﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using XBase.Common;
//using GrapeCity.ActiveReports.PageReportModel;


public partial class ReportPage_JtSalesContractTrack : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string CompanyCD = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).CompanyCD;//获取公司的名称
            string UserID = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).UserID;//获取用户的id            
        }
    }  
}