﻿<%@ WebHandler Language="C#" Class="StorageInProcessInfo" %>

using System;
using System.Web;
using XBase.Model.Office.StorageManager;
using XBase.Business.Office.StorageManager;
using XBase.Common;
using System.Data;
using System.Web.SessionState;
public class StorageInProcessInfo : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        if (context.Request.RequestType == "POST")
        {
            string companyCD = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).CompanyCD;//[待修改] 
            string action = context.Request.QueryString["Act"];
            if ("Close".Equals(action.Trim()))//结单
            {
                CloseBill(context);
            }
            else if ("CancelClose".Equals(action.Trim()))//取消结单
            {
                CancelCloseBill(context);
            }
            else if ("unconfirm".Equals(action.Trim()))//取消确认
            {
                Unconfirm(context);
            }
            else
            {

                string ID = context.Request.QueryString["ID"].ToString();
                StorageInProcessModel model = new StorageInProcessModel();
                model.CompanyCD = companyCD;
                model.ID = ID;
                DataTable DT = StorageInProcessBus.GetStorageInProcessDetailInfo(model);

                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("{");
                sb.Append("data:");
                sb.Append(JsonClass.DataTable2Json(DT));
                sb.Append("}");

                context.Response.ContentType = "text/plain";
                context.Response.Write(sb.ToString());
                context.Response.End();
            }
        }
    }

    private void CloseBill(HttpContext context)
    {
        JsonClass jc = new JsonClass();

        string companyCD = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).CompanyCD;//[待修改] 
        int loginUser_id = int.Parse(((UserInfoUtil)SessionUtil.Session["UserInfo"]).EmployeeID.ToString());
        string LoginUserID = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).UserID;
        string LoginUserName = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).EmployeeName;//登陆用户名
        string Date = System.DateTime.Now.ToString("yyyy-MM-dd");

        int ID = int.Parse((context.Request.QueryString["ID"].ToString()));//明细信息的ID组合字符串
        if (context.Request.QueryString["Act"].ToString().Trim() == "Close")
            if (ID > 0)
            {
                StorageInProcessModel model = new StorageInProcessModel();
                model.ID = ID.ToString();
                model.CompanyCD = companyCD;
                model.Closer = loginUser_id.ToString();
                model.ModifiedUserID = LoginUserID;
                if (StorageInProcessBus.CloseBill(model))
                {
                    jc = new JsonClass("结单成功", LoginUserName + " | " + Date, 1);
                }
                else
                {
                    jc = new JsonClass("结单失败", "", 0);
                }
            }
        context.Response.Write(jc);
    }
    private void Unconfirm(HttpContext context)
    {
        JsonClass jc = new JsonClass();

        string companyCD = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).CompanyCD;//[待修改] 
        int loginUser_id = int.Parse(((UserInfoUtil)SessionUtil.Session["UserInfo"]).EmployeeID.ToString());
        string LoginUserID = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).UserID;
        string LoginUserName = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).EmployeeName;//登陆用户名
        string Date = System.DateTime.Now.ToString("yyyy-MM-dd");

        int ID = int.Parse(context.Request.QueryString["ID"].ToString());//明细信息的ID组合字符串
        if (ID > 0)
        {
            StorageInProcessModel model = new StorageInProcessModel();
            model.ID = ID.ToString();
            model.CompanyCD = companyCD;
            model.Closer = loginUser_id.ToString();
            model.ModifiedUserID = LoginUserID;
            if (StorageInProcessBus.CheckIsUnfirm(model))
            {
                if (StorageInProcessBus.unconfirm(model))
                {
                    jc = new JsonClass("取消确认成功", LoginUserName + " | " + Date, 1);
                }
                else
                {
                    jc = new JsonClass("取消确认失败", "", 0);
                }
            }
            else
            {
                jc = new JsonClass("该单据已被引用", "", 0);
            }
        }
        context.Response.Write(jc);
    }
    private void CancelCloseBill(HttpContext context)
    {
        JsonClass jc = new JsonClass();

        string companyCD = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).CompanyCD;//[待修改] 
        int loginUser_id = int.Parse(((UserInfoUtil)SessionUtil.Session["UserInfo"]).EmployeeID.ToString());
        string LoginUserID = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).UserID;
        string LoginUserName = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).EmployeeName;//登陆用户名
        string Date = System.DateTime.Now.ToString("yyyy-MM-dd");

        int ID = int.Parse(context.Request.QueryString["ID"].ToString());//明细信息的ID组合字符串
        if (ID > 0)
        {
            StorageInProcessModel model = new StorageInProcessModel();
            model.ID = ID.ToString();
            model.CompanyCD = companyCD;
            model.Closer = loginUser_id.ToString();
            model.ModifiedUserID = LoginUserID;
            if (StorageInProcessBus.CancelCloseBill(model))
            {
                jc = new JsonClass("取消结单成功", LoginUserName + " | " + Date, 1);
            }
            else
            {
                jc = new JsonClass("取消结单失败", "", 0);
            }
        }
        context.Response.Write(jc);
    }
    
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}