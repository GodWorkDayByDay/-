using System;
namespace XBase.Model.Personal.MessageBox
{
	/// <summary>
	/// ʵ����MyContact ��(����˵���Զ���ȡ���ݿ��ֶε�������Ϣ)
	/// </summary>
	public class MyContact
	{
		public MyContact()
		{}
		#region Model
		private int _id;
		private int _groupid;
		private string _companycd;
		private int _contactid;
		private int _creator;
		private DateTime _createdate;
		private DateTime _modifieddate;
		private string _modifieduserid;
		/// <summary>
		/// �Զ�����
		/// </summary>
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// ����ID(��Ӧ�����)
		/// </summary>
		public int GroupID
		{
			set{ _groupid=value;}
			get{return _groupid;}
		}
		/// <summary>
		/// ��ҵ����
		/// </summary>
		public string CompanyCD
		{
			set{ _companycd=value;}
			get{return _companycd;}
		}
		/// <summary>
		/// ��ϵ��ID(��ӦԱ����ID)
		/// </summary>
		public int ContactID
		{
			set{ _contactid=value;}
			get{return _contactid;}
		}
		/// <summary>
		/// ������ID(��ӦԱ����ID)
		/// </summary>
		public int Creator
		{
			set{ _creator=value;}
			get{return _creator;}
		}
		/// <summary>
		/// ����ʱ��
		/// </summary>
		public DateTime CreateDate
		{
			set{ _createdate=value;}
			get{return _createdate;}
		}
		/// <summary>
		/// ����������
		/// </summary>
		public DateTime ModifiedDate
		{
			set{ _modifieddate=value;}
			get{return _modifieddate;}
		}
		/// <summary>
		/// �������û�ID����Ӧ�����û����е�UserID��
		/// </summary>
		public string ModifiedUserID
		{
			set{ _modifieduserid=value;}
			get{return _modifieduserid;}
		}
		#endregion Model

	}
}

