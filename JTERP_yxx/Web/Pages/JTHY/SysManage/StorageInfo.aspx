<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StorageInfo.aspx.cs" Inherits="Pages_Office_StorageManager_StorageInfo" %>

<%@ Register Src="../../../UserControl/Message.ascx" TagName="Message" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link rel="stylesheet" type="text/css" href="../../../css/default.css" />

    <script src="../../../js/JQuery/jquery_last.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript" src="../../../js/common/PageBar-1.1.1.js"></script>

    <link href="../../../css/pagecss.css" type="text/css" rel="Stylesheet" />

    <script src="../../../js/common/check.js" type="text/javascript"></script>

    <script src="../../../js/common/common.js" type="text/javascript"></script>

    <script src="../../../js/common/page.js" type="text/javascript"></script>

    <script src="../../../js/office/StorageManager/StorageInfo.js" type="text/javascript"></script>
 <script type="text/javascript"> 
//����س��¼� Ǯ��� 2010-11-04
function document.onkeydown() 
{ 
    
    if(event.keyCode == 13)
    {
       DoSearch();
        event.returnValue = false;
    } 
}
</script>
    <title>�ֿ��б���Ϣ</title>
</head>
<body>
    <form id="form1" runat="server">
    <table width="95%" height="57" border="0" cellpadding="0" cellspacing="0" class="checktable"
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
                                    <td width="10%" height="20" class="td_list_fields" align="right">
                                        �ֿ���
                                    </td>
                                    <td width="20%" bgcolor="#FFFFFF">
                                        <input name="txtStorageNo" id="txtStorageNo" specialworkcheck="�ֿ���" runat="server"
                                            type="text" class="tdinput" size="13" style="width: 95%" />
                                    </td>
                                    <td class="td_list_fields" align="right" width="10%">
                                        �ֿ�����
                                    </td>
                                    <td width="25%" bgcolor="#FFFFFF">
                                        <input name="txtStorageName" id="txtStorageName" specialworkcheck="�ֿ�����" runat="server"
                                            type="text" class="tdinput" size="19" style="width: 95%" />
                                    </td>
                                    <td width="10%" height="20" class="td_list_fields" align="right">
                                        �ֿ�����
                                    </td>
                                    <td width="25%" bgcolor="#FFFFFF">
                                        <select id="sltType" name="sltType" class="tddropdlist" runat="server">
                                            <option value="">--��ѡ��--</option>
                                            <option value="0">һ���</option>
                                            <option value="1">ί�д�����</option>
                                            <option value="2">������Ʒ��</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="table-item">
                                    <td class="td_list_fields" align="right" width="10%">
                                        ʹ��״̬
                                    </td>
                                    <td width="25%" bgcolor="#FFFFFF">
                                        <select id="sltUsedStatus"  class="tddropdlist" name="sltUsedStatus" runat="server">
                                            <option value="">--��ѡ��--</option>
                                            <option value="1">����</option>
                                            <option value="0">ͣ��</option>
                                        </select>
                                    </td>
                                    <td  class="td_list_fields" align="right">
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                    </td>
                                    <td  class="td_list_fields" align="right">
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" align="center" bgcolor="#FFFFFF">
                                        <input type="hidden" id="txtorderBy" runat="server" />
                                        <input type="hidden" id="hidModuleID" runat="server" />
                                        <input type="hidden" id="hidSearchCondition" runat="server" />
                                        <img alt="����" src="../../../images/Button/Bottom_btn_search.jpg" id="btn_Search"
                                            runat="server" style='cursor: hand;' onclick='DoSearch()' visible="false" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="95%" height="57" border="0" cellpadding="0" cellspacing="0" class="maintable"
        id="mainindex">
        <tr>
            <td valign="top">
                <img src="../../../images/Main/Line.jpg" width="122" height="7" />
            </td>
            <td align="center" valign="top">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td height="30" colspan="2" align="center" valign="top" class="Title">
                �ֿ��б�
            </td>
        </tr>
        <tr>
            <td height="35" colspan="2" valign="top">
                <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999">
                    <tr>
                        <td height="28" bgcolor="#FFFFFF">
                            <img src="../../../images/Button/Bottom_btn_new.png" id="btn_Add" runat="server"
                                alt="�½�" style='cursor: hand;' onclick="DoNew();" visible="false" />
                            <img src="../../../images/Button/Main_btn_delete.png" id="btn_del" runat="server"
                                alt="ɾ��" style='cursor: hand;' onclick="DelStorage()" visible="false" />
                            <%--<img id="btnImport" runat="server" src="../../../images/Button/Main_btn_out.jpg"
                                alt="����Excel" onclick="btnImport_onclick()" />--%>
                            <asp:ImageButton ID="btnImport" runat="server"  ImageUrl="../../../images/Button/Main_btn_out.jpg"
                                alt="����Excel" OnClick="btnImport_Click" style="display:none;" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" id="pageDataList1"
                    bgcolor="#999999">
                    <tbody>
                        <tr>
                            <th height="20" align="center" background="../../../images/Main/Table_bg.jpg" bgcolor="#FFFFFF"
                                width="10%">
                                <input type="checkbox" name="checkall" id="checkall" onclick="SelectAllCk()" value="checkbox" />
                            </th>
                            <th align="center" class="td_list_fields" width="15%">
                                <div class="orderClick" onclick="OrderBy('StorageNo','oGroup');return false;">
                                    �ֿ���<span id="oGroup" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_list_fields" width="20%">
                                <div class="orderClick" onclick="OrderBy('StorageName','oC1');return false;">
                                    �ֿ�����<span id="oC1" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_list_fields" width="15%">
                                <div class="orderClick" onclick="OrderBy('StorageType','Span2');return false;">
                                    �ֿ�����<span id="Span2" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_list_fields"  width="9%">
                                <div class="orderClick" onclick="OrderBy('UsedStatus','Span3');return false;">
                                    �ֿ�״̬<span id="Span3" class="orderTip"></span></div>
                            </th>
                                 <th align="center" class="td_list_fields" width="15%">
                                <div class="orderClick" onclick="OrderBy('CanViewUserName','0C100');return false;">
                                    �ֹ�Ա<span id="0C100" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_list_fields" width="15%">
                                <div class="orderClick" onclick="OrderBy('Remark','oC2');return false;">
                                    �ֿ�˵��<span id="oC2" class="orderTip"></span></div>
                            </th>
                        </tr>
                    </tbody>
                </table>
                <br />
                <div style="overflow-y: auto;">
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999"
                        class="PageList">
                        <tr>
                            <td height="28" background="../../../images/Main/PageList_bg.jpg">
                                <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="PageList">
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
                                                <input name="text" type="text" id="ShowPageCount" />
                                                �� ת����
                                                <input name="text" type="text" id="ToPage" />
                                                ҳ
                                                <img src="../../../images/Button/Main_btn_GO.jpg" style='cursor: hand;' alt="go"
                                                    width="36" height="28" align="absmiddle" onclick="ChangePageCountIndex($('#ShowPageCount').val(),$('#ToPage').val());" />
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
            </td>
        </tr>
    </table>
    <uc1:Message ID="Message1" runat="server" />
    <a name="pageDataList1Mark"></a><span id="Forms" class="Spantype"></span>
    </form>
</body>
</html>
