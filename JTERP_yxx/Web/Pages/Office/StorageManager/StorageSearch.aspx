<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StorageSearch.aspx.cs" Inherits="Pages_Office_StorageManager_StorageSearch"
    EnableEventValidation="false" %>

<%@ Register Src="../../../UserControl/Message.ascx" TagName="Message" TagPrefix="uc1" %>
<%@ Register Src="../../../UserControl/ProductInfoControl.ascx" TagName="ProductInfoControl"
    TagPrefix="uc2" %>
<%@ Register Src="../../../UserControl/GetBillExAttrControl.ascx" TagName="GetBillExAttrControl"
    TagPrefix="uc6" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../../css/jt_default.css" type="text/css" rel="stylesheet" />

    <script src="../../../js/JQuery/jquery_last.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript" src="../../../js/common/PageBar-1.1.1.js"></script>

    <link href="../../../css/pagecss.css" type="text/css" rel="Stylesheet" />

    <script src="../../../js/office/StorageManager/StorageSearch.js" type="text/javascript"></script>

    <script src="../../../js/common/check.js" type="text/javascript"></script>

    <script src="../../../js/Calendar/WdatePicker.js" type="text/javascript"></script>

    <script src="../../../js/common/page.js" type="text/javascript"></script>

    <script src="../../../js/common/common.js" type="text/javascript"></script>

    <script type="text/javascript">
 
    </script>
<script type="text/javascript"> 
//����س��¼� Ǯ��� 2010-11-04
function document.onkeydown() 
{ 
    
    if(event.keyCode == 13)
    {
        Fun_Search_StorageInfo();
        event.returnValue = false;
    } 
}
</script>
    <script type="text/javascript" language="javascript">
        function ClearPkroductInfo() {
            document.getElementById("txtProductNo").value = "";
            document.getElementById("txtProductName").value = "";
            closeProductdiv();
        }
    </script>

    <title>���п���ѯ</title>
</head>
<body>
    <form id="form1" runat="server">
    <input id="HiddenPoint" type="hidden" runat="server" />
    <input id="IsMoreUnit" type="hidden" runat="server" />
    <table width="99%" height="57" border="0" cellpadding="0" cellspacing="0" class="checktable"
        id="mainindex">
        <%--<tr>
            <td valign="top">
                <img src="../../../images/Main/Line.jpg" width="122" height="7" />
            </td>
            
        </tr>--%>
        <tr class="menutitle1" >
            <td align="left" valign="middle">
                &nbsp;&nbsp;<%--<img src="../../../images/Main/Arrow.jpg" width="21" height="18" align="absmiddle" />--%>��������
            </td>
            <td  align="right" valign="middle">
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
                                    <td width="11%" height="20"  align="right" class="td_list_fields">
                                        �ֿ�
                                    </td>
                                    <td width="22%" bgcolor="#FFFFFF">
                                        <asp:DropDownList ID="ddlStorage"  CssClass="tddropdlist" runat="server" onchange="fnGetPackage()">
                                        </asp:DropDownList>
                                    </td>
                                    <td width="11%" height="20"  class="td_list_fields" align="right">
                                        ��Ʒ���
                                    </td>
                                    <td width="22%" height="20" bgcolor="#FFFFFF">
                                        <input name="txtProductNo" id="txtProductNo" type="text" class="tdinput" readonly="readonly"
                                            size="19" onclick="popTechObj.ShowList('a','txtProductNo')" style="width: 95%"
                                            runat="server" onpropertychange="fnGetPackage()" />
                                    </td>
                                    <td width="11%"  align="right" class="td_list_fields">
                                        ��Ʒ����
                                    </td>
                                    <td width="23%" bgcolor="#FFFFFF">
                                        <input name="txtProductName" id="txtProductName" specialworkcheck="��Ʒ����" type="text"
                                            class="tdinput" size="19" style="width: 95%" runat="server" />
                                    </td>
                                </tr>
                                <!--�޸� -->
                                
                                
                                
                                
                                <tr class="table-item">
                                    <td class="td_list_fields" align="right">
                                        ���������Χ
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                            <tr>
                                                <td style="width: 46%;">
                                                    <input id="txtStorageCount" onchange="Number_round(this,2)" class="tdinput" style="width: 98%;"
                                                        type="text" runat="server" />
                                                    <input type="hidden" id="hiddStorageCount" runat="server" />
                                                </td>
                                                <td style="width: 8%;">
                                                    ��
                                                </td>
                                                <td style="width: 46%;">
                                                    <input id="txtStorageCount1" onchange="Number_round(this,2)" class="tdinput" style="width: 98%;"
                                                        type="text" runat="server" />
                                                    <input type="hidden" id="hiddStorageCount1" runat="server" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td height="20" class="td_list_fields" align="right">
                                        ���״̬
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                         <asp:DropDownList ID="DropDownList2" CssClass="tddropdlist" runat="server">
                                            <asp:ListItem Value="0">����ʾ0���</asp:ListItem>
                                            <asp:ListItem Value="1">��ʾ0���</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td></td><td></td>
                                    <%--<td class="td_list_fields" align="right">
                                      <span id="OtherConditon" style="display: none">��������</span>
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                        <uc6:GetBillExAttrControl ID="GetBillExAttrControl1" runat="server" />
                                    </td>--%>






                                    <%--<td  height="20" align="right" class="td_list_fields">
                                        ��Ʒ����
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                        <input name="txtBarCode" id="txtBarCode" type="text" class="tdinput" size="19" style="width: 95%"
                                            runat="server" />
                                        <input type="hidden" id="HiddenBarCode" runat="server" />
                                    </td>
                                    <td class="td_list_fields" align="right">
                                        ����ͺ�
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                        <input name="txtSpecification" id="txtSpecification" specialworkcheck="����ͺ�" type="text"
                                            class="tdinput" style="width: 95%" runat="server" />
                                    </td>
                                    <td class="td_list_fields" align="right">
                                        ����
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                        <input name="txtManufacturer" id="txtManufacturer" specialworkcheck="����" type="text"
                                            class="tdinput" style="width: 95%" runat="server" />
                                    </td>--%>
                                </tr>
                                <%--<tr class="table-item">
                                    <td  height="20" align="right" class="td_list_fields">
                                        ����
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                        <asp:DropDownList ID="ddlMaterial" CssClass="tddropdlist" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="td_list_fields" align="right">
                                        ����
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                        <input name="txtFromAddr" id="txtFromAddr" specialworkcheck="����" type="text" class="tdinput"
                                            style="width: 95%" runat="server" />
                                    </td>
                                    
                                </tr>
                                <tr class="table-item">
                                    <td class="td_list_fields" align="right">
                                        ����
                                    </td>
                                    
                                    
                                    
                                    <td bgcolor="#FFFFFF">
                                        <asp:DropDownList ID="ddlBatchNo" CssClass="tddropdlist" runat="server">
                                            <asp:ListItem Value="0">--��ѡ��--</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td height="20" class="td_list_fields" align="right">
                                       �ϲ�����
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                        <asp:DropDownList ID="isbatch" CssClass="tddropdlist" runat="server">
                                            <asp:ListItem Value="0">���ϲ�</asp:ListItem>
                                            <asp:ListItem Value="1">�ϲ�</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="td_list_fields" align="right">
                                        ��ɫ
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                        <asp:DropDownList ID="sel_ColorID" runat="server"  CssClass="tddropdlist">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                 <tr  class="table-item">
                                    <td class="td_list_fields" align="right">
                                     ��Ʒ״̬
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                      <asp:DropDownList ID="DropDownList1" CssClass="tddropdlist" runat="server">
                                            <asp:ListItem Value="0">ȫ��</asp:ListItem>
                                            <asp:ListItem Value="1">ִ��</asp:ListItem>
                                            <asp:ListItem Value="2">�Ƶ�</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td height="20" class="td_list_fields" align="right">
                                        ���״̬
                                    </td>
                                    <td bgcolor="#FFFFFF">//ǰ���Ѿ�����
                                         <asp:DropDownList ID="DropDownList2" CssClass="tddropdlist" runat="server">
                                            <asp:ListItem Value="0">����ʾ0���</asp:ListItem>
                                            <asp:ListItem Value="1">��ʾ0���</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    
                                </tr>
                               
                            </table>
                        </td>
                    </tr>--%>
                     <tr>
                                    <td colspan="6" align="center" bgcolor="#FFFFFF">
                                        <input type="hidden" id="txtorderBy" runat="server" />
                                        <input type="hidden" id="hidSearchCondition" />
                                        <img alt="����" src="../../../images/Button/Bottom_btn_search.jpg" style='cursor: hand;'
                                            id="btn_Search" runat="server" onclick='Fun_Search_StorageInfo();' visible="true" />
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
        <tr>
            
        </tr>
        <tr class="menutitle1" >
            <td align="left" valign="middle">
                &nbsp;&nbsp;���п���ѯ�б�
            </td>
            <td height="35"  valign="middle" align="right">
                <asp:ImageButton ID="btnImport" runat="server" ImageUrl="../../../images/Button/Main_btn_out.jpg"
                                alt="����Excel" OnClick="btnImport_Click" />
                            <%--<img id="btnPrint" src="../../../images/Button/Main_btn_print.jpg" alt="��ӡ" />--%>
                          <img alt="��ӡ" id="btnPrint" src="../../../images/Button/Main_btn_print.jpg" style="cursor: pointer"
                                title="��ӡ" onclick="BillPrint();" />
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
                <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" id="pageDataList1"
                    bgcolor="#999999">
                    <tbody>
                        <tr  class="table-item" id="trHtml">
                            <th align="center" class="td_main_detail"  height="20px">
                                <div class="orderClick" onclick="OrderBy('StorageNo','Span4');return false;">
                                    �ֿ���<span id="Span4" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_main_detail" >
                                <div class="orderClick" onclick="OrderBy('StorageName','oc1');return false;">
                                    �ֿ�����<span id="oc1" class="orderTip"></span></div>
                            </th>
                            <%--<th align="center" class="td_main_detail" id="batch" >
                                <div class="orderClick">
                                    ����<span id="Span5" class="orderTip"></span></div>
                            </th>--%>
                            <%--<th align="center" class="td_list_fields" style="display:none" >
                                <div class="orderClick" onclick="OrderBy('DeptName','oc2');return false;">
                                    ��������<span id="oc2" class="orderTip"></span></div>
                            </th>--%>
                            <th align="center" class="td_main_detail" >
                                <div class="orderClick" onclick="OrderBy('ProductNo','Span1');return false;">
                                    ��Ʒ���<span id="Span1" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_main_detail" >
                                <div class="orderClick" onclick="OrderBy('ProductName','oc4');return false;">
                                    ��Ʒ����<span id="oc4" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_main_detail" >
                                <div class="orderClick" onclick="OrderBy('Specification','Span3');return false;">
                                    ���<span id="Span3" class="orderTip"></span></div>
                            </th>
                            <%--<th align="center" class="td_main_detail" >
                                <div class="orderClick" onclick="OrderBy('ColorName','Span14');return false;">
                                    ��ɫ<span id="Span14" class="orderTip"></span></div>
                            </th>--%>
                            <%if (MoreUnit == "True")
                              {%>
                            <th align="center" class="td_main_detail">
                                <div class="orderClick" onclick="OrderBy('UnitID','oc5');return false;">
                                    ������λ<span id="oc5" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_main_detail"  >
                                <div class="orderClick" onclick="OrderBy('ProductCount','Span2');return false;">
                                    ��������<span id="Span2" class="orderTip"></span></div>
                            </th>
                            <%} %>
                            <th align="center" class="td_main_detail" >
                               <div class="orderClick" onclick="OrderBy('UnitID','Span6');return false;">
                                    ��λ<span id="Span6" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_main_detail" >
                               <div class="orderClick" onclick="OrderBy('ProductCount','Span9');return false;">
                                    ����<span id="Span9" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_main_detail" id="thHole" style="display: none;">
                                <div id="divClick" class="orderClick">
                                    <span id="newItem"></span><span id="Span8" class="orderTip"></span>
                                </div>
                            </th>
                             <%--<th align="center" class="td_main_detail" >
                                <div class="orderClick" onclick="OrderBy('MaterialName','Span7');return false;">
                                    ����<span id="Span7" class="orderTip"></span></div>
                                    --%>
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
    <asp:HiddenField ID="hiddenEFIndexName" runat="server" />
    <asp:HiddenField ID="hiddenEFIndex" runat="server" />
    <asp:HiddenField ID="hiddenEFDesc" runat="server" />
    </form>
       <div id="divBillChoose" style="border: solid 10px #93BCDD; background: #fff; padding: 10px;
        width: 700px; height:100px; z-index: 1001; position: absolute; display: none;
        ">
        
        <table width="100%">
            <tr>
                <td>
                    <a onclick="closeBilldiv();" style="text-align: left; cursor: pointer"><img  src="../../../images/Button/Bottom_btn_close.jpg"/></a>
                </td>
            </tr>
        </table>
        <div style="height:100px; width:700px;">
         <table width="97%" border="0" align="center" cellpadding="0" cellspacing="1" id="Table1"
                    bgcolor="#CCCCCC">
                    <tbody>
                        <tr style="height:22px;">
                            <th  align="center" class="td_list_fields" >
                                ֽ��
                            </th>
                            <th align="center" class="td_list_fields" >
                                ��ĥֽ 
                            </th>
                             <th  align="center" class="td_list_fields" >
                                 ƽ��ֽ
                            </th>
                            <th align="center" class="td_list_fields" >
                                ���� 
                            </th>
                             <th  align="center" class="td_list_fields" >
                                 ���湤��
                            </th>
                            <th align="center" class="td_list_fields" >
                                ���׸ְ� 
                            </th>
                             <th  align="center" class="td_list_fields" >
                                 ����
                            </th>
                            <th align="center" class="td_list_fields" >
                                ��װ 
                            </th>
                        </tr>
                    </tbody>
                </table>
      </div></div>
</body>
</html>
