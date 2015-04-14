using System;
namespace XBase.Model.Personal.Culture
{
	/// <summary>
	/// ʵ����CultureType ��(����˵���Զ���ȡ���ݿ��ֶε�������Ϣ)
	/// </summary>
	public class CultureType
	{
		public CultureType()
		{}
		#region Model
		private int _id;
		private string _companycd;
		private string _typename;
		private int _suppertypeid;
		private string _path;
        private string _canviewuser;
        private string _canviewusername;
		/// <summary>
		/// �Զ�����
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
		/// ��Ϣ��������
		/// </summary>
		public string TypeName
		{
			set{ _typename=value;}
			get{return _typename;}
		}
		/// <summary>
		/// �ϼ�����ID
		/// </summary>
		public int SupperTypeID
		{
			set{ _suppertypeid=value;}
			get{return _suppertypeid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Path
		{
			set{ _path=value;}
			get{return _path;}
		}
        /// <summary>
        /// 
        /// </summary>
        public string CanViewUser
        {
            set { _canviewuser = value; }
            get { return _canviewuser; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CanViewUserName
        {
            set { _canviewusername = value; }
            get { return _canviewusername; }
        }
		#endregion Model

	}
}

