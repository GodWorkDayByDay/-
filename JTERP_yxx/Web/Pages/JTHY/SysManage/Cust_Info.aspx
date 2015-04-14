<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cust_Info.aspx.cs" Inherits="Pages_Office_CustManager_Cust_Info" %>

<%@ Register Src="../../../UserControl/CustClassDrpControl.ascx" TagName="CustClassDrpControl"
    TagPrefix="uc1" %>
<%@ Register Src="../../../UserControl/Message.ascx" TagName="Message" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link rel="stylesheet" type="text/css" href="../../../css/jt_default.css" />

    <script src="../../../js/JQuery/jquery_last.js" type="text/javascript"></script>

    <script src="../../../js/Calendar/WdatePicker.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript" src="../../../js/common/PageBar-1.1.1.js"></script>

    <link href="../../../css/pagecss.css" type="text/css" rel="Stylesheet" />

    <script src="../../../js/jthy/CustManager/CustInfo.js" type="text/javascript"></script>

    <script src="../../../js/common/check.js" type="text/javascript"></script>

    <script src="../../../js/common/page.js" type="text/javascript"></script>

    <script src="../../../js/common/Common.js" type="text/javascript"></script>

    <script src="../../../js/common/TreeView.js" language="javascript" type="text/javascript"></script>
    <script type="text/javascript"> 
//����س��¼� 
function document.onkeydown() 
{ 
    var button = document.getElementById("btn_search");
    if(event.keyCode == 13)
    {
        button.click();
        event.returnValue = false;
    } 
}
    </script>

    <title>�ͻ���Ϣ�б�</title>
