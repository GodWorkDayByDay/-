﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmployeeWork_Info.aspx.cs" Inherits="Pages_Office_HumanManager_EmployeeWork_Info" %>
<%@ Register src="../../../UserControl/Message.ascx" tagname="Message" tagprefix="uc1" %>
<%@ Register src="../../../UserControl/CodeTypeDrpControl.ascx" tagname="CodeType" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>在职人员列表</title>
    <link rel="stylesheet" type="text/css" href="../../../css/default.css" />
    <link href="../../../css/pagecss.css" type="text/css" rel="Stylesheet" />
    <script src="../../../js/Calendar/WdatePicker.js" type="text/javascript"></script>
    <script src="../../../js/JQuery/jquery_last.js" type="text/javascript"></script>
    <script src="../../../js/common/PageBar-1.1.1.js" type="text/javascript"></script>
    <script src="../../../js/common/Page.js" type="text/javascript"></script>
    <script src="../../../js/office/HumanManager/EmployeeWork_Query.js" type="text/javascript"></script>
    <script src="../../../js/common/check.js" type="text/javascript"></script>
    <script src="../../../js/common/Common.js" type="text/javascript"></script>
    <script type="text/javascript"> 
//定义回车事件 钱锋锋 2010-11-04
function document.onkeydown() 
{ 
    
    if(event.keyCode == 13)
    {
        SearchEmployeeWork();
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
                </div>&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2"  >
                <table width="99%" border="0" align="center" cellpadding="0" id="tblSearch"  cellspacing="0" bgcolor="#CCCCCC">
                    <tr>
                        <td bgcolor="#FFFFFF">
                            <table width="100%" border="0"  cellpadding="2" cellspacing="1" bgcolor="#CCCCCC" class="table">
                                <tr>
                                    <td width="10%" height="20"  class="td_list_fields" align="right">编号</td>
                                    <td width="23%" class="tdColInput">
                                        <input name="txtEmployeeNo" id="txtEmployeeNo" runat="server" type="text" class="tdinput" size = "13" SpecialWorkCheck="编号" />
                                    </td>
                                    <td width="10%"  class="td_list_fields" align="right">工号</td>
                                    <td width="23%" class="tdColInput">
                                        <input name="txtEmployeeNum" id="txtEmployeeNum" runat="server" type="text" class="tdinput" size = "19" SpecialWorkCheck="工号"  />
                                    </td>
                                    <td width="10%"  class="td_list_fields" align="right">拼音缩写</td>
                                    <td width="24%" class="tdColInput">
                                        <input name="txtCardID" id="txtPYShort" runat="server" type="text" class="tdinput" size = "19" SpecialWorkCheck="拼音缩写" />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="20"   class="td_list_fields" align="right">姓名</td>
                                    <td class="tdColInput">
                                        <input name="txtEmployeeName" runat="server" id="txtEmployeeName" type="text" class="tdinput" size = "13" SpecialWorkCheck="姓名" />
                                    </td>
                                    <td  class="td_list_fields" align="right">岗位</td>
                                    <td class="tdColInput">
                                       
                                        <asp:DropDownList ID="ddlQuarter_ddlCodeType" runat="server"></asp:DropDownList>
                                       
                                    </td>
                                    <td  class="td_list_fields" align="right">职称</td>
                                    <td class="tdColInput">
                                        
                                        <uc1:CodeType ID="ddlPosition" runat="server" />
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="20"  class="td_list_fields" align="right">入职时间</td>
                                    <td class="tdColInput">
                                        <input name="txtStartDate" readonly runat="server" id="txtStartDate" size="12" type="text" class="tdinput" maxlength="10" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',el:$dp.$('txtStartDate')})" />至
                                        <input runat="server" readonly id="txtEnterEndDate" size="12" type="text" class="tdinput" maxlength="10" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',el:$dp.$('txtEnterEndDate')})" /></td>
                                    <td  class="td_list_fields"  align="right" >手机号码</td>
                                    <td class="tdColInput">
                                                            <asp:TextBox ID="txtMobile" runat="server" MaxLength="50" SpecialWorkCheck="手机号码" CssClass="tdinput" Width="95%"></asp:TextBox>
                  </td>
                                    <td  class="td_list_fields">&nbsp;</td>
                                    <td class="tdColInput">
                                        
                                    </td>
                                </tr>                    
                                <tr>
                                    <td colspan="6" align="center" bgcolor="#FFFFFF">
                                        <uc1:Message ID="Message1" runat="server" />
                                        <input type="hidden" id="hidSearchCondition" name="hidSearchCondition" />
                                        <img alt="检索" src="../../../images/Button/Bottom_btn_search.jpg" id="btnSearch" visible="false" runat="server" style='cursor:pointer;' onclick='SearchEmployeeWork()'/>                                        
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                 </table>
            </td>
        </tr>
        <tr><td colspan="2" height="5">
        <input type="hidden" id="hidModuleID" runat="server" />
        <input type="hidden" id="hidSysteDate" runat="server" />
        </td></tr>
        <tr>
            <td colspan="2">

                <table width="99%" border="0" cellpadding="0" cellspacing="0" id="tblDetailList" align="center" >
                    <tr>
                        <td valign="top">
                            <img src="../../../images/Main/Line.jpg" width="122" height="7" />
                        </td>
                        <td align="center" valign="top"></td>
                    </tr>
                    <tr><td colspan="2" height="2"></td></tr>
                    <tr>
                        <td height="30" colspan="2" align="center" valign="top" class="Title">在职人员列表</td>
                    </tr>
                    <tr>
                        <td height="35" colspan="2" valign="top">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999">
                                <tr>
                                    <td height="28" bgcolor="#FFFFFF">
                                        <img src="../../../Images/Button/Bottom_btn_new.jpg" alt="新建" visible="false" id="btnNew" runat="server" style="cursor:hand" onclick="DoNew();" />
                                        <asp:ImageButton ID="btnImport" runat="server" ImageUrl="~/Images/Button/Main_btn_out.jpg" onclick="btnImport_Click" />
                                        <%--<img src="../../../images/Button/Main_btn_delete.jpg" alt="删除" visible="false" id="btnDelete" runat="server" onclick="DeleteEmployeeInfo()" style='cursor:pointer;' width="51" height="25" />--%>&nbsp;
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
                                       
                                         <th align="center" class="td_list_fields">
                                            <div class="orderClick" style="width:95%" onclick="OrderBy('EmployeeNo','oC0');return false;">
                                                编号<span id="oC0" class="orderTip"></span>
                                            </div>
                                        </th>
                                         <th align="center" class="td_list_fields">
                                            <div class="orderClick" style="width:95%" onclick="OrderBy('EmployeeNum','oC1');return false;">
                                                工号<span id="oC1" class="orderTip"></span>
                                            </div>
                                        </th>
                                         <th align="center" class="td_list_fields">
                                            <div class="orderClick" style="width:95%" onclick="OrderBy('PYShort','oC2');return false;">
                                                拼音缩写<span id="oC2" class="orderTip"></span>
                                            </div>
                                        </th>
                                         <th align="center" class="td_list_fields">
                                            <div class="orderClick" style="width:95%" onclick="OrderBy('EmployeeName','oC3');return false;">
                                                姓名<span id="oC3" class="orderTip"></span>
                                            </div>
                                        </th>                                        
                                         <th align="center" class="td_list_fields">
                                            <div class="orderClick" style="width:95%" onclick="OrderBy('DeptName','oC5');return false;">
                                                部门<span id="oC5" class="orderTip"></span>
                                            </div>
                                        </th>
                                       
                                         <th align="center" class="td_list_fields">
                                            <div class="orderClick" style="width:95%" onclick="OrderBy('QuarterName','oC7');return false;">
                                                岗位<span id="oC7" class="orderTip"></span>
                                            </div>
                                        </th>
                                         <th align="center" class="td_list_fields">
                                            <div class="orderClick" style="width:95%" onclick="OrderBy('PositionName','oC8');return false;">
                                                职称<span id="oC8" class="orderTip"></span>
                                            </div>
                                        </th>
                                         <th align="center" class="td_list_fields">
                                            <div class="orderClick" style="width:95%" onclick="OrderBy('EntryDate','oC9');return false;">
                                                入职时间<span id="oC9" class="orderTip"></span>
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
                                                        每页显示<input name="txtShowPageCount" type="text" id="txtShowPageCount"size="3" maxlength="4" />条&nbsp;&nbsp;
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
<input id="hiddExpOrder" type="hidden" runat="server" />
</form>
</body>
</html>
