﻿/**********************************************
 * 类作用：   提成工资录入
 * 建立人：   吴志强
 * 建立时间： 2009/05/14
 ***********************************************/
using System;
using XBase.Model.Office.HumanManager;
using System.Text;
using XBase.Data.DBHelper;
using System.Data.SqlClient;
using System.Data;
using System.Data.SqlTypes;
using XBase.Common;
using System.Collections;

namespace XBase.Data.Office.HumanManager
{
    /// <summary>
    /// 类名：CommissionSalaryDBHelper
    /// 描述：提成工资录入
    /// 
    /// 作者：吴志强
    /// 创建时间：2009/05/14
    /// 最后修改时间：2009/05/14
    /// </summary>
    ///
    public class CommissionSalaryDBHelper
    {
        public static bool DeletePerTypeInfo(string elemID, string CompanyCD)
        {
            //删除SQL拼写
            StringBuilder deleteSql = new StringBuilder();
            deleteSql.AppendLine(" DELETE FROM  officedba.CommissionSalary");
            deleteSql.AppendLine(" WHERE  CompanyCD='" + CompanyCD + "'");
            deleteSql.AppendLine("and  EmployeeID = '" + elemID + "'");

            //定义更新基本信息的命令
            SqlCommand comm = new SqlCommand();
            comm.CommandText = deleteSql.ToString();

            //执行插入操作并返回更新结果
            return SqlHelper.ExecuteTransWithCommand(comm);
        }
        #region 查询人员信息
        /// <summary>
        /// 查询人员信息
        /// </summary>
        /// <param name="model">查询条件</param>
        /// <param name="itemNo">提成项目编号</param>
        /// <returns></returns>
        public static DataTable GetEmplInfo(EmployeeSearchModel model, string itemNo)
        {

            #region 查询语句
            StringBuilder searchSql = new StringBuilder();
            searchSql.AppendLine(" SELECT DISTINCT                       ");
            searchSql.AppendLine(" 	 E.EmployeeID AS EmployeeID          ");
            searchSql.AppendLine(" 	,A.EmployeeNo AS EmployeeNo          ");
            searchSql.AppendLine(" 	,A.EmployeeNum AS EmployeeNum        ");
            searchSql.AppendLine(" 	,A.EmployeeName AS EmployeeName      ");
            searchSql.AppendLine(" 	,C.QuarterName AS QuarterName        ");
            searchSql.AppendLine(" 	,B.DeptName AS DeptName              ");
            searchSql.AppendLine(" 	,D.TypeName AS AdminLevelName        ");
            searchSql.AppendLine(" FROM                                  ");
            searchSql.AppendLine("     officedba.CommissionSalary E      ");
            searchSql.AppendLine(" 	LEFT JOIN officedba.EmployeeInfo A   ");
            searchSql.AppendLine(" 		ON A.CompanyCD=E.CompanyCD AND  E.EmployeeID = A.ID           ");
            searchSql.AppendLine(" 	LEFT JOIN officedba.DeptInfo B       ");
            searchSql.AppendLine(" 		ON B.CompanyCD=E.CompanyCD AND  A.DeptID = B.ID               ");
            searchSql.AppendLine(" 	LEFT JOIN officedba.DeptQuarter C    ");
            searchSql.AppendLine(" 		ON C.CompanyCD=E.CompanyCD AND A.QuarterID = C.ID            ");
            searchSql.AppendLine(" 	LEFT JOIN officedba.CodePublicType D ");
            searchSql.AppendLine(" 		ON D.CompanyCD=E.CompanyCD AND A.AdminLevelID = D.ID         ");
            searchSql.AppendLine(" WHERE                                 ");
            searchSql.AppendLine(" 	E.CompanyCD = @CompanyCD             ");
            #endregion

            //定义查询的命令
            SqlCommand comm = new SqlCommand();
            //公司代码
            comm.Parameters.Add(SqlHelper.GetParameterFromString("@CompanyCD", model.CompanyCD));

            #region 页面条件
            //编号
            if (!string.IsNullOrEmpty(model.EmployeeNo))
            {
                searchSql.AppendLine("	AND A.EmployeeNo LIKE  '%' + @EmployeeNo + '%' ");
                comm.Parameters.Add(SqlHelper.GetParameterFromString("@EmployeeNo", model.EmployeeNo));
            }
            //姓名
            if (!string.IsNullOrEmpty(model.EmployeeName))
            {
                searchSql.AppendLine("	AND A.EmployeeName LIKE  '%' + @EmployeeName + '%' ");
                comm.Parameters.Add(SqlHelper.GetParameterFromString("@EmployeeName", model.EmployeeName));
            }
            //岗位
            if (!string.IsNullOrEmpty(model.QuarterID))
            {
                searchSql.AppendLine("	AND A.QuarterID = @QuarterID ");
                comm.Parameters.Add(SqlHelper.GetParameterFromString("@QuarterID", model.QuarterID));
            }
            //提成项目
            if (!string.IsNullOrEmpty(itemNo))
            {
                searchSql.AppendLine("	AND E.ItemNo = @ItemNo ");
                comm.Parameters.Add(SqlHelper.GetParameterFromString("@ItemNo", itemNo));
            }
            //开始时间
            if (!string.IsNullOrEmpty(model.StartDate))
            {
                searchSql.AppendLine("	AND CONVERT(VARCHAR(10), E.CommDate,21) >= @StartDate ");
                comm.Parameters.Add(SqlHelper.GetParameterFromString("@StartDate", model.StartDate));
            }
            //结束时间
            if (!string.IsNullOrEmpty(model.EndDate))
            {
                searchSql.AppendLine("	AND CONVERT(VARCHAR(10), E.CommDate,21) <= @EndDate ");
                comm.Parameters.Add(SqlHelper.GetParameterFromString("@EndDate", model.EndDate));
            }
            #endregion

            //指定命令的SQL文
            comm.CommandText = searchSql.ToString();
            //执行查询
            return SqlHelper.ExecuteSearch(comm);
        }
        #endregion

        #region 查询提成工资项信息
        /// <summary>
        /// 查询提成工资项信息
        /// </summary>
        /// <param name="companyCD">公司代码</param>
        /// <param name="emplID">员工ID</param>
        /// <param name="itemNo">提成项目编号</param>
        /// <param name="startDate">开始时间</param>
        /// <param name="endDate">结束时间</param>
        /// <returns></returns>
        public static DataTable GetCommissionItemInfo(string companyCD, string emplID, string itemNo, string startDate, string endDate)
        {

            #region 查询语句
            StringBuilder searchSql = new StringBuilder();
            searchSql.AppendLine(" SELECT DISTINCT                       ");
            searchSql.AppendLine(" 	A.ItemNo                           ");
            searchSql.AppendLine(" 	,isnull(C.ProductName,'默认') as ItemName            ");
            searchSql.AppendLine(" 	,case A.Amount when 0 then 0 else Convert(numeric(10,4),(A.SalaryMoney /A.Amount)) end as Rate  ");
            searchSql.AppendLine(" FROM                                  ");
            searchSql.AppendLine("     officedba.CommissionSalary A      ");
            searchSql.AppendLine(" 	LEFT JOIN officedba.CommissionItem B ");
            searchSql.AppendLine(" 		ON A.CompanyCD = B.CompanyCD     ");
            searchSql.AppendLine(" 		AND A.ItemNo = B.ItemNo          ");
            searchSql.AppendLine(" 	LEFT JOIN officedba.ProductInfo C ");
            searchSql.AppendLine(" 		ON A.CompanyCD = C.CompanyCD     ");
            searchSql.AppendLine(" 		AND A.ItemNo = C.ProdNo          ");
            searchSql.AppendLine(" WHERE                                 ");
            searchSql.AppendLine(" 	A.CompanyCD = @CompanyCD             ");
            searchSql.AppendLine(" 	AND A.EmployeeID = @EmployeeID       ");
            #endregion

            //定义查询的命令
            SqlCommand comm = new SqlCommand();
            //公司代码
            comm.Parameters.Add(SqlHelper.GetParameterFromString("@CompanyCD", companyCD));
            //员工ID
            comm.Parameters.Add(SqlHelper.GetParameterFromString("@EmployeeID", emplID));

            #region 页面查询条件
            //提成项目
            if (!string.IsNullOrEmpty(itemNo))
            {
                searchSql.AppendLine("	AND A.ItemNo = @ItemNo ");
                comm.Parameters.Add(SqlHelper.GetParameterFromString("@ItemNo", itemNo));
            }
            //开始时间
            if (!string.IsNullOrEmpty(startDate))
            {
                searchSql.AppendLine("	AND CONVERT(VARCHAR(10), A.CommDate,21) >= @StartDate ");
                comm.Parameters.Add(SqlHelper.GetParameterFromString("@StartDate", startDate));
            }
            //结束时间
            if (!string.IsNullOrEmpty(endDate))
            {
                searchSql.AppendLine("	AND CONVERT(VARCHAR(10), A.CommDate,21) <= @EndDate ");
                comm.Parameters.Add(SqlHelper.GetParameterFromString("@EndDate", endDate));
            }
            #endregion

            //指定命令的SQL文
            comm.CommandText = searchSql.ToString();
            //执行查询
            return SqlHelper.ExecuteSearch(comm);
        }
        #endregion

        #region 查询提成工资信息
        /// <summary>
        /// 查询提成工资项信息
        /// </summary>
        /// <param name="companyCD">公司代码</param>
        /// <param name="emplID">员工ID</param>
        /// <param name="itemNo">提成项目编号</param>
        /// <param name="startDate">开始时间</param>
        /// <param name="endDate">结束时间</param>
        /// <returns></returns>
        public static DataTable GetCommissionSalaryInfo(string companyCD, string emplID, string itemNo, string startDate, string endDate)
        {
            #region 查询语句
            StringBuilder searchSql = new StringBuilder();
            searchSql.AppendLine(" SELECT                                ");
            searchSql.AppendLine(" 	 A.ID                                ");
            searchSql.AppendLine(" 	,A.EmployeeID AS EmployeeID          ");
            searchSql.AppendLine(" 	,A.ItemNo                            ");
            searchSql.AppendLine(" 	,CONVERT(VARCHAR(10),A.CommDate,21)  ");
            searchSql.AppendLine(" 		AS CommDate                      ");
            searchSql.AppendLine(" 	,A.Amount AS Amount                  ");
            searchSql.AppendLine(" 	,A.SalaryMoney AS SalaryMoney        ");
            searchSql.AppendLine(" 	,case A.Amount when 0 then 0 else Convert(numeric(10,4),(A.SalaryMoney /A.Amount)) end as Rate  ");
            //searchSql.AppendLine(" 	,(A.SalaryMoney /A.Amount)Rate       ");
            searchSql.AppendLine(" 	,case A.Flag  when '1'then '销售订单' else '无来源' end AS FlagName   ");
            searchSql.AppendLine(" FROM                                  ");
            searchSql.AppendLine("     officedba.CommissionSalary A      ");
            searchSql.AppendLine(" WHERE                                 ");
            searchSql.AppendLine(" 	A.CompanyCD = @CompanyCD             ");
            searchSql.AppendLine(" 	AND A.EmployeeID = @EmployeeID       ");
            #endregion

            //定义查询的命令
            SqlCommand comm = new SqlCommand();
            //公司代码
            comm.Parameters.Add(SqlHelper.GetParameterFromString("@CompanyCD", companyCD));
            //员工ID
            comm.Parameters.Add(SqlHelper.GetParameterFromString("@EmployeeID", emplID));

            #region 页面条件
            //提成项目
            if (!string.IsNullOrEmpty(itemNo))
            {
                searchSql.AppendLine("	AND A.ItemNo = @ItemNo ");
                comm.Parameters.Add(SqlHelper.GetParameterFromString("@ItemNo", itemNo));
            }
            //开始时间
            if (!string.IsNullOrEmpty(startDate))
            {
                searchSql.AppendLine("	AND CONVERT(VARCHAR(10), A.CommDate,21) >= @StartDate ");
                comm.Parameters.Add(SqlHelper.GetParameterFromString("@StartDate", startDate));
            }
            //结束时间
            if (!string.IsNullOrEmpty(endDate))
            {
                searchSql.AppendLine("	AND CONVERT(VARCHAR(10), A.CommDate,21) <= @EndDate ");
                comm.Parameters.Add(SqlHelper.GetParameterFromString("@EndDate", endDate));
            }
            #endregion

            //指定命令的SQL文
            comm.CommandText = searchSql.ToString();
            //执行查询
            return SqlHelper.ExecuteSearch(comm);
        }
        #endregion

