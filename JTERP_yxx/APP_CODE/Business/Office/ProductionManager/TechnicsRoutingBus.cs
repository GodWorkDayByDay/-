﻿/**********************************************
 * 类作用：   工艺路线事务层处理
 * 建立人：   王玉贞
 * 建立时间： 2009/03/17
 ***********************************************/

using System;
using System.Collections.Generic;
using XBase.Model.Office.ProductionManager;
using XBase.Data.Office.ProductionManager;
using XBase.Common;
using XBase.Data.DBHelper;
using System.Data.SqlClient;
using System.Data;
using XBase.Business.Common;
using System.Text;
using XBase.Model.Common;
using XBase.Data.Common;

namespace XBase.Business.Office.ProductionManager
{
    public class TechnicsRoutingBus
    {

        /// <summary>
        /// 查询工艺路线列表
        /// </summary>
        /// <returns>DataTable</returns>
        public static DataTable GetTechnicsRoutingListBycondition(TechnicsRoutingModel model,int pageIndex, int pageCount, string OrderBy, ref int totalCount)
        {
            try
            {
                return TechnicsRoutingDBHelper.GetTechnicsRoutingTableBycondition(model, pageIndex, pageCount, OrderBy, ref totalCount);
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
        }


        /// <summary>
        /// 工艺路线插入
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public static bool InsertTechnicsRouting(TechnicsRoutingModel model, out string ID)
        {
            UserInfoUtil userInfo = (UserInfoUtil)SessionUtil.Session["UserInfo"];
            ID = "0";
            try
            {
                bool succ = false;
                string loginUserID = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).UserID;

                LogInfoModel logModel = InitLogInfo(model.RouteNo);
                logModel.Element = ConstUtil.LOG_PROCESS_INSERT;

                succ = TechnicsRoutingDBHelper.InsertTechnicsRouting(model, loginUserID, out ID);
                if (!succ)
                    logModel.Remark = ConstUtil.LOG_PROCESS_FAILED;
                else
                    logModel.Remark = ConstUtil.LOG_PROCESS_SUCCESS;
                LogDBHelper.InsertLog(logModel);
                return succ;
            }
            catch (Exception ex)
            {
                WriteSystemLog(userInfo, ex);
                return false;
            }
        }

        #region 更新工艺路线
        /// <summary>
        /// 更新工艺路线
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public static bool UpdateTechnicsRouting(TechnicsRoutingModel model)
        {
            UserInfoUtil userInfo = (UserInfoUtil)SessionUtil.Session["UserInfo"];
            try
            {
                bool succ = false;
                string loginUserID = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).UserID;

                LogInfoModel logModel = InitLogInfo(model.RouteNo);
                logModel.Element = ConstUtil.LOG_PROCESS_UPDATE;

                succ = TechnicsRoutingDBHelper.UpdateTechnicsRouting(model, loginUserID);
                if (!succ)
                    logModel.Remark = ConstUtil.LOG_PROCESS_FAILED;
                else
                    logModel.Remark = ConstUtil.LOG_PROCESS_SUCCESS;
                LogDBHelper.InsertLog(logModel);
                return succ;
            }
            catch (Exception ex)
            {
                WriteSystemLog(userInfo, ex);
                return false;
            }
        }
        #endregion


        /// <summary>
        /// 获取工艺路线和工序信息
        /// </summary>
        /// <returns>DataTable</returns>
        public static DataTable GetTechnicsRoutingInfo(TechnicsRoutingModel model)
        {
            try
            {
                return TechnicsRoutingDBHelper.GetTechnicsRoutingInfo(model);
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// 获取工艺路线和工序明细信息
        /// </summary>
        /// <returns>DataTable</returns>
        public static DataTable GetTechnicsRoutingDetailInfo(TechnicsRoutingModel model)
        {
            try
            {
                return TechnicsRoutingDBHelper.GetTechnicsRoutingDetailInfo(model);
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
        }


        /// <summary>
        /// 删除工艺路线
        /// </summary>
        /// <param name="ID"></param>
        /// <param name="CompanyCD"></param>
        /// <returns></returns>
        public static bool DeleteTechnicsRouting(string ID, string CompanyCD)
        {
            if (string.IsNullOrEmpty(ID))
            {
                return false;
            }
            if (string.IsNullOrEmpty(CompanyCD))
            {
                CompanyCD = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).CompanyCD;
            }

            UserInfoUtil userInfo = (UserInfoUtil)SessionUtil.Session["UserInfo"];

            bool isSucc = TechnicsRoutingDBHelper.DeleteTechnicsRouting(ID, CompanyCD);
            //定义变量
            string remark;
            //成功时
            if (isSucc)
            {
                //设置操作成功标识
                remark = ConstUtil.LOG_PROCESS_SUCCESS;
            }
            else
            {
                //设置操作成功标识 
                remark = ConstUtil.LOG_PROCESS_FAILED;
            }
            //获取删除的编号列表
            string[] noList = ID.Split(',');
            //遍历所有编号，登陆操作日志
            for (int i = 0; i < noList.Length; i++)
            {
                //获取编号
                string no = noList[i];
                //替换两边的 '
                no = no.Replace("'", string.Empty);

                //操作日志
                LogInfoModel logModel = InitLogInfo("工艺路线ID：" + no);
                //涉及关键元素 这个需要根据每个页面具体设置，本页面暂时设置为空
                logModel.Element = ConstUtil.LOG_PROCESS_DELETE;
                //设置操作成功标识
                logModel.Remark = remark;

                //登陆日志
                LogDBHelper.InsertLog(logModel);
            }
            return isSucc;
        }

        #region 是否被引用
        /// <summary>
        /// 判断要删除的ID是否已经被引用
        /// </summary>
        /// <param name="CompanyCD"></param>
        /// <param name="ID"></param>
        /// <param name="TableName"></param>
        /// <returns></returns>
        public static int CountRefrence(string CompanyCD, string ID, string TableName)
        {
            try
            {
                return WorkCenterDBHelper.CountRefrence(CompanyCD, ID, TableName, "RouteID");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

        #region 输出系统日志
        /// <summary>
        /// 输出系统日志
        /// </summary>
        /// <param name="userInfo">用户信息</param>
        /// <param name="ex">异常信息</param>
        private static void WriteSystemLog(UserInfoUtil userInfo, Exception ex)
        {
            /* 
             * 出现异常时，输出系统日志到文本文件 
             * 考虑出现异常情况比较少，尽管一个方法可能多次异常，
             *      但还是考虑将异常日志的变量定义放在catch里面
             */
            //定义变量
            LogInfo logSys = new LogInfo();
            //设置日志类型 需要指定为系统日志
            logSys.Type = LogInfo.LogType.SYSTEM;
            //指定系统日志类型 出错信息
            logSys.SystemKind = LogInfo.SystemLogKind.SYSTEM_ERROR;
            //指定登陆用户信息
            logSys.UserInfo = userInfo;
            //设定模块ID
            logSys.ModuleID = ConstUtil.MODULE_ID_TECHNICSROUTING_LIST;
            //描述
            logSys.Description = ex.ToString();

            //输出日志
            LogUtil.WriteLog(logSys);
        }
        #endregion

        #region 设置操作日志内容
        /// <summary>
        /// 设置操作日志内容
        /// </summary>
        /// <returns></returns>
        private static LogInfoModel InitLogInfo(string routeno)
        {
            LogInfoModel logModel = new LogInfoModel();
            //获取登陆用户信息
            UserInfoUtil userInfo = (UserInfoUtil)SessionUtil.Session["UserInfo"];
            //设置公司代码
            logModel.CompanyCD = userInfo.CompanyCD;
            //设置登陆用户ID
            logModel.UserID = userInfo.UserID;
            //设置模块ID 模块ID请在ConstUtil中定义，以便维护
            logModel.ModuleID = ConstUtil.MODULE_ID_TECHNICSROUTING_LIST;
            //设置操作日志类型 修改
            logModel.ObjectName = ConstUtil.CODING_RULE_TABLE_TECHNICSROUTING;
            //操作对象
            logModel.ObjectID = routeno;
            //涉及关键元素 这个需要根据每个页面具体设置，本页面暂时设置为空
            logModel.Element = string.Empty;

            return logModel;

        }
        #endregion
    }
}
