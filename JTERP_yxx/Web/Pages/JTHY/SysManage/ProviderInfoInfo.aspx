<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProviderInfoInfo.aspx.cs" Inherits="Pages_Office_PurchaseManager_ProviderInfoInfo" %>

<%@ Register src="../../../UserControl/Message.ascx" tagname="Message" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <script type="text/javascript">
 
function SelectedNodeChanged(code_text,type_code)
{   
   document.getElementById("txtCustClassName").value=code_text;
   document.getElementById("txtCustClass").value=type_code;
   hideUserList();
}
function hidetxtUserList()
{
   hideUserList();
}
function showUserList()
{
  var list = document.getElementById("userList");
  if(list.style.display != "none")
   {
      list.style.display = "none";
      return;
   }
   document.getElementById("userList").style.display = "block";
}
function hideUserList()
{
 document.getElementById("userList").style.display = "none";
}

function clearInfo() {
    document.getElementById("txtCustClassName").value = "";
    document.getElementById("txtCustClass").value = "";
    hideUserList();
}

</script>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link rel="stylesheet" type="text/css" href="../../../css/jt_default.css" />
    <script src="../../../js/JQuery/jquery_last.js" type="text/javascript"></script>
    <script src="../../../js/common/Check.js" type="text/javascript"></script>
    
    <script src="../../../js/common/Common.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript" src="../../../js/common/PageBar-1.1.1.js"></script>

    <link href="../../../css/pagecss.css" type="text/css" rel="Stylesheet" />

    <script src="../../../js/jthy/sysmanage/ProviderInfoInfo.js" type="text/javascript"></script>

    <script src="../../../js/common/page.js" type="text/javascript"></script>
    
    <script src="../../../js/common/UserOrDeptSelect.js" type="text/javascript"></script>
    
    <script src="../../../js/Calendar/WdatePicker.js" type="text/javascript"></script>
   <script type="text/javascript"> 
//����س��¼� Ǯ��� 2010-11-04
function document.onkeydown() 
{ 
    
    if(event.keyCode == 13)
    {
       SearchProviderInfoData();
        event.returnValue = false;
    } 
}
</script>
    <title>��Ӧ�̵����б�</title>
