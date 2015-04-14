<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PaySettle.aspx.cs" Inherits="Pages_JTHY_Expenses_PaySettle" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Src="../../../UserControl/Message.ascx" TagName="Message" TagPrefix="uc1" %>
<%@ Register Src="../../../UserControl/GetBillExAttrControl.ascx" TagName="GetBillExAttrControl"
    TagPrefix="uc2" %>
    <%@ Register Src="~/UserControl/DeleteBill.ascx" TagName="DeleteBill" TagPrefix="uc8" %>

<%@ Register Src="../../../UserControl/CustNameSel_Con.ascx" TagName="CustNameSel_Con"
    TagPrefix="uc11" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>���۽��㵥�½�</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../../css/jt_default.css" rel="stylesheet" type="text/css" />
    <link href="../../../css/pagecss.css" type="text/css" rel="Stylesheet" />

    <script src="../../../js/JQuery/jquery_last.js" type="text/javascript"></script>

    <script src="../../../js/common/PageBar-1.1.1.js" language="javascript" type="text/javascript"></script>

    <script src="../../../js/JQuery/formValidator.js" type="text/javascript"></script>

    <script src="../../../js/JQuery/formValidatorRegex.js" type="text/javascript"></script>

    <script src="../../../js/Calendar/WdatePicker.js" type="text/javascript"></script>

    <script src="../../../js/common/UserOrDeptSelect.js" type="text/javascript"></script>

    <script src="../../../js/common/check.js" type="text/javascript"></script>

    <script src="../../../js/common/page.js" type="text/javascript"></script>

    <script src="../../../js/common/Common.js" type="text/javascript"></script>
    
    <script src="../../../js/jthy/Expenses/PaySettle.js" type="text/javascript"> </script>
   
    <script src="../../../js/FusionCharts/Contact.js" type="text/javascript"> </script>

    <script type="text/javascript">
        function showDeleteDiv() {
            $("#deleteBill").show(500);
            DeleteBill();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <input type="hidden" id="hidisCust" runat="server" />
    <input type="hidden" id="hiddExpOrder" value="" runat="server" />
    <input id="hidselpoint" type="hidden" runat="server" />
    <input type="hidden" id="hiddUrl" runat="server" />
    <input type="hidden" id="hfCustNo" runat="server" />
    <input type="hidden" id="hidBillStatus" runat="server" />
    <input type="hidden" id="hidStatus" runat="server" />
    <input type="hidden" id="txtBillStatusID" name="txtBillStatusID" value="1" runat="server" />
    <input type="hidden" id="txtBillStatusName" name="txtBillStatusName" value="�Ƶ�"  runat="server" />
    <uc11:CustNameSel_Con ID="CustNameSel_Con" runat="server" /> 
    <span id="Forms" class="Spantype"></span>
    <uc2:GetBillExAttrControl ID="GetBillExAttrControl2" runat="server" />
    <input type="hidden" id="hidEFIndexP" runat="server" />
    <input type="hidden" id="hidEFDescP" runat="server" />  
    <uc8:DeleteBill ID="DeleteBill1"  runat="server"/>    
    <table width="98%" border="0"  cellpadding="0" cellspacing="0" id="mainindex_1">
        <tr>
            <td valign="middle" align="center">
                <table width="99%" border="0" border="0" cellpadding="0" cellspacing="0" >
        
                    <tr class="menutitle1">
                        <td align="left" valign="middle" >
                            &nbsp;&nbsp;��������
                        </td>
                        <td align="right">
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
                                  <td  class="td_list_fields">�ͻ�����<span class="redbold">*</span></td>
                        <td class="td_list_edit" valign="middle" >
                            <input id="opr_addcontract" type="hidden" runat="server" value="1" />  
                            <input id="txtCustomerID" type="hidden" runat="server" />  
                            <asp:TextBox ID="txtCustomerName" runat="server"  style="width: 80%; border:0px; background-color:#FFFFFF;"  onclick="SearchCustData();"></asp:TextBox>
                            <img alt="����" src="../../../Images/default/Search1.gif"  id="search"     style=" cursor:pointer;" onclick="SearchCustData();" />
                        </td>
                                    <td class="td_list_fields" >
                                       ʱ��
                                    </td>
                                      <td class="tdColInput" colspan="3">
                                         <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td align="left" style="width: 45%">
                                                    <input type="text" name="time1" id="txtBeginT" runat="server" style="width: 95%;" class="tdinput Wdate"
                                                        onclick="WdatePicker({dateFmt:'yyyy-MM-dd',el:$dp.$('OrderDate')})" />
                                                </td>
                                              <td style="width: 10%">
                                                    <input id="Text8" runat="server" class="tdinput" value="��" type="text" style="width: 78%;" />
                                                </td>
                                                <td style="width: 45%">
                                                    <input type="text" id="txtEndT" runat="server" style="width: 95%;" class="tdinput Wdate"
                                                        onclick="WdatePicker({dateFmt:'yyyy-MM-dd',el:$dp.$('OrderDate')})" />
                                                </td>
                                                
                                             
                                                </table>
                                                </td>
                                    
                                    <td>
                                    
                                     <input type="checkbox"  id="iscountCheck" name="iscount" />����������
                                    </td>
                                    
                                 
                                     
                                </tr>
                          
                                <tr >
                                    <td colspan="8" align="center" bgcolor="#FFFFFF">
                                        <uc1:Message ID="Message1" runat="server" />
                                        <img runat="server" alt="����" src="../../../images/Button/Bottom_btn_search.jpg" style='cursor: pointer;'
                                            id="btn_Search" onclick='SearchPaySettle()' />
                                        <input id="hidSearchCondition" type="hidden" runat="server" />   
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="98%" border="0"  cellpadding="0" cellspacing="0" class="maintable" id="mainindex">
        <tr>
            <td height="30" colspan="2" align="center" valign="top" class="Title">
                <table width="99%" border="0" border="0" cellpadding="0" cellspacing="0" >
                    <tr class="menutitle1">
                 
                  
                 
                        <td  align="left" valign="middle" >
                         &nbsp;&nbsp;  <asp:Label ID="labTitle_Write1" runat="server" Text="">�½����۽���</asp:Label>         
                        </td>
                        
                         
                        <td  align="right">
                           
                             <img id="imgSave" src="../../../Images/Button/Bottom_btn_save.jpg" alt="����" style="cursor: pointer;"
                                    runat="server" onclick="SaveSellOrder();" />
                                <img id="imgUnSave" runat="server" alt="����" src="../../../Images/Button/UnClick_bc.jpg"
                                    style="display: none;" />                                    
                                     <input type="hidden" id="hidUpDateTime" runat="server" />
                                     <input id="headid" type="hidden" runat="server" />
                               <%-- <span visible="false" runat="server" id="GlbFlowButtonSpan1"></span>--%>                          
                                 <span runat="server" id="GlbFlowButtonSpan"></span>
                                <input id="txtOprtID" type="text" style="display: none;" />
                                     <img id="btn_confirm" src="../../../Images/Button/Bottom_btn_ok.jpg" alt="�����Ч" style="cursor: pointer;display: none;"
                                    runat="server" onclick="Fun_ConfirmOperate();" />
                               
                            <img id="Imgbtn_confirm" src="../../../Images/Button/Bottom_btn_confirm2.jpg" alt="�޷���Ч"
                                runat="server" />

                            <img id="UnConfirm" alt="ȡ����Ч" src="../../../Images/Button/btn_fqr.jpg" style="cursor: pointer;
                                display: none;" onclick="Fun_UnConfirmOperate();" visible="false" />
                             <img id="ImgUnConfirm" alt="�޷�ȡ����Ч" src="../../../Images/Button/btn_fqru.jpg" style="cursor: pointer;" />
                     


                                       <img id="ImageClose" alt="��ɽ���"    src="../../../Images/Button/wanchengjiesuan.jpg"  style="cursor: pointer; display:none";
                                 onclick="CloseConfim();" visible="false" />
                             
                                
                            <img id="ImageClose_btn" alt="�޷���ɽ���" src="../../../Images/Button/wcjs.jpg" style="cursor: pointer;" />
                         
                         
                              <img id="UnClose" alt="���½���" src="../../../Images/Button/chongxinjiesuanlan.jpg" style="cursor: pointer;
                                display: none;" onclick="UncloseConfim();" visible="false" />
                             
                                
                            <img id="UnClose_btn" alt="�޷����½���" src="../../../Images/Button/chongxinjiesuan.jpg" style="cursor: pointer;" />

                        </td>
                    </tr>
                 </table>
            </td>
        </tr>
        <tr >
            <td colspan="2">
            
              <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999">
                                <tr class="table-item">
                                    <td style="padding-top: 5px; padding-left: 5px;">
                                      
                                        <img runat="server" src="../../../images/Button/Show_del.jpg" alt="ɾ��" id="imgDel"
                                            style="cursor: hand;" onclick="fnDelOneRow();" />
                                    </td>
                                </tr>
                            </table>
                   <div id="divDetail" style="width: 100%; background-color: #FFFFFF;">
                                    <table width="99%" border="0" id="dg_Log" style="height: auto;" align="center" cellpadding="0"
                                        cellspacing="1" bgcolor="#999999">
                                        <tr class="table-item">
                                            <td  class="td_main_detail" style="width: 6%;">
                                                ѡ��<input type="checkbox" visible="false" id="checkall" onclick="fnSelectAll()" value="checkbox" />
                                            </td>
                                            <td class="td_main_detail" style="width: 10%;">
                                               ���������<span class="redbold">*</span>
                                            </td>
                                        
                                                                                  
                                            <td class="td_main_detail" style="width: 10%;">
                                                �ͻ���λ 
                                            </td>                                           
                                          
                                            <td  class="td_main_detail" style="width: 8%;">
                                               ��������
                                            </td>
                                       
                                            <td class="td_main_detail" style="width: 8%;">
                                              ���ݵ���
                                            </td> 
                                            
                                             <td class="td_main_detail" style="width: 8%;">
                                              ��������<span class="redbold">*</span>
                                            </td> 
                                            
                                              <td class="td_main_detail" style="width:8%;">
                                              ���㵥��<span class="redbold">*</span>
                                            </td> 
                                            
                                            <td class="td_main_detail" style="width: 8%;">
                                              �ܽ��<span class="redbold">*</span>
                                            </td> 
                                            
                                             <td class="td_main_detail" style="width: 7%;">
                                             ��������
                                            </td>  
                                              <td class="td_main_detail" style="width: 10%;">
                                              ��ע
                                            </td> 
                                             </td>  
                                              <td class="td_main_detail" style="width: 10%;">
                                              �ѽ�������
                                            </td>
                                             
                                              <td class="td_main_detail" style="width: 10%;">
                                              �ѽ�����
                                            </td>
                                            
                                            
                                      
                                                                                       
                                        </tr>                                          
                                    </table>                            
                                </div>
                            </td>
                        </tr>
                    </table>
                    
                    
                    
                    <br />
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#999999">
                    <tr>
                         <td height="20" class="td_list_title">
                            <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                <tr  class="menutitle1">
                                    <td align="left">
                                           &nbsp;&nbsp;������Ϣ
                                    </td>
                                    <td align="right">
                                        <div id='divButtonNote'>
                                            <img src="../../../images/Main/Close.jpg" style="cursor: pointer" onclick="oprItem('Tb_04','divButtonNote')" /></div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table width="99%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#999999"
                    id="Tb_04">                   
                    <tr  class="table-item">
                        <td class="td_list_fields" >
                            ���㵥��
                        </td>
                        <td class="tdColInput" >
                            <asp:TextBox ID="txtxsfpNo" runat="server" CssClass="tdinput" Width="80%" Enabled="False"></asp:TextBox>
                        </td>
                        <td class="td_list_fields" >
                            �Ƶ��� 
                        </td>
                        <td class="tdColInput" >
                           <asp:TextBox ID="txtCreatePerson" runat="server" CssClass="tdinput" 
                                Width="90%" Enabled="False"></asp:TextBox>
                           <input type="hidden" id="txtCreator" runat="server" />

                        </td>
                        <td class="td_list_fields" >
                            �Ƶ�ʱ��
                        </td>
                        <td class="tdColInput" > 
                        
                            <asp:TextBox ID="txtCreateDate" runat="server" CssClass="tdinput" Width="80%" Enabled="False"></asp:TextBox>
                      
                                              
                        </td>
                    </tr>                   
                    <tr  class="table-item">
                       <td class="td_list_fields" >
                            ȷ����
                        </td>
                        <td  class="tdColInput">  
                            <input name="txtConfirmor" id="txtConfirmor" type="text" runat="server" disabled="disabled" class="tdinput"
                                style="width: 95%; " maxlength="50"  />    
                                 <input type="hidden" id="txtConfirmorId" runat="server" />
                                                    
                        </td>
                        <td   class="td_list_fields">
                            ȷ��ʱ��
                        </td>
                        <td class="tdColInput">
                            <asp:TextBox ID="txtConfirmDate" MaxLength="50" runat="server" CssClass="tdinput"
                                Width="95%" disabled Text=""></asp:TextBox>
                        </td>
                        <td class="td_list_fields">
                            ����״̬
                        </td>
                        <td  class="tdColInput">
                            <asp:TextBox ID="txtStatus" MaxLength="50" runat="server" CssClass="tdinput"
                                Width="95%" disabled Text=""></asp:TextBox>
                        </td>
                        
                       
                    </tr>
                </table>
                
                </td>
            </tr>
        </table>
                    
                    
        
    </form>
</body>
</html>



