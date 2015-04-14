using System;
using System.Data;
using System.Collections.Generic;

namespace XBase.Business.Personal.MessageBox
{
	/// <summary>
	/// ҵ���߼���PublicNotice ��ժҪ˵����
	/// </summary>
	public class PublicNotice
	{
		private readonly XBase.Data.Personal.MessageBox.PublicNotice dal=new XBase.Data.Personal.MessageBox.PublicNotice();
		public PublicNotice()
		{}
		#region  ��Ա����

		

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
		public int  Add(XBase.Model.Personal.MessageBox.PublicNotice model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public void Update(XBase.Model.Personal.MessageBox.PublicNotice model)
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
		public XBase.Model.Personal.MessageBox.PublicNotice GetModel(int ID)
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
        /// GetPageData
        /// </summary>    
        /// <param name="where"></param>
        /// <param name="fields"></param>
        /// <param name="orderExp"></param>
        /// <param name="pageindex"></param>
        /// <param name="pagesize"></param>
        /// <returns></returns>
        public int GetPageData(out DataTable dt, string where, string fields, string orderExp, int pageindex, int pagesize)
        {
            return dal.GetPageData(out dt, where, fields, orderExp, pageindex, pagesize);
        }

        public int GetDeskTopPageData(out DataTable dt, string CompanyCD)
        {
            return dal.GetDeskTopPageData(out dt, CompanyCD);
        }

		#endregion  ��Ա����
	}
}

