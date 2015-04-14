﻿<%@ WebHandler Language="C#" Class="LinkInfoDel" %>

using System;
using System.Web;
using XBase.Business.Office.CustManager;
using XBase.Common;
using XBase.Business.Common;
using System.Data;

public class LinkInfoDel : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        string CompanyCD = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).CompanyCD;//公司代码
        string alllinkid = context.Request.Params["alllinkid"].ToString().Trim(); //客户编号
        string[] al = alllinkid.Split(',');

        JsonClass jc;

        bool IsHave = LinkManBus.GetLinkManByID(CompanyCD, al);
        if (IsHave)
        {
            jc = new JsonClass("success", "", 2);
        }
        else
        {
             if (LinkManBus.DelLinkInfo(al) >= 0)
                jc = new JsonClass("success", "", 1);
            else
                jc = new JsonClass("faile", "", 0);            
        }
        context.Response.Write(jc);
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}