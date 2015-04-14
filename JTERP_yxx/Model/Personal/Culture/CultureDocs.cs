using System;
namespace XBase.Model.Personal.Culture
{
	/// <summary>
	/// ʵ����CultureDocs ��(����˵���Զ���ȡ���ݿ��ֶε�������Ϣ)
	/// </summary>
	public class CultureDocs
	{
		public CultureDocs()
		{}
		#region Model
		private int _id;
		private string _companycd;
		private int _culturetypeid;
		private string _title;
		private string _culturetent;
		private string _attachment;
		private int _creator;
		private DateTime _createdate;
		private DateTime _modifieddate;
		private string _modifieduserid;
        private string _custno;//2012-10-13��ӣ����ڱ��浱ǰ�ĵ������ĸ��ͻ�
        private string _userCanViewUserName;//2012-10-25 ��ӣ����ڱ���ɲ鿴����Ա
        private string _iFileName;//������

        public string IFileName
        {
            get { return _iFileName; }
            set { _iFileName = value; }
        }
        private string _iFileAddr;//�����ϴ�·��

        public string IFileAddr
        {
            get { return _iFileAddr; }
            set { _iFileAddr = value; }
        }

        public string UserCanViewUserName
        {
            get { return _userCanViewUserName; }
            set { _userCanViewUserName = value; }
        }

        public string Custno
        {
            get { return _custno; }
            set { _custno = value; }
        }

        private int _CreateDeptID;
        private string _createname;
        private string _modifier;
        private string _deptname;

        public string CreateName
        {
            set { _createname = value; }
            get { return _createname; }
        }
        public string Modifier
        {
            set { _modifier = value; }
            get { return _modifier; }
        }
        public string DeptName
        {
            set { _deptname = value; }
            get { return _deptname; }
        }

        public int CreateDeptID
        {
            get { return _CreateDeptID; }
            set { _CreateDeptID = value; }
        }

		/// <summary>
		/// 
		/// </summary>
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string CompanyCD
		{
			set{ _companycd=value;}
			get{return _companycd;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int CultureTypeID
		{
			set{ _culturetypeid=value;}
			get{return _culturetypeid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Title
		{
			set{ _title=value;}
			get{return _title;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Culturetent
		{
			set{ _culturetent=value;}
			get{return _culturetent;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Attachment
		{
			set{ _attachment=value;}
			get{return _attachment;}
		}
		/// <summary>
		/// 
		/// </summary>
        public int Creator
		{
            set { _creator = value; }
            get { return _creator; }
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime CreateDate
		{
			set{ _createdate=value;}
			get{return _createdate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime ModifiedDate
		{
			set{ _modifieddate=value;}
			get{return _modifieddate;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string ModifiedUserID
		{
			set{ _modifieduserid=value;}
			get{return _modifieduserid;}
		}
		#endregion Model

	}
}

