﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductInfo.aspx.cs" Inherits="Pages_Office_SupplyChain_ProductInfo" %>

<%--
<%@ Register src="../../../UserControl/ProductInfoControl.ascx" tagname="ProductInfoControl" tagprefix="uc1" %>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
        <link rel="stylesheet" type="text/css" href="../../../css/default.css" />


    <script src="../../../js/common/Common.js" type="text/javascript"></script>
    <script src="../../../js/JQuery/jquery_last.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript" src="../../../js/common/PageBar-1.1.1.js"></script>

    <script src="../../../js/office/SupplyChain/ProductInfoAdd.js" type="text/javascript"></script>
<%--<script src="../../../js/office/SupplyChain/ProductTest.js" type="text/javascript"></script>--%>

    <script src="../../../js/common/page.js" type="text/javascript"></script>

    <script src="../../../js/Calendar/WdatePicker.js" type="text/javascript"></script>

    <script src="../../../js/common/Check.js" type="text/javascript"></script>

</head>
<body>
    <form id="form1" runat="server">
    <span id="Forms" class="Spantype"></span>
    <div>
    
    </div>
        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999">
                        <tr>
                            <td height="28" bgcolor="#FFFFFF">
                             <%-- <img src="../../../images/Button/Show_add.jpg" width="34" height="24" style="cursor: hand"
                                    onclick="ShowProdInfo();" />--%>
                                      <img src="../../../images/Button/Show_add.jpg" width="34" height="24" style="cursor: hand"
                                    onclick="AddSignRow();" />
                                <img src="../../../images/Button/Show_del.jpg" width="34" height="24" style="cursor: hand"
                                    onclick="DeleteSignRow();" />
                                </td>
                        </tr>
                    </table>
                    <table width="99%" border="0" id="dg_Log" style="behavior: url(../../../css/draggrid.htc)"
                        align="center" cellpadding="0" cellspacing="1" bgcolor="#999999">
                        <tr>
                            <td height="20" align="center" class="td_list_fields">
                                序号
                            </td>
                            <td align="center"  class="td_list_fields" class="Blue">
                                选择<input type="checkbox" name="checkall" id="checkall" onclick="SelectAll()" />
                            </td>
                            <td align="center"  class="td_list_fields" class="Blue">
                                物品编号
                            </td>
                            <td align="center"  class="td_list_fields" class="Blue">
                                物品名称
                            </td>
                            <td align="center"  class="td_list_fields" class="Blue">
                                标准成本
                            </td>
                               <td align="center"  class="td_list_fields" class="Blue">
                                单位
                            </td>
                        </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td height="2" bgcolor="#999999">
                            </td>
                        </tr>
                    </table>
 <input name='txtTRLastIndex' type='hidden' id='txtTRLastIndex' value="1" />
 <%--   <uc1:ProductInfoControl ID="ProductInfoControl1" runat="server" />--%>
    </form>
</body>
</html>
