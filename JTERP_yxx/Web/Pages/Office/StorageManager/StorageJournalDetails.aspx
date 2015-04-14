<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StorageJournalDetails.aspx.cs"
    Inherits="Pages_Office_StorageManager_StorageJournalDetails" EnableEventValidation="false" %>

<%@ Register Src="../../../UserControl/Message.ascx" TagName="Message" TagPrefix="uc1" %>
<%@ Register Src="../../../UserControl/ProductInfoControl.ascx" TagName="ProductInfoControl"
    TagPrefix="uc2" %>
<%@ Register Src="../../../UserControl/ProviderInfo.ascx" TagName="ProviderInfo"
    TagPrefix="uc4" %>
<%@ Register Src="../../../UserControl/GetBillExAttrControl.ascx" TagName="GetBillExAttrControl"
    TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../../css/jt_default.css" type="text/css" rel="stylesheet" />

    <script src="../../../js/JQuery/jquery_last.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript" src="../../../js/common/PageBar-1.1.1.js"></script>

    <link href="../../../css/pagecss.css" type="text/css" rel="Stylesheet" />

    <script src="../../../js/office/StorageManager/StorageJournalDetails.js" type="text/javascript"></script>

    <script src="../../../js/common/check.js" type="text/javascript"></script>

    <script src="../../../js/Calendar/WdatePicker.js" type="text/javascript"></script>

    <script src="../../../js/common/page.js" type="text/javascript"></script>

    <script src="../../../js/common/common.js" type="text/javascript"></script>

    <script src="../../../js/common/UserOrDeptSelect.js" type="text/javascript"></script>

    <script type="text/javascript" language="javascript">
        $(document).ready(function() {


            var requestObj = GetRequest(location.search);
            var Flag = requestObj['Flag'];
            if (typeof (Flag) != "undefined") {

                pageCount = parseInt(requestObj['pageCount']);

                Fun_Search_StorageInfo(requestObj['pageIndex'])
            }
            IsDiplayOther('GetBillExAttrControl1_SelExtValue', 'GetBillExAttrControl1_TxtExtValue');

            var obj = document.getElementById("ddlBatchNo");

            obj.options.length = 1;

            var Storage = "";

            var ProductNo = "";
            //���巴ȷ�϶�������
            var action = "GetBatchNo";
            var postParam = "action=" + action + "&Storage=" + Storage + "&ProductNo=" + ProductNo;
            $.ajax(
        {
            type: "POST",
            url: "../../../Handler/Office/StorageManager/StorageSearchInfo.ashx?" + postParam,
            dataType: 'html', //����json��ʽ����
            cache: false,
            beforeSend: function() {
            },
            error: function() {
            },
            success: function(msg) {
                var msginfo = msg.toString().split(',');
                for (var i = msginfo.length - 1; i >= 0; i--) {
                    if (msginfo[i].toString() != "") {
                        var varItem = new Option(msginfo[i].toString(), msginfo[i].toString());
                        obj.options.add(varItem);
                    }
                }
            }
        });

        });


        function changeUrl() {
            var ret = document.getElementById("ddlShowType").value;
            if (ret == "1") {
                window.location.href = "StorageJournalDetails.aspx?ModuleID=2051903";
            }
            else {
                window.location.href = "StorageJournal.aspx?ModuleID=2051903";
            }
        }

        function BatchNoInfo() {
            document.getElementById("hiddenBatchNo").value = document.getElementById("ddlBatchNo").value;
        }
    </script>
<script type="text/javascript" language="javascript">
    function ClearPkroductInfo() {
        document.getElementById("txtProductNo").value = "";
        document.getElementById("hiddenProductID").value = "";
        closeProductdiv();
    }
</script>
<script type="text/javascript"> 
//����س��¼� Ǯ��� 2010-11-04
function document.onkeydown() 
{ 
    
    if(event.keyCode == 13)
    {
       TurnToPage(1);
        event.returnValue = false;
    } 
}
</script>
    <title>�����ˮ�˲�ѯ</title>
</head>
<body>
    <form id="form1" runat="server">
    <input id="HiddenPoint" type="hidden" runat="server" />
    <table width="99%" height="57" border="0" cellpadding="0" cellspacing="0" class="checktable"
        id="mainindex">
        <%--<tr>
         <td valign="top">
                <img src="../../../images/Main/Line.jpg" width="122" height="7" />
            </td>
            
        </tr>--%>
        <tr  class="menutitle1" >
            <td align="left" valign="middle">
                &nbsp;&nbsp;<%--<img src="../../../images/Main/Arrow.jpg" width="21" height="18" align="absmiddle" />--%>��������
            </td>
            <td align="right" valign="top">
                <div id='searchClick'>
                    <img src="../../../images/Main/Close.jpg" style="cursor: pointer" onclick="oprItem('searchtable1','searchClick')" /></div>
                &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="99%" border="0" align="center" cellpadding="0" id="searchtable1" cellspacing="0"
                    bgcolor="#CCCCCC">
                    <tr>
                        <td bgcolor="#FFFFFF">
                            <table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC">
                                <tr class="table-item">
                                    <td width="10%" height="20" class="td_list_fields" align="right">
                                        �ֿ�
                                    </td>
                                    <td width="20%" bgcolor="#FFFFFF">
                                        <asp:DropDownList ID="ddlStorage"  CssClass="tddropdlist" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                    <td height="20"  class="td_list_fields" align="right" width="10%">
                                        ��Ʒ���
                                    </td>
                                    <td height="20" bgcolor="#FFFFFF" width="25%">
                                        <input name="txtProductNo" id="txtProductNo" type="text" class="tdinput" readonly="readonly"
                                            size="19" onclick="popTechObj.ShowList('a','txtProductNo','hiddenProductID')"
                                            style="width: 95%" runat="server" />
                                        <input type="hidden" id="hiddenProductID" runat="server" />
                                    </td>
                                    <td width="10%"  align="right" class="td_list_fields" id="trNewAttr">
                                        <span id="OtherConditon">��������</span>
                                    </td>
                                    <td width="25%" bgcolor="#FFFFFF">
                                        <uc3:GetBillExAttrControl ID="GetBillExAttrControl1" runat="server" />
                                    </td>
                                </tr>
                                <tr class="table-item">
                                    <td width="10%" height="20" class="td_list_fields" align="right">
                                        ��ʼʱ��
                                    </td>
                                    <td width="20%" bgcolor="#FFFFFF">
                                        <asp:TextBox ID="txtStartDate" runat="server" class="tdinput" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',el:$dp.$('txtbuydate')})"
                                            ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="td_list_fields" align="right" width="10%">
                                        ����ʱ��
                                    </td>
                                    <td width="25%" bgcolor="#FFFFFF">
                                        <asp:TextBox ID="txtEndDate" runat="server" class="tdinput" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',el:$dp.$('txtbuydate')})"
                                            ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="td_list_fields" align="right" width="10%">
                                        ������
                                    </td>
                                    <td width="25%" bgcolor="#FFFFFF">
                                        <asp:TextBox ID="UserCreator" MaxLength="50" onclick="alertdiv('UserCreator,txtCreatorID');"
                                            ReadOnly="true" runat="server" CssClass="tdinput" Width="95%"></asp:TextBox>
                                        <input type="hidden" id="txtCreatorID" runat="server" />
                                    </td>
                                </tr>
                                <tr class="table-item">
                                    <td class="td_list_fields" align="right" width="10%">
                                        ��������
                                    </td>
                                    <td width="25%" bgcolor="#FFFFFF">
                                        <asp:DropDownList ID="ddlSourceType" CssClass="tddropdlist" runat="server">
                                            <asp:ListItem Value="0">--��ѡ��--</asp:ListItem>
                                            <asp:ListItem Value="1">�ڳ����¼��</asp:ListItem>
                                            <asp:ListItem Value="2">�ڳ������������</asp:ListItem>
                                            <asp:ListItem Value="3">�ɹ���ⵥ</asp:ListItem>
                                            <asp:ListItem Value="4">�����깤��ⵥ</asp:ListItem>
                                            <asp:ListItem Value="5">������ⵥ</asp:ListItem>
                                            <asp:ListItem Value="6">�����ⵥ</asp:ListItem>
                                            <asp:ListItem Value="7">���۳��ⵥ</asp:ListItem>
                                            <asp:ListItem Value="8">�������ⵥ</asp:ListItem>
                                            <asp:ListItem Value="9">�����ⵥ</asp:ListItem>
                                            <asp:ListItem Value="10">������뵥</asp:ListItem>
                                            <asp:ListItem Value="11">���������</asp:ListItem>
                                            <asp:ListItem Value="12">��������</asp:ListItem>
                                            <asp:ListItem Value="13">�������</asp:ListItem>
                                            <asp:ListItem Value="14">�ճ�������</asp:ListItem>
                                            <asp:ListItem Value="15">��ĩ�̵㵥</asp:ListItem>
                                            <asp:ListItem Value="16">��汨��</asp:ListItem>
                                            <asp:ListItem Value="17">���ϵ�</asp:ListItem>
                                            <asp:ListItem Value="18">���ϵ�</asp:ListItem>
                                            <asp:ListItem Value="19">���͵�</asp:ListItem>
                                            <asp:ListItem Value="20">�����˻���</asp:ListItem>
                                            <asp:ListItem Value="21">�ŵ����۹���</asp:ListItem>
                                            <asp:ListItem Value="22">�ŵ������˻�</asp:ListItem>
                                            <asp:ListItem Value="23">��װ��ⵥ</asp:ListItem>
                                            <asp:ListItem Value="24">��װ���ⵥ</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="td_list_fields" align="right" width="10%">
                                        ���ݱ��
                                    </td>
                                    <td width="25%" bgcolor="#FFFFFF">
                                        <asp:TextBox ID="txtSourceNo" runat="server" class="tdinput" specialworkcheck="���ݱ��" ></asp:TextBox>
                                        <asp:CheckBox ID="ckbIsM" runat="server" Text="ģ��ƥ��" />
                                    </td>
                                    
                                    <td class="td_list_fields" align="right" width="10%">
                                        &nbsp;��ʾ���
                                    </td>
                                    <td width="25%" bgcolor="#FFFFFF">
                                        <asp:DropDownList ID="ddlShowType" runat="server" CssClass="tddropdlist" onchange="changeUrl();">
                                            <asp:ListItem Value="1">��ϸ</asp:ListItem>
                                            <asp:ListItem Value="2">����</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                
                                
                                <div style="display:none;">
                                    <tr class="table-item">
                                    <td width="10%" height="20" class="td_list_fields" align="right">
                                        ����ͺ�
                                    </td>
                                    <td width="20%" bgcolor="#FFFFFF">
                                        <input id="txt_Specification" disabled="disabled" runat="server" class="tdinput" specialworkcheck="����ͺ�" 
                                            type="text" />
                                    </td>
                                    <td class="td_list_fields" align="right" width="10%">
                                        ��ɫ
                                    </td>
                                    <td width="25%" bgcolor="#FFFFFF">
                                        <asp:DropDownList ID="sel_ColorID" runat="server" disabled="disabled"  CssClass="tddropdlist">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="td_list_fields" align="right" width="10%">
                                        ����
                                    </td>
                                    <td width="25%" bgcolor="#FFFFFF">
                                        <asp:DropDownList ID="sel_Material"  disabled="disabled" runat="server"  CssClass="tddropdlist">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr class="table-item">
                                    <td width="10%" height="20" class="td_list_fields" align="right">
                                        ����
                                    </td>
                                    <td width="20%" bgcolor="#FFFFFF">
                                        <asp:TextBox ID="txt_Manufacturer"  disabled="disabled" specialworkcheck="����" runat="server" CssClass="tdinput"
                                            Width="63%"></asp:TextBox>
                                    </td>
                                    <td class="td_list_fields" align="right" width="10%">
                                        �ߴ�
                                    </td>
                                    <td width="25%" bgcolor="#FFFFFF">
                                        <input type="text" id="txt_Size"  disabled="disabled" specialworkcheck="�ߴ�" name="txt_Size" class="tdinput"
                                            runat="server" style="width: 90%" />
                                    </td>
                                    <td class="td_list_fields" align="right" width="10%">
                                        ����
                                    </td>
                                    <td width="25%" bgcolor="#FFFFFF">
                                        <asp:TextBox ID="txt_FromAddr"   disabled="disabled" specialworkcheck="����" runat="server" CssClass="tdinput"
                                            Width="178px" Height="21px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr class="table-item">
                                    <td width="10%" height="20" class="td_list_fields" align="right">
                                        ����
                                    </td>
                                    <td width="20%" bgcolor="#FFFFFF">
                                        <input id="txt_BarCode"  disabled="disabled" specialworkcheck="����" cols="20" maxlength="50" name="S1"
                                            class="tdinput" runat="server" style="width: 90%" />
                                    </td>
                                    <td width="10%" height="20" class="td_list_fields" align="right">
                                        ����
                                    </td>
                                    <td width="20%" bgcolor="#FFFFFF">
                                        <asp:DropDownList ID="ddlBatchNo"  disabled="disabled" runat="server" CssClass="tddropdlist" onpropertychange="BatchNoInfo()">
                                            <asp:ListItem Value="0">--��ѡ��--</asp:ListItem>
                                        </asp:DropDownList>
                                        <input type="hidden" id="hiddenBatchNo" runat="server"  value="0"/>
                                    </td>
                                    
                                    <td class="td_list_fields" align="right" width="10%">
                                        &nbsp;
                                    </td>
                                    <td width="25%" bgcolor="#FFFFFF">
                                        &nbsp;
                                    </td>
                                    
                                </tr>
                                </div>
                                
                                
                                <tr class="table-item">
                                    <td colspan="6" align="center" bgcolor="#FFFFFF">
                                        <input type="hidden" id="txtorderBy" runat="server" />
                                        <input type="hidden" id="hidSearchCondition" />
                                        <input type="hidden" id="hidModuleID" runat="server" />
                                        <img alt="����" src="../../../images/Button/Bottom_btn_search.jpg" style='cursor: hand;'
                                            id="btn_Search" runat="server" onclick='TurnToPage(1);' />
                                        
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="99%" height="57" border="0" cellpadding="0" cellspacing="0" class="maintable"
        id="mainindex">
        <%--<tr>
            <td valign="top">
                <img src="../../../images/Main/Line.jpg" width="122" height="7" />
            </td>
            <td align="center" valign="top">
                &nbsp;
            </td>
        </tr>--%>
        <%--<tr>
            
        </tr>--%>
        <tr class="menutitle1">
            <td align="left" valign="middle" class="Title">
                &nbsp;&nbsp;�����ˮ��
            </td>
            
           <td   valign="middle" align="right">
            <asp:ImageButton ID="btnImport" runat="server" ImageUrl="../../../images/Button/Main_btn_out.jpg"
                                alt="����Excel" Visible="true" OnClick="btnImport_Click" />&nbsp;&nbsp;
                 <%--<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999">
                    <tr>
                        <td height="28" bgcolor="#FFFFFF">
                            
                        </td>
                    </tr>
                </table>--%>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" id="pageDataList1"
                    bgcolor="#999999">
                    <tbody>
                        <tr class="table-item">
                            <th align="center" class="td_main_detail" height="20">
                                <div class="orderClick" onclick="OrderBy('BillNo','Span9');return false;">
                                    ���ݱ��<span id="Span9" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_main_detail" >
                                <div class="orderClick" onclick="OrderBy('typeflag','Span7');return false;">
                                    ��������<span id="Span7" class="orderTip"></span></div>
                            </th>
                            <%--<th align="center" class="td_main_detail" height="20">
                                <div class="orderClick" onclick="OrderBy('StorageNo','Span4');return false;">
                                    �ֿ���<span id="Span4" class="orderTip"></span></div>
                            </th>--%>
                            <th align="center" class="td_main_detail" >
                                <div class="orderClick" onclick="OrderBy('StorageName','oc1');return false;">
                                    �ֿ�����<span id="oc1" class="orderTip"></span></div>
                            </th>
                            <%--<th align="center" class="td_main_detail" >
                                <div class="orderClick">
                                    ����<span id="Span8" class="orderTip"></span></div>
                            </th>--%>
                            <th align="center" class="td_main_detail" >
                                <div class="orderClick" onclick="OrderBy('ProdNo','Span1');return false;">
                                    ��Ʒ���<span id="Span1" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_main_detail" >
                                <div class="orderClick" onclick="OrderBy('ProductName','oc4');return false;">
                                    ��Ʒ����<span id="oc4" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_main_detail" >
                                <div class="orderClick">
                                    ��λ<span id="Span13" class="orderTip"></span></div>
                            </th>
                            <%--<th align="center" class="td_main_detail" >
                                <div class="orderClick" onclick="OrderBy('Specification','Span3');return false;">
                                    ����ͺ�<span id="Span3" class="orderTip"></span></div>
                            </th>--%>
                            
                              <%--<th align="center" class="td_main_detail" >
                                <div class="orderClick" onclick="OrderBy('ColorName','Span14');return false;">
                                    ��ɫ<span id="Span14" class="orderTip"></span></div>
                            </th>
                            
                            <th align="center" class="td_main_detail" >
                                <div class="orderClick" onclick="OrderBy('ProductSize','oc5');return false;">
                                    �ߴ�<span id="oc5" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_main_detail" >
                                <div class="orderClick" onclick="OrderBy('FromAddr','Span2');return false;">
                                    ����<span id="Span2" class="orderTip"></span></div>
                            </th>--%>
                            <th align="center" class="td_main_detail" >
                                <div class="orderClick" onclick="OrderBy('EnterDate','Span6');return false;">
                                    �����ʱ��<span id="Span6" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_main_detail" >
                                <div class="orderClick" onclick="OrderBy('ProductCount','Span5');return false;">
                                    ���������<span id="Span5" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_main_detail" id="NowStorage">
                                <div class="orderClick" onclick="OrderBy('NowProductCount','Span7');return false;">
                                    �����<span id="Span10" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_main_detail" id="Th1">
                                <div class="orderClick" onclick="OrderBy('CreatorName','Span11');return false;">
                                    ������<span id="Span11" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_main_detail" id="Th2">
                                <div class="orderClick" onclick="OrderBy('NowProductCount','Span12');return false;">
                                    ��ע<span id="Span12" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_main_detail" id="thHole" style="display: none">
                                <div id="divClick" class="orderClick" onclick="">
                                    <span id="newItem"></span><span id="Span15" class="orderTip"></span>
                                </div>
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
    <uc2:ProductInfoControl ID="ProductInfoControl1" runat="server" />
    <a name="pageDataList1Mark"></a><span id="Forms" class="Spantype"></span>
    <asp:HiddenField ID="hiddenEFIndex" runat="server" />
    <asp:HiddenField ID="hiddenEFIndexName" runat="server" />
    <asp:HiddenField ID="hiddenEFDesc" runat="server" />
    </form>
</body>
</html>