</head>
<body>
    <form id="form1" runat="server">
    <table width="98%"  border="0" cellpadding="0" cellspacing="0" 
        id="mainindex">
        <tr>
            <td  >
                <table width="99%" border="0" align="center" border="0" cellpadding="0" cellspacing="0" >
        
                    <tr class="menutitle1">
                        <td align="left" valign="middle" >
                            &nbsp;&nbsp;��������
                        </td>
                        <td align="right" valign="middle">
                            <div id='searchClick'>
                                <img src="../../../images/Main/Close.jpg" style="cursor: pointer" onclick="oprItem('searchtable','searchClick')" /></div>
                            
                        </td>
                    </tr>
                </table>
            </td>
                        
        </tr>
      
            
    
        <tr>
            <td >
                <table width="99%" border="0" align="center" cellpadding="0" id="searchtable" cellspacing="0"
                    bgcolor="#CCCCCC">
                    <tr>
                        <td bgcolor="#FFFFFF">
                            <table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC"
                                class="table">
                                <tr class="table-item">
                                    <td  class="td_list_fields">
                                        �ͻ����
                                    </td>
                                    <td class="tdColInput">
                                        <input name="txtCustNo" id="txtCustNo" class="tdinput" type="text" specialworkcheck="�ͻ����"
                                            style="width: 95%;" runat="server" />
                                    </td>
                                    <td  class="td_list_fields">
                                        �ͻ�����
                                    </td>
                                    <td class="tdColInput">
                                        <input name="txtCustName" id="txtCustName" class="tdinput" specialworkcheck="�ͻ�����"
                                            type="text" style="width: 95%;" runat="server" />
                                    </td>
                                    <td class="td_list_fields">
                                        �ֹ�ҵ��Ա
                                    </td>
                                    <td class="tdColInput">
                                        <input name="txtManager" id="txtManager" specialworkcheck="�ֹ�ҵ��Ա" class="tdinput"
                                            type="text" style="width: 95%;" runat="server" />
                                    </td>                                    
                                </tr>
                                <tr>
                                    <td colspan="6" align="center" bgcolor="#FFFFFF">
                                        <img id="btn_search" alt="����" src="../../../images/Button/Bottom_btn_search.jpg"
                                            visible="false" runat="server" style='cursor: hand;' onclick='SearchCustData(1)' />
                                    </td>
                                </tr>                           
                            </table>
                        </td>
                    </tr>                    
                    
                </table>
            </td>
        </tr>
    </table>
    <table width="98%" border="0" cellpadding="0" cellspacing="0" 
        id="mainindex">
        <tr>
            <td height="30" colspan="2" align="center" valign="top" class="Title">
                <table width="99%" border="0" border="0" cellpadding="0" cellspacing="0" >
                    <tr class="menutitle1">
                        <td  align="left" valign="middle" >
                            &nbsp;&nbsp;�ͻ������б�
                        </td>
                        <td align="right" valign="middle">
                            <img id="btn_create" src="../../../images/Button/Bottom_btn_new.png" visible="false"
                                runat="server" alt="�½�" style='cursor: hand;' onclick="CreateCust()" />&nbsp;
                            <img id="btn_del" src="../../../Images/Button/Main_btn_delete.png" alt="ɾ��" style='cursor: hand;'
                                visible="false" runat="server" onclick="DelCustInfo()" />&nbsp;
                            <asp:ImageButton ID="btnImport" style="display:none;" runat="server" ImageUrl="~/Images/Button/Main_btn_out.jpg"
                                OnClick="btnImport_Click" />
                                &nbsp;
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
                            <th width="3%" class="td_main_detail">
                                ѡ��<input type="checkbox" visible="false" name="checkall" id="checkall" onclick="AllSelect('checkall','Checkbox1');"
                                    value="checkbox" />
                            </th>
                            <th width="5%" class="td_main_detail">
                                <div class="orderClick" onclick="OrderBy('CustNo','oCustNo');return false;">
                                    �ͻ����<span id="oCustNo" class="orderTip"></span></div>
                            </th>
                            <th width="5%" class="td_main_detail">
                                <div class="orderClick" onclick="OrderBy('CustName','oCustName');return false;">
                                    �ͻ�����<span id="oCustName" class="orderTip"></span></div>
                            </th>                           
                            <th width="5%" class="td_main_detail" width="80">
                                <div class="orderClick" onclick="OrderBy('ReceiveAddress','oCustAdd');return false;">
                                    �ͻ���ַ<span id="oCustAdd" class="orderTip"></span></div>
                            </th>
                            
                            <th width="5%" class="td_main_detail">
                                <div class="orderClick" onclick="OrderBy('Manager','oManager');return false;">
                                    �ֹ�ҵ��Ա<span id="oManager" class="orderTip"></span></div>
                            </th>                          
                           
                            <th width="5%" class="td_main_detail">
                                <div class="orderClick" onclick="OrderBy('Creator','oCreator');return false;">
                                    ������<span id="oCreator" class="orderTip"></span></div>
                            </th>
                            <th width="5%" class="td_main_detail">
                                <div class="orderClick" onclick="OrderBy('CreatedDate','oCreatedDate');return false;">
                                    ��������<span id="oCreatedDate" class="orderTip"></span></div>
                            </th>
                            <th width="5%" class="td_main_detail">
                                <div class="orderClick" onclick="OrderBy('UsedStatus','oUsedStatus');return false;">
                                    ����״̬<span id="oUsedStatus" class="orderTip"></span></div>
                            </th>                          
                        </tr>
                    </tbody>
                </table>
                <br />
                <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999"
                    class="PageList">
                    <tr >
                        <td height="28" background="../../../images/Main/PageList_bg.jpg">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="PageList">
                                <tr>
                                    <td height="28" background="../../../images/Main/PageList_bg.jpg" width="40%">
                                        <div id="pagecount">
                                        </div>
                                    </td>
                                    <td height="28" align="right">
                                        <div id="pageDataList1_Pager" class="jPagerBar">
                                        </div>
                                    </td>
                                    <td height="28" align="right">
                                        <div id="divpage">
                                            <input name="text" type="text" id="Text2" style="display: none" />
                                            <span id="pageDataList1_Total"></span>ÿҳ��ʾ
                                            <input name="text" type="text" id="ShowPageCount" maxlength="4" />
                                            �� ת����
                                            <input name="text" type="text" id="ToPage" />
                                            ҳ
                                            <img src="../../../images/Button/Main_btn_GO.jpg" style='cursor: hand;' alt="go"
                                                align="absmiddle" onclick="ChangePageCountIndex($('#ShowPageCount').val(),$('#ToPage').val());" />
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
    <a name="pageDataList1Mark"></a>
    <uc2:Message ID="Message1" runat="server" />
    <span id="Forms" class="Spantype"></span>
    <input id="hiddExpOrder" type="hidden" runat="server" />
    <input id="hiddCustClass" type="hidden" runat="server" />   
    
    </form>
</body>
</html>
