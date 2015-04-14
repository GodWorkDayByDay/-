using System;
using System.Data;
using System.Collections.Generic;

namespace XBase.Business.Personal.MessageBox
{
	/// <summary>
	/// ҵ���߼���MyContact ��ժҪ˵����
	/// </summary>
	public class MyContact
	{
		private readonly XBase.Data.Personal.MessageBox.MyContact dal=new XBase.Data.Personal.MessageBox.MyContact();
		public MyContact()
		{}
		#region  ��Ա����

        public DataTable GetListEx(string companyCD,int creator)
        {
            return dal.GetListEx(companyCD,creator);
        }

		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		public bool Exists(int ID)
		{
			return dal.Exists(ID);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public int  Add(XBase.Model.Personal.MessageBox.MyContact model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public void Update(XBase.Model.Personal.MessageBox.MyContact model)
		{
			dal.Update(model);
		}

		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public void Delete(int ID)
		{
			
			dal.Delete(ID);
		}

		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		public XBase.Model.Personal.MessageBox.MyContact GetModel(int ID)
		{
			
			return dal.GetModel(ID);
		}

		

		/// <summary>
		/// ��������б�
		/// </summary>
		public DataTable GetList(string strWhere)
		{
			return dal.GetList(strWhere);
		}
		
		/// <summary>
		/// ��������б�
		/// </summary>
        public DataTable GetAllList()
		{
			return GetList("");
		}

		/// <summary>
		/// ��������б�
		/// </summary>
		//public DataSet GetList(int PageSize,int PageIndex,string strWhere)
		//{
			//return dal.GetList(PageSize,PageIndex,strWhere);
		//}


         /// <summary>
        /// �������
        /// </summary>
        public int GetCount(string strWhere)
        {
            return dal.GetCount(strWhere);
        }

		#endregion  ��Ա����
	}
}

