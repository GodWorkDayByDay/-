﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SalaryDepatmentRoyaltySet.aspx.cs"
    Inherits="Pages_Office_HumanManager_SalaryDepatmentRoyaltySet" %>

<%@ Register Src="../../../UserControl/Message.ascx" TagName="Message" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>部门提成设置</title>
    <link rel="stylesheet" type="text/css" href="../../../css/default.css" />
    <link href="../../../css/pagecss.css" type="text/css" rel="Stylesheet" />

    <script src="../../../js/JQuery/jquery_last.js" type="text/javascript"></script>

    <script src="../../../js/common/PageBar-1.1.1.js" type="text/javascript"></script>

    <script src="../../../js/common/Page.js" type="text/javascript"></script>

    <script src="../../../js/common/check.js" type="text/javascript"></script>

    <script src="../../../js/common/Common.js" type="text/javascript"></script>

    <script src="../../../js/office/HumanManager/SalaryDepatmentRoyaltySet.js" type="text/javascript"></script>

    <style type="text/css">
        #tblMain
        {
            margin-top: 0px;
            margin-left: 0px;
            background-color: #F0f0f0;
            font-family: "tahoma";
            color: #333333;
            font-size: 12px;
        }
        .errorMsg
        {
            filter: progid:DXImageTransform.Microsoft.DropShadow(color=#cccccc,offX=4,offY=4,positives=true);
            position: absolute;
            top: 240px;
            left: 450px;
            border-width: 1pt;
            border-color: #666666;
            border-style: solid;
            width: 290px;
            display: none; 9margin-top:10px;z-index:21;}</style>
</head>
<body>
    <form id="frmMain" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="maintable"
        id="tblMain">
        <tr>
            <td valign="top" colspan="2">
                <img src="../../../images/Main/Line.jpg" width="122" height="7" />
            </td>
        </tr>
        <tr height="20" align="right" bgcolor="#f0f0f0">
            <td colspan='2' width='100%'>
                &nbsp; <a href="SalaryCompanyRoyaltySet.aspx?ModuleID=2011701" style="text-decoration: none;
                    color: Blue">公司业务提成</a>&nbsp;&nbsp; <a href="SalaryDepatmentRoyaltySet.aspx?ModuleID=2011701"
                        style="text-decoration: none; color: Blue">部门业务提成</a>&nbsp; &nbsp; <a href="SalaryPersonalRoyaltySet.aspx?ModuleID=2011701"
                            style="text-decoration: none; color: Blue">个人业务提成</a>&nbsp; &nbsp; <a href="SalaryPiecework.aspx?ModuleID=2011701"
                                style="text-decoration: none; color: Blue">计件工资</a>&nbsp; &nbsp;
                <a href="SalaryTime.aspx?ModuleID=2011701" style="text-decoration: none; color: Blue">
                    计时工资</a> &nbsp; &nbsp; <a href="SalaryCommission.aspx?ModuleID=2011701" style="text-decoration: none;
                        color: Blue">产品单品提成</a> &nbsp; &nbsp; <a href="PerformanceRoyaltyBase.aspx?ModuleID=2011701"
                            style="text-decoration: none; color: Blue">绩效薪资设置</a>&nbsp; &nbsp; <a href="SalaryPerformanceRoyaltySet.aspx?ModuleID=2011701"
                                style="text-decoration: none; color: Blue">绩效系数设置</a>&nbsp;
            </td>
        </tr>
        <tr>
            <td height="30" align="center" colspan="2" class="Title">
                部门业务提成设置
            </td>
        </tr>
        <tr>
            <td height="40" valign="top" colspan="2">
                <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999">
                    <tr>
                        <td height="30" class="tdColInput">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <img src="../../../images/Button/Main_btn_add.jpg" alt="添加" id="btnAdd" visible="false"
                                            style="cursor: hand" onclick="DoAdd();" runat="server" />
                                        <img src="../../../Images/Button/Bottom_btn_save.jpg" runat="server" visible="false"
                                            alt="保存" id="btnSave" style="cursor: hand" onclick="DoSave();" />
                                        <img src="../../../images/Button/Main_btn_delete.jpg" alt="删除" visible="false" id="btnDelete"
                                            runat="server" onclick="DoDelete()" style='cursor: hand;' />
                                        <%--  <input id="Button1" type="button" value="button"   onclick="getMoney()"   />--%>
                                    </td>
                                    <td align="right" class="tdColInput">
                                        <%--<img src="../../../Images/Button/Main_btn_print.jpg" runat="server" visible="true" alt="打印" id="btnPrint" onclick="DoPrint();" style="cursor:hand"   />--%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" align="center">
                    <input type="hidden" id="DeptID" value="" />
                    <input type="hidden" id="HidDeptName" value="" />
                    <input type="hidden" id="HidDeptID" value="0" />
                    <tr>
                        <td width="10%" height="20" class="td_list_fields" align="right">
                            &nbsp; 部门名称
                        </td>
                        <td width="15%" bgcolor="#FFFFFF">
                            <input id="DeptName" type="text" class="tdinput" size="19" readonly="readonly" onclick="alertdiv('DeptName,DeptID');" />
                        </td>
                        <td>
                            <img alt="检索" id="btnSearch" runat="server" src="../../../images/Button/Bottom_btn_search.jpg"
                                style='cursor: hand;' onclick='DoSearch();' visible="false" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div style="overflow-y: auto; width: 100%; line-height: 14pt; letter-spacing: 0.2em;
                    overflow-x: auto; vertical-align: top">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" id="Table1" style="height: 500px;
                        vertical-align: top">
                        <tr>
                            <td colspan="2" valign="top">
                                <div id="divSalaryList" runat="server">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" height="10">
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2" height="10">
            </td>
        </tr>
    </table>
    <div id="popupContent">
    </div>
    <span id="Forms" class="Spantype"></span><span id="spanMsg" class="errorMsg"></span>
    <uc1:Message ID="msgError" runat="server" />
    </form>
</body>
</html>
