﻿<%@ WebHandler Language="C#" Class="CustEdit" %>

using System;
using System.Web;
using XBase.Business.Office.CustManager;
using System.Data;
using XBase.Common;
using System.Collections;
using XBase.Model.Office.CustManager;
public class CustEdit : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {

        int id = 0;
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        //string CompanyCD = "AAAAAA";
        string CompanyCD = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).CompanyCD;//公司代码
        DataTable dt = new DataTable();
        CustInfoModel model = new CustInfoModel();
        if (context.Request.Form["action"] != null)
        {
            if (context.Request.Form["action"].ToString() == "extValue")
            { 
                   string strKey = context.Request.Form["keyList"].ToString().Trim();
                   string CustNO = context.Request.Form["strCustNo"].ToString().Trim();
                   
                   
                   
                   strKey = strKey.Substring(1, strKey.Length - 1);
                   strKey = strKey.Replace('|', ',');
                
                   dt = CustInfoBus.GetExtAttrValue(strKey, CustNO, CompanyCD);
                   
               
                   sb.Append("{");
                   sb.Append("totalCount:");
                   sb.Append(dt.Rows.Count.ToString());
                   sb.Append(",data:");
                   if (dt.Rows.Count == 0)
                       sb.Append("[{\"ID\":\"\"}]");
                   else
                       sb.Append(JsonClass.DataTable2Json(dt));
                   sb.Append("}");

                   context.Response.ContentType = "text/plain";
                   context.Response.Write(sb.ToString());
                   context.Response.End();
                   return;
            }
        }
        else
        {
            id = Convert.ToInt32(context.Request.Params["id"].ToString().Trim()); //客户ID
            string custbig = context.Request.Params["custbig"].ToString().Trim();//客户大类
            string custno = context.Request.Params["custno"].ToString().Trim();//客户编号
            model.CustNo = custno;
            dt = CustInfoBus.GetCustInfoByID(CompanyCD, id, custbig, custno);
        }
        JsonClass jc;
        model.CompanyCD = CompanyCD;
        model.ID = id;
        
        DataTable dtAttach = CustInfoBus.GetAdvisoryPriceAttachInfo(model);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            dt.Rows[i]["CustNote"] = dt.Rows[i]["CustNote"].ToString().Replace("\\", "\\\\");
        }
        sb.Append("{");
        sb.Append("data:");
        sb.Append(JsonClass.DataTable2Json(dt));
        if (dtAttach.Rows.Count > 0)
        {
            sb.Append(",");
            sb.Append("dataAttach:");
            sb.Append(JsonClass.DataTable2Json(dtAttach));
        }
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