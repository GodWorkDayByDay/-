<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProviderLinkManInfo.aspx.cs" Inherits="Pages_Office_PurchaseManager_ProviderLinkManInfo" %>

<%@ Register src="../../../UserControl/Message.ascx" tagname="Message" tagprefix="uc1" %>

<%@ Register src="../../../UserControl/ProviderInfo.ascx" tagname="ProviderInfo" tagprefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link rel="stylesheet" type="text/css" href="../../../css/default.css" />
     <script src="../../../js/JQuery/jquery_last.js" type="text/javascript"></script>
    <script src="../../../js/common/Check.js" type="text/javascript"></script>
    
    <script src="../../../js/common/Common.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript" src="../../../js/common/PageBar-1.1.1.js"></script>

    <link href="../../../css/pagecss.css" type="text/css" rel="Stylesheet" />

    <script src="../../../js/office/PurchaseManager/ProviderLinkManInfo.js" type="text/javascript"></script>

    <script src="../../../js/common/page.js" type="text/javascript"></script>
    
    <script src="../../../js/Calendar/WdatePicker.js" type="text/javascript"></script>
   <script type="text/javascript"> 
//����س��¼� Ǯ��� 2010-11-04
function document.onkeydown() 
{ 
    
    if(event.keyCode == 13)
    {
       SearchProviderLinkManData();
        event.returnValue = false;
    } 
}
</script>
    <title>��Ӧ����ϵ���б�</title>
</head>
<body>
    <form id="form1" runat="server">
    <!-- ���۶���-->
    <!-- ���۶���-->
    <uc1:Message  ID="Message1" runat="server" />
    <uc2:ProviderInfo ID="ProviderInfo1" runat="server" />
    <table width="98%" height="57" border="0" cellpadding="0" cellspacing="0" class="checktable"
        id="mainindex">
        <tr>
            <td valign="top">
                <img src="../../../images/Main/Line.jpg" width="122" height="7" />
                </td>
            <td rowspan="2" align="right" valign="top">
                <div id='searchClick1'>
                    <img src="../../../images/Main/Close.jpg" style="cursor: pointer" onclick="oprItem('tbse','searchClick1')" /></div>
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
                            <table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC" id="tbse"
                                class="table">
                                <tr class="table-item">
                                    <td height="10"  align="right" class="td_list_fields" width="10%">
                                        ��Ӧ������</td>
                                    <td bgcolor="#FFFFFF" width="23%">
                                        <asp:TextBox ID="txtCustName" MaxLength="25" onclick ="popProviderObj.ShowProviderList('txtCustName','txtCustName','txtCustNo')" ReadOnly="true" runat="server" CssClass="tdinput" Width="95%"></asp:TextBox>
                                        <input type="hidden" id="txtCustNo" runat="server" />
                                    </td>
                                   <td class="td_list_fields" align="right" width="10%">
                                        ��ϵ������
                                    </td>
                                    <td bgcolor="#FFFFFF" width="23%">
                                        <asp:TextBox ID="txtLinkManName" MaxLength="10" runat="server" CssClass="tdinput" Width="95%"  SpecialWorkCheck="��ϵ������" ></asp:TextBox>
                                    </td>
                                    <td width="10%"  align="right" class="td_list_fields" width="10%">
                                        �ֻ�
                                    </td>
                                    <td bgcolor="#FFFFFF" width="24%">
                                        <asp:TextBox ID="txtHandset" MaxLength="10" runat="server" CssClass="tdinput" Width="95%"  SpecialWorkCheck="�ֻ�"  ></asp:TextBox>
                                    </td>
                                </tr>
                                <tr class="table-item">
                                    <td height="10"  align="right" class="td_list_fields" width="10%">
                                        ��Ҫ�̶�
                                    </td>
                                    <td bgcolor="#FFFFFF" width="23%">
                                        <select name="drpImportant" class="tddropdlist" id="drpImportant"  runat="server" >
                                        <option value="0" selected="selected">--��ѡ��--</option>
                                        <option value="1">����Ҫ</option><option value="2">��ͨ</option>
                                        <option value="3">��Ҫ</option><option value="4">�ؼ�</option></select>
                                    </td>
                                   <td class="td_list_fields" align="right" width="10%">
                                        ��ϵ������
                                    </td>
                                    <td bgcolor="#FFFFFF" width="23%">
                                        <select name="drpLinkType" class="tddropdlist" width="119px" runat="server" id="drpLinkType"></select>
                                        <input type="hidden" id="Hidden1" runat="server" />
                                    </td>
                                    <td width="10%"  align="right" class="td_list_fields" width="10%">
                                        ����
                                    </td>
                                    <td bgcolor="#FFFFFF" width="24%">
                                        <asp:TextBox ID="txtStartBirthday" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',el:$dp.$('txtStartBirthday')})" ReadOnly="true" CssClass="tdinput" Width="35%"></asp:TextBox>
                                        <asp:TextBox ID="txtZhi" Text="��" ReadOnly="true" runat="server"  CssClass="tdinput" Width="10%"></asp:TextBox><asp:TextBox ID="txtEndBirthday" runat="server" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',el:$dp.$('txtEndBirthday')})" ReadOnly="true" CssClass="tdinput" Width="35%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="8" align="center" bgcolor="#FFFFFF">
                                    <input type="hidden" id="hidModuleID" runat="server" />
                                    <input type="hidden" id="hidSearchCondition" name="hidSearchCondition" />
                                        <img id="btnQuery" alt="����" src="../../../images/Button/Bottom_btn_search.jpg" style='cursor: hand;'
                                            onclick='SearchProviderLinkManData()' visible="false" runat="server"/>
                                        <%--<img id="btnClear" alt="����" src="../../../images/Button/Bottom_btn_re.jpg" style='cursor: hand;'
                                            onclick="Fun_ClearInput()" width="52" height="23" />--%>
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
            <td valign="top">
                <img src="../../../images/Main/Line.jpg" width="122" height="7" />
            </td>
            <td align="center" valign="top">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td height="30" colspan="2" align="center" valign="top" class="Title">
                ��Ӧ����ϵ���б�
            </td>
        </tr>
        <tr>
            <td height="35" colspan="2" valign="top">
                <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999">
                    <tr>
                        <td height="28" bgcolor="#FFFFFF">
                            <%--<a href="MasterProductSchedule_Add.aspx">--%>
                                <%--<img id="btnAdd" src="../../../images/Button/Bottom_btn_new.png" alt="����������ƻ���" style='cursor: hand;'
                                    width="51" height="25" border="0" /></a><img id="btnDel" src="../../../images/Button/Main_btn_delete.png"
                                        alt="ɾ���������ƻ���" style='cursor: hand;' border="0" onclick="Fun_Delete_MasterProductSchedule();" />--%>
                            <%--                                        <img src="../../../images/Button/Main_btn_submission.jpg" alt="�ύ����" />
                                        <img src="../../../images/Button/Main_btn_verification.jpg" alt="����" />
                                        <img src="../../../images/Button/Bottom_btn_confirm.jpg" alt="ȷ��" />
                                        <img src="../../../images/Button/Main_btn_Invoice.jpg" alt="�ᵥ" />
                                        <img src="../../../images/Button/Main_btn_qxjd.jpg" alt="ȡ���ᵥ" />--%>
                            <img id="btn_create"  src="../../../images/Button/Bottom_btn_new.png" alt="�½�" style="cursor:hand;" onclick="CreateProviderLinkMan()"  runat="server" visible="false" />
                            <img id="btn_del"  src="../../../Images/Button/Main_btn_delete.png" alt="ɾ��" style="cursor:hand;" onclick="DelProviderLinkMan()"  runat="server" visible="false" />
                            <asp:ImageButton ID="btnImport" ImageUrl="../../../images/Button/Main_btn_out.jpg" AlternateText="����Excel" runat="server" onclick="btnImport_Click" />
                            <%--<img id="btnPrint" src="../../../images/Button/Main_btn_print.jpg" alt="��ӡ" />--%>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" id="tdResult">
                <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" id="pageDataList1"
                    bgcolor="#999999">
                    <tbody>
                        <tr>
                            <th height="20" align="center" class="td_list_fields" >ѡ��<input type="checkbox" visible="false" id="checkall" onclick="SelectAll()" value="checkbox" /></th>
                            <th align="center" class="td_list_fields" ><div class="orderClick" onclick="OrderBy1('LinkManName','oLinkManName');return false;">��ϵ������<span id="oLinkManName" class="orderTip"></span></div></th>
                            <th align="center" class="td_list_fields" ><div class="orderClick" onclick="OrderBy1('CustName','oCustName');return false;">��Ӧ������<span id="oCustName" class="orderTip"></span></div></th>
                            <th align="center" class="td_list_fields" ><div class="orderClick" onclick="OrderBy1('Appellation','oAppellation');return false;">��ν<span id="oAppellation" class="orderTip"></span></div></th>
                            <th align="center" class="td_list_fields" ><div class="orderClick" onclick="OrderBy1('LinkTypeName','oLinkTypeName');return false;">��ϵ������<span id="oLinkTypeName" class="orderTip"></span></div></th>
                            <th align="center" class="td_list_fields" ><div class="orderClick" onclick="OrderBy1('Important','oImportant');return false;">��Ҫ�̶�<span id="oImportant" class="orderTip"></span></div></th>
                            <th align="center" class="td_list_fields" ><div class="orderClick" onclick="OrderBy1('WorkTel','oWorkTel');return false;">�绰<span id="oWorkTel" class="orderTip"></span></div></th>
                            <th align="center" class="td_list_fields" ><div class="orderClick" onclick="OrderBy1('Handset','oHandset');return false;">�ֻ�<span id="oHandset" class="orderTip"></span></div></th>
                            <th align="center" class="td_list_fields" ><div class="orderClick" onclick="OrderBy1('MailAddress','oMailAddress');return false;">�ʼ�<span id="oMailAddress" class="orderTip"></span></div></th>
                            <th align="center" class="td_list_fields" ><div class="orderClick" onclick="OrderBy1('MSN','oMSN');return false;">MSN<span id="oMSN" class="orderTip"></span></div></th>
                            <th align="center" class="td_list_fields" ><div class="orderClick" onclick="OrderBy1('QQ','oQQ');return false;">QQ<span id="oQQ" class="orderTip"></span></div></th>
                            <th align="center" class="td_list_fields" ><div class="orderClick" onclick="OrderBy1('Birthday','oBirthday');return false;">����<span id="oBirthday" class="orderTip"></span></div></th>
                          </tr>
                    </tbody>
                </table>
                <br />
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
                                        <div id="pageDataList1_PagerList" class="jPagerBar">
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
                <br />
            </td>
        </tr>
    </table>
    <a name="pageDataList1Mark"></a><span id="Forms" class="Spantype"></span>
    </form>
</body>
</html>


