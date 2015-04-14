﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using XBase.Data.DBHelper;
using System.Data;
using XBase.Model.Office.SellManager;
using XBase.Common;

namespace XBase.Data.Office.SellManager
{
    public  class SelectSellContractUCDBHelper
    {
        /// <summary>
        /// 选择执行状态的单据
        /// </summary>
        /// <returns></returns>
        public static DataTable GetSellContractList(string OrderNo, string Title, string CustName, int? CurrencyType, string model, int pageIndex, int pageCount, string ord, ref int TotalCount)
        {
            string strSql = string.Empty;
            string strCompanyCD = string.Empty;//单位编号
           
                strCompanyCD = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).CompanyCD;
           
            strSql = "SELECT s.ID, s.ContractNo, s.Title, CONVERT(varchar(100), s.SignDate, 23) AS SignDate, e.EmployeeName, s.Rate, cts.CurrencyName, c.CustName" +
                     " FROM officedba.SellContract AS s LEFT OUTER JOIN " +
                     " officedba.CurrencyTypeSetting AS cts ON s.CurrencyType = cts.ID LEFT OUTER JOIN  " +
                     " officedba.CustInfo AS c ON s.CustID = c.ID LEFT OUTER JOIN " +
                     "  officedba.EmployeeInfo AS e ON s.Seller = e.ID  " +
                     " WHERE  s.CompanyCD=@CompanyCD";
            strSql += " and (  ";
            XBase.Common.UserInfoUtil userInfo = (XBase.Common.UserInfoUtil)XBase.Common.SessionUtil.Session["UserInfo"];
            DataTable dtt = XBase.Data.Office.SystemManager.RoleInfoDBHelper.GetRoleInfoByUserID(userInfo.UserID);
            if (dtt != null && dtt.Rows.Count > 0)
            {
                
                if (dtt.Rows[0]["RoleRange"].ToString() == "1")
                {
                    strSql += " (s.Creator IN  ";
                    strSql += "( SELECT ID FROM  officedba.EmployeeInfo ";
                    strSql += "  WHERE DeptID IN (SELECT a.ID  ";
                    strSql += " FROM officedba.DeptInfo a,DepartInfo_Children(" + userInfo.DeptID.ToString() + ") b  ";
                    strSql += "  WHERE a.ID=b.ID) AND DeptID<>" + userInfo.DeptID.ToString() + " )) OR ";
                }
                if (dtt.Rows[0]["RoleRange"].ToString() == "2")
                {
                    strSql += " (s.Creator IN  ";
                    strSql += " (SELECT ID FROM  officedba.EmployeeInfo ";
                    strSql += "  WHERE DeptID IN (SELECT a.ID  ";
                    strSql += " FROM officedba.DeptInfo a,DepartInfo_Children(" + userInfo.DeptID.ToString() + ") b  ";
                    strSql += "  WHERE a.ID=b.ID) ))  OR ";
                }
                if (dtt.Rows[0]["RoleRange"].ToString() == "3")
                {
                    strSql += " (s.Creator IN  ";
                    strSql += "( SELECT ID FROM  officedba.EmployeeInfo ";
                    strSql += "  WHERE DeptID IN (SELECT a.ID  ";
                    strSql += " FROM officedba.DeptInfo a,DepartInfo_Children(" + userInfo.BranchID.ToString() + ") b  ";
                    strSql += "  WHERE a.ID=b.ID)))  OR ";
                }
            }
            strSql += " (select COUNT(*) from officedba.FlowTaskHistory where FlowNo=(SELECT TOP 1 FlowNo FROM officedba.FlowInstance WHERE BillID = s.ID AND BillTypeFlag = 5 AND BillTypeCode = 2) AND BillID = s.ID  AND operateUserId = '" + userInfo.UserID + "')>0 ";

            strSql += "or (s.Creator IN (SELECT EmployeeID from  officedba.UserInfo where UserID = '" + userInfo.UserID + "')) OR (s.Seller IN (SELECT EmployeeID from  officedba.UserInfo where UserID = '" + userInfo.UserID + "'))";

            strSql += " or ( charindex('," + userInfo.EmployeeID + ",' , ','+s.CanViewUser+',')>0 )) ";
            ArrayList arr = new ArrayList();
            arr.Add(new SqlParameter("@CompanyCD", strCompanyCD));
            if (OrderNo != null)
            {
                strSql += " and s.ContractNo like  '%" + OrderNo + "%'";
            }
            if (Title != null)
            {
                strSql += " and s.Title like '%" + Title + "%'";

            }
            if (CustName != null)
            {
                strSql += " and c.CustName like '%" + CustName + "%'";

            }
            if (CurrencyType != null)
            {
                strSql += " and s.CurrencyType = " + CurrencyType;

            }
            if (model != "all")
            {
                strSql += " and  s.BillStatus = '2' ";
            }
            else
            {
                strSql += " and  s.BillStatus <> '1' and s.State<>'2' ";
            }
            return SqlHelper.CreateSqlByPageExcuteSqlArr(strSql.ToString(), pageIndex, pageCount, ord, arr, ref TotalCount);
        }

        /// <summary>
        /// 获取合同详细信息
        /// </summary>
        /// <param name="strOffNo"></param>
        public static DataTable GetSellContract(string strContractNo)
        {
            string strSql = string.Empty;//查询报价单信息
            string strCompanyCD = string.Empty;//单位编号

            
                strCompanyCD = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).CompanyCD;
           

            strSql = "SELECT o.CustTel, o.MoneyType, o.ContractNo, o.CustID, o.Seller, e.EmployeeName, ";
            strSql += "o.PayType, o.CarryType, o.CurrencyType, o.Rate, o.SellType, o.BusiType, ";
            strSql += "o.TakeType, c.CustName, ct.CurrencyName, o.SellDeptId, d.DeptName, o.isAddTax,o.Discount ";
            strSql += "FROM officedba.SellContract AS o LEFT OUTER JOIN ";
            strSql += "officedba.CurrencyTypeSetting AS ct ON o.CurrencyType = ct.ID LEFT OUTER JOIN ";
            strSql += "officedba.DeptInfo AS d ON o.SellDeptId = d.ID LEFT OUTER JOIN ";
            strSql += "officedba.EmployeeInfo AS e ON o.Seller = e.ID LEFT OUTER JOIN ";
            strSql += "officedba.CustInfo AS c ON o.CustID = c.ID ";

            strSql += " WHERE (o.ContractNo = @ContractNo ) and o.CompanyCD=@CompanyCD  ORDER BY o.CreateDate DESC";
            SqlParameter[] paras = { new SqlParameter("@ContractNo", strContractNo), new SqlParameter("@CompanyCD", strCompanyCD) };
            return SqlHelper.ExecuteSql(strSql,paras);

        }

        /// <summary>
        /// 获取合同明细信息
        /// </summary>
        /// <param name="strOffNo"></param>
        /// <returns></returns>
        public static DataTable GetSellContractInfo(string strContractNo)
        {
            string strSql = string.Empty;//查询报价单明细信息
            string strCompanyCD = string.Empty;//单位编号

           
                strCompanyCD = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).CompanyCD;
            

            strSql = "SELECT d.SortNo, d.ProductID, isnull(d.ProductCount,0) as ProductCount, d.UnitID, d.UnitPrice, u.CodeName, ";
            strSql += "d.TotalPrice, d.Discount, d.SendTime, d.Package, d.Remark, p.ProductName,isnull(pc.TypeName,'') as ColorName, ";
            strSql += "p.ProdNo, p.Specification, isnull(p.StandardCost,0) as StandardCost,d.TaxPrice, d.TaxRate, d.TotalTax, d.TotalFee ";
            strSql += " ,isnull(p.StandardSell,0) as StandardSell,d.UsedUnitID,isnull(d.UsedUnitCount,0) as UsedUnitCount,isnull(d.UsedPrice,0) as UsedPrice,isnull(d.ExRate,1) as ExRate  ";//,单位，数量，单价，换算率
            strSql += " ,isnull(p.ExtField1,'') ExtField1,isnull(p.ExtField2,'') ExtField2,isnull(p.ExtField3,'') ExtField3,isnull(p.ExtField4,'') ExtField4,";
            strSql += " isnull(p.ExtField5,'') ExtField5,isnull(p.ExtField6,'') ExtField6,isnull(p.ExtField7,'') ExtField7,";
            strSql += " isnull(p.ExtField8,'') ExtField8,isnull(p.ExtField9,'') ExtField9,isnull(p.ExtField10,'') ExtField10 ";
            strSql += "FROM officedba.SellContractDetail AS d LEFT OUTER JOIN ";
            strSql += "officedba.SellContract AS s ON d.ContractNo = s.ContractNo and d.CompanyCD=s.CompanyCD LEFT OUTER JOIN ";
            strSql += "officedba.ProductInfo AS p ON d.ProductID = p.ID LEFT OUTER JOIN ";
            strSql += "officedba.CodePublicType as pc on pc.ID=p.ColorID left join ";
            strSql += "officedba.CodeUnitType AS u ON d.UnitID = u.ID ";

            strSql += " WHERE (d.ContractNo = '" + strContractNo + "') and s.CompanyCD='" + strCompanyCD + "'  order by d.SortNo asc";

            return SqlHelper.ExecuteSql(strSql);
        }
    }
}
