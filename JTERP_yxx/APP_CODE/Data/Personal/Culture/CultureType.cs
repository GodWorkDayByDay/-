using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using XBase.Data.DBHelper;
using System.Data.SqlClient;
using System.Data;
namespace XBase.Data.Personal.Culture
{
	/// <summary>
	/// ���ݷ�����CultureType��
	/// </summary>
	public class CultureType
	{
		public CultureType()
		{}
		#region  ��Ա����

		

		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		public bool Exists(int ID)
		{
			StringBuilder strSql=new StringBuilder();
            strSql.Append("select count(1) from [officedba].CultureType");
			strSql.Append(" where ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)};
			parameters[0].Value = ID;

            return DBHelper.SqlHelper.ExecuteSql(strSql.ToString(), parameters).Rows.Count > 0;
		}


		/// <summary>
		/// ����һ������
		/// </summary>
		public int Add(XBase.Model.Personal.Culture.CultureType model)
		{
			StringBuilder strSql=new StringBuilder();            
            strSql.AppendLine("set @path =''");
            strSql.AppendLine("select @path=[path] from [officedba].CultureType where id=@SupperTypeID");
            strSql.AppendLine("insert into [officedba].CultureType(");
            strSql.AppendLine("CompanyCD,TypeName,SupperTypeID,Path,CanViewUser,CanViewUserName)");
			strSql.AppendLine(" values (");
            strSql.AppendLine("@CompanyCD,@TypeName,@SupperTypeID,@Path,@CanViewUser,@CanViewUserName)");
            strSql.AppendLine("select @ID=@@IDENTITY");
            strSql.AppendLine("if(@path <> '')");
            strSql.AppendLine("begin");
            strSql.AppendLine("set @path=@path+'_'");
            strSql.AppendLine("end");
            strSql.AppendLine(";UPDATE [officedba].CultureType SET [path]=@path+cast(@ID as varchar(10)) WHERE ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@CompanyCD", SqlDbType.VarChar,8),
					new SqlParameter("@TypeName", SqlDbType.VarChar,100),
					new SqlParameter("@SupperTypeID", SqlDbType.Int,4),
					new SqlParameter("@Path", SqlDbType.VarChar,512),
                    new SqlParameter("@CanViewUser",SqlDbType.VarChar,1024),
                    new SqlParameter("@CanViewUserName",SqlDbType.VarChar,1024),
                     new SqlParameter("@ID", SqlDbType.Int,0) };
			parameters[0].Value = model.CompanyCD;
			parameters[1].Value = model.TypeName;
			parameters[2].Value = model.SupperTypeID;
			parameters[3].Value = model.Path;
            parameters[4].Value = model.CanViewUser;
            parameters[5].Value = model.CanViewUserName;

            parameters[6].Direction = ParameterDirection.Output;

            SqlHelper.ExecuteTransSql(strSql.ToString(), parameters);
            return int.Parse(parameters[6].Value.ToString());
		}
		/// <summary>
		/// ����һ������
		/// </summary>
		public void Update(XBase.Model.Personal.Culture.CultureType model)
		{
			StringBuilder strSql=new StringBuilder();
            strSql.Append("update [officedba].CultureType set ");
			strSql.Append("CompanyCD=@CompanyCD,");
			strSql.Append("TypeName=@TypeName,");
			strSql.Append("SupperTypeID=@SupperTypeID,");
			strSql.Append("Path=@Path,");
            strSql.Append("CanViewUser=@CanViewUser,");
            strSql.Append("CanViewUserName=@CanViewUserName");
			strSql.Append(" where ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4),
					new SqlParameter("@CompanyCD", SqlDbType.VarChar,8),
					new SqlParameter("@TypeName", SqlDbType.VarChar,100),
					new SqlParameter("@SupperTypeID", SqlDbType.Int,4),
					new SqlParameter("@Path", SqlDbType.VarChar,512),
                    new SqlParameter("@CanViewUser",SqlDbType.VarChar,1024),
                    new SqlParameter("@CanViewUserName",SqlDbType.VarChar,1024)};
			parameters[0].Value = model.ID;
			parameters[1].Value = model.CompanyCD;
			parameters[2].Value = model.TypeName;
			parameters[3].Value = model.SupperTypeID;
			parameters[4].Value = model.Path;
            parameters[5].Value = model.CanViewUser;
            parameters[6].Value = model.CanViewUserName;

          SqlHelper.ExecuteTransSql(strSql.ToString(), parameters);
		}

		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public void Delete(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
            strSql.Append("delete [officedba].CultureType ");
			strSql.Append(" where ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)};
			parameters[0].Value = ID;

            SqlHelper.ExecuteTransSql(strSql.ToString(), parameters);
		}


		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		public XBase.Model.Personal.Culture.CultureType GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
            strSql.Append("select  top 1 ID,CompanyCD,TypeName,SupperTypeID,Path from [officedba].CultureType ");
			strSql.Append(" where ID=@ID ");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)};
			parameters[0].Value = ID;

			XBase.Model.Personal.Culture.CultureType model=new XBase.Model.Personal.Culture.CultureType();
            DataTable dt = SqlHelper.ExecuteSql(strSql.ToString(), parameters);
            DataSet ds = new DataSet();
            ds.Tables.Add(dt);
			if(ds.Tables[0].Rows.Count>0)
			{
				if(ds.Tables[0].Rows[0]["ID"].ToString()!="")
				{
					model.ID=int.Parse(ds.Tables[0].Rows[0]["ID"].ToString());
				}
				model.CompanyCD=ds.Tables[0].Rows[0]["CompanyCD"].ToString();
				model.TypeName=ds.Tables[0].Rows[0]["TypeName"].ToString();
				if(ds.Tables[0].Rows[0]["SupperTypeID"].ToString()!="")
				{
					model.SupperTypeID=int.Parse(ds.Tables[0].Rows[0]["SupperTypeID"].ToString());
				}
				model.Path=ds.Tables[0].Rows[0]["Path"].ToString();
				return model;
			}
			else
			{
				return null;
			}
		}

		/// <summary>
		/// ��������б�
		/// </summary>
        public DataTable GetList(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
            strSql.Append("select ID,CompanyCD,TypeName,SupperTypeID,Path,CanViewUser,CanViewUserName ");
            strSql.Append(" FROM [officedba].CultureType ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
            return DBHelper.SqlHelper.ExecuteSql(strSql.ToString());
		}

		/*
		/// <summary>
		/// ��ҳ��ȡ�����б�
		/// </summary>
		public DataSet GetList(int PageSize,int PageIndex,string strWhere)
		{
			SqlParameter[] parameters = {
					new SqlParameter("@tblName", SqlDbType.VarChar, 255),
					new SqlParameter("@fldName", SqlDbType.VarChar, 255),
					new SqlParameter("@PageSize", SqlDbType.Int),
					new SqlParameter("@PageIndex", SqlDbType.Int),
					new SqlParameter("@IsReCount", SqlDbType.Bit),
					new SqlParameter("@OrderType", SqlDbType.Bit),
					new SqlParameter("@strWhere", SqlDbType.VarChar,1000),
					};
			parameters[0].Value = "CultureType";
			parameters[1].Value = "ID";
			parameters[2].Value = PageSize;
			parameters[3].Value = PageIndex;
			parameters[4].Value = 0;
			parameters[5].Value = 0;
			parameters[6].Value = strWhere;	
			return SqlHelper.RunProcedure("UP_GetRecordByPage",parameters,"ds");
		}*/

		#endregion  ��Ա����
	}
}

