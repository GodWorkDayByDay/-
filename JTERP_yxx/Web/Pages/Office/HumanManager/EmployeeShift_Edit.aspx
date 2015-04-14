﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmployeeShift_Edit.aspx.cs" Inherits="Pages_Office_HumanManager_EmployeeShift_Edit" %>
<%@ Register src="../../../UserControl/Message.ascx" tagname="Message" tagprefix="uc1" %>
<%@ Register src="../../../UserControl/CodingRuleControl.ascx" tagname="CodingRule" tagprefix="uc1" %>
<%@ Register src="../../../UserControl/CodeTypeDrpControl.ascx" tagname="CodeType" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新建调职单</title>
    <link rel="stylesheet" type="text/css" href="../../../css/default.css" />
    <script src="../../../js/common/check.js" type="text/javascript"></script>
    <script src="../../../js/JQuery/jquery_last.js" type="text/javascript"></script>
    <script src="../../../js/common/Common.js" type="text/javascript"></script>
    <script src="../../../js/Calendar/WdatePicker.js" type="text/javascript"></script>
    <script src="../../../js/common/UserOrDeptSelect.js" type="text/javascript"></script>
    <script src="../../../js/office/HumanManager/EmployeeShift_Edit.js" type="text/javascript"></script>
</head>
<body>
<form id="frmMain" runat="server">
<table width="98%" border="0" cellpadding="0" cellspacing="0" class="maintable" id="mainindex">
    <tr>
        <td valign="top" colspan="2">
            <img src="../../../images/Main/Line.jpg" width="122" height="7" />
        </td>
    </tr>
    <tr>
        <td height="30" align="center" colspan="2" class="Title"><div id="divTitle" runat="server">新建调职通知单</div></td>
    </tr>
    <tr>
        <td height="40" valign="top" colspan="2">
            <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999">
                <tr>
                    <td height="30" class="tdColInput">
                        <table width="100%">
                            <tr>
                                <td>
                                    <img src="../../../Images/Button/Bottom_btn_save.jpg" runat="server" visible="false" title="保存" id="btnSave" style="cursor:hand" onclick="DoSave();"/>
                                    <img src="../../../Images/Button/UnClick_qr.jpg" runat="server" visible="false" alt="确认" id="btnConfirm" style="cursor:hand"  />
                                    <img src="../../../Images/Button/Bottom_btn_back.jpg" runat="server" visible="false" alt="返回" id="btnBack" onclick="DoBack();" style="cursor:hand"  />
                                    <span id="GlbFlowButtonSpan"></span>
                                </td>
                                <td align="right" class="tdColInput">
                                    <img src="../../../Images/Button/Main_btn_print.jpg" visible="false" alt="打印" id="btnPrint" onclick="DoPrint();" style="cursor:hand"  />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr><td>
<!-- <div style="height:500px;overflow-y:scroll;"> -->
<table width="100%" border="0" cellpadding="0" cellspacing="0" id="tblmain">
    <tr>
        <td  colspan="2">
            <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999">
                <tr>
                     <td height="20" class="td_list_title">
                        <table width="100%" align="center" border="0" cellspacing="0" cellpadding="3">
                            <tr>
                                <td>基本信息</td>
                                <td align="right">
                                    <div id='divBaseInfo'>
                                        <img src="../../../images/Main/Close.jpg" style="CURSOR: pointer"  onclick="oprItem('tblBaseInfo','divBaseInfo')"/>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td colspan="2" height="0">
                        <input type="hidden" id="hidIdentityID" value="" runat="server" />
                        <input type="hidden" id="hidListModuleID" runat="server" />
                        <input type="hidden" id="hidFastModuleID" runat="server" />
                        <input type="hidden" id="hidFromPage" runat="server" />
                        <input type="hidden" id="hidSearchCondition" runat="server" />
                    </td>
                </tr>
            </table>
            <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999" id="tblBaseInfo" style="display:block">
                <tr>
                    <td height="20"  class="td_list_fields" width="10%" align="right">调职单编号<span class="redbold">*</span></td>
                    <td height="20" class="tdColInput" width="23%">
                        <div id="divCodeRule" runat="server">
                            <uc1:CodingRule ID="codeRule" runat="server" />
                        </div>
                        <%--<div id="divCodeNo" runat="server" class="tdinput" style="display:none">--%>
                            <asp:TextBox ID="divCodeNo" CssClass="tdinput"  Enabled="false" runat="server"></asp:TextBox>
                        </div>
                    </td>
                    <td height="20"  class="td_list_fields" width="10%" align="right">调职单主题<span class="redbold">*</span></td>
                    <td height="20" class="tdColInput" width="23%">
                        <asp:TextBox ID="txtTitle" runat="server" MaxLength="50" CssClass="tdinput" ></asp:TextBox>
                    </td>
                    <td height="20"  class="td_list_fields" align="right">对应申请单</td>
                    <td height="20" class="tdColInput" >
                        <asp:DropDownList ID="ddlApply" runat="server" Width="150px"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td height="20"  class="td_list_fields" align="right">员工编号<span class="redbold">*</span></td>
                    <td height="20" class="tdColInput">
                        <asp:TextBox ID="txtEmployeeNo" onfocus="SelectEmployeeInfo();"  ReadOnly="true" Width="95%" runat="server" CssClass="tdinput"></asp:TextBox>
                        <input type="hidden" id="txtEmployeeID" runat="server" />
                    </td>
                    <td height="20"  class="td_list_fields" align="right">员工姓名</td>
                    <td height="20" class="tdColInput">
                        <asp:TextBox ID="txtEmployeeName" Width="95%" runat="server" CssClass="tdinput" Enabled="false"></asp:TextBox>
                    </td>
                    <td height="20"  class="td_list_fields" align="right">事由<span class="redbold">*</span></td>
                    <td height="20" class="tdColInput">
                        <asp:TextBox ID="txtReason" runat="server" CssClass="tdinput" MaxLength="100" Width="95%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td height="20"  class="td_list_fields" align="right">原部门</td>
                    <td height="20" class="tdColInput">
                        <asp:TextBox ID="txtNowDeptName" runat="server" Enabled="false" Width="95%"  CssClass="tdinput"></asp:TextBox>
                        <input type="hidden" id="txtNowDeptID" runat="server" />
                    </td>
                    <td height="20"  class="td_list_fields" align="right">原岗位</td>
                    <td height="20" class="tdColInput">
                        <asp:TextBox ID="txtNowQuarterName" runat="server" CssClass="tdinput" Width="95%" Enabled="false"></asp:TextBox>
                        <input type="hidden" runat="server" id="txtNowQuarterID" />
                    </td>
                    <td height="20"  class="td_list_fields" align="right">原岗位职等</td>
                    <td height="20" class="tdColInput">
                        <asp:TextBox ID="txtNowQuarterAdminName" runat="server" Enabled="false" Width="95%"  CssClass="tdinput"></asp:TextBox>
                        <input type="hidden" id="txtNowQuarterAdminID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td height="20"  class="td_list_fields" align="right">调入部门<span class="redbold">*</span></td>
                    <td height="20" class="tdColInput">
                        <asp:TextBox ID="DeptNew" runat="server" onclick="alertdiv('DeptNew,txtNewDept');" ReadOnly="true" Width="95%"  CssClass="tdinput"></asp:TextBox>
                        <input type="hidden" id="txtNewDept" runat="server" />
                    </td>
                    <td height="20"  class="td_list_fields" align="right">调入岗位<span class="redbold">*</span></td>
                    <td height="20" class="tdColInput">
                        <asp:DropDownList ID="ddlNewQuarter" runat="server"></asp:DropDownList>
                    </td>
                    <td height="20"  class="td_list_fields" align="right">调入岗位职等<span class="redbold">*</span></td>
                    <td height="20" class="tdColInput">
                        <uc1:CodeType ID="ctNewQuaterAdmin" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td height="20"  class="td_list_fields" align="right">调出时间<span class="redbold">*</span></td>
                    <td height="20" class="tdColInput">
                        <asp:TextBox ID="txtOutDate" Width="95%" runat="server" ReadOnly="true" CssClass="tdinput" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',el:$dp.$('txtOutDate')})"></asp:TextBox>
                    </td>
                    <td height="20"  class="td_list_fields" align="right">调入时间<span class="redbold">*</span></td>
                    <td height="20" class="tdColInput">
                        <asp:TextBox ID="txtIntDate" Width="95%" runat="server" ReadOnly="true" CssClass="tdinput" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',el:$dp.$('txtIntDate')})"></asp:TextBox>
                    </td>
                    <td height="20"  class="td_list_fields"></td>
                    <td height="20" class="tdColInput"></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr><td colspan="2" height="10"></td></tr>
    <tr>
        <td height="25" valign="top" colspan="2">
            <table width="99%" cellpadding="0" cellspacing="1" border="0" align="center">
                <tr>
                    <td height="25" valign="top" >
                        <span class="Blue">备注信息</span>
                    </td>
                    <td align="right" valign="top">
                        <div id='divRemarkInfo'>
                            <img src="../../../images/Main/close.jpg" style="CURSOR: pointer"  onclick="oprItem('tblRemarkInfo','divRemarkInfo')"/>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <table width="99%" border="0" id="tblRemarkInfo" style="BEHAVIOR:url(../../../draggrid.htc)"  align="center" cellpadding="0" cellspacing="1" bgcolor="#999999">
                <tr>
                    <td height="20"  class="td_list_fields" width="10%" align="right">制单人</td>
                    <td height="20" class="tdColInput" width="23%">
                        <asp:TextBox ID="UserCreator" onclick="alertdiv('UserCreator,txtCreator');" Enabled="false" Width="95%" CssClass="tdinput" runat="server"></asp:TextBox>
                        <input type="hidden" id="txtCreator" value="38" runat="server"/>
                    </td>
                    <td height="20"  class="td_list_fields" width="10%" align="right">制单日期</td>
                    <td height="20" class="tdColInput" width="23%">
                        <asp:TextBox ID="txtCreateDate" Width="95%" Enabled="false" runat="server" CssClass="tdinput" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',el:$dp.$('txtCreateDate')})"></asp:TextBox>
                    </td>
                    <td height="20"  class="td_list_fields" width="10%"></td>
                    <td height="20" class="tdColInput" width="24%">
                    </td>
                </tr>
                <tr>
                    <td height="20"  class="td_list_fields" align="right">确认人</td>
                    <td height="20" class="tdColInput" >
                        <asp:TextBox ID="UserConfirmor" onclick="alertdiv('UserConfirmor,txtConfirmor');" Enabled="false" Width="95%" CssClass="tdinput" runat="server"></asp:TextBox>
                        <input type="hidden" id="txtConfirmor" runat="server"/>
                    </td>
                    <td height="20"  class="td_list_fields" align="right">确认日期</td>
                    <td height="20" class="tdColInput" >
                        <asp:TextBox ID="txtConfirmDate" Width="95%" runat="server" Enabled="false" CssClass="tdinput" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',el:$dp.$('txtConfirmDate')})"></asp:TextBox>
                    </td>
                    <td height="20"  class="td_list_fields" ></td>
                    <td height="20" class="tdColInput"></td>
                </tr>
                <tr>
                    <td height="20"  class="td_list_fields" align="right">备注</td>
                    <td height="20" class="tdColInput" colspan="5">
                        <asp:TextBox ID="txtRemark" runat="server" MaxLength="100" Width="85%" CssClass="tdinput"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr><td colspan="2" height="10"></td></tr>  
</table>
<!-- </div> -->
</td>
</tr>
</table>
<div id="popupContent"></div>
<span id="Forms" class="Spantype"></span>
<uc1:Message ID="msgError" runat="server" />
</form>
</body>
</html>