﻿/**********************************************
 * 类作用：   车辆维护事务层处理
 * 建立人：   lysong
 * 建立时间： 2009/05/04
 ***********************************************/
using System;
using XBase.Model.Office.AdminManager;
using XBase.Data.Office.AdminManager;
using XBase.Common;
using System.Data;

namespace XBase.Business.Office.AdminManager
{
    /// <summary>
    /// 类名：CarRepairBus
    /// 描述：车辆维护事务层处理
    /// 作者：lysong
    /// 创建时间：2009/05/04
    /// </summary>
   public class CarRepairBus
   {
       #region 添加车辆维修信息
        /// <summary>
        /// 添加车辆维修信息
        /// </summary>
        /// <param name="RepairInfos">车辆维修信息</param>
        /// <param name="userID">用户ID</param>
        /// <param name="CompanyID">公司代码</param>
        /// <returns>成功：true,失败:false</returns>
       public static bool AddCarRepairInfo(string RepairInfos, string userID, string CompanyID, int Employeeid)
        {
            return CarRepairDBHelper.AddCarRepairInfo(RepairInfos, userID, CompanyID, Employeeid);
        }
        #endregion
       #region 查询车辆维修信息列表
       /// <summary>
       /// 查询车辆加油信息列表
       /// </summary>
       /// <returns>DataTable</returns>
       public static DataTable GetCarRepairList(string CompanyID, string CarNo, string CarMark, string JoinUser, string StartGasDate, string EndGasDate,int pageIndex,int pageCount,string ord, ref int TotalCount)
       {
           try
           {
               return CarRepairDBHelper.GetCarRepairList(CompanyID, CarNo, CarMark, JoinUser, StartGasDate, EndGasDate, pageIndex, pageCount, ord, ref TotalCount);
           }

           catch (System.Exception ex)
           {
               throw ex;
           }
       }
       #endregion

       #region 修改车辆维修信息
       /// <summary>
       /// 修改车辆维修信息
       /// </summary>
       /// <param name="RepairInfos">车辆维修信息</param>
       /// <param name="userID">用户ID</param>
       /// <param name="CompanyID">公司代码</param>
       /// <returns>成功：true,失败:false</returns>
       public static bool UpdateRepairInfo(string RepairInfos, string userID, string CompanyID, int Employeeid)
       {
           return CarRepairDBHelper.UpdateRepairInfo(RepairInfos, userID, CompanyID, Employeeid);
       }
       #endregion
    }
}
