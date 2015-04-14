﻿<%@ WebHandler Language="C#" Class="LinkManEdit" %>

using System;
using System.Web;
using XBase.Common;
using System.Data;
using XBase.Business.Office.CustManager;

public class LinkManEdit : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        int id = Convert.ToInt32(context.Request.Params["id"].ToString().Trim()); //联系人ID        
        string CompanyCD = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).CompanyCD;//公司代码
        DataTable dt = LinkManBus.GetLinkInfoByID(CompanyCD, id);
        
        JsonClass jc;

        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("{");
        sb.Append("data:");
        sb.Append(JsonClass.DataTable2Json(dt));
        sb.Append("}");

        context.Response.ContentType = "text/plain";
        context.Response.Write(sb.ToString());
        context.Response.End();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}