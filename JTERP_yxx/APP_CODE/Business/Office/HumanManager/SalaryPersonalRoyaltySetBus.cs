﻿using XBase.Data.Office.HumanManager;
using XBase.Common;
using System;
using XBase.Model.Common;
using XBase.Data.Common;
using XBase.Business.Common;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using XBase.Model.Office.HumanManager;

namespace XBase.Business.Office.HumanManager
{
   public class SalaryPersonalRoyaltySetBus
    {
       public static DataTable GetInsuPersonalTaxInfo(string EmpID, string CustID)
        {
            if (string.IsNullOrEmpty(EmpID))
                EmpID = "0";
            if (string.IsNullOrEmpty(CustID))
                CustID = "0";
            //获取登陆用户信息
            UserInfoUtil userInfo = (UserInfoUtil)SessionUtil.Session["UserInfo"];
            //执行查询
            return SalaryPersonalRoyaltySetDBHelper.SearchInsuPersonalTaxInfo(userInfo.CompanyCD, EmpID,CustID);
        }
       public static bool SaveInsuPersonInfo(string EmpID,string CustID,IList<SalaryPersonalRoyaltySetModel> modelist)
        {
            //定义返回变量
            bool isSucc = true;
            //信息存在时，进行操作
            //if (modelist != null && modelist.Count > 0)
            //{
                //获取登陆用户信息
                UserInfoUtil userInfo = (UserInfoUtil)SessionUtil.Session["UserInfo"];
                //执行保存操作
                try
                {
                    //执行保存操作
                    isSucc = SalaryPersonalRoyaltySetDBHelper.UpdateIsuPersonalTaxInfo(userInfo.CompanyCD,EmpID,CustID,modelist);
                }
                catch (Exception ex)
                {
                    //输出系统日志
                    WriteSystemLog(userInfo, ex);
                }
                //操作日志
                LogInfoModel logModel = InitLogInfo(userInfo.CompanyCD);
                //设置关键元素
                logModel.Element = ConstUtil.LOG_PROCESS_UPDATE;

                //更新成功时
                if (isSucc)
                {
                    //设置操作成功标识
                    logModel.Remark = ConstUtil.LOG_PROCESS_SUCCESS;
                }
                //更新不成功
                else
                {
                    //设置操作成功标识 
                    logModel.Remark = ConstUtil.LOG_PROCESS_FAILED;
                }

                //登陆日志
                LogDBHelper.InsertLog(logModel);
            //}

            return isSucc;
        }
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
            logSys.ModuleID = ConstUtil.MODULE_ID_HUMAN_SALARY_SET;
            //描述
            logSys.Description = ex.ToString();

            //输出日志
            LogUtil.WriteLog(logSys);
        }

        private static LogInfoModel InitLogInfo(string no)
        {
            LogInfoModel logModel = new LogInfoModel();
            //获取登陆用户信息
            UserInfoUtil userInfo = (UserInfoUtil)SessionUtil.Session["UserInfo"];
            //设置公司代码
            logModel.CompanyCD = userInfo.CompanyCD;
            //设置登陆用户ID
            logModel.UserID = userInfo.UserID;
            //设置模块ID
            logModel.ModuleID = ConstUtil.MODULE_ID_HUMAN_SALARY_SET;
            //设置操作日志类型 修改
            logModel.ObjectName = ConstUtil.CODING_RULE_TABLE_INSU_SOCIAL;//操作对象
            //
            logModel.ObjectID = no;

            return logModel;

        }
        /// <summary>
        /// 选择执行状态的单据
        /// </summary>
        /// <returns></returns>
        public static DataTable GetCustList(string OrderNo, string Title, string model, int pageIndex, int pageCount, string ord, ref int TotalCount)
        {
            return SalaryPersonalRoyaltySetDBHelper.GetCustList(OrderNo, Title, model, pageIndex, pageCount, ord, ref TotalCount);
        }
        /// <summary>
        /// 选择执行状态的单据by BigType
        /// </summary>
        /// <returns></returns>
        public static DataTable GetCustListByType(string OrderNo, string BigType, string Title, string model, int pageIndex, int pageCount, string ord, ref int TotalCount)
        {
            return SalaryPersonalRoyaltySetDBHelper.GetCustList(OrderNo,BigType, Title, model, pageIndex, pageCount, ord, ref TotalCount);
        }



        /// <summary>
        /// 获取客户详细信息
        /// </summary>
        /// <param name="strID">客户编号</param>
        /// <returns></returns>
        public static DataTable GetCustInfo(string strID)
        {
            return SalaryPersonalRoyaltySetDBHelper.GetCustInfo(strID);
        }
    }
}
