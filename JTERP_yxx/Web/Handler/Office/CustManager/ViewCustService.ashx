﻿<%@ WebHandler Language="C#" Class="ViewCustService" %>

using System;
using System.Web;
using XBase.Common;
using XBase.Business.Office.CustManager;
using System.Xml.Linq;
using System.Data;
using System.IO;
using System.Web.Script.Serialization;
using System.Linq;

public class ViewCustService : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        if (context.Request.RequestType == "POST")
        {
            //设置行为参数
            string orderString = (context.Request.Form["orderby"].ToString());//排序
            string order = "id";

            int pageCount = int.Parse(context.Request.Form["pageCount"].ToString());//每页显示记录数
            int pageIndex = int.Parse(context.Request.Form["pageIndex"].ToString());//当前页
            int skipRecord = (pageIndex - 1) * pageCount;//跳过记录数
            int totalCount = 0;

            //获取数据           
            string CustNo = context.Request.Form["CustNo"].ToString().Trim();

            string CompanyCD = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).CompanyCD;//用户公司代码 

            DataTable dt = ServiceBus.GetCustServiceByCustNo(CompanyCD, CustNo, pageIndex, pageCount, order, ref totalCount);

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("{");
            sb.Append("totalCount:");
            sb.Append(totalCount.ToString());
            sb.Append(",data:");
            if (dt == null)
                sb.Append("[{\"id\":\"\"}]");
            else
                sb.Append(JsonClass.DataTable2Json(dt));
            sb.Append("}");
            context.Response.ContentType = "text/plain";

            context.Response.Write(sb.ToString());
            context.Response.End();
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}