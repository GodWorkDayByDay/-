﻿/**********************************************
 * 类作用：   绩效工资基数录入
 * 建立人：   肖合明
 * 建立时间： 2009/09/11
 ***********************************************/
using System;
using XBase.Model.Office.HumanManager;
using XBase.Data.Office.HumanManager;
using XBase.Common;
using XBase.Model.Common;
using XBase.Data.Common;
using XBase.Business.Common;
using System.Data;
using System.Collections;
using System.Collections.Generic;
namespace XBase.Business.Office.HumanManager
{
    public class PerformanceRoyaltyBaseBus
    {
        #region 查询：绩效工资基数录入信息
        /// <summary>
        /// 查询绩效工资基数信息
        /// </summary>
        /// <returns>DataTable</returns>
        public static DataTable GetInfo(PerformanceRoyaltyBaseModel model, int pageIndex, int pageCount, string ord, ref int TotalCount)
        {
            try
            {
                return PerformanceRoyaltyBaseDBHelper.GetInfo(model, pageIndex, pageCount, ord, ref TotalCount);
            }
            catch (Exception)
            {

                throw;
            }
        }
        #endregion

        #region 插入
        /// <summary>
        /// 插入一条新的数据，如果成功给Model.ID赋值主键，否则Model.ID="0"
        /// </summary>
        /// <param name="Model"></param>
        /// <returns></returns>
        public static bool InSert(PerformanceRoyaltyBaseModel Model)
        {
            //获取登陆用户信息
            UserInfoUtil userInfo = (UserInfoUtil)SessionUtil.Session["UserInfo"];
            //定义返回变量
            bool isSucc = false;
            /* 
             * 定义日志内容变量 
             * 增删改相关的日志，需要输出操作日志，该类型日志插入到数据库
             * 其他的 如出现异常时，需要输出系统日志，该类型日志保存到日志文件
             */
            try
            {
                isSucc = PerformanceRoyaltyBaseDBHelper.InSert(Model);
            }
            catch (Exception ex)
            {

                //输出日志
                WriteSystemLog(userInfo, ex);
            }
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
            //操作日志
            LogInfoModel logModel = InitLogInfo(Model.EmployeeID);
            //涉及关键元素 这个需要根据每个页面具体设置，本页面暂时设置为空
            logModel.Element = ConstUtil.LOG_PROCESS_INSERT;
            //设置操作成功标识
            logModel.Remark = remark;

            //登陆日志
            LogDBHelper.InsertLog(logModel);
            return isSucc;
        }
        #endregion


        #region 判断插入之前，改设置是否已经存在
        /// <summary>
        /// 存在则返回true
        /// </summary>
        /// <param name="Model"></param>
        /// <returns></returns>
        public static bool ifEitst(PerformanceRoyaltyBaseModel Model)
        {
            try
            {
                return PerformanceRoyaltyBaseDBHelper.ifEitst(Model);
            }
            catch (Exception)
            {

                throw;
            }
        }

        #endregion

        #region 更新
        /// <summary>
        /// 更新数据
        /// </summary>
        /// <param name="Model"></param>
        /// <returns></returns>
        public static bool Update(PerformanceRoyaltyBaseModel Model)
        {
            //获取登陆用户信息
            UserInfoUtil userInfo = (UserInfoUtil)SessionUtil.Session["UserInfo"];
            //定义返回变量
            bool isSucc = false;
            /* 
             * 定义日志内容变量 
             * 增删改相关的日志，需要输出操作日志，该类型日志插入到数据库
             * 其他的 如出现异常时，需要输出系统日志，该类型日志保存到日志文件
             */
            try
            {
                isSucc = PerformanceRoyaltyBaseDBHelper.Update(Model);
            }
            catch (Exception ex)
            {

                //输出日志
                WriteSystemLog(userInfo, ex);
            }
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
            //操作日志
            LogInfoModel logModel = InitLogInfo(Model.EmployeeID);
            //涉及关键元素 这个需要根据每个页面具体设置，本页面暂时设置为空
            logModel.Element = ConstUtil.LOG_PROCESS_UPDATE;
            //设置操作成功标识
            logModel.Remark = remark;

            //登陆日志
            LogDBHelper.InsertLog(logModel);
            return isSucc;
        }
        #endregion

        #region 删除
        /// <summary>
        /// 删除事件（通过ID数组删除）
        /// </summary>
        /// <param name="StrID"></param>
        /// <returns></returns>
        public static bool DoDelete(string StrID)
        {
            //获取登陆用户信息
            UserInfoUtil userInfo = (UserInfoUtil)SessionUtil.Session["UserInfo"];
            //定义返回变量
            bool isSucc = false;
            /* 
             * 定义日志内容变量 
             * 增删改相关的日志，需要输出操作日志，该类型日志插入到数据库
             * 其他的 如出现异常时，需要输出系统日志，该类型日志保存到日志文件
             */
            try
            {
                isSucc = PerformanceRoyaltyBaseDBHelper.DoDelete(StrID, userInfo.CompanyCD);
            }
            catch (Exception ex)
            {

                //输出日志
                WriteSystemLog(userInfo, ex);
            }
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
            //操作日志
            LogInfoModel logModel = InitLogInfo(StrID);
            //涉及关键元素 这个需要根据每个页面具体设置，本页面暂时设置为空
            logModel.Element = ConstUtil.LOG_PROCESS_DELETE;
            //设置操作成功标识
            logModel.Remark = remark;

            //登陆日志
            LogDBHelper.InsertLog(logModel);
            return isSucc;
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
            logSys.ModuleID = "2011701";
            //logSys.ModuleID = ConstUtil.MODULE_ID_STORAGE_STORAGELOSS_ADD;
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
        private static LogInfoModel InitLogInfo(string ID)
        {
            LogInfoModel logModel = new LogInfoModel();
            //获取登陆用户信息
            UserInfoUtil userInfo = (UserInfoUtil)SessionUtil.Session["UserInfo"];
            //设置公司代码
            logModel.CompanyCD = userInfo.CompanyCD;
            //设置登陆用户ID
            logModel.UserID = userInfo.UserID;
            //设置模块ID 模块ID请在ConstUtil中定义，以便维护

            logModel.ModuleID = "2011701";
            //设置操作日志类型 修改
            logModel.ObjectName = "PerformanceRoyaltyBase";
            //操作对象
            logModel.ObjectID = ID;
            //涉及关键元素 这个需要根据每个页面具体设置，本页面暂时设置为空
            logModel.Element = string.Empty;

            return logModel;

        }
        #endregion
    }
}
