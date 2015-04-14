﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PerformanceBetter_Edit.aspx.cs" Inherits="Pages_Office_HumanManager_PerformanceBetter_Edit" %>
<%@ Register src="../../../UserControl/Message.ascx" tagname="Message" tagprefix="uc1" %>
<%@ Register src="../../../UserControl/CodingRuleControl.ascx" tagname="CodingRule" tagprefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <title>绩效改进</title>
   
           <link rel="stylesheet" type="text/css" href="../../../css/default.css" />
    <link href="../../../css/pagecss.css" type="text/css" rel="Stylesheet" />
        <script src="../../../js/Calendar/WdatePicker.js" type="text/javascript"></script>
    <script src="../../../js/JQuery/jquery_last.js" type="text/javascript"></script>
    <script src="../../../js/common/PageBar-1.1.1.js" type="text/javascript"></script>
    <script src="../../../js/common/Page.js" type="text/javascript"></script>
    <script src="../../../js/common/check.js" type="text/javascript"></script>
    <script src="../../../js/common/Common.js" type="text/javascript"></script>
    <script src="../../../js/office/HumanManager/PerformanceBetter_Edit.js" type="text/javascript"></script>
     <script src="../../../js/common/UserOrDeptSelect.js" type="text/javascript"></script>
    <%--  <script src="../../../js/personal/MessageBox/SendInfo.js" type="text/javascript"></script>--%>
           <script src="../../../js/Personal/MessageBox/send.js" type="text/javascript"></script>
           <script type="text/javascript"> 
//定义回车事件 钱锋锋 2010-11-04
function document.onkeydown() 
{ 
    
    if(event.keyCode == 13)
    {
        DoSearchInfo();
        event.returnValue = false;
    } 
}
</script>
    <style type="text/css">
    
       .tab_a{width:99%; background-color:#FFFFFF ; border-collapse:collapse; border:1px #D1D1D1 solid; border-spacing:0px; margin:0 auto 8px}

.tab_a th{ padding:4px 6px; border-right:1px #D1D1D1 solid; border:1px #D1D1D1 solid;background:#F4F4F4; text-align:left}
.tab_a td{ padding:4px 6px;  border:1px #D1D1D1 solid}
        #txtSearchTask
        {
            width: 99%;
        }
        #inptSearchTitle
        {
            width: 264px;
        }
    </style>
</head>
<body>

<form id="frmMain" runat="server" >
<%--<div id="popupContent"  ></div>--%>
<span id="Forms" class="Spantype"></span>
<input id="hidModuleID" type="hidden" runat="server" />
<div id="PerformanceTypeCheck"   >
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
                            <table width="100%" border="0"  cellpadding="2" cellspacing="1" bgcolor="#CCCCCC">
                                <tr>
                                    <td height="20"  class="td_list_fields" width="10%" align="right">
                                        改进计划编号</td>
                                    <td class="tdColInput" width="23%">
                                        <input name="txtSearchTestNo" id="txtSearchTask" runat="server" maxlength="25" 
                                            type="text" class="tdinput" SpecialWorkCheck="改进计划编号"/>
                                    </td>
                                     <td  class="td_list_fields" width="10%" align="right">
                                       改进计划主题</td>
                                    <td class="tdColInput" width="23%">
                                        <input id="inptSearchTitle" type="text" maxlength="25"  class="tdinput" SpecialWorkCheck="改进计划主题" runat="server"/>
                                    </td>
                                        <td  class="td_list_fields" width="10%" align="right">
                                        被考核人</td>
                                    <td class="tdColInput" width="23%">
                                             <asp:TextBox ID="UserApplyUserName" MaxLength="50" onclick="alertdiv('UserApplyUserName,txtSearchScoreEmployee');"
                                runat="server" CssClass="tdinput" Width="95%"  ReadOnly="true"></asp:TextBox>
                            <input type="hidden" id="txtSearchScoreEmployee" runat="server" />
                                    </td>
                                </tr>     
                                <tr>
                                    <td height="20"  class="td_list_fields" width="10%" align="right">
                                                                                创建时间</td>
                                    <td class="tdColInput" width="23%"  colspan="3">
                                   <asp:TextBox ID="txtStartDate" runat="server" MaxLength="10" CssClass="tdinput" ReadOnly="true" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',el:$dp.$('txtStartDate')})"></asp:TextBox>至<asp:TextBox ID="txtEndDate" runat="server" MaxLength="10" CssClass="tdinput" ReadOnly="true" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',el:$dp.$('txtEndDate')})"></asp:TextBox>
        </td>
                             
                                  <td  class="td_list_fields" width="10%"></td> <td class="tdColInput" width="23%"></td>     
                                </tr>  
                                <tr>
                                    <td colspan="6" align="center" bgcolor="#FFFFFF">  
                                        <input type="hidden" id="hidSearchCondition" runat="server" />
                                        <uc1:Message ID="Message1" runat="server" />
                                        <img alt="检索" src="../../../images/Button/Bottom_btn_search.jpg" id="btnSearch" visible="false" runat="server" style='cursor:pointer;' onclick='DoSearchInfo()'   />
                                        <%--<img alt="重置" src="../../../images/Button/Bottom_btn_re.jpg" id="btnReset" runat="server" visible="false" style='cursor:pointer;' onclick="ClearInput()" width="52" height="23" />--%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                 </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" height="5"></td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" id="tblDetailList" >
                    <tr>
                        <td valign="top">
                            <img src="../../../images/Main/Line.jpg" width="122" height="7" />
                        </td>
                        <td align="center" valign="top"></td>
                    </tr>
                    <tr>
                        <td height="30" colspan="2" align="center" valign="top" class="Title">绩效改进</td>
                    </tr>
                    <tr>
                        <td height="35" colspan="2" valign="top">
                            <table width="99%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#999999">
                                <tr>
                                    <td height="28" bgcolor="#FFFFFF">
                                        
                                        <%--<img src="../../../images/Button/Main_btn_delete.jpg" alt="删除" visible="true" id="btnDelete" runat="server" onclick="DoDelete()" style='cursor:pointer;' width="51" height="25" />--%>
                                        <%--<img src="../../../images/Button/Main_btn_out.jpg" alt="导出" visible="true" id="btnExport" runat="server" onclick="DoExport()" style='cursor:pointer;' width="51" height="25" />--%>
                  <img src="../../../Images/Button/Bottom_btn_new.jpg" alt="新建" visible="false" id="btnNew" runat="server" style="cursor:hand"  onclick="DoBack();"/>
                                    <img src="../../../images/Button/Main_btn_delete.jpg" alt="删除" visible="false" id="btnDelete" runat="server" onclick="DoDelete()" style='cursor:pointer;'   />
                                      <asp:ImageButton ID="btnImport" ImageUrl="../../../images/Button/Main_btn_out.jpg" AlternateText="导出Excel" runat="server" onclick="btnImport_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <!-- <div style="height:252px;overflow-y:scroll;"> -->
                            <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" id="tblDetailInfo" bgcolor="#999999">
                                <tbody>
                                    <tr>
                                     <th align="center" class="td_list_fields" >
                                           选择<input type="checkbox" id="chkCheckAll" name="chkCheckAll" onclick="AllSelect('chkCheckAll', 'chkSelect')"/>
                                        </th> 
                                        <th align="center" class="td_list_fields" >
                                            <div class="orderClick" onclick="OrderBy('PlanNo','oC0');return false;">
                                                计划编号<span id="oC0" class="orderTip"></span>
                                            </div>
                                        </th> 
                                        <th align="center" class="td_list_fields" >
                                            <div class="orderClick" onclick="OrderBy('Title','oC1');return false;">
                                                计划主题<span id="oC1" class="orderTip"></span>
                                            </div>
                                        </th>
                                         <th align="center" class="td_list_fields" >
                                            <div class="orderClick" onclick="OrderBy('Creator','oC2');return false;">
                                                创建人<span id="oC2" class="orderTip"></span>
                                            </div>
                                        </th>
                                        <th align="center" class="td_list_fields" >
                                            <div class="orderClick" onclick="OrderBy('CreateDate','oC3');return false;">
                                               创建时间<span id="oC3" class="orderTip"></span>
                                            </div>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- </div> -->
                            <br/>
                            <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999" class="PageList">
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
                                                        每页显示<input name="txtShowPageCount" type="text" id="txtShowPageCount" size="3"   maxlength="5"/>条&nbsp;&nbsp;
                                                        转到第<input name="txtToPage" type="text" id="txtToPage" size="3"/>页&nbsp;&nbsp;
                                                        <img src="../../../images/Button/Main_btn_GO.jpg" style='cursor:pointer;' alt="go" width="36" height="28" align="absmiddle" onclick="ChangePageCountIndex($('#txtShowPageCount').val(),$('#txtToPage').val());" />
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
    
    
   </div> 
      

     
</form>
</body>
</html>
