﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmployeeShift_Info.aspx.cs" Inherits="Pages_Office_HumanManager_EmployeeShift_Info" %>
<%@ Register src="../../../UserControl/Message.ascx" tagname="Message" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>调职单列表</title>
    <link rel="stylesheet" type="text/css" href="../../../css/default.css" />
    <link href="../../../css/pagecss.css" type="text/css" rel="Stylesheet" />
    <script src="../../../js/JQuery/jquery_last.js" type="text/javascript"></script>
    <script src="../../../js/common/PageBar-1.1.1.js" type="text/javascript"></script>
    <script src="../../../js/common/Page.js" type="text/javascript"></script>
    <script src="../../../js/office/HumanManager/EmployeeShift_Query.js" type="text/javascript"></script>
    <script src="../../../js/common/check.js" type="text/javascript"></script>
    <script src="../../../js/common/Common.js" type="text/javascript"></script>
    <script src="../../../js/Calendar/WdatePicker.js" type="text/javascript"></script>
    <script src="../../../js/common/UserOrDeptSelect.js" type="text/javascript"></script>
    <script type="text/javascript"> 
//定义回车事件 钱锋锋 2010-11-04
function document.onkeydown() 
{ 
    
    if(event.keyCode == 13)
    {
        DoSearch();
        event.returnValue = false;
    } 
}
</script>
</head>
<body>
<form id="frmMain" runat="server">
    <table width="98%"border="0" cellpadding="0" cellspacing="0" class="checktable" id="mainindex">
        <tr>
            <td valign="top">
                <img src="../../../images/Main/Line.jpg" width="122" height="7" />
            </td>
        </tr>
        <tr>
            <td  valign="top" class="Blue">
                <img src="../../../images/Main/Arrow.jpg" width="21" height="18" align="absmiddle" />检索条件
            </td>
            <td align="right" valign="top">
                <div id='divSearch'>
                    <img src="../../../images/Main/Close.jpg" style="CURSOR: pointer"  onclick="oprItem('tblSearch','divSearch')"/>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="99%" border="0" align="center" cellpadding="0" id="tblSearch"  cellspacing="0" bgcolor="#CCCCCC">
                    <tr>
                        <td bgcolor="#FFFFFF">
                            <table width="100%" border="0"  cellpadding="2" cellspacing="1" bgcolor="#CCCCCC">
                                <tr>
                                    <td height="20"  class="td_list_fields" width="10%" align="right">调职单编号</td>
                                    <td class="tdColInput" width="23%">
                                        <asp:TextBox ID="txtNotifyNo" runat="server" MaxLength="50" specialworkcheck="调职单编号" Width="95%" CssClass="tdinput"></asp:TextBox>
                                    </td>
                                    <td height="20"  class="td_list_fields" width="10%" align="right">调职单主题</td>
                                    <td class="tdColInput" width="23%">
                                        <asp:TextBox ID="txtTitle" Width="95%" runat="server" specialworkcheck="调职单主题" CssClass="tdinput" MaxLength="50"></asp:TextBox>
                                    </td>
                                    <td  class="td_list_fields" align="right">对应申请单</td>
                                    <td class="tdColInput">
                                        <asp:DropDownList ID="ddlApply" runat="server" Width="150px"></asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="td_list_fields" align="right">员工</td>
                                    <td class="tdColInput">
                                        <asp:TextBox ID="UserEmployeeName" onclick="alertdiv('UserEmployeeName,hidEmployeeID');" ReadOnly="true" Width="95%" CssClass="tdinput" runat="server"></asp:TextBox>
                                        <input type="hidden" id="hidEmployeeID" runat="server"/>
                                    </td>
                                    <td  class="td_list_fields"></td>
                                    <td class="tdColInput"></td>
                                    <td  class="td_list_fields"></td>
                                    <td class="tdColInput"></td>
                                </tr>             
                                <tr>
                                    <td colspan="6" align="center" bgcolor="#FFFFFF">
                                        <uc1:Message ID="Message1" runat="server" />
                                        <input type="hidden" id="hidModuleID" runat="server"/>
                                        <input type="hidden" id="hidSearchCondition" />
                                        <img alt="检索" src="../../../images/Button/Bottom_btn_search.jpg" id="btnSearch" visible="false" runat="server" style='cursor:pointer;' onclick='DoSearch()'/>
                                        <%--<img alt="重置" src="../../../images/Button/Bottom_btn_re.jpg" id="btnReset" runat="server" visible="true" style='cursor:pointer;' onclick="ClearInputProxy()" width="52" height="23" />--%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                 </table>
            </td>
        </tr>
        <tr><td colspan="2" height="10"><input type="hidden" id="hfModuleID" runat="server" /></td></tr>
        <tr><td colspan="2"  valign="top"><img src="../../../images/Main/Line.jpg" width="122" height="7" /></td></tr>
        <tr>
            <td colspan="2">
                <table width="99%" align="center" border="0" cellpadding="0" cellspacing="0" id="tblDetailList" >
                    <tr><td colspan="2" height="2"></td></tr>
                    <tr>
                        <td height="30" colspan="2" align="center" valign="top" class="Title">调职通知单列表</td>
                    </tr>
                    <tr>
                        <td height="35" colspan="2" valign="top">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999">
                                <tr>
                                    <td height="28" bgcolor="#FFFFFF">
                                        <img src="../../../Images/Button/Bottom_btn_new.jpg" alt="新建" visible="false" id="btnNew" runat="server" style="cursor:hand" onclick="DoNew();"/>
                                        <img src="../../../images/Button/Main_btn_delete.jpg" alt="删除" visible="false" id="btnDelete" runat="server" onclick="DoDelete()" style='cursor:pointer;'/>
                                        <asp:ImageButton ID="btnImport" ImageUrl="../../../images/Button/Main_btn_out.jpg" AlternateText="导出Excel" runat="server" onclick="btnImport_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <%--<div style="height:252px;overflow-y:scroll;">--%>
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" id="tblDetailInfo" bgcolor="#999999">
                                <tbody>
                                    <tr>
                                         <th height="20" align="center" class="td_list_fields">
                                            选择<input type="checkbox" id="chkCheckAll" name="chkCheckAll" onclick="AllSelect('chkCheckAll', 'chkSelect')">
                                        </th>
                                         <th align="center" class="td_list_fields">
                                            <div class="orderClick" onclick="OrderBy('NotifyNo','oC0');return false;">
                                                调职单编号<span id="oC0" class="orderTip"></span>
                                            </div>
                                        </th>
                                         <th align="center" class="td_list_fields">
                                            <div class="orderClick" onclick="OrderBy('Title','oC1');return false;">
                                                调职单主题<span id="oC1" class="orderTip"></span>
                                            </div>
                                        </th>
                                         <th align="center" class="td_list_fields">
                                            <div class="orderClick" onclick="OrderBy('EmplApplyNo','oC2');return false;">
                                                对应申请单<span id="oC2" class="orderTip"></span>
                                            </div>
                                        </th>
                                         <th align="center" class="td_list_fields">
                                            <div class="orderClick" onclick="OrderBy('EmployeeNo','oC3');return false;">
                                                员工编号<span id="oC3" class="orderTip"></span>
                                            </div>
                                        </th>
                                         <th align="center" class="td_list_fields">
                                            <div class="orderClick" onclick="OrderBy('EmployeeName','oC4');return false;">
                                                员工姓名<span id="oC4" class="orderTip"></span>
                                            </div>
                                        </th>
                                         <th align="center" class="td_list_fields">
                                            <div class="orderClick" onclick="OrderBy('NowDeptName','oC5');return false;">
                                                原部门<span id="oC5" class="orderTip"></span>
                                            </div>
                                        </th>
                                         <th align="center" class="td_list_fields">
                                            <div class="orderClick" onclick="OrderBy('NowQuarterName','oC6');return false;">
                                                原岗位<span id="oC6" class="orderTip"></span>
                                            </div>
                                        </th>
                                         <th align="center" class="td_list_fields">
                                            <div class="orderClick" onclick="OrderBy('OutDate','oC7');return false;">
                                                调出时间<span id="oC7" class="orderTip"></span>
                                            </div>
                                        </th>
                                         <th align="center" class="td_list_fields">
                                            <div class="orderClick" onclick="OrderBy('NewDeptName','oC8');return false;">
                                                调入部门<span id="oC8" class="orderTip"></span>
                                            </div>
                                        </th>
                                         <th align="center" class="td_list_fields">
                                            <div class="orderClick" onclick="OrderBy('NewQuarterName','oC9');return false;">
                                                调入岗位<span id="oC9" class="orderTip"></span>
                                            </div>
                                        </th>
                                         <th align="center" class="td_list_fields">
                                            <div class="orderClick" onclick="OrderBy('BillStatus','oC10');return false;">
                                                单据状态<span id="oC10" class="orderTip"></span>
                                            </div>
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                            <%--</div>--%>
                            <br/>
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999" class="PageList">
                                <tr>
                                    <td height="28"  background="../../../images/Main/PageList_bg.jpg" >
                                        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="PageList">
                                            <tr>
                                                <td height="28"  background="../../../images/Main/PageList_bg.jpg" width="40%"  >
                                                    <div id="pagecount"></div>
                                                </td>
                                                <td height="28"  align="right">
                                                    <div id="divPageClickInfo" class="jPagerBar"></div>
                                                </td>
                                                <td height="28" align="right">
                                                    <div id="divPage">
                                                        每页显示<input name="txtShowPageCount" type="text" id="txtShowPageCount" maxlength="4" size="3" />条&nbsp;&nbsp;
                                                        转到第<input name="txtToPage" type="text" id="txtToPage" maxlength="4" size="3"/>页&nbsp;&nbsp;
                                                        <img src="../../../images/Button/Main_btn_GO.jpg" style='cursor:pointer;' alt="go" height="28" align="absmiddle" onclick="ChangePageCountIndex($('#txtShowPageCount').val(),$('#txtToPage').val());" />
                                                    </div>
                                                 </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <br/>
                        </td>
                    </tr>
                </table>            
            </td>
        </tr>
    </table>
    <a name="DetailListMark"></a>
    <span id="Forms" class="Spantype" name="Forms"></span>
</form>
</body>
</html>
