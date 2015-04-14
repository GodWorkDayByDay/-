using System;
namespace XBase.Model.Personal.MessageBox
{
	/// <summary>
	/// ʵ����PersonalAdviceSend ��(����˵���Զ���ȡ���ݿ��ֶε�������Ϣ)
	/// </summary>
	public class PersonalAdviceSend
	{
		public PersonalAdviceSend()
		{}
		#region Model
		private int _id;
		private string _companycd;
		private string _advicetype;
		private int _fromuserid;
		private int _douserid;
		private string _title;
		private string _content;
		private DateTime _createdate;
		private string _displayname;
		/// <summary>
		/// �Զ�����
		/// </summary>
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
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
		/// �������ͣ�1���飬2�����
		/// </summary>
		public string AdviceType
		{
			set{ _advicetype=value;}
			get{return _advicetype;}
		}
		/// <summary>
		/// �����ύ��ID
		/// </summary>
		public int FromUserID
		{
			set{ _fromuserid=value;}
			get{return _fromuserid;}
		}
		/// <summary>
		/// ���鴦����ID
		/// </summary>
		public int DoUserID
		{
			set{ _douserid=value;}
			get{return _douserid;}
		}
		/// <summary>
		/// ����
		/// </summary>
		public string Title
		{
			set{ _title=value;}
			get{return _title;}
		}
		/// <summary>
		/// ����
		/// </summary>
		public string Content
		{
			set{ _content=value;}
			get{return _content;}
		}
		/// <summary>
		/// ����ʱ�䣨��ȷ���룩
		/// </summary>
		public DateTime CreateDate
		{
			set{ _createdate=value;}
			get{return _createdate;}
		}
		/// <summary>
		/// ������0����1���ǣ�
		/// </summary>
		public string DisplayName
		{
			set{ _displayname=value;}
			get{return _displayname;}
		}
		#endregion Model

	}
}

