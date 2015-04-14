<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ware_List.aspx.cs" Inherits="Pages_JTHY_SysManage_Ware_List" %>



<%@ Register Src="../../../UserControl/CustClassDrpControl.ascx" TagName="CustClassDrpControl"
    TagPrefix="uc1" %>
<%@ Register Src="../../../UserControl/Message.ascx" TagName="Message" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link rel="stylesheet" type="text/css" href="../../../css/default.css" />

    <script src="../../../js/JQuery/jquery_last.js" type="text/javascript"></script>

    <script src="../../../js/Calendar/WdatePicker.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript" src="../../../js/common/PageBar-1.1.1.js"></script>

    <link href="../../../css/pagecss.css" type="text/css" rel="Stylesheet" />

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

    <title>�ֿ���Ϣ�б�</title>
</head>
<body>
    <form id="form1" runat="server">
    <table width="98%" border="0" cellpadding="0" cellspacing="0" 
        id="mainindex">
        <tr>
            <td valign="top">
                <img src="../../../images/Main/Line.jpg" width="122" height="7" />
            </td>
            <td rowspan="2" align="right" valign="top">
                <div id='searchClick'>
                    <img src="../../../images/Main/Close.jpg" style="cursor: pointer" onclick="oprItem('searchtable','searchClick')" /></div>
                &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" class="Blue">
                <img src="../../../images/Main/Arrow.jpg" width="21" height="18" align="absmiddle" />��������
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="99%" border="0" align="center" cellpadding="0" id="searchtable" cellspacing="0"
                    bgcolor="#CCCCCC">
                    <tr>
                        <td bgcolor="#FFFFFF">
                            <table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC"
                                class="table">
                                <tr class="table-item">
                                    <td width="8%" height="20" align="right" class="td_list_fields">
                                        �ֿ���
                                    </td>
                                    <td width="12%" bgcolor="#FFFFFF">
                                        <input name="txtWHNo" id="txtWHNo" class="tdinput" type="text" specialworkcheck="�ֿ���"
                                            style="width: 95%;" runat="server" />
                                    </td>
                                    <td width="8%" align="right" class="td_list_fields">
                                        �ֿ�����
                                    </td>
                                    <td width="12%" bgcolor="#FFFFFF">
                                        <input name="txtWHName" id="txtWHName" class="tdinput" specialworkcheck="�ֿ�����"
                                            type="text" style="width: 95%;" runat="server" />
                                    </td>
                                    <td width="8%" align="right" class="td_list_fields">
                                        ������
                                    </td>
                                    <td width="12%" bgcolor="#FFFFFF">
                                        <input name="txtWHMan" id="txtWHMan" class="tdinput" specialworkcheck="������"
                                            type="text" style="width: 95%;" runat="server" />
                                    </td>
                                   
                                </tr>

                                <tr>
                                    <td colspan="6" align="center" style=" height:22px" bgcolor="#FFFFFF">
                                        <img id="btn_search" alt="����" src="../../../images/Button/Bottom_btn_search.jpg"
                                            runat="server" style="cursor: hand;" />
                                    </td>
                                </tr>
                                
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    
    <tr>
    <td  colspan="6">
    <table width="100%" height="57" border="0" cellpadding="0" cellspacing="0" class="maintable"
        id="mainindex1" border="10" >
        
        <tr>
            <td>
                <table width="99%" align="center" cellpadding="0" cellspacing="0" style="margin-top:5px">
                    <tr>
                        <td  colspan="2" style="line-height:25px; height:25px; font-size:16px" align="center" valign="top" class="td_list_title">
                            �ֿ⵵���б�
                        </td>
                    </tr>
                    <tr>
            <td height="35" colspan="2" valign="top">
                <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999">
                    <tr>
                        <td height="28" bgcolor="#FFFFFF">
                            <img id="btn_create" src="../../../images/Button/Bottom_btn_new.png" visible="false"
                                runat="server" alt="�½�" style='cursor: hand;' onclick="CreateCust()" />
                            <img id="btn_del" src="../../../Images/Button/Main_btn_delete.png" alt="ɾ��" style='cursor: hand;'
                                visible="false" runat="server" onclick="DelCustInfo()" />
                            <asp:ImageButton ID="btnImport" runat="server" ImageUrl="~/Images/Button/Main_btn_out.jpg"
                                 />
                                <!--<a href="demo2.aspx">demo2</a>-->
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
                </table>
            </td>
        </tr>
        <%--<tr>
            <td  colspan="2" valign="top">
                <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FFF">
                    <tr>
                        <td >
                            <img id="btn_create" src="../../../images/Button/Bottom_btn_new.png" visible="false"
                                runat="server" alt="�½�" style='cursor: hand;' onclick="CreateCust()" />
                            <img id="btn_del" src="../../../Images/Button/Main_btn_delete.png" alt="ɾ��" style='cursor: hand;'
                                visible="false" runat="server" onclick="DelCustInfo()" />
                            <asp:ImageButton ID="btnImport" runat="server" ImageUrl="~/Images/Button/Main_btn_out.jpg"
                                OnClick="btnImport_Click" />
                                
                        </td>
                    </tr>
                </table>
            </td>
        </tr>--%>
        <tr>
            <td colspan="2">
                <table width="99%" border="1" align="center" cellpadding="0" cellspacing="0" id="pageDataList1"
                    bgcolor="#999999">
                    <tbody>
                        <tr>
                            <th height="20" align="center" class="td_list_fields">
                                ѡ��<input type="checkbox" visible="false" name="checkall" id="checkall" onclick="AllSelect('checkall','Checkbox1');"
                                    value="checkbox" />
                            </th>
                            <th align="center" class="td_list_fields">
                                <div class="orderClick" onclick="OrderBy('CustNo','oCustNo');return false;">
                                    �ֿ���<span id="oCustNo" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_list_fields">
                                <div class="orderClick" onclick="OrderBy('CustName','oCustName');return false;">
                                    �ֿ�����<span id="oCustName" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_list_fields">
                                <div class="orderClick" onclick="OrderBy('CustBig','oCustBig');return false;" >
                                    ��������<span id="oCustBig" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_list_fields" width="80">
                                <div class="orderClick" onclick="OrderBy('ReceiveAddress','oCustAdd');return false;">
                                    �ֿ��ַ<span id="oCustAdd" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_list_fields" >
                                <div class="orderClick" onclick="OrderBy('CustShort','oCustShort');return false;">
                                    �绰<span id="oCustShort" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_list_fields">
                                <div class="orderClick" onclick="OrderBy('CodeName','oCodeName');return false;">
                                    ������<span id="oCodeName" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_list_fields">
                                <div class="orderClick" onclick="OrderBy('TypeName','oTypeName');return false;">
                                    �Ƽ۷�ʽ<span id="oTypeName" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_list_fields" style="width:15%">
                                <div class="orderClick" onclick="OrderBy('Area','oArea');return false;">
                                    ��ע<span id="oArea" class="orderTip"></span></div>
                            </th>

                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
    <br />
    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#999999"
        class="PageList">
        <tr>
            <td height="28" background="../../../images/Main/PageList_bg.jpg">
                <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="PageList">
                    <tr>
                        <td height="28" style="background-image:'../../../images/Main/PageList_bg.jpg'; width:40%" >
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
                                    align="middle" onclick="ChangePageCountIndex($('#ShowPageCount').val(),$('#ToPage').val());" />
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
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
