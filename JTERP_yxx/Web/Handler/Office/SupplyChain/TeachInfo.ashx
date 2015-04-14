﻿<%@ WebHandler Language="C#" Class="TeachInfo" %>

using System;
using System.Web;
using XBase.Model.Office.SupplyChain;
using XBase.Business.Office.SupplyChain;
using System.Collections;
using System.Data;
using System.Linq;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Web.Script.Serialization;
using System.IO;
using XBase.Common;
using XBase.Business.Office.SystemManager;

public class TeachInfo : BaseHandler
{
    protected override void ActionHandler(string action)
    {
        ProcessRequestHandler(_context, action);
    }
    public void ProcessRequestHandler(HttpContext context, string action)
    {
       if (action.ToLower() == "load")
        {
            try
            {
                string companyCD = string.Empty;
                companyCD = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).CompanyCD;
                //设置行为参数
                string orderString = (context.Request.Form["orderby"].ToString());//排序
                string order = "asc";//排序：升序
                string orderBy = (!string.IsNullOrEmpty(orderString)) ? orderString.Substring(0, orderString.Length - 2) : "ID";//要排序的字段，如果为空，默认为"ID"
                if (orderString.EndsWith("_d"))
                {
                    order = "desc";//排序：降序
                }
                int pageCount = int.Parse(context.Request.Form["pageCount"].ToString());//每页显示记录数
                int pageIndex = int.Parse(context.Request.Form["pageIndex"].ToString());//当前页
                int skipRecord = (pageIndex - 1) * pageCount;//跳过记录数
                int totalCount = 0;
                string ord = orderBy + " " + order;
                //获取数据
                TeachInfoModel model = new TeachInfoModel();
                if (context.Request.Form["TeachNo"].ToString() != "")
                {
                    model.TeachNo = context.Request.Form["TeachNo"].ToString().Trim();
                }
                if (!string.IsNullOrEmpty(context.Request.Form["TeachName"].ToString().Trim()))
                {
                    model.TeachName = context.Request.Form["TeachName"].ToString();
                }
                if (!string.IsNullOrEmpty(context.Request.Form["TeachType"].ToString().Trim()))
                {
                    model.TeachType = int.Parse(context.Request.Form["TeachType"].ToString().Trim());
                }
                if (!string.IsNullOrEmpty(context.Request.Form["UsedStatus"].ToString().Trim()))
                {
                    model.UsedStatus = context.Request.Form["UsedStatus"].ToString();
                }
                if (!string.IsNullOrEmpty(context.Request.Form["Specification"].ToString().Trim()))
                {
                    model.Specification = context.Request.Form["Specification"].ToString();
                } 
               
               
                model.CompanyCD = companyCD;
                DataTable dt = TeachInfoBus.GetTeachInfo(model, pageIndex, pageCount, ord, ref totalCount);
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("{");
                sb.Append("totalCount:");
                sb.Append(totalCount.ToString());
                sb.Append(",data:");
                if (dt.Rows.Count == 0)
                    sb.Append("[{\"ID\":\"\"}]");
                else
                    sb.Append(JsonClass.DataTable2Json(dt));
                sb.Append("}");
                context.Response.ContentType = "text/plain";
                context.Response.Write(sb.ToString());
                context.Response.End();
            }
            catch (Exception)
            {
            }

        }
        
    }
  
}