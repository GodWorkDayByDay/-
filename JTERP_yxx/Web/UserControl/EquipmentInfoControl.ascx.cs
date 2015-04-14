﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using XBase.Business.Office.AdminManager;
using XBase.Business.Office.SystemManager;
using XBase.Model.Office.AdminManager;
using XBase.Data.Office.AdminManager;
using XBase.Common;


public partial class UserControl_EquipmentInfoControl : System.Web.UI.UserControl
{
    private string CompanyCD = "";
    private string TypeFlag = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //设备编号初期处理
            CompanyCD = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).CompanyCD;
            BindEquipmentType();
        }
    }
    #region 绑定设备品分类
    private void BindEquipmentType()
    {
        DataTable dt_product = CategorySetBus.GetCodeEquipmentType(CompanyCD, "");
        DataView dataView = dt_product.DefaultView;
        foreach (DataRow row in dt_product.Select("SupperID=0"))
        {
            TreeNode nodes = new TreeNode();
            nodes.Text = row["CodeName"].ToString();
            nodes.Value = row["ID"].ToString();
            TypeFlag = row["TypeFlag"].ToString();
            nodes.NavigateUrl = string.Format("javascript:SelectedNodeChanged('{0}','{1}','{2}');", nodes.Text, nodes.Value, TypeFlag);

            LoadSubData(row["ID"].ToString(), nodes, dt_product);
            //node.ChildNodes.Add(nodes);
            this.TreeView1.Nodes.Add(nodes);
            nodes.Expanded = true;
        }
    }
    private void LoadSubData(string pid, TreeNode nodes, DataTable dt)
    {
        foreach (DataRow row in dt.Select("SupperID=" + pid))
        {
            TreeNode nodess = new TreeNode();
            nodess.Text = row["CodeName"].ToString();
            nodess.Value = row["ID"].ToString();
            TypeFlag = row["TypeFlag"].ToString();
            nodess.NavigateUrl = string.Format("javascript:SelectedNodeChanged('{0}','{1}','{2}');", nodess.Text, nodess.Value, TypeFlag);
            LoadSubData(row["ID"].ToString(), nodess, dt);
            nodes.ChildNodes.Add(nodess);
            nodes.Expanded = false;
        }
    }
    #endregion
}
