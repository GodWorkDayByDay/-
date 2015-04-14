﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Collections;

using XBase.Model.Office.StorageManager;
using XBase.Business.Common;
using XBase.Model.Common;
using XBase.Data.Common;
using XBase.Common;
namespace XBase.Business.Office.StorageManager
{
    public class StorageReturnBus
    {
        #region 读取借货单列表
        public static DataTable GetSorageBorrow(Hashtable htPara, int PageIndex, int PageSize, string OrderBy, ref int TotalCount)
        {
            return XBase.Data.Office.StorageManager.StorageReturnDBHelper.GetStorageBorrow(htPara,PageIndex,PageSize,OrderBy,ref TotalCount);
        }
        #endregion

        #region 读取借货单明细
        public static DataTable GetStroageBorrowDetail(string CompanyCD, string BorrowNo)
        {
            return XBase.Data.Office.StorageManager.StorageReturnDBHelper.GetStorageBorrowDetail(CompanyCD, BorrowNo);
        }
        #endregion

        #region 添加借货返还单 与 明细
        public static string StorageReturnAdd(XBase.Model.Office.StorageManager.StorageReturn sr, List<XBase.Model.Office.StorageManager.StorageReturnDetail> srdList, Hashtable ht)
        {
            // return "2|" + ID + "#" + sr.ReturnNo;
            //定义返回变量
            string res = string.Empty;
            /* 
             * 定义日志内容变量 
             * 增删改相关的日志，需要输出操作日志，该类型日志插入到数据库
             * 其他的 如出现异常时，需要输出系统日志，该类型日志保存到日志文件
             */
            //获取当前用户信息
            UserInfoUtil userInfo = (UserInfoUtil)SessionUtil.Session["UserInfo"];

            //执行操作
            try
            {
                //执行操作
                res = XBase.Data.Office.StorageManager.StorageReturnDBHelper.StorageReturnAdd(sr, srdList,ht);
            }
            catch (Exception ex)
            {
                //输出日志
                WriteSystemLog(userInfo, ex);
            }
            //定义变量
            string remark;
            //成功时
            if (res.Split('|')[0] == "2")
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
            LogInfoModel logModel = InitLogInfo(sr.ReturnNo);
            //涉及关键元素 这个需要根据每个页面具体设置，本页面暂时设置为空
            logModel.Element = ConstUtil.LOG_PROCESS_INSERT;
            //设置操作成功标识
            logModel.Remark = remark;

            //登陆日志
            LogDBHelper.InsertLog(logModel);
            return res;
        }
        #endregion

        #region 更新借货返还单 及其明细
        public static string StorageReturnUpdate(XBase.Model.Office.StorageManager.StorageReturn sr, List<XBase.Model.Office.StorageManager.StorageReturnDetail> srdList, Hashtable ht)
        {
            // return "1|";
            //定义返回变量
            string res = string.Empty;
            /* 
             * 定义日志内容变量 
             * 增删改相关的日志，需要输出操作日志，该类型日志插入到数据库
             * 其他的 如出现异常时，需要输出系统日志，该类型日志保存到日志文件
             */
            //获取当前用户信息
            UserInfoUtil userInfo = (UserInfoUtil)SessionUtil.Session["UserInfo"];

            //执行操作
            try
            {
                //执行操作
                res = XBase.Data.Office.StorageManager.StorageReturnDBHelper.StorageReturnUpdate(sr, srdList,ht);
            }
            catch (Exception ex)
            {
                //输出日志
                WriteSystemLog(userInfo, ex);
            }
            //定义变量
            string remark;
            //成功时
            if (res.Split('|')[0] == "1")
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
            LogInfoModel logModel = InitLogInfo(sr.ReturnNo);
            //涉及关键元素 这个需要根据每个页面具体设置，本页面暂时设置为空
            logModel.Element = ConstUtil.LOG_PROCESS_UPDATE;
            //设置操作成功标识
            logModel.Remark = remark;

            //登陆日志
            LogDBHelper.InsertLog(logModel);
            return res;
        }
        #endregion

        #region 读取借货返还单列表
        public static DataTable GetStorageReturnList(string EFIndex, string EFDesc, Hashtable htPara, string CompanyCD, int PageSize, int PageIndex, string OrderBy, ref int TotalCount,string productname)
        {
            return XBase.Data.Office.StorageManager.StorageReturnDBHelper.GetStorageReturnList(EFIndex,EFDesc,htPara, CompanyCD,PageSize,PageIndex,OrderBy,ref TotalCount,productname);
        }

        /*不分页*/
        public static DataTable GetStorageReturnList(Hashtable htPara, string CompanyCD, string OrderBy,string productname)
        {
            return XBase.Data.Office.StorageManager.StorageReturnDBHelper.GetStorageReturnList(htPara, CompanyCD,  OrderBy,productname);
        }
        #endregion

        #region 删除 借货返还单 及其明细
        public static string DelStorageReturn(string[] ID)
        {
            bool flag = false;

            //string res = string.Empty;
            /* 
             * 定义日志内容变量 
             * 增删改相关的日志，需要输出操作日志，该类型日志插入到数据库
             * 其他的 如出现异常时，需要输出系统日志，该类型日志保存到日志文件
             */
            //获取当前用户信息
            UserInfoUtil userInfo = (UserInfoUtil)SessionUtil.Session["UserInfo"];

            //执行操作
            try
            {
                //执行操作
                flag = XBase.Data.Office.StorageManager.StorageReturnDBHelper.DelStorageReturn(ID);
            }
            catch (Exception ex)
            {
                //输出日志
                WriteSystemLog(userInfo, ex);
            }
            //定义变量
            string remark;
            //成功时
            if (flag)
            {
                //设置操作成功标识
                remark = ConstUtil.LOG_PROCESS_SUCCESS;
            }
            else
            {
                //设置操作成功标识 
                remark = ConstUtil.LOG_PROCESS_FAILED;
            }
            string idInfo = string.Empty;
            foreach (string str in ID)
            {
                idInfo += str + ",";
            }
            //操作日志
            LogInfoModel logModel = InitLogInfo(idInfo);
            //涉及关键元素 这个需要根据每个页面具体设置，本页面暂时设置为空
            logModel.Element = ConstUtil.LOG_PROCESS_DELETE;
            //设置操作成功标识
            logModel.Remark = remark;

            //登陆日志
            LogDBHelper.InsertLog(logModel);

            if (flag)
                return "2";
            else
                return "1";
        }
        #endregion

        #region 读取借货返还单信息
        public static DataTable GetStorageReturn(int ID)
        {
            return XBase.Data.Office.StorageManager.StorageReturnDBHelper.GetStorageReturnInfo(ID);
        }
        #endregion

        #region 读取对应借货返还单明细
        public static DataTable GetStorageReturnDetailList(string CompanyCD, string ReturnNo)
        {
            return XBase.Data.Office.StorageManager.StorageReturnDBHelper.GetStorageReturnDetailList(CompanyCD, ReturnNo);
        }
        #endregion

        #region 更新状态 实现业务逻辑操作
        public static string UpdateStatus(Model.Office.StorageManager.StorageReturn sr, string stype)
        {
            //定义返回变量
            bool res = false;
            /* 
             * 定义日志内容变量 
             * 增删改相关的日志，需要输出操作日志，该类型日志插入到数据库
             * 其他的 如出现异常时，需要输出系统日志，该类型日志保存到日志文件
             */
            //获取当前用户信息
            UserInfoUtil userInfo = (UserInfoUtil)SessionUtil.Session["UserInfo"];
            string msg = "";
            //执行操作
            try
            {
                //执行操作
                res = XBase.Data.Office.StorageManager.StorageReturnDBHelper.UpdateStatus(sr, stype,ref msg);
            }
            catch (Exception ex)
            {
                //输出日志
                WriteSystemLog(userInfo, ex);
            }
            //定义变量
            string remark;
            //成功时
            if (res)
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
            LogInfoModel logModel = InitLogInfo(sr.ReturnNo);
            //涉及关键元素 这个需要根据每个页面具体设置，本页面暂时设置为空
            if (stype == "1")
                logModel.Element = ConstUtil.LOG_PROCESS_CONFIRM;
            else if (stype == "2")
                logModel.Element = ConstUtil.LOG_PROCESS_COMPLETE;
            else if (stype == "3")
                logModel.Element = ConstUtil.LOG_PROCESS_CONCELCOMPLETE;
            //设置操作成功标识
            logModel.Remark = remark;

            //登陆日志
            LogDBHelper.InsertLog(logModel);
            if (res)
                return "1|";
            else
                return "0|"+msg;


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
            logSys.ModuleID = ConstUtil.MODULE_ID_STORAGE_RETURN_SAVE;
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
        private static LogInfoModel InitLogInfo(string InNo)
        {
            LogInfoModel logModel = new LogInfoModel();
            //获取登陆用户信息
            UserInfoUtil userInfo = (UserInfoUtil)SessionUtil.Session["UserInfo"];
            //设置公司代码
            logModel.CompanyCD = userInfo.CompanyCD;
            //设置登陆用户ID
            logModel.UserID = userInfo.UserID;
            //设置模块ID 模块ID请在ConstUtil中定义，以便维护
            logModel.ModuleID = ConstUtil.MODULE_ID_STORAGE_RETURN_SAVE;
            //设置操作日志类型 修改
            logModel.ObjectName = "StorageReturn";
            //操作对象
            logModel.ObjectID = InNo;
            //涉及关键元素 这个需要根据每个页面具体设置，本页面暂时设置为空
            logModel.Element = string.Empty;

            return logModel;

        }
        #endregion


    }
}
