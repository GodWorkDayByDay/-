﻿/****************************************
 * 修改记录：
 *     1.添加字段：可查看人员CanViewUser varchar(2048)  于2010-4-7 add by hexw
 *      
 * ***************************************/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace XBase.Model.Office.SellManager
{
    /// <summary>
    /// 实体类SellOfferModel 。
    /// </summary>
    public class SellOfferModel
    {
        #region Model
        private int _id;
        private string _companycd;
        private string _offerno;
        private int? _custid;
        private string _custtel;
        private string _fromtype;
        private int? _frombillid;
        private string _title;
        private int? _seller;
        private int? _selldeptid;
        private int? _selltype;
        private string _busitype;
        private int? _paytype;
        private int? _moneytype;
        private int? _carrytype;
        private int? _taketype;
        private DateTime? _expiredate;
        private decimal? _totalprice;
        private decimal? _totaltax;
        private decimal? _totalfee;
        private decimal? _discount;
        private decimal? _discounttotal;
        private decimal? _realtotal;
        private string _isaddtax;
        private decimal? _counttotal;
        private int? _currencytype;
        private decimal? _rate;
        private int? _quotetime;
        private DateTime? _offerdate;
        private string _payremark;
        private string _deliverremark;
        private string _packtransit;
        private string _remark;
        private string _billstatus;
        private int? _creator;
        private DateTime? _createdate;
        private int? _confirmor;
        private DateTime? _confirmdate;
        private int? _closer;
        private DateTime? _closedate;
        private DateTime? _modifieddate;
        private string _modifieduserid;
        private string _canViewUser;
        private string _askagain;
        private int? _custlinkid;
        private string _custlinkname;
        private string _custlinkhandset;
        private string _custlinkaddr;
        /// <summary>
        /// 
        /// </summary>
        public int ID
        {
            set { _id = value; }
            get { return _id; }
        }
        /// <summary>
        /// 公司代码
        /// </summary>
        public string CompanyCD
        {
            set { _companycd = value; }
            get { return _companycd; }
        }
        /// <summary>
        /// 报价单编号
        /// </summary>
        public string OfferNo
        {
            set { _offerno = value; }
            get { return _offerno; }
        }
        /// <summary>
        /// 客户ID（关联客户信息表）
        /// </summary>
        public int? CustID
        {
            set { _custid = value; }
            get { return _custid; }
        }
        /// <summary>
        /// 客户联系电话
        /// </summary>
        public string CustTel
        {
            set { _custtel = value; }
            get { return _custtel; }
        }
        /// <summary>
        /// 源单类型（0无来源，1销售机会）
        /// </summary>
        public string FromType
        {
            set { _fromtype = value; }
            get { return _fromtype; }
        }
        /// <summary>
        /// 销售机会ID
        /// </summary>
        public int? FromBillID
        {
            set { _frombillid = value; }
            get { return _frombillid; }
        }
        /// <summary>
        /// 报价主题
        /// </summary>
        public string Title
        {
            set { _title = value; }
            get { return _title; }
        }
        /// <summary>
        /// 业务员(对应员工表ID)
        /// </summary>
        public int? Seller
        {
            set { _seller = value; }
            get { return _seller; }
        }
        /// <summary>
        /// 部门(对部门表ID)
        /// </summary>
        public int? SellDeptId
        {
            set { _selldeptid = value; }
            get { return _selldeptid; }
        }
        /// <summary>
        /// 销售类别ID（对应分类代码表ID）
        /// </summary>
        public int? SellType
        {
            set { _selltype = value; }
            get { return _selltype; }
        }
        /// <summary>
        /// 业务类型（1普通销售,2委托代销,3直运，4零售，5销售调拨）
        /// </summary>
        public string BusiType
        {
            set { _busitype = value; }
            get { return _busitype; }
        }
        /// <summary>
        /// 结算方式ID（对应分类代码表ID）
        /// </summary>
        public int? PayType
        {
            set { _paytype = value; }
            get { return _paytype; }
        }
        /// <summary>
        /// 支付方式ID（对应分类代码表ID）
        /// </summary>
        public int? MoneyType
        {
            set { _moneytype = value; }
            get { return _moneytype; }
        }
        /// <summary>
        /// 运送方式ID（对应分类代码表ID）
        /// </summary>
        public int? CarryType
        {
            set { _carrytype = value; }
            get { return _carrytype; }
        }
        /// <summary>
        /// 交货方式ID（对应分类代码表ID）
        /// </summary>
        public int? TakeType
        {
            set { _taketype = value; }
            get { return _taketype; }
        }
        /// <summary>
        /// 有效截止日期
        /// </summary>
        public DateTime? ExpireDate
        {
            set { _expiredate = value; }
            get { return _expiredate; }
        }
        /// <summary>
        /// 金额合计
        /// </summary>
        public decimal? TotalPrice
        {
            set { _totalprice = value; }
            get { return _totalprice; }
        }
        /// <summary>
        /// 税额合计
        /// </summary>
        public decimal? TotalTax
        {
            set { _totaltax = value; }
            get { return _totaltax; }
        }
        /// <summary>
        /// 含税金额合计
        /// </summary>
        public decimal? TotalFee
        {
            set { _totalfee = value; }
            get { return _totalfee; }
        }
        /// <summary>
        /// 整单折扣（%）
        /// </summary>
        public decimal? Discount
        {
            set { _discount = value; }
            get { return _discount; }
        }
        /// <summary>
        /// 折扣金额
        /// </summary>
        public decimal? DiscountTotal
        {
            set { _discounttotal = value; }
            get { return _discounttotal; }
        }
        /// <summary>
        /// 折后含税金额
        /// </summary>
        public decimal? RealTotal
        {
            set { _realtotal = value; }
            get { return _realtotal; }
        }
        /// <summary>
        /// 是否增值税（0否,1是
        /// </summary>
        public string isAddTax
        {
            set { _isaddtax = value; }
            get { return _isaddtax; }
        }
        /// <summary>
        /// 产品数量合计
        /// </summary>
        public decimal? CountTotal
        {
            set { _counttotal = value; }
            get { return _counttotal; }
        }
        /// <summary>
        /// 币种ID
        /// </summary>
        public int? CurrencyType
        {
            set { _currencytype = value; }
            get { return _currencytype; }
        }
        /// <summary>
        /// 汇率
        /// </summary>
        public decimal? Rate
        {
            set { _rate = value; }
            get { return _rate; }
        }
        /// <summary>
        /// 报价次数
        /// </summary>
        public int? QuoteTime
        {
            set { _quotetime = value; }
            get { return _quotetime; }
        }
        /// <summary>
        /// 报价日期
        /// </summary>
        public DateTime? OfferDate
        {
            set { _offerdate = value; }
            get { return _offerdate; }
        }
        /// <summary>
        /// 付款说明
        /// </summary>
        public string PayRemark
        {
            set { _payremark = value; }
            get { return _payremark; }
        }
        /// <summary>
        /// 交付说明
        /// </summary>
        public string DeliverRemark
        {
            set { _deliverremark = value; }
            get { return _deliverremark; }
        }
        /// <summary>
        /// 包装运输说明
        /// </summary>
        public string PackTransit
        {
            set { _packtransit = value; }
            get { return _packtransit; }
        }
        /// <summary>
        /// 备注
        /// </summary>
        public string Remark
        {
            set { _remark = value; }
            get { return _remark; }
        }
        /// <summary>
        /// 单据状态（1制单，2执行，3变更，4手工结单，5自动结单）
        /// </summary>
        public string BillStatus
        {
            set { _billstatus = value; }
            get { return _billstatus; }
        }
        /// <summary>
        /// 制单人ID
        /// </summary>
        public int? Creator
        {
            set { _creator = value; }
            get { return _creator; }
        }
        /// <summary>
        /// 制单日期
        /// </summary>
        public DateTime? CreateDate
        {
            set { _createdate = value; }
            get { return _createdate; }
        }
        /// <summary>
        /// 确认人ID
        /// </summary>
        public int? Confirmor
        {
            set { _confirmor = value; }
            get { return _confirmor; }
        }
        /// <summary>
        /// 确认日期
        /// </summary>
        public DateTime? ConfirmDate
        {
            set { _confirmdate = value; }
            get { return _confirmdate; }
        }
        /// <summary>
        /// 结单人ID
        /// </summary>
        public int? Closer
        {
            set { _closer = value; }
            get { return _closer; }
        }
        /// <summary>
        /// 结单日期
        /// </summary>
        public DateTime? CloseDate
        {
            set { _closedate = value; }
            get { return _closedate; }
        }
        /// <summary>
        /// 最后更新日期
        /// </summary>
        public DateTime? ModifiedDate
        {
            set { _modifieddate = value; }
            get { return _modifieddate; }
        }
        /// <summary>
        /// 最后更新用户ID(对应操作用户UserID)
        /// </summary>
        public string ModifiedUserID
        {
            set { _modifieduserid = value; }
            get { return _modifieduserid; }
        }
        /// <summary>
        /// 可查看人员
        /// </summary>
        public string CanViewUser
        {
            set { _canViewUser = value; }
            get { return _canViewUser; }
        }
        /// <summary>
        /// 再次询价标志
        /// </summary>
        public string AskAgain
        {
            set { _askagain = value; }
            get { return _askagain; }
        }
        /// <summary>
        /// 联系人ID
        /// </summary>
        public int? CustLinkManID
        {
            set { _custlinkid = value; }
            get { return _custlinkid; }
        }
        /// <summary>
        /// 联系人姓名
        /// </summary>
        public string CustLinkManName
        {
            set { _custlinkname = value; }
            get { return _custlinkname; }
        }
        /// <summary>
        /// 联系人手机
        /// </summary>
        public string CustLinkHandSet
        {
            set { _custlinkhandset = value; }
            get { return _custlinkhandset; }
        }
        /// <summary>
        /// 联系人地址
        /// </summary>
        public string CustLinkAddress
        {
            set { _custlinkaddr = value; }
            get { return _custlinkaddr; }
        }
        #endregion Model
    }
}
