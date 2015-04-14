using System;
namespace XBase.Model.Personal.MessageBox
{
	/// <summary>
	/// ʵ����PublicNotice ��(����˵���Զ���ȡ���ݿ��ֶε�������Ϣ)
	/// </summary>
	public class PublicNotice
	{
		public PublicNotice()
		{}
		#region Model
		private int _id;
		private string _companycd;
		private int _typeid;
		private string _newstitle;
		private string _newscontent;
		private string _isshow;
		private string _status;
		private string _result;
		private int _comfirmor;
		private DateTime _comfirmdate;
		private int _creator;
		private DateTime _createdate;
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
		public string NewsTitle
		{
			set{ _newstitle=value;}
			get{return _newstitle;}
		}
		/// <summary>
		/// ����
		/// </summary>
		public string NewsContent
		{
			set{ _newscontent=value;}
			get{return _newscontent;}
		}
		/// <summary>
		/// �Ƿ���ʾ��0����1���ǣ�
		/// </summary>
		public string IsShow
		{
			set{ _isshow=value;}
			get{return _isshow;}
		}
		/// <summary>
		/// ���״̬��0δ��ˣ�1�����
		/// </summary>
		public string Status
		{
			set{ _status=value;}
			get{return _status;}
		}
		
		/// <summary>
		/// ȷ����ID
		/// </summary>
		public int Comfirmor
		{
			set{ _comfirmor=value;}
			get{return _comfirmor;}
		}
		/// <summary>
		/// ȷ��ʱ��
		/// </summary>
		public DateTime ComfirmDate
		{
			set{ _comfirmdate=value;}
			get{return _comfirmdate;}
		}
		/// <summary>
		/// ������ID����ӦԱ����ID��
		/// </summary>
		public int Creator
		{
			set{ _creator=value;}
			get{return _creator;}
		}
		/// <summary>
		/// ����ʱ�䣨��ȷ���룩
		/// </summary>
		public DateTime CreateDate
		{
			set{ _createdate=value;}
			get{return _createdate;}
		}
		#endregion Model

	}
}