        #region 保存提成工资项信息
        /// <summary>
        /// 保存提成工资项信息
        /// </summary>
        /// <param name="lstEdit">提成工资项信息</param>
        /// <param name="companyCD">公司代码</param>
        /// <param name="modifyUserID">最后修改用户</param>
        /// <returns></returns>
        public static bool SaveCommissionSalaryInfo(ArrayList lstEdit, string companyCD, string modifyUserID)
        {
            //定义返回变量
            bool isSucc = true;
            //信息存在时，进行操作
            if (lstEdit != null && lstEdit.Count > 0)
            {
                //保存库列表
                ArrayList lstSave = new ArrayList();
                //遍历所有提成工资项，进行增删改操作
                for (int i = 0; i < lstEdit.Count; i++)
                {
                    //获取值
                    CommissionSalaryModel model = (CommissionSalaryModel)lstEdit[i];
                    //设置公司代码
                    model.CompanyCD = companyCD;
                    //最后修改人
                    model.ModifiedUserID = modifyUserID;
                    //更新
                    if ("1".Equals(model.EditFlag))
                    {
                        //执行更新操作
                        lstSave.Add(UpdateCommissionSalaryInfo(model));
                    }
                    //插入
                    else if ("0".Equals(model.EditFlag))
                    {
                        //执行插入操作
                        lstSave.Add(InsertCommissionSalaryInfo(model));
                    }
                    //删除
                    else
                    {
                        //执行删除操作
                        lstSave.Add(DeleteCommissionSalaryInfo(model.ID));
                    }
                }
                //执行保存操作
                isSucc = SqlHelper.ExecuteTransWithArrayList(lstSave);
                //获取插入数据的ID
                for (int j = 0; j < lstEdit.Count; j++)
                {
                    //获取值
                    CommissionSalaryModel model = (CommissionSalaryModel)lstEdit[j];
                    //插入时
                    if ("0".Equals(model.EditFlag))
                    {
                        //获取插入的命令
                        SqlCommand comm = (SqlCommand)lstSave[j];
                        //设置提成工资项编号
                        model.ID = comm.Parameters["@SalaryID"].Value.ToString();
                    }
                }
            }

            return isSucc;
        }
        #endregion

        #region 新建提成工资项信息
        /// <summary>
        /// 新建提成工资项信息 
        /// </summary>
        /// <param name="model">提成工资项信息</param>
        /// <returns></returns>
        private static SqlCommand InsertCommissionSalaryInfo(CommissionSalaryModel model)
        {
            #region 登陆SQL文
            StringBuilder insertSql = new StringBuilder();
            insertSql.AppendLine(" INSERT INTO                ");
            insertSql.AppendLine(" officedba.CommissionSalary ");
            insertSql.AppendLine(" 	(CompanyCD                ");
            insertSql.AppendLine(" 	,EmployeeID               ");
            insertSql.AppendLine(" 	,CommDate                 ");
            insertSql.AppendLine(" 	,ItemNo                   ");
            insertSql.AppendLine(" 	,Amount                   ");
            insertSql.AppendLine(" 	,SalaryMoney              ");
            insertSql.AppendLine(" 	,ModifiedDate             ");
            insertSql.AppendLine(" 	,ModifiedUserID)          ");
            insertSql.AppendLine(" VALUES                     ");
            insertSql.AppendLine(" 	(@CompanyCD               ");
            insertSql.AppendLine(" 	,@EmployeeID              ");
            insertSql.AppendLine(" 	,@CommDate                ");
            insertSql.AppendLine(" 	,@ItemNo                  ");
            insertSql.AppendLine(" 	,@Amount                  ");
            insertSql.AppendLine(" 	,@SalaryMoney             ");
            insertSql.AppendLine(" 	,getdate()                ");
            insertSql.AppendLine(" 	,@ModifiedUserID)         ");
            insertSql.AppendLine(" SET @SalaryID= @@IDENTITY  ");
            #endregion

            //定义更新基本信息的命令
            SqlCommand comm = new SqlCommand();
            //设置存储过程名
            comm.CommandText = insertSql.ToString();
            //设置保存的参数
            SetSaveParameter(comm, model);

            //添加返回参数
            comm.Parameters.Add(SqlHelper.GetOutputParameter("@SalaryID", SqlDbType.Int));

            //执行插入并返回插入结果
            return comm;
        }
        #endregion

        #region 更新提成工资项信息
        /// <summary>
        /// 更新提成工资项信息
        /// </summary>
        /// <param name="model">提成工资项信息</param>
        /// <returns></returns>
        private static SqlCommand UpdateCommissionSalaryInfo(CommissionSalaryModel model)
        {

            #region SQL文拼写
            StringBuilder updateSql = new StringBuilder();
            updateSql.AppendLine(" UPDATE officedba.CommissionSalary     ");
            updateSql.AppendLine(" SET  Amount = @Amount                 ");
            updateSql.AppendLine(" 	,SalaryMoney = @SalaryMoney          ");
            updateSql.AppendLine(" 	,ModifiedDate = getdate()            ");
            updateSql.AppendLine(" 	,ModifiedUserID = @ModifiedUserID    ");
            updateSql.AppendLine(" WHERE                                 ");
            updateSql.AppendLine(" 	CompanyCD = @CompanyCD               ");   
            updateSql.AppendLine(" 	AND ItemNo = @ItemNo                 ");
            updateSql.AppendLine(" 	AND EmployeeID = @EmployeeID         ");    
            updateSql.AppendLine(" 	AND CONVERT(VARCHAR(10),CommDate,21) ");
            updateSql.AppendLine(" 	 = CONVERT(VARCHAR(10),@CommDate,21) ");
     
            #endregion

            //定义更新基本信息的命令  
            SqlCommand comm = new SqlCommand();
            comm.CommandText = updateSql.ToString();
            //参数
            SetSaveParameter(comm, model);
            //执行更新
            return comm;
        }
        #endregion

