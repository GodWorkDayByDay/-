<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyWorkFlow.aspx.cs"   Inherits="Pages_jthy_PersonCenter_MyWorkFlow" %>

<%@ Register Src="../../../UserControl/Message.ascx" TagName="Message" TagPrefix="uc1" %>
<%@ Register Src="../../../UserControl/CodingRuleControl.ascx" TagName="CodingRuleControl"
    TagPrefix="uc3" %>
<%--<%@ Register Src="../../../UserControl/CustLinkManSel.ascx" TagName="CustLinkManSel"
    TagPrefix="uc4" %>--%>
<%--<%@ Register Src="~/UserControl/CodeTypeDrpControl.ascx" TagName="CodeTypeDrpControl"
    TagPrefix="uc6" %>--%>
<%@ Register Src="~/UserControl/AddLimitArea.ascx" TagName="Limitarea" TagPrefix="uc7" %>
<%--<%@ Register src="~/UserControl/addCustLinkMan.ascx" tagname="addCustLinkMan" tagprefix="uc8" %>--%>
<%@ Register Src="../../../UserControl/FlowApply.ascx" TagName="FlowApply" TagPrefix="uc10" %>
<%--<%@ Register Src="../../../UserControl/CustNameSel_Con.ascx" TagName="CustNameSel"
    TagPrefix="uc11" %>--%>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link rel="stylesheet" type="text/css" href="../../../css/jt_default.css" />

    <script src="../../../js/JQuery/jquery-1.4.4.min.js" type="text/javascript"></script>
    
    
    <script src="../../../js/JQuery/jquery_last.js" type="text/javascript"></script>

    <script src="../../../js/Calendar/WdatePicker.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript" src="../../../js/common/PageBar-1.1.1.js"></script>

    <script src="../../../js/Personal/Common.js" type="text/javascript"></script>

    <script src="../../../js/jthy/PersonCenter/MyWorkFlow.js" type="text/javascript"></script>

    <script src="../../../js/common/check.js" type="text/javascript"></script>

    <script src="../../../js/common/page.js" type="text/javascript"></script>

    <script src="../../../js/common/Common.js" type="text/javascript"></script>
    
    <script src="../../../js/common/UserOrDeptSelect.js" type="text/javascript"></script>
    
   <script src="../../../js/jthy/contractmanage/flowbuttoncontrol.js" type="text/javascript"></script>
      
 

 <script type="text/javascript">
  
     
    var glb_BillTypeFlag ="30";
    var glb_BillTypeCode ="1";
    var glb_BillID = 0;                                //����ID
    var glb_IsComplete = false;                                          //�Ƿ���Ҫ�ᵥ��ȡ���ᵥ(Сд��ĸ)
    var FlowJS_HiddenIdentityID ='hiddOrderID'; //���������������ID
    var FlowJs_BillNo ='billNo';//��ǰ���ݱ�������
    var FlowJS_BillStatus ='hidBillStatus';    //����״̬ID
   
  
  </script>

  
  
    <title>��������������</title>
    <style type="text/css">
           .style1
          {
            background-color: #FFFFFF;
            width: 324px;
          }
        #BillType
        {
            width: 81px;
        }
        #BillFlag
        {
            width: 74px;
         }
        
    .menu{ margin-top:-10px; }
    .menu ul li a, .menu ul li a:visited {display:block;  text-decoration:none; color:#000;width:104px; height:19px; text-align:center; color:#fff; border:1px solid #fff; background:#008EFF; line-height:20px; font-size:11px; overflow:hidden;}
 .menu ul {padding:0; margin:0;list-style-type: none;}
 .menu ul li {float:left; margin-right:1px;}
 .menu ul li ul {display: none;}

 .menu ul li:hover a {color:#fff; background:#36f;}
 .menu ul li:hover ul {display:block; top:20px; left:0; width:105px;}
 .menu ul li:hover ul li a.hide {background:#6a3; color:#fff;}
 .menu ul li:hover ul li:hover a.hide {background:#6fc; color:#000;}
 .menu ul li:hover ul li ul {display: none;}
 .menu ul li:hover ul li a {display:block; background:#ddd; color:#000; }
 .menu ul li:hover ul li a:hover {background:#6fc; color:#000;}
 .menu ul li:hover ul li:hover ul {display:block; position:absolute; left:105px;}
 .menu ul li:hover ul li:hover ul.left {left:-105px; }
       
    </style>
</head>
<body>


    <form id="form1" runat="server">
<span id="Span1" class="Spantype"></span>
    <uc1:Message ID="Message1" runat="server" />    
    <input type="hidden" id="hiddtitlename" runat="server" value="0" />
    <input type="hidden" id="hiddOrderID" runat="server" value="0" />
    <input type="hidden" id="hidisCust" runat="server" />
    <input type='hidden' id='txtTRLastIndex' value="0" />
    <input type="hidden" id="hidBillStatus" runat="server" />
    <input type="hidden" id="hidStatus" runat="server" />
    <input type="hidden" id="hidSendStatus" runat="server" />
    <input type="hidden" id="ThisID" runat="server" />
    <%--<uc11:CustNameSel ID="CustNameSel" runat="server" />--%>
     <input type="hidden" id="txtCreatorID" name="txtCreatorID" runat="server" />
     <input type="hidden" id="txtCreateDate" name="txtCreateDate" runat="server" />
     <input type="hidden" id="txtBillStatusID" name="txtBillStatusID" value="1" runat="server" />
     <input type="hidden" id="txtBillStatusName" name="txtBillStatusName" value="�Ƶ�"  runat="server" />
     <input type="hidden" id="txtConfirmorID" name="txtConfirmorID" runat="server" />
     <input type="hidden" id="txtConfirmor" name="txtConfirmor" runat="server" />
     <input type="hidden" id="txtConfirmorReal" name="txtConfirmorReal" runat="server" />
     <input type="hidden" id="txtConfirmorDate" name="txtConfirmorDate" runat="server" />
     <input type="hidden" id="txtModifiedUserID" name="txtModifiedUserID" runat="server" />
     <input type="hidden" id="txtModifiedDate" name="txtModifiedDate" runat="server" /> 
     <script src="../../../js/common/Flow.js" type="text/javascript"></script>
     <input type="hidden" id="getOrderNO" />
     <uc10:FlowApply ID="FlowApply1" runat="server" />

    <input type="hidden" id="isSearched" value="0" />

    
    <a name="pageDataList1Mark"></a>
    <span id="Forms" class="Spantype" name="Forms"></span>
    <table width="98%" height="57" border="0" cellpadding="0" cellspacing="0" class="checktable"
        id="mainindex">
        <tr>
            <td valign="middle" align="center">
                <table width="99%" border="0" border="0" cellpadding="0" cellspacing="0" >

                    <tr class="menutitle1">
                        <td align="left" valign="middle" >
                            &nbsp;&nbsp;��������
                        </td>
                        <td align="right" valign="middle" >
                            <div id='searchClick'>
                                <img src="../../../images/Main/Close.jpg" style="cursor: pointer" onclick="oprItem('searchtable','searchClick')" />
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="99%" border="0" align="center" cellpadding="0" id="searchtable" cellspacing="0"
                    bgcolor="#CCCCCC">
                    <tr>
                        <td bgcolor="#FFFFFF">
                            <table width="100%" border="0"  cellpadding="2" cellspacing="1" bgcolor="#CCCCCC" class="table">
                                
                                     
                      
                                <tr class="table-item">
                                    
                                    
                                    
                                    <td class="td_list_fields" >
                                        ���̷�����
                                    </td>
                                    <td class="tdColInput">
                                        <asp:TextBox ID="UserApplyUserID" Style="width: 98%" ReadOnly="true" CssClass="tdinput"
                                            runat="server" onclick="alertdiv('UserApplyUserID,ApplyUser,2');" 
                                            Height="21px"></asp:TextBox>
                                        <input type="hidden" id="ApplyUser" runat="server" />
                                    </td>
                                     <td class="td_list_fields">
                                        ���ݱ��
                                    </td>
                                    <td class="tdColInput"  colspan="3">
                                        <input name="billNo" id="billNo" type="text" class="tdinput" size="19" />
                                    </td>
                                    <td class="td_list_fields" align="right"  style=" display:none" >
                                        ��������
                                    </td>
                                   <td bgcolor="#FFFFFF" width="300px" style=" display:none">
                                    <%--������,�б�ѡ������ ��������--%>
                                        <select id="BillFlag" onchange="setTypes(this)"> 
                                          
                                        </select>
                                        <select id="BillType">
                                        </select>
                                        
                                    </td>
                                   
                                </tr>
                                <tr class="table-item">
                                    <td  class="td_list_fields">
                                        ����״̬
                                    </td>
                                    <td class="tdColInput">
                                        <select id="slFlowStatus" style="width: 120px;">
                                            <option value="-1" selected>������ѡ�񡪡�</option>
                                            <option value="1">δ���</option>
                                            <option value="2">������</option>
                                            <option value="3">����ͨ��</option>
                                            <option value="4">������ͨ��</option>
                                            <option value="5">��������</option>
                                        </select>
                                    </td>
                                    
                                    
                                    <td class="td_list_fields" >
                                        ����ʱ��
                                    </td>
                                    <td class="tdColInput" colspan="3">
                                        <input onkeypress="return false;" name="createDate" id="createDate1" class="tdinput"
                                            type="text" size="10" onclick="WdatePicker()" />
                                        &nbsp;~&nbsp;<input onkeypress="return false;" name="createDate" id="createDate2" class="tdinput"
                                            type="text" size="10" onclick="WdatePicker()" />
                                    </td>
                                </tr>
                                <tr >
                                    <td colspan="6" class="td_main_detail">
                                        <img title="����" src="../../../images/Button/Bottom_btn_search.jpg" style='cursor: pointer;'
                                            onclick='SearchEquipData()'/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="98%" height="57" border="0" cellpadding="0" cellspacing="0" class="maintable"
        id="mainindex">

        <tr>
            <td  colspan="2" align="center" valign="top" class="Title">
                <table width="99%" border="0" cellpadding="0" cellspacing="0" >
                    <tr class="menutitle1">
                        <td  align="left" valign="middle" >
                            &nbsp;&nbsp;��������������
                        </td>
                    </tr>
                </table>
                
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" id="pageDataList1"
                     bgcolor="#CCCCCC">
                    <tbody>
                        <tr class="table-item">                            
                            
                              <th width="5%" class="td_main_detail" >
                        ѡ��
                    </th>
                            
                            
                            <th width="5%" class="td_main_detail">
                                <div class="orderClick" onclick="OrderBy(this,'billNo','oGroup');return false;">
                                    ���ݱ��<span></span></div>
                            </th>
                            <th  width="5%" class="td_main_detail">
                                <div class="orderClick" onclick="return false;">
                                    ��Ӧ��������<span></span></div>
                            </th>
                            <th width="5%" class="td_main_detail">
                                <div class="orderClick" onclick="OrderBy(this,'FlowName','oC1');return false;">
                                    ���ݴ���ʱ��<span></span></div>
                            </th>
                            
                            <th width="5%" class="td_main_detail">
                                <div class="orderClick" onclick="OrderBy(this,'ApplyUserId','oC4');return false;">
                                     ״̬<span></span></div>
                            </th>
                           <th width="5%"  class="td_main_detail">
                                <div class="orderClick" onclick="OrderBy(this,'FlowStatus','oC2');return false;">
                                    ���̷�����<span></span></div>
                            </th>
                            <th width="5%" class="td_main_detail">
                                <div class="orderClick" onclick="OrderBy(this,'ModifiedUserID','oC8');return false;">
                                   ���̽�����<span></span></div>
                            </th>
                            <th width="5%" class="td_main_detail">
                                <div class="orderClick" onclick="OrderBy(this,'ModifiedUserID','oC8');return false;">
                                    ����<span></span>
                                    </div>
                            </th>
                        </tr>
                        <tr>
                        <td>
                     <%--   <div id='Header'><ul id='nav'><li class='nav'>����<ul><li>�鿴</li><li>����ͨ��</li><li>�����˻�</li></ul></li></ul></div>--%>
                        <span runat="server" id="GlbFlowButtonSpan" style="display:none"></span>
                        </td>
                        </tr>
                    </tbody>
                </table>
                <br />
                
                <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999"
                    class="PageList">
                    <tr>
                        <td height="28" background="../../../images/Main/PageList_bg.jpg">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="PageList">
                                <tr>
                                    <td height="28" background="../../../images/Main/PageList_bg.jpg" width="40%">
                                        <div id="PageCount">
                                        </div>
                                    </td>
                                    <td height="28" align="right">
                                        <div id="pageDataList1_Pager" class="jPagerBar">
                                        </div>
                                    </td>
                                    <td height="28" align="right">
                                        <div id="divpage">
                                            <input name="text" type="text" id="Text2" style="display: none" />
                                            <span id="pageDataList1_Total" style="display: none"></span>ÿҳ��ʾ
                                            <input name="text" type="text" id="ShowPageCount" />
                                            �� ת����
                                            <input name="text" type="text" id="ToPage" />
                                            ҳ
                                            <img src="../../../images/Button/Main_btn_GO.jpg" style='cursor: pointer;' alt="go"
                                                width="36" height="28" align="absmiddle" onclick="ChangePageCountIndex($('#ShowPageCount').val(),$('#ToPage').val());" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <br />
            </td>
        </tr>
    </table>
    </form>
    
</body>
</html>
