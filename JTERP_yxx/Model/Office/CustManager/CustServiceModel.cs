﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace XBase.Model.Office.CustManager
{
    public class CustServiceModel
    {
        #region Model
        private int _id;
        private string _companycd;
        private string _serveno;
        private int _custid;
        private int _custlinkman;
        private string _custlinktel;
        private string _title;
        private int _servetype;
        private int _fashion;
        private string _state;
        private DateTime? _begindate;
        private string _dateunit;
        private decimal _spendtime;
        private int _ourlinkman;
        private int _executant;
        private string _contents;
        private string _feedback;
        private string _linkqa;
        private string _remark;
        private DateTime? _modifieddate;
        private string _modifieduserid;
        private string _canviewuser;
        private string _canviewusername;
        private DateTime? _nextlinkdate;
        private string _joinuser;
        private string _joinusername;
        private string _custlinkaddress;
        private string _outno;
        private string _productno;
        private string _specification;
        private DateTime? _selldate;
        private DateTime? _repairdate;
        private string _faults;
        private string _results;

        /// <summary>
        /// 参与人员ID
        /// </summary>
        public string JoinUser
        {
            set { _joinuser = value; }
            get { return _joinuser; }
        }
        /// <summary>
        /// 参与人员姓名
        /// </summary>
        public string JoinUserName
        {
            set { _joinusername = value; }
            get { return _joinusername; }
        }
        /// <summary>
        /// 可查看该客户档案的人员ID
        /// </summary>
        public string CanViewUser
        {
            set { _canviewuser = value; }
            get { return _canviewuser; }
        }
        /// <summary>
        /// 可查看该客户档案的人员姓名
        /// </summary>
        public string CanViewUserName
        {
            set { _canviewusername = value; }
            get { return _canviewusername; }
        }
        /// <summary>
        /// 客户服务id，自动生成
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
        /// 服务单编号
        /// </summary>
        public string ServeNO
        {
            set { _serveno = value; }
            get { return _serveno; }
        }
        /// <summary>
        /// 客户ID（关联客户信息表）
        /// </summary>
        public int CustID
        {
            set { _custid = value; }
            get { return _custid; }
        }
        /// <summary>
        /// 客户联系人
        /// </summary>
        public int CustLinkMan
        {
            set { _custlinkman = value; }
            get { return _custlinkman; }
        }
        /// <summary>
        /// 客户联系电话
        /// </summary>
        public string CustLinkTel
        {
            set { _custlinktel = value; }
            get { return _custlinktel; }
        }
        /// <summary>
        /// 主题
        /// </summary>
        public string Title
        {
            set { _title = value; }
            get { return _title; }
        }
        /// <summary>
        /// 服务类型ID
        /// </summary>
        public int ServeType
        {
            set { _servetype = value; }
            get { return _servetype; }
        }
        /// <summary>
        /// 服务方式ID
        /// </summary>
        public int Fashion
        {
            set { _fashion = value; }
            get { return _fashion; }
        }
        /// <summary>
        /// 服务状态（0执行中1已完成）
        /// </summary>
        public string State
        {
            set { _state = value; }
            get { return _state; }
        }
        /// <summary>
        /// 开始时间（精确到分）
        /// </summary>
        public DateTime? BeginDate
        {
            set { _begindate = value; }
            get { return _begindate; }
        }
        /// <summary>
        /// 花费时间单位（1小时,2天,3月）
        /// </summary>
        public string DateUnit
        {
            set { _dateunit = value; }
            get { return _dateunit; }
        }
        /// <summary>
        /// 花费时间
        /// </summary>
        public decimal SpendTime
        {
            set { _spendtime = value; }
            get { return _spendtime; }
        }
        /// <summary>
        /// 联系人(员工ID用)
        /// </summary>
        public int OurLinkMan
        {
            set { _ourlinkman = value; }
            get { return _ourlinkman; }
        }
        /// <summary>
        /// 执行人(员工ID用)
        /// </summary>
        public int Executant
        {
            set { _executant = value; }
            get { return _executant; }
        }
        /// <summary>
        /// 服务内容
        /// </summary>
        public string Contents
        {
            set { _contents = value; }
            get { return _contents; }
        }
        /// <summary>
        /// 客户反馈
        /// </summary>
        public string Feedback
        {
            set { _feedback = value; }
            get { return _feedback; }
        }
        /// <summary>
        /// 对应QA
        /// </summary>
        public string LinkQA
        {
            set { _linkqa = value; }
            get { return _linkqa; }
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
        /// 
        /// </summary>
        public DateTime? ModifiedDate
        {
            set { _modifieddate = value; }
            get { return _modifieddate; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ModifiedUserID
        {
            set { _modifieduserid = value; }
            get { return _modifieduserid; }
        }
        /// <summary>
        /// 下次联络日期
        /// </summary>
        public DateTime? NextLinkDate
        {
            set { _nextlinkdate = value; }
            get { return _nextlinkdate; }
        }

        /// <summary>
        /// 销售日期（客户的购买日期）
        /// </summary>
        public DateTime? SellDate
        {
            set { _selldate = value; }
            get { return _selldate; }
        }
        /// <summary>
        /// 保修日期
        /// </summary>
        public DateTime? RepairDate
        {
            set { _repairdate = value; }
            get { return _repairdate; }
        }

        /// <summary>
        /// 联系地址
        /// </summary>
        public string CustLinkAddress
        {
            set { _custlinkaddress = value; }
            get { return _custlinkaddress; }
        }
        /// <summary>
        /// 来源出库单编号
        /// </summary>
        public string OutNo
        {
            set { _outno = value; }
            get { return _outno; }
        }
        /// <summary>
        /// 产品编号
        /// </summary>
        public string ProductNo
        {
            set { _productno = value; }
            get { return _productno; }
        }
        /// <summary>
        /// 产品型号
        /// </summary>
        public string Specification
        {
            set { _specification = value; }
            get { return _specification; }
        }
        /// <summary>
        /// 故障描述
        /// </summary>
        public string Faults
        {
            set { _faults = value; }
            get { return _faults; }
        }
        /// <summary>
        /// 处理结果
        /// </summary>
        public string Result
        {
            set { _results = value; }
            get { return _results; }
        }
        #endregion Model
    }
}
