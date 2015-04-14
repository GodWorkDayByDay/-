﻿<%@ WebHandler Language="C#" Class="SalaryTime" %>
/**********************************************
 * 作    者： 吴志强
 * 创建日期： 2009/05/06
 * 描    述： 计时工资设置
 * 修改日期： 2009/05/06
 * 版    本： 0.5.0
 ***********************************************/
using System;
using System.Web;
using XBase.Model.Office.HumanManager;
using XBase.Business.Office.HumanManager;
using System.Collections;
using XBase.Common;
using System.Text;
using XBase.Business.Common;

public class SalaryTime : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        if (context.Request.QueryString["Action"] != null)
        {
            string action = context.Request.QueryString["Action"].ToString();
            if ("IsDelete".Equals(action))
            {
                //获取要素ID
                string itemNo = context.Request.QueryString["itemNo"];
                string row = context.Request.QueryString["row"];
                if (string.IsNullOrEmpty(itemNo))
                {
                    context.Response.Write(new JsonClass("", row, 2));
                    return;
                }
                else
                {
                    //替换引号
                    ////校验是否被使用
                    bool isUsed = TimeItemBus.IsUsedItem(itemNo);
                    //如果已经被使用

                    //已经被使用
                    if (isUsed)
                    {
                        //输出响应 返回不执行删除
                        context.Response.Write(new JsonClass("", "", 1));
                    }
                    else
                    {
                        context.Response.Write(new JsonClass("", row, 2));

                    }
                }
            }
        }
        else
        {







            //编辑请求信息
            ArrayList lstEdit = EditRequstData(context.Request);
            //执行保存
            bool isSucc = TimeItemBus.SaveTimeItemInfo(lstEdit);
            //定义返回字符串变量
            StringBuilder sbReturn = new StringBuilder();
            //保存成功时
            if (isSucc)
            {
                //设置记录总数
                sbReturn.Append("{");
                sbReturn.Append("EditStatus:1");
                //设置数据
                sbReturn.Append(",DataInfo:");
                sbReturn.Append(SalaryItem2Json(lstEdit));
                sbReturn.Append("}");
            }
            //保存未成功时
            else
            {
                //设置记录总数
                sbReturn.Append("{EditStatus:0}");
            }
            //设置输出流的 HTTP MIME 类型
            context.Response.ContentType = "text/plain";
            //向响应中输出数据
            context.Response.Write(sbReturn.ToString());
            context.Response.End();
        }
    }

    /// <summary>
    /// 工资项记录转换为Json
    /// </summary>
    /// <param name="lstEdit">工资项记录</param>
    /// <returns></returns>
    private string SalaryItem2Json(ArrayList lstEdit)
    {
        //定义变量
        StringBuilder sbSalaryInfo = new StringBuilder();
        //记录存在时
        if (lstEdit != null && lstEdit.Count > 0)
        {
            //数据开始符
            sbSalaryInfo.Append("[");
            //遍历所有记录转化为Json
            for (int i = 0; i < lstEdit.Count; i++)
            {
                //获取工资项信息
                TimeItemModel model = (TimeItemModel)lstEdit[i];
                //未删除的项转换为Json值
                if ("0".Equals(model.EditFlag) || "1".Equals(model.EditFlag))
                {
                    //行数据开始符
                    sbSalaryInfo.Append("{");
                    //工资项ID
                    sbSalaryInfo.Append("\"ID\":\"" + model.ID + "\"");
                    //项目编号
                    sbSalaryInfo.Append(",\"TimeNo\":\"" + model.TimeNo + "\"");
                    //项目名称
                    sbSalaryInfo.Append(",\"TimeName\":\"" + model.TimeName + "\"");
                    //单价
                    sbSalaryInfo.Append(",\"UnitPrice\":\"" + model.UnitPrice + "\"");
                    //启用状态
                    sbSalaryInfo.Append(",\"UsedStatus\":\"" + model.UsedStatus + "\"");
                    //行数据结束符
                    sbSalaryInfo.Append("},");
                }
            }
            //替换最后的,
            sbSalaryInfo.Replace(",", "", sbSalaryInfo.Length - 1, 1);
            //数据结束符
            sbSalaryInfo.Append("]");
        }
        //返回值
        return sbSalaryInfo.ToString();
    }

    /// <summary>
    /// 从请求中获取培训信息并转换为Model模式
    /// </summary>
    /// <param name="request">客户端请求</param>
    /// <returns></returns>
    private ArrayList EditRequstData(HttpRequest request)
    {
        //定义变量
        ArrayList lstReturn = new ArrayList();
        //获取工资项列表数据总数
        int salaryCount = int.Parse(request.QueryString["SalaryCount"]);
        //遍历所有工资项
        for (int i = 1; i <= salaryCount; i++)
        {
            //定义Model变量
            TimeItemModel model = new TimeItemModel();
            //工资项ID
            model.ID = request.QueryString["SalaryID_" + i.ToString()];
            //编辑模式
            model.EditFlag = request.QueryString["EditFlag_" + i.ToString()];
            //不是删除时
            if ("0".Equals(model.EditFlag) || "1".Equals(model.EditFlag))
            {
                //项目编号
                model.TimeNo = request.QueryString["TimeNo_" + i.ToString()];
                //项目名称
                model.TimeName = request.QueryString["TimeName_" + i.ToString()];
                //单价
                model.UnitPrice = request.QueryString["UnitPrice_" + i.ToString()];
                //启用状态
                model.UsedStatus = request.QueryString["UsedStatus_" + i.ToString()];
            }
            //添加记录
            lstReturn.Add(model);
        }

        return lstReturn;
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}