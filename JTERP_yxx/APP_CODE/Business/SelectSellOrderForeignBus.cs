﻿/*************************************
 * 创建人：宋凯歌
 * 创建日期：2010-11-19
 * 描述：销售订单选择控件业务处理
 ************************************/
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using XBase.Data.Office.SellManager;

namespace XBase.Business.Office.SellManager
{
    public class SelectSellOrderForeignBus
    {
        #region 获取销售销售订单列表
        /// <summary>
        /// 获取销售销售订单列表
        /// </summary>
        /// <param name="strCompanyCD">公司编码</param>
        /// <param name="BranchID">分店ID，总店0</param>
        /// <param name="pageIndex">页码</param>
        /// <param name="pageCount">页数</param>
        /// <param name="ord">排序</param>
        /// <param name="totalCount">总记录数</param>
        /// <returns>datatable</returns>
        public static DataTable GetSellOrderList(string strCompanyCD, int BranchID, int pageIndex, int pageCount, string ord, ref int totalCount)
        {
            return SelectSellOrderForeignDBHelper.GetSellOrderList(strCompanyCD, BranchID, pageIndex, pageCount, ord, ref totalCount);
        }
        #endregion

        #region 获取销售订单明细列表信息
        /// <summary>
        /// 获取销售订单明细列表信息
        /// </summary>
        /// <param name="sellOrderNo">销售订单编号</param>
        /// <param name="sellOrderID">销售订单ID</param>
        /// <param name="strCompanyCD">公司编码</param>
        /// <returns>datatable</returns>
        public static DataTable GetSellOrderDetail(string sellOrderNo, int sellOrderID, string strCompanyCD)
        {
            return SelectSellOrderForeignDBHelper.GetSellOrderDetail(sellOrderNo, sellOrderID, strCompanyCD);
        }
        #endregion

    }
}