        #region 保存时参数设置
        /// <summary>
        /// 保存时参数设置
        /// </summary>
        /// <param name="comm">命令</param>
        /// <param name="model">人才代理信息</param>
        private static void SetSaveParameter(SqlCommand comm, CommissionSalaryModel model)
        {
            comm.Parameters.Add(SqlHelper.GetParameterFromString("@CompanyCD", model.CompanyCD));//公司代码
            comm.Parameters.Add(SqlHelper.GetParameterFromString("@EmployeeID", model.EmployeeID));//员工ID
            comm.Parameters.Add(SqlHelper.GetParameterFromString("@ItemNo", model.ItemNo));//提成工资项编号
            comm.Parameters.Add(SqlHelper.GetParameterFromString("@CommDate", model.CommDate));//提成工资项日期
            comm.Parameters.Add(SqlHelper.GetParameterFromString("@Amount", model.Amount));//业务量
            comm.Parameters.Add(SqlHelper.GetParameterFromString("@SalaryMoney", model.SalaryMoney));//金额
            comm.Parameters.Add(SqlHelper.GetParameterFromString("@ModifiedUserID", model.ModifiedUserID));//最后修改人
        }
        #endregion

        #region 删除提成工资项信息
        /// <summary>
        /// 删除提成工资项信息
        /// </summary>
        /// <param name="ID">提成工资项ID</param>
        /// <returns></returns>
        private static SqlCommand DeleteCommissionSalaryInfo(string ID)
        {
            //删除SQL拼写
            StringBuilder deleteSql = new StringBuilder();
            deleteSql.AppendLine(" DELETE FROM officedba.CommissionSalary ");
            deleteSql.AppendLine(" WHERE ");
            deleteSql.AppendLine(" ID = @ItemID");

            //定义更新基本信息的命令
            SqlCommand comm = new SqlCommand();
            //公司代码
            comm.Parameters.Add(SqlHelper.GetParameterFromString("@ItemID", ID));
            //设置SQL语句
            comm.CommandText = deleteSql.ToString();

            //执行删除并返回
            return comm;
        }
        #endregion

        #region 查询月份的计件工资信息
        /// <summary>
        /// 查询月份的提成工资信息
        /// </summary>
        /// <param name="companyCD">公司代码</param>
        /// <param name="salaryMonth">年月份</param>
        /// <returns></returns>
        public static DataTable GetMonthCommSalary(string companyCD, string salaryMonth, string startDate, string endDate)
        {
            #region 查询语句
            StringBuilder searchSql = new StringBuilder();
            searchSql.AppendLine(" SELECT 		                    ");
            searchSql.AppendLine(" 	SUM(SalaryMoney) AS TotalSalary ");
            searchSql.AppendLine(" 	,EmployeeID AS EmployeeID       ");
            searchSql.AppendLine(" FROM                             ");
            searchSql.AppendLine(" 	officedba.CommissionSalary      ");
            searchSql.AppendLine(" WHERE                            ");
            searchSql.AppendLine(" 	CompanyCD = @CompanyCD  and CommDate  between @startDate and @endDate       ");
            //searchSql.AppendLine(" 	CompanyCD = @CompanyCD          ");
            //searchSql.AppendLine(" 	AND SUBSTRING(                  ");
            //searchSql.AppendLine(" 	  CONVERT(VARCHAR, CommDate     ");
            //searchSql.AppendLine(" 	  , 112), 1, 6) = @SalaryMonth  ");
            searchSql.AppendLine(" GROUP BY                         ");
            searchSql.AppendLine(" 	EmployeeID                      ");
            #endregion

            //定义查询的命令
            SqlCommand comm = new SqlCommand();
            //公司代码
            comm.Parameters.Add(SqlHelper.GetParameterFromString("@CompanyCD", companyCD));
            //员工ID
            //comm.Parameters.Add(SqlHelper.GetParameterFromString("@SalaryMonth", salaryMonth));
            comm.Parameters.Add(SqlHelper.GetParameterFromString("@startDate", startDate));
            comm.Parameters.Add(SqlHelper.GetParameterFromString("@endDate", endDate));
            //指定命令的SQL文
            comm.CommandText = searchSql.ToString();
            //执行查询
            return SqlHelper.ExecuteSearch(comm);
        }
        #endregion
    }
}
