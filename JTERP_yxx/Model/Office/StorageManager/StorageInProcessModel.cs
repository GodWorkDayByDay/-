﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace XBase.Model.Office.StorageManager
{
    public class StorageInProcessModel
    {
        public StorageInProcessModel()
        { }
        #region Model
        private string _id;
        private string _companycd;
        private string _inno;
        private string _fromtype;
        private string _frombillid;
        private string _title;
        private string _processdept;
        private string _processtype;
        private string _processor;
        private string _executor;
        private string _enterdate;
        private string _remark;
        private string _creator;
        private string _createdate;
        private string _billstatus;
        private string _confirmor;
        private string _confirmdate;
        private string _closer;
        private string _closedate;
        private string _modifieddate;
        private string _modifieduserid;
        private string _stringype;
        private string _deptid;
        private string _totalprice;
        private string _counttotal;
        private string _summary;
        //拓展属性
        private string _efindex;
        private string _efdesc;

        private string _canviewuser;
        private string _canviewusername;

        public string CanViewUser
        {
            set { _canviewuser = value; }
            get { return _canviewuser; }
        }
        public string CanViewUserName
        {
            set { _canviewusername = value; }
            get { return _canviewusername; }
        }

        /// <summary>
        /// 
        /// </summary>
        public string EFIndex
        {
            set { _efindex = value; }
            get { return _efindex; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string EFDesc
        {
            set { _efdesc = value; }
            get { return _efdesc; }
        }

        /// <summary>
        /// 
        /// </summary>
        public string ID
        {
            set { _id = value; }
            get { return _id; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CompanyCD
        {
            set { _companycd = value; }
            get { return _companycd; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string InNo
        {
            set { _inno = value; }
            get { return _inno; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string FromType
        {
            set { _fromtype = value; }
            get { return _fromtype; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string FromBillID
        {
            set { _frombillid = value; }
            get { return _frombillid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Title
        {
            set { _title = value; }
            get { return _title; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ProcessDept
        {
            set { _processdept = value; }
            get { return _processdept; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ProcessType
        {
            set { _processtype = value; }
            get { return _processtype; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Processor
        {
            set { _processor = value; }
            get { return _processor; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Executor
        {
            set { _executor = value; }
            get { return _executor; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string EnterDate
        {
            set { _enterdate = value; }
            get { return _enterdate; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Remark
        {
            set { _remark = value; }
            get { return _remark; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Creator
        {
            set { _creator = value; }
            get { return _creator; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CreateDate
        {
            set { _createdate = value; }
            get { return _createdate; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string BillStatus
        {
            set { _billstatus = value; }
            get { return _billstatus; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Confirmor
        {
            set { _confirmor = value; }
            get { return _confirmor; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ConfirmDate
        {
            set { _confirmdate = value; }
            get { return _confirmdate; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Closer
        {
            set { _closer = value; }
            get { return _closer; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CloseDate
        {
            set { _closedate = value; }
            get { return _closedate; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ModifiedDate
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
        /// 
        /// </summary>
        public string stringype
        {
            set { _stringype = value; }
            get { return _stringype; }
        }

        public string DeptID
        {
            set { _deptid = value; }
            get { return _deptid; }
        }

        /// <summary>
        /// 
        /// </summary>
        public string TotalPrice
        {
            set { _totalprice = value; }
            get { return _totalprice; }
        }

        /// <summary>
        /// 
        /// </summary>
        public string CountTotal
        {
            set { _counttotal = value; }
            get { return _counttotal; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Summary
        {
            set { _summary = value; }
            get { return _summary; }
        }
        private string _usernames;
        private string _userids;
        /// <summary>
        /// 
        /// </summary>
        public string Userids
        {
            set { _userids = value; }
            get { return _userids; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Usernames
        {
            set { _usernames = value; }
            get { return _usernames; }
        }
        #endregion Model

    }

}

