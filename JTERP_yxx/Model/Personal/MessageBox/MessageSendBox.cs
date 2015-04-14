using System;
namespace XBase.Model.Personal.MessageBox
{
	/// <summary>
	/// ʵ����MessageSendBox ��(����˵���Զ���ȡ���ݿ��ֶε�������Ϣ)
	/// </summary>
	public class MessageSendBox
	{
		public MessageSendBox()
		{}
		#region Model
		private int _id;
		private string _companycd;
		private string _title;
		private string _content;
		private int _senduserid;
		private int _receiveuserid;
		private string _status;
		private DateTime _readdate;
		private DateTime _createdate;
		private string _msgurl;
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
		/// ��ҵ����
		/// </summary>
		public string CompanyCD
		{
			set{ _companycd=value;}
			get{return _companycd;}
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
		/// ��Ϣ������ID
		/// </summary>
		public int SendUserID
		{
			set{ _senduserid=value;}
			get{return _senduserid;}
		}
		/// <summary>
		/// ��Ϣ������ID
		/// </summary>
		public int ReceiveUserID
		{
			set{ _receiveuserid=value;}
			get{return _receiveuserid;}
		}
		/// <summary>
		/// �Ķ�״̬��0��δ����1���Ѷ���
		/// </summary>
		public string Status
		{
			set{ _status=value;}
			get{return _status;}
		}
		/// <summary>
		/// �Ķ�ʱ�䣨��ȷ���룩
		/// </summary>
		public DateTime ReadDate
		{
			set{ _readdate=value;}
			get{return _readdate;}
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
		/// �������URL
		/// </summary>
		public string MsgURL
		{
			set{ _msgurl=value;}
			get{return _msgurl;}
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

