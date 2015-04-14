﻿/**********************************************
 * 描述：    固定资产类别业务处理
 * 建立人：   江贻明
 * 建立时间： 2009/03/30
 ***********************************************/
using System;
using XBase.Data.Office.FinanceManager;
using XBase.Model.Office.FinanceManager;
using System.Data;
using System.Data.SqlClient;
using XBase.Common;

using XBase.Model.Common;
using XBase.Data.Common;
using XBase.Business.Common;

namespace XBase.Business.Office.FinanceManager
{
  public  class AssetTypeSettingBus
  {
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
           * 但还是考虑将异常日志的变量定义放在catch里面
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
          logSys.ModuleID = ConstUtil.MODULE_ID_ASSETTYPE_LIST;
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
      private static LogInfoModel InitLogInfo(string wcno)
      {
          LogInfoModel logModel = new LogInfoModel();
          //获取登陆用户信息
          UserInfoUtil userInfo = (UserInfoUtil)SessionUtil.Session["UserInfo"];
          //设置公司代码
          logModel.CompanyCD = userInfo.CompanyCD;
          //设置登陆用户ID
          logModel.UserID = userInfo.UserID;
          //设置模块ID 模块ID请在ConstUtil中定义，以便维护
          logModel.ModuleID = ConstUtil.MODULE_ID_ASSETTYPE_LIST;

          //设置操作日志类型 修改
          logModel.ObjectName = ConstUtil.CODING_RULE_TABLE_ASSETTYPESETTING;
          //操作对象
          logModel.ObjectID = wcno;
          //涉及关键元素 这个需要根据每个页面具体设置，本页面暂时设置为空
          logModel.Element = string.Empty;
          return logModel;
      }
      #endregion

      #region 判断资产类别是否被引用
      public static bool IsAssetTypeReference(int TypeID)
      {
          try
          {
              return AssetTypeSettingDBHelper.IsAssetTypeReference(TypeID);
          }
          catch (Exception ex)
          {
              throw ex;
          }
      }
      #endregion



      #region 添加固定资产类别
      /// <summary>
       /// 添加固定资产类别
       /// </summary>
       /// <param name="Model">实体</param>
       /// <returns>true 成功，false失败</returns>
      public static bool InsertAssetType(AssetTypeSettingModel Model, out int ID)
      {
          UserInfoUtil userInfo = (UserInfoUtil)SessionUtil.Session["UserInfo"];

          if (Model.CompanyCD == null) Model.CompanyCD = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).CompanyCD;


          try
          {
              bool succ = false;
              string loginUserID = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).UserID;
              LogInfoModel logModel = InitLogInfo(Model.SubjectsCD);
              logModel.Element = ConstUtil.LOG_PROCESS_INSERT;


              succ = AssetTypeSettingDBHelper.InsertAssetType(Model, out ID);

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
              throw ex;
          }
      }
      #endregion

      #region 根据类别ID获取类别信息
      /// <summary>
       /// 根据类别ID获取类别信息
       /// </summary>
       /// <param name="TypeID">类别ID</param>
       /// <returns>DataTable</returns>
      public static DataTable GetAssetTypeByTypeID(string ID)
      {
          if (string.IsNullOrEmpty(ID)) return null;
          try
          {
              return AssetTypeSettingDBHelper.GetAssetTypeByTypeID(ID);
          }
          catch (Exception ex)
          {
              throw ex;
          }
      }
      #endregion

      #region 根据类别ID获取类别名称
      /// <summary>
      /// 根据类别ID获取类别信息
      /// </summary>
      /// <param name="TypeID">类别ID</param>
      /// <returns>DataTable</returns>
      public static string GetAssetTypeNameByTypeID(string ID)
      {
          if (string.IsNullOrEmpty(ID)) return null;
          try
          {
              return AssetTypeSettingDBHelper.GetAssetTypeNameByTypeID(ID);
          }
          catch (Exception ex)
          {
              throw ex;
          }
      }
      #endregion


      #region 获取类别名称
      /// <summary>
       /// 获取类别名称
       /// </summary>
       /// <param name="CompanyCD">企业编码</param>
       /// <returns>DataTable</returns>
      public static DataTable GetAssetType()
      {
          string CompanyCD = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).CompanyCD;
          if (string.IsNullOrEmpty(CompanyCD)) return null;
          try
          {
              return AssetTypeSettingDBHelper.GetAssetType(CompanyCD);
          }
          catch (Exception ex)
          {
              throw ex;
          }
      }
      #endregion

      #region 获取固定资产类别信息
       /// <summary>
       /// 获取固定资产类别信息
       /// </summary>
       /// <returns>DataTable</returns>
      public static DataTable GetAssetTypeInfo()
      {
          string CompanyCD = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).CompanyCD;
          if(string.IsNullOrEmpty(CompanyCD)) return null;
          try
          {
              DataTable dt = AssetTypeSettingDBHelper.GetAssetTypeInfo(CompanyCD);
              if (dt != null && dt.Rows.Count > 0)
              {
                  foreach (DataRow rows in dt.Rows)
                  {
                      if (rows["UsedStatus"].ToString() == ConstUtil.USED_STATUS_ON)
                      {
                          rows["UsedStatus"] = ConstUtil.USED_STATUS_ON_NAME;
                      }
                      else if (rows["UsedStatus"].ToString() == ConstUtil.USED_STATUS_OFF)
                      {
                          rows["UsedStatus"] = ConstUtil.USED_STATUS_OFF_NAME;
                      }
                      if (rows["CountMethod"].ToString() == ConstUtil.ASSETCOUNT_METHOD_NXPJF_CODE)
                      {
                          rows["CountMethod"] = ConstUtil.ASSETCOUNT_METHOD_NXPJF_NAME;
                      }
                      else if (rows["CountMethod"].ToString() == ConstUtil.ASSETCOUNT_METHOD_GZLF_CODE)
                      {
                          rows["CountMethod"] = ConstUtil.ASSETCOUNT_METHOD_GZLF_NAME;
                      }
                      else if (rows["CountMethod"].ToString() == ConstUtil.ASSETCOUNT_METHOD_NXZHF_CODE)
                      {
                          rows["CountMethod"] = ConstUtil.ASSETCOUNT_METHOD_NXZHF_NAME;
                      }
                      else if (rows["CountMethod"].ToString() == ConstUtil.ASSETCOUNT_METHOD_SBYETJS_CODE)
                      {
                          rows["CountMethod"] = ConstUtil.ASSETCOUNT_METHOD_SBYETJS_NAME;
                      }
                  }
              }
              return dt;
          }
          catch(Exception ex)
          {
              throw ex;
          }
      }
      #endregion

      #region 修改固定资产类别
       /// <summary>
       /// 修改固定资产类别
       /// </summary>
       /// <param name="Model">实体</param>
       /// <returns>true 成功，false失败</returns>
      public static bool UpdateAssetType(AssetTypeSettingModel Model)
      {
          UserInfoUtil userInfo = (UserInfoUtil)SessionUtil.Session["UserInfo"];

          if (Model == null) return false;
          if (Model.CompanyCD == null) Model.CompanyCD = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).CompanyCD;
          try
          {
              bool succ = false;
              string loginUserID = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).UserID;
              LogInfoModel logModel = InitLogInfo(Model.ID.ToString());
              logModel.Element = ConstUtil.LOG_PROCESS_UPDATE;

              succ = AssetTypeSettingDBHelper.UpdateAssetType(Model);
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
              throw ex;
          }
      }
      #endregion

      #region 删除固定资产类别
       /// <summary>
       /// 删除固定资产类别
       /// </summary>
       /// <param name="CompanyCD">企业编码</param>
       /// <param name="ID">主键</param>
       /// <returns>true 成功，false失败</returns>
      public static bool DeleteAssetType(string ID)
      {
          bool isSucc = false;


          UserInfoUtil userInfo = (UserInfoUtil)SessionUtil.Session["UserInfo"];

          string CompanyCD = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).CompanyCD;
          if (string.IsNullOrEmpty(ID) && string.IsNullOrEmpty(CompanyCD)) return false;
          try
          {
              isSucc= AssetTypeSettingDBHelper.DeleteAssetType(CompanyCD, ID);
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
              string[] noList = ID.Split(',');
              for (int i = 0; i < noList.Length; i++)
              {
                  //获取编号
                  string no = noList[i];
                  //替换两边的 '
                  no = no.Replace("'", string.Empty);
                  //操作日志
                  LogInfoModel logModel = InitLogInfo(no);
                  //涉及关键元素 这个需要根据每个页面具体设置，本页面暂时设置为空
                  logModel.Element = ConstUtil.LOG_PROCESS_DELETE;
                  //设置操作成功标识
                  logModel.Remark = remark;
                  //登陆日志
                  LogDBHelper.InsertLog(logModel);
              }
              return isSucc;
          }
          catch (Exception ex)
          {
              throw ex;
          }
      }
      #endregion
  }
}