</head>
<body>
    <form id="form1" runat="server">
    <uc1:Message ID="Message1" runat="server" />
    <!-- ���۶���-->
    <!-- ���۶���-->
    <table width="98%" border="0" cellpadding="0" cellspacing="0"  id="mainindex">
        <tr>
            <td valign="middle" align="center">
                <table width="99%" border="0" border="0" cellpadding="0" cellspacing="0" >
        
                    <tr class="menutitle1">
                        <td align="left" valign="middle" >
                            &nbsp;&nbsp;��������
                        </td>
                        <td  align="right" >
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
                        <td >
                            <table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC"
                                class="table">
                                <tr class="table-item">
                                    <td  class="td_list_fields">
                                        ��Ӧ�̱��
                                    </td>
                                    <td class="tdColInput">
                                        <asp:TextBox ID="txtCustNo" MaxLength="25" runat="server" CssClass="tdinput" Width="95%"   SpecialWorkCheck="��Ӧ�̱��" ></asp:TextBox>
                                    </td>
                                   <td class="td_list_fields" >
                                        ��Ӧ������
                                    </td>
                                    <td class="tdColInput">
                                        <asp:TextBox ID="txtCustName" MaxLength="50" runat="server" CssClass="tdinput" Width="95%"  SpecialWorkCheck="��Ӧ������"  ></asp:TextBox>
                                    </td>
                                    <td class="td_list_fields" >
                                        �ֹܲɹ�Ա
                                    </td>
                                    <td class="tdColInput">
                                        <asp:TextBox ID="UsertxtManager" onclick="alertdiv('UsertxtManager,HidManager');" runat="server"
                                             ReadOnly="true" CssClass="tdinput" Width="95%"></asp:TextBox>
                                             <input type="hidden" id="HidManager" runat="server" />
                                    </td>                                    
                                </tr>
                                 <tr>
                                     <td colspan="6" align="center" bgcolor="#FFFFFF">
                                      <input type="hidden" id="hidModuleID" runat="server" />
                                      <input type="hidden" id="hidSearchCondition" name="hidSearchCondition" />
                                      <img id="btnQuery" alt="����" src="../../../images/Button/Bottom_btn_search.jpg" style='cursor: hand;'
                                                                onclick='SearchProviderInfoData()' visible="false" runat="server"/>
                                                            
                                    </td>
                               </tr> 
                            </table>
                        </td>
                    </tr>                               
                  
                </table>
            </td>
        </tr>

    </table>
            
    <table width="98%"  border="0" cellpadding="0"  cellspacing="0" class="maintable"
        id="mainindex">

        <tr>
            <td height="30" colspan="2" align="center" valign="top" class="Title">
                <table width="99%" border="0" border="0"  cellpadding="0" cellspacing="0" >
                    <tr class="menutitle1">
                        <td  align="left" valign="middle" >
                            &nbsp;&nbsp;��Ӧ�̵����б�             
                        </td>

                        <td align="right" valign="middle">                            
                            <img id="btn_create"  src="../../../images/Button/Bottom_btn_new.png" alt="�½�" style="cursor:hand;" onclick="CreateProviderInfo()"  runat="server" visible="false" />&nbsp;
                            <img id="btn_del"  src="../../../Images/Button/Main_btn_delete.png" alt="ɾ��" style="cursor:hand;" onclick="DelProviderInfo()"  runat="server" visible="false" />&nbsp;
                            <asp:ImageButton ID="btnImport" ImageUrl="../../../images/Button/Main_btn_out.jpg" style="display:none;" AlternateText="����Excel" runat="server" onclick="btnImport_Click" />
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" id="tdResult">
                <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" id="pageDataList1"
                    bgcolor="#CCCCCC">
                    <tbody>                        
                        <tr class="table-item">
                            <th   class="td_main_detail" width="3%" >ѡ��<input type="checkbox" visible="false" id="checkall" onclick="SelectAll()" value="checkbox" /></th>
                            <th   class="td_main_detail" width="5%" ><div class="orderClick" onclick="OrderBy('CustNo','oCustNo');return false;">��Ӧ�̱��<span id="oCustNo" class="orderTip"></span></div></th>
                            <th   class="td_main_detail" width="5%" ><div class="orderClick" onclick="OrderBy('CustName','oCustName');return false;">��Ӧ������<span id="oCustName" class="orderTip"></span></div></th>
                            <th   class="td_main_detail" width="5%" ><div class="orderClick" onclick="OrderBy('ContactName','oContactName');return false;">��ϵ��<span id="oContactName" class="orderTip"></span></div></th>
                            <th   class="td_main_detail" width="5%" ><div class="orderClick" onclick="OrderBy('Mobile','oMobile');return false;">��ϵ�绰<span id="oMobile" class="orderTip"></span></div></th>
                            <th   class="td_main_detail" width="5%" ><div class="orderClick"  onclick="OrderBy('ManagerName','oManagerName');return false;">�ֹܲɹ�Ա<span id="oManagerName" class="orderTip"></span></div></th>
                            <th   class="td_main_detail" width="5%" ><div class="orderClick" onclick="OrderBy('CreatorName','oCreatorName');return false;">������<span id="oCreatorName" class="orderTip"></span></div></th>
                            <th   class="td_main_detail" width="5%" ><div class="orderClick" onclick="OrderBy('CreateDate','oCreateDate');return false;">��������<span id="oCreateDate" class="orderTip"></span></div></th>
                          </tr>
                    </tbody>
                </table>
                <br />
                <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999"
                    class="PageList">
                    <tr>
                        <td height="28" background="../../../images/Main/PageList_bg.jpg">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="PageList">
                                <tr >
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
                                                width="36" height="28" align="center" onclick="ChangePageCountIndex($('#ShowPageCount').val(),$('#ToPage').val());" />
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


