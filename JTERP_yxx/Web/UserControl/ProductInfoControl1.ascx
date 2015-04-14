﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProductInfoControl1.ascx.cs" Inherits="UserControl_ProductInfoControl1" %>
<%--<%@ Register Src="ProductDiyAttr.ascx" TagName="ProductDiyAttr" TagPrefix="uc1" %>--%>
<style type="text/css">
    .tdinput
    {
        border-width: 0pt;
        background-color: #ffffff;
        height: 21px;
        margin-left: 2px;
    }
    #Product_List
    {
        border: solid 1px #111111;
        width: 165px;
        z-index: 101;
         bottom:0px;
        display: none;
        position: absolute;
        background-color: White;
    }
</style>

<a name="pageprodDataListMark"></a><span id="Forms" class="Spantype"></span>
<input type="hidden" id="CurrentType" value="0" runat="server" />
<input id="HdSubProductStorageID" type="hidden" runat="server" />
<input type="hidden" id="hidIsAuthority" value="0" runat="server" />
<input type="hidden" id="hidversion" runat="server" />
<!--提示信息弹出详情start-->
<div id="divzhezhao1" style="filter: Alpha(opacity=0); width: 93%; padding: 1px;height: 500px; z-index: 199; bottom:0px; left:0px;position: absolute; display: none;">
</div>
<div id="divStorageProduct" style="border: solid 8px #93BCDD; background: #fff; padding: 10px; width: 93%;z-index: 200; top:50px;left:0px; position: absolute; display: none;" onmousedown="javascript:moveStart(event,this.id);">
    <div id="divquery">
    <!--IFRAME 遮层，防止 IE6下，下拉框 遮住显示内容,以下尺寸在 IE6下测试成功。-->
    <iframe style="border: 0; width: 1000px; height: 500px; position: absolute;z-index: -1;"></iframe>
        <table width="100%">
            <tr>
                <td>
                    <%-- <a onclick="closeProductdiv('divStorageProduct')" style="text-align: right; cursor: pointer">关闭</a>--%>
                    <img alt="关闭" id="btn_Close1" src="../../../images/Button/Bottom_btn_close.jpg" style='cursor: hand;'
                        onclick='closeProductdiv();' />
                    <img alt="清除" id="ClearInputProduct" src="../../../images/Button/Bottom_btn_del.jpg"
                        style='cursor: hand; display: none' onclick='ClearPkroductInfo();' />
                    <input id="hf_typeid" type="hidden" />
                    <input id="hf_bigtype" type="hidden" />
                </td>
            </tr>
        </table>
       <table  style="width:100%;" border="1" cellpadding="0" cellspacing="0">
       <tr>
       <td style="width: 10%; background: #fff;" align="left" valign="top" height="200">
                            <div style="height: 180px; overflow-x: hidden; overflow-y: auto;" id="div_tree_Class">
                                <asp:TreeView ID="Tree_SteelType" runat="server" ShowLines="True" >
                                </asp:TreeView>
                            </div>
          </td>
       <td style="width: 90%; background: #fff;" valign="top" height="200">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" id="mainindex">
            <tr>
                <td valign="top">
                    <img src="../../../images/Main/Line.jpg" width="122" height="7" />
                </td>
                <td rowspan="2" align="right" valign="top">
                    <div id='searchClick12'>
                        <img src="../../../images/Main/Close.jpg" style="cursor: pointer" onclick="oprItem('searchtable12','searchClick12')" /></div>
                    &nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td valign="top" class="Blue">
                    <img src="../../../images/Main/Arrow.jpg" width="21" height="18" align="absmiddle" />检索条件
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table width="100%" border="0" align="left" cellpadding="0" id="searchtable12" cellspacing="0"
                        bgcolor="#CCCCCC">
                        <tr>
                            <td bgcolor="#FFFFFF">
                                <table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC"
                                    class="table">
                                    <tr class="table-item">
                                        <td width="10%" height="20" class="td_list_fields" align="right">
                                            物品编号
                                        </td>
                                        <td width="23%" bgcolor="#FFFFFF">
                                            <input type="text" id="txt_ProdNO" specialworkcheck="物品编号" class="tdinput" />
                                        </td>
                                        <td width="10%" height="20" class="td_list_fields" align="right">
                                            物品名称
                                        </td>
                                        <td width="23%" bgcolor="#FFFFFF">
                                            <input type="text" id="txt_ProdName" specialworkcheck="物品名称" class="tdinput" />
                                        </td>
                                        <td class="td_list_fields" align="right" width="10%">
                                            拼音代码
                                        </td>
                                        <td bgcolor="#FFFFFF" width="24%">
                                            <input type="text" id="txt_PYShort" specialworkcheck="拼音代码" name="txtConfirmorReal2"
                                                class="tdinput" />
                                        </td>
                                    </tr>
                                    <tr class="table-item">
                                        <td class="td_list_fields" align="right" width="10%" style="display:none;">
                                            物品分类
                                        </td>
                                        <td bgcolor="#FFFFFF" width="23%" style="display:none;">
                                            <input type="text" id="txt_TypeID" readonly onclick="showUserList()" class="tdinput" />
                                        </td>
                                         <td width="10%" height="20" class="td_list_fields" align="right">
                                            库存数量范围
                                        </td>
                                        <td width="24%" bgcolor="#FFFFFF">
                                            <input type="text" id="txt_StartStorage" class="tdinput" size="10" maxlength="15" />至
                                            <input type="text" id="txt_EndStorage" class="tdinput" size="10" maxlength="15" />
                                        </td>
                                        <td width="10%" height="20" class="td_list_fields" align="right">
                                            规格型号
                                        </td>
                                        <td width="23%" bgcolor="#FFFFFF">
                                            <input type="text" id="txt_Specification" class="tdinput" />
                                        </td>
                                        <td width="10%" height="20" class="td_list_fields" align="right">
                                            厂家
                                        </td>
                                        <td width="24%" bgcolor="#FFFFFF">
                                            <input type="text" id="txt_Manufacturer" specialworkcheck="厂家" class="tdinput" />
                                        </td>
                                    </tr>
                                    <tr class="table-item" style="display:none;">
                                        <td class="td_list_fields" align="right" width="10%" >
                                            产地
                                        </td>
                                        <td bgcolor="#FFFFFF" width="23%">
                                            <input type="text" id="txt_FromAddr" specialworkcheck="产地" class="tdinput" />
                                        </td>
                                        <td width="10%" height="20" class="td_list_fields" align="right">
                                            材质
                                        </td>
                                        <td width="23%" bgcolor="#FFFFFF">
                                            <asp:DropDownList ID="sel_Material" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                       
                                    </tr>
                                    <tr >
                                        <td class="td_list_fields" align="right" width="10%" >
                                           <span style="display:none;"> 颜色</span>
                                        </td>
                                        <td bgcolor="#FFFFFF" width="23%">
                                             <span style="display: none"><asp:DropDownList ID="selCorlor" runat="server">
                                            </asp:DropDownList></span>
                                        </td>
                                        <td class="td_list_fields" align="right" width="10%">
                                            <span id="spanOther" style="display: none">其他条件</span>
                                        </td>
                                        <td bgcolor="#FFFFFF" width="23%">
                                            <span id="trNewAttr" style="display: none">
                                                <%--<uc1:ProductDiyAttr ID="ProductDiyAttr2" runat="server" />--%>
                                            </span>
                                        </td>
                                        <td class="td_list_fields" align="right" width="10%">
                                        </td>
                                        <td bgcolor="#FFFFFF" width="23%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="8" align="center" bgcolor="#FFFFFF">
                                            <img alt="检索" src="../../../images/Button/Bottom_btn_search.jpg" style='cursor: hand;'
                                                onclick='Fun_Search_Product()' id="btn_search" />
                                            <img alt="确定" src="../../../images/Button/Bottom_btn_ok.jpg" style='cursor: hand;'
                                                onclick="GetValue();" id="imgsure" />
                                            <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" id="pageDataListProduct"
                                                bgcolor="#999999">
                                                <tbody>
                                                    <tr>
                                                        <th height="20" align="center" class="td_list_fields">
                                                            选择<input type="checkbox" id="btnProductAll" name="btnProductAll" onclick="OptionCheckAll1()" />
                                                        </th>
                                                        <%-- <th align="center" class="td_list_fields">
                                                            <div class="orderClick">
                                                                查看<span id="oID" class="orderTip"></span></div>
                                                        </th>--%>
                                                        <th align="center" class="td_list_fields">
                                                            <div class="orderClick" onclick="OrderByProduct('ProdNo','PublicProdNo');return false;">
                                                                物品编号<span id="PublicProdNo" class="orderTip"></span></div>
                                                        </th>
                                                        <th align="center" class="td_list_fields">
                                                            <div class="orderClick" onclick="OrderByProduct('ProductName','Public_ProductName');return false;">
                                                                物品名称<span id="Public_ProductName" class="orderTip"></span></div>
                                                        </th>
                                                        <th align="center" class="td_list_fields">
                                                            <div class="orderClick" onclick="OrderByProduct('CodeTypeName','Public_CodeTypeName');return false;">
                                                                物品分类<span id="Public_CodeTypeName" class="orderTip"></span></div>
                                                        </th>
                                                        <th align="center" class="td_list_fields">
                                                            <div class="orderClick" onclick="OrderByProduct('Specification','Public_Specification');return false;">
                                                                规格型号<span id="Public_Specification" class="orderTip"></span></div>
                                                        </th>
                                                          <th align="center" class="td_list_fields">
                                                            <div class="orderClick" onclick="OrderByProduct('Size','Public_Size');return false;">
                                                                尺寸<span id="Public_Size" class="orderTip"></span></div>
                                                        </th>
                                                        <th align="center" class="td_list_fields">
                                                            <div class="orderClick" onclick="OrderByProduct('CodeName','Public_CodeName');return false;">
                                                                基本单位<span id="Public_CodeName" class="orderTip"></span></div>
                                                        </th>
                                                        <th align="center" class="td_list_fields"
                                                            style="display: none">
                                                            <div class="orderClick" onclick="OrderByProduct('CurrentStore','Public_CurrentStore');return false;">
                                                                可用存量<span id="Public_CurrentStore" class="orderTip"></span></div>
                                                        </th>
                                                        <th align="center" class="td_list_fields">
                                                            <div class="orderClick" onclick="OrderByProduct('ProductCount','ProductCount');return false;">
                                                                现有存量<span id="Public_ProductCount" class="orderTip"></span></div>
                                                        </th>
                                                        <th align="center" class="td_list_fields" id="divStandardCost" style="display: none">
                                                            <div class="orderClick" onclick="OrderByProduct('StandardCost','StandardCost');return false;">
                                                                标准成本<span id="Public_StandardCost" class="orderTip"></span></div>
                                                        </th>
                                                        <th align="center" class="td_list_fields" id="divTaxBuy" style="display: none">
                                                            <div class="orderClick" onclick="OrderByProduct('TaxBuy','Public_TaxBuy');return false;">
                                                                去税进价<span id="Public_TaxBuy" class="orderTip"></span></div>
                                                        </th>
                                                        <th align="center" class="td_list_fields" id="divInTaxRate" style="display: none">
                                                            <div class="orderClick" onclick="OrderByProduct('InTaxRate','Public_InTaxRate');return false;">
                                                                进项税率(%)<span id="Public_InTaxRate" class="orderTip"></span></div>
                                                        </th>
                                                        <th align="center" class="td_list_fields" id="divStandardSell" style="display: none"> 
                                                            <div class="orderClick" onclick="OrderByProduct('StandardSell','Public_StandardSell');return false;">
                                                                去税售价<span id="Public_StandardSell" class="orderTip"></span></div>
                                                        </th>
                                                        <th align="center" class="td_list_fields" id="divSellTax" style="display: none"> 
                                                            <div class="orderClick" onclick="OrderByProduct('SellTax','Public_SellTax');return false;">
                                                                含税售价<span id="Public_SellTax" class="orderTip"></span></div>
                                                        </th>
                                                        <th align="center" class="td_list_fields" id="divStandardBuy" style="display: none">
                                                            <div class="orderClick" onclick="OrderByProduct('StandardBuy','Public_StandardBuy');return false;">
                                                                含税进价<span id="Public_StandardBuy" class="orderTip"></span></div>
                                                        </th>
                                                        <th align="center" class="td_list_fields" id="divTaxRate" style="display: none">
                                                            <div class="orderClick" onclick="OrderByProduct('TaxRate','Public_TaxRate');return false;">
                                                                销项税率(%)<span id="Public_TaxRate" class="orderTip"></span></div>
                                                        </th>
                                                        <th align="center" class="td_list_fields"id="divDiscount" style="display: none"> 
                                                            <div class="orderClick" onclick="OrderByProduct('Discount','Public_Discount');return false;">
                                                                折扣(%)<span id="Public_Discount" class="orderTip"></span></div>
                                                        </th>
                                                        <%if (this.Version == "floor")
                                                          { %>
                                                           <th align="center" class="td_list_fields" id="divPnumber">
                                                          <div class="orderClick">
                                                             纸号<span id="floor_Pnumber" class="orderTip"></span>
                                                          </div>
                                                        </th>
                                                        <th align="center" class="td_list_fields" id="divAbrasion">
                                                          <div class="orderClick">
                                                             耐磨纸<span id="floor_Abrasion" class="orderTip"></span>
                                                          </div>
                                                        </th>
                                                        <th align="center" class="td_list_fields" id="divBalancePaper">
                                                          <div class="orderClick">
                                                             平衡纸<span id="floor_BalancePaper" class="orderTip"></span>
                                                          </div>
                                                        </th>
                                                        <th align="center" class="td_list_fields" id="divBaseM">
                                                          <div class="orderClick">
                                                             基材<span id="floor_BaseM" class="orderTip"></span>
                                                          </div>
                                                        </th>
                                                         <th align="center" class="td_list_fields" id="divSurfTreat">
                                                          <div class="orderClick">
                                                             表面处理工艺<span id="floor_SurfTreat" class="orderTip"></span>
                                                          </div>
                                                        </th>
                                                        <th align="center" class="td_list_fields" id="divBBPlate">
                                                          <div class="orderClick">
                                                             背面底钢板<span id="floor_BBPlate" class="orderTip"></span>
                                                          </div>
                                                        </th>
                                                         <th align="center" class="td_list_fields" id="divBuckleType">
                                                          <div class="orderClick">
                                                             扣型<span id="floor_BuckleT" class="orderTip"></span>
                                                          </div>
                                                        </th>
                                                        <%} %>
                                                        
                                                        <th align="center" class="td_list_fields">
                                                            <div class="orderClick">
                                                                商品信息<span id="Span1" class="orderTip"></span></div>
                                                        </th>
                                                        
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999"
            style="margin-left: 10px; position: relative">
            <tr>
                <td height="28" background="../../../images/Main/PageList_bg.jpg">
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="PageList">
                        <tr>
                            <td height="28" background="../../../images/Main/PageList_bg.jpg" width="40%">
                                <div id="pagecountProduct">
                                </div>
                            </td>
                            <td height="28" align="right">
                                <div id="pageDataList1_Pagerproduct" class="jPagerBar">
                                </div>
                            </td>
                            <td height="28" align="right">
                                <div id="divpageProduct">
                                    <input name="text" type="text" id="TextProduct" style="display: none" />
                                    <span id="pageDataList1_TotalProduct"></span>每页显示
                                    <input name="text" type="text" id="ShowPageCountProduct" size="6" />
                                    条 转到第
                                    <input name="text" type="text" id="ToPageproduct" size="6" />
                                    页
                                    <img src="../../../images/Button/Main_btn_GO.jpg" style='cursor: hand;' alt="go"
                                        width="36" height="28" align="absmiddle" onclick="ChangePageCountIndexProduct($('#ShowPageCountProduct').val(),$('#ToPageproduct').val());" />
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
        <div id="Product_List" style="display: none;">
            <iframe id="aaaa" style="position: absolute; z-index: -1; bottom:0px; width: 165px; height: 100px;"
                frameborder="0"></iframe>
            <div style="background-color: Silver; padding: 3px; height: 20px; padding-left: 50px;
                padding-top: 1px">
                <a href="javascript:hidetxtUserList()" style="float: right;">清空</a>
            </div>
            <div style="padding-top: 5px; height: 300px; width: 165px; overflow: auto; margin-top: 1px">
                <asp:TreeView ID="TreeView1" runat="server" ShowLines="True">
                </asp:TreeView>
            </div>
        </div>
    </div>
</div>
<!--提示信息弹出详情end-->

<script type="text/javascript" language="javascript">
    var hidIsAuthority_ClientID = "ProductInfoControl12_hidIsAuthority";
    var glbHidAuthority = document.getElementById(hidIsAuthority_ClientID).value;  
    var hidversion_ClientID= "ProductInfoControl12_hidversion";
    var glbhidversion = document.getElementById(hidversion_ClientID).value;  
    var popTechObj = new Object();
    popTechObj.InputObj = null;
    popTechObj.OperateObj = null;
    popTechObj.Special = null;
    popTechObj.CheckSpecial = null;
    var QueryID = "0";

    popTechObj.CleraInput = null;
    popTechObj.CleraHidden = null;
    popTechObj.IsStorage = null;
    popTechObj.SubSorageID=null;
    popTechObj.gettype=null;
  
    /*单选*/
    popTechObj.ShowList = function(objInput, CleraInput, CleraHidden) 
    {
        popTechObj.InputObj = objInput;
        popTechObj.CheckSpecial = null;
        popTechObj.CleraInput = CleraInput;
        popTechObj.CleraHidden = CleraHidden;
        document.getElementById('txt_TypeID').value = "";
        document.getElementById("selEFIndex").value = "-1";
        document.getElementById("txtEFDesc").value = "";
        if (typeof (CleraInput) != "undefined" || (typeof (CleraHidden) != "undefined")) {
            document.getElementById('ClearInputProduct').style.display = 'inline';
        }
        else {
            document.getElementById('ClearInputProduct').style.display = 'none';
        }
        Hidebtn();
    }
    flag = "5";
    /*单选：生产任务汇报单*/
    popTechObj.ShowListOperate = function(objInput, objOperate, CleraInput, CleraHidden) {
        popTechObj.InputObj = objInput;
        popTechObj.OperateObj = objOperate;
        popTechObj.CheckSpecial = null;
        popTechObj.CleraInput = CleraInput;
        popTechObj.CleraHidden = CleraHidden;
        document.getElementById('txt_TypeID').value = "";
        document.getElementById("selEFIndex").value = "-1";
        document.getElementById("txtEFDesc").value = "";
        if (typeof (CleraInput) != "undefined" || (typeof (CleraHidden) != "undefined")) {
            document.getElementById('ClearInputProduct').style.display = 'inline';
        }
        else {
            document.getElementById('ClearInputProduct').style.display = 'none';
        }
        Hidebtn();
    }

    /*单选:质检和生产所调用,生产只需第一个参数*/
    popTechObj.ShowListSpecial = function(objInput, Special, CleraInput, CleraHidden) {
        if (document.getElementById('ddlInStorage') != null) {
            if (Special != "DETAIL" && Special != "-1") {
                if (document.getElementById('ddlInStorage').value == '0') {
                    popMsgObj.ShowMsg('请先选择一个仓库！');
                    return false;
                }
                Special = document.getElementById('ddlInStorage').value;
            }
        }
        document.getElementById('txt_TypeID').value = "";
        document.getElementById("selEFIndex").value = "-1";
        document.getElementById("txtEFDesc").value = "";
        popTechObj.InputObj = objInput;
        popTechObj.Special = Special;
        QueryID = Special; //生成DETAIL
        popTechObj.CheckSpecial = null;
        popTechObj.CleraInput = CleraInput;
        popTechObj.CleraHidden = CleraHidden;
        if (typeof (CleraInput) != "undefined" || (typeof (CleraHidden) != "undefined")) {
            document.getElementById('ClearInputProduct').style.display = 'inline';
        }
        else {
            document.getElementById('ClearInputProduct').style.display = 'none';
        }
        Hidebtn();
    }

    function Hidebtn() {
        document.getElementById('divStorageProduct').style.display = 'block';
        document.getElementById('divzhezhao1').style.display = 'block';
        document.getElementById("btnProductAll").style.display = 'none';
        document.getElementById("imgsure").style.display = 'none';
        AlertProductMsg();
        Fun_Search_Product();
        PCenterToDocument("divStorageProduct", false);
    }

    /*多选*/
    popTechObj.ShowListCheckSpecial = function(objInput, CheckSpecial,listtype) 
    {

        popTechObj.InputObj = objInput;
        popTechObj.CheckSpecial = CheckSpecial;
        popTechObj.gettype=listtype;
        document.getElementById('divStorageProduct').style.display = 'inline';
        document.getElementById('divzhezhao1').style.display = 'inline';
        AlertProductMsg();
        Fun_Search_Product();
        
        document.getElementById('txt_TypeID').value = "";
        document.getElementById("selEFIndex").value = "-1";
        document.getElementById("txtEFDesc").value = "";
        document.getElementById("btnProductAll").style.display = 'inline';
        document.getElementById("imgsure").style.display = 'inline';
        PCenterToDocument("divStorageProduct",true);
    }
    var ProdNo = "";
    var ProdName = "";
    var PYShort = "";
    var typeid = "";
    var bigtype="";
    var Specification = "";
    var Manufacturer = "";
    var FromAddr = "";
    var Material = "";
    var StartStorage = "";
    var EndStorage = "";
    var pageCountproduct = 10; //每页计数
    var totalRecord = 0;
    var pagerproductStyle = "flickr"; //jPagerBar样式
    var flag = "";
    var str = "";
    var currentPageIndexproduct = 1;
    var action = ""; //操作
    var orderByP = ""; //排序字段
    //jQuery-ajax获取JSON数据


    function TurnToPageProduct(pageIndex) 
    {
        document.getElementById("btnProductAll").checked = false;
        currentPageIndexproduct = pageIndex;
        var ProductName = "";
        var TypeID = "";
        var UnitID = "";
        var UsedStatus = "";
        var Remark = "";
        var EFIndex = "";
        var EFDesc = "";
        var Color = document.getElementById("<%=selCorlor.ClientID %>").value;
        if (document.getElementById("trNewAttr").style.display != "none") 
        {
            EFIndex = document.getElementById("selEFIndex").value;
            EFDesc = document.getElementById("txtEFDesc").value;
        }
 
        $.ajax({
            type: "POST", //用POST方式传输
            dataType: "json", //数据格式:JSON
            url: '../../../Handler/Office/SupplyChain/ProductInfoList1.ashx', //目标地址
            cache: false,
            data: "pageIndex=" + pageIndex + "&pageCount=" + pageCountproduct + "&action=" + action + "&orderByP=" + orderByP + "&ProductID=" + escape(ProdNo) + "&ProdName=" + escape(ProdName) + "\
                     &PYShort=" + escape(PYShort) + "&Specification=" + escape(Specification) + "&Manufacturer=" + escape(Manufacturer) + "&FromAddr=" + escape(FromAddr) + "&Material=" + escape(Material) + "&StartStorage=" + escape(StartStorage) + "&EndStorage=" + escape(EndStorage) + "\
                     &QueryID=" + escape(QueryID) + "&typeid=" + escape(typeid) + "&bigtype=" + escape(bigtype) +"&ColorID=" + escape(Color) + "&EFIndex=" + escape(EFIndex) + "&EFDesc=" + escape(EFDesc) + "&gettype="+escape(popTechObj.gettype), //数据
            beforeSend: function() { $("#pageDataList_PagerProduct").hide(); }, //发送数据之前

            success: function(msg) 
            {
                //数据获取完毕，填充页面据显示
                //数据列表
                $("#pageDataListProduct tbody").find("tr.newrow").remove();
                $.each(msg.data, function(i, item) {
                    if (item.ID != null && item.ID != "") {
                        var tempOnclick = "";
                        var CheckSpe = "";
                        var TempPrice="";
                        var floorp="";
                        //判断如果物品的计量单位组编号为空则
                        if (item.SaleUnitName == "" || item.SaleUnitName == null) {
                            item.SaleUnitName = item.CodeName;
                        }
                        if (item.InUnitName == "" || item.InUnitName == null) {
                            item.InUnitName = item.CodeName;
                        }
                        if (item.StockUnitName == "" || item.StockUnitName == null) {
                            item.StockUnitName = item.CodeName;
                        }
                        if (item.MakeUnitName == "" || item.MakeUnitName == null) {
                            item.MakeUnitName = item.CodeName;
                        }
                        if (popTechObj.Special != null) {
                            tempOnclick = "" + item.ID + ",'" + item.ProdNo + "','" + item.ProductName + "','" + item.StandardSell + "',\
                          '" + item.UnitID + "','" + item.CodeName + "','" + item.TaxRate + "','" + item.SellTax + "','" + item.Discount + "',\
                          '" + item.Specification + "','" + item.CodeTypeName + "','" + item.TypeID + "','" + item.StandardCost + "','" + item.Source + "',\
                          '" + item.GroupUnitNo + "','" + item.SaleUnitID + "','" + item.SaleUnitName + "',\
                          '" + item.InUnitID + "','" + item.InUnitName + "', '" + item.StockUnitID + "','" + item.StockUnitName + "',\
                         '" + item.MakeUnitID + "','" + item.MakeUnitName + "', '" + item.IsBatchNo + "','"+item.ColorName+ "','"+item.StorageID+"'";
                         
                        }
                        else {
                            tempOnclick = "" + item.ID + ",'" + item.ProdNo + "','" + item.ProductName + "',\
                         '" + item.StandardSell + "','" + item.UnitID + "','" + item.CodeName + "','" + item.TaxRate + "',\
                         '" + item.SellTax + "','" + item.Discount + "','" + item.Specification + "','" + item.CodeTypeName + "',\
                         '" + item.TypeID + "','" + item.StandardBuy + "','" + item.TaxBuy + "','" + item.InTaxRate + "',\
                         '" + item.StandardCost + "','" + item.GroupUnitNo + "','" + item.SaleUnitID + "','" + item.SaleUnitName + "',\
                         '" + item.InUnitID + "','" + item.InUnitName + "', '" + item.StockUnitID + "','" + item.StockUnitName + "',\
                         '" + item.MakeUnitID + "','" + item.MakeUnitName + "', '" + item.IsBatchNo + "','"+item.ColorName+ "','"+item.StorageID+"'";
                        
                        }
                        
                        if (popTechObj.CheckSpecial != null) {
                            CheckSpe = " <td height='22' align='center'>" + " <input id='CheckboxProdID" + i + "' name='CheckboxProdID'  value=" + item.ID + "  type='checkbox'/>" + "</td>";
                        }
                        else if (typeof (popTechObj.CheckSpecial) == "undefined" || (popTechObj.CheckSpecial == null)) {
                            CheckSpe = " <td height='22' align='center'>" + " <input type=\"radio\" name=\"radioTech\" id=\"radioTech_" + item.ID + "\"" +
                          "value=\"" + item.ID + "\" onclick=\"Fun_FillParent_Content(" + tempOnclick + ");closeProductdiv();\" />" + "</td>";
                        }
                         if (glbHidAuthority==1)
                        {
                        
                             document.getElementById('divStandardCost').style.display = '';
                             document.getElementById('divTaxBuy').style.display = '';
                             document.getElementById('divInTaxRate').style.display = '';
                             document.getElementById('divStandardSell').style.display = '';
                             document.getElementById('divSellTax').style.display = '';
                             document.getElementById('divStandardBuy').style.display = '';                             
                             document.getElementById('divTaxRate').style.display = '';
                             document.getElementById('divDiscount').style.display = '';
                             TempPrice = "<td height='22' align='center'>" + item.StandardCost + "</td>" +
                       "<td height='22' align='center'>" + item.TaxBuy + "</td>" +
                       "<td height='22' align='center'>" + item.InTaxRate + "</td>" +
                       "<td height='22' align='center'>" + item.StandardSell + "</td>" +
                       "<td height='22' align='center'>" + item.SellTax + "</td>" +
                       "<td height='22' align='center'>" + item.StandardBuy + "</td>" +
                       "<td height='22' align='center'>" + item.TaxRate + "</td>" +
                       "<td height='22' align='center'>" + item.Discount + "</td>" ;
                        }
                        if (glbhidversion=="floor")
                       {
                        floorp="<td height='22' align='center'>" + item.Pnumber + "</td>" +
                       "<td height='22' align='center'>" + item.AbrasionResist + "</td>" +
                       "<td height='22' align='center'>" + item.BalancePaper + "</td>" +
                       "<td height='22' align='center'>" + item.BaseMaterial + "</td>" +
                       "<td height='22' align='center'>" + item.SurfaceTreatment + "</td>" +
                       "<td height='22' align='center'>" + item.BackBottomPlate + "</td>" +
                       "<td height='22' align='center'>" + item.BuckleType + "</td>" ;
                       }

                        $("<tr class='newrow'></tr>").append(CheckSpe +
                        "<td height='22' align='center' title=\"" + item.ProdNo + "\">" + fnjiequ(item.ProdNo, 12) + "</td>" +
                        "<td height='22' id=\"ProdNamejjj" + i + "\" align='center' title=\"" + item.ProductName + "\">" + fnjiequ(item.ProductName, 10) + "</td>" +
                        "<td height='22' align='center'>" + item.CodeTypeName + "</td>" +
                       "<td height='22' align='center'>" + item.Specification + "</td>" +
                        "<td height='22' align='center'>" + item.Size + "</td>" +
                       "<td height='22' align='center'>" + item.CodeName + "</td>" +
                       "<td height='22' align='center'style='display:none'>" + item.CurrentStore + "</td>" +
                       "<td height='22' align='center'>" + item.ProductCount + "</td>" +
                       TempPrice +
                       floorp +                             
                       "<td align=\"center\"><a href=\"../../../Pages/Office/SupplyChain/ProductInfoAdd.aspx?intOtherCorpInfoID=" + item.ID + "\"  target=\"_blank\">查看</a></td>").appendTo($("#pageDataListProduct tbody"));
                    }
                });
                //页码
                ShowPageBar("pageDataList1_Pagerproduct", //[containerId]提供装载页码栏的容器标签的客户端ID
                    "<%= Request.Url.AbsolutePath %>", //[url]
                    {style: pagerproductStyle, mark: "pageprodDataListMark",
                    totalCount: msg.totalCount,
                    showPageNumber: 3,
                    pageCount: pageCountproduct,
                    currentPageIndex: pageIndex,
                    noRecordTip: "没有符合条件的记录",
                    preWord: "上页",
                    nextWord: "下页",
                    First: "首页",
                    End: "末页",
                    onclick: "TurnToPageProduct({pageindex});return false;"}//[attr]
                    );
                totalRecord = msg.totalCount;
                // $("#pageDataList1_TotalProduct").html(msg.totalCount);//记录总条数
                document.getElementById('TextProduct').value = msg.totalCount;
                //                      document.all["TextProduct"].value=msg.totalCount;
                $("#ShowPageCountProduct").val(pageCountproduct);
                ShowTotalPage(msg.totalCount, pageCountproduct, pageIndex);
                $("#ToPageproduct").val(pageIndex);
                ShowTotalPage(msg.totalCount, pageCountproduct, currentPageIndexproduct, $("#pagecountProduct"));
                //document.getElementById('tdResult').style.display='block';
            },
            error: function() { },
            complete: function() { hidePopup(); $("#pageDataList1_Pagerproduct").show(); Ifshowproduct(document.getElementById('TextProduct').value); pageDataListProduct("pageDataListProduct", "#E7E7E7", "#FFFFFF", "#cfc", "cfc"); } //接收数据完毕
        });
    }
 
    //table行颜色
    function pageDataListProduct(o, a, b, c, d) 
    {
        var t = document.getElementById(o).getElementsByTagName("tr");
        for (var i = 1; i < t.length; i++) {
            t[i].style.backgroundColor = (t[i].sectionRowIndex % 2 == 0) ? a : b;
            t[i].onmouseover = function() {
                if (this.x != "1") this.style.backgroundColor = c;
            }
            t[i].onmouseout = function() {
                if (this.x != "1") this.style.backgroundColor = (this.sectionRowIndex % 2 == 0) ? a : b;
            }
        }
    }

    function Fun_Search_Product(aa) 
    {
        var fieldText = "";
        var msgText = "";
        var isFlag = true;
        ProdNo = document.getElementById("txt_ProdNO").value;
        ProdName = document.getElementById("txt_ProdName").value;
        PYShort = document.getElementById("txt_PYShort").value;
        typeid = document.getElementById("hf_typeid").value;
        bigtype=document.getElementById("hf_bigtype").value;
        Specification = document.getElementById("txt_Specification").value;
        Manufacturer = document.getElementById("txt_Manufacturer").value;
        FromAddr = document.getElementById("txt_FromAddr").value;
        Material = document.getElementById("ProductInfoControl12_sel_Material").value;
        StartStorage = document.getElementById("txt_StartStorage").value;
        EndStorage = document.getElementById("txt_EndStorage").value;
        var RetVal = CheckSpecialWords();
        if (RetVal != "") {
            isFlag = false;
            fieldText = fieldText + RetVal + "|";
            msgText = msgText + RetVal + "不能含有特殊字符|";
        }
        if (StartStorage.length > 0) {
            if (!IsNumericFH(StartStorage, 15, 15)) {
                isFlag = false;
                fieldText += "开始数量|";
                msgText += "开始数量必须是数字格式|";
            }
        }
        if (EndStorage.length > 0) {
            if (!IsNumericFH(EndStorage, 15, 15)) {
                isFlag = false;
                fieldText += "结束数量|";
                msgText += "结束数量必须是数字格式|";
            }
        }
        if (StartStorage.length > 0 && EndStorage.length > 0) 
        {
            if (parseFloat(StartStorage) > parseFloat(EndStorage)) 
            {
                isFlag = false;
                fieldText += "库存查询范围|";
                msgText += "开始数量不能大于结束数量|";
            }
        }
        if (!CheckSpecification(Specification)) {
            isFlag = false;
            fieldText = "规格型号|";
            msgText = msgText + "不能含有特殊字符|";
        }
        
        var tmpSpecification = '';

        /*处理规格型号*/
        for (var i = 0; i < Specification.length; i++) 
        {
            if (Specification.charAt(i) == '+') {
                tmpSpecification = tmpSpecification + '＋';
            }
            else {
                tmpSpecification = tmpSpecification + Specification.charAt(i);
            }
        }

        Specification = tmpSpecification;  
        if (!isFlag) 
        {
            popMsgObj.Show(fieldText, msgText);
            return;
        }
        search = "1";
        TurnToPageProduct(1)
    }

    function Ifshowproduct(count) 
    {
        if (count == "0") {
            document.getElementById('divpageProduct').style.display = "none";
            document.getElementById("pagecountProduct").style.display = "none";
        }
        else {
            document.getElementById("divpageProduct").style.display = "block";
            document.getElementById("pagecountProduct").style.display = "block";
        }
    }
    function SelectDept(retval) {
        alert(retval);
    }

    //改变每页记录数及跳至页数
    function ChangePageCountIndexProduct(newPageCount, newPageIndex) {
        if (!IsZint(newPageCount)) {
            popMsgObj.ShowMsg('显示条数格式不对，必须是正整数！');
            return;
        }
        if (!IsZint(newPageIndex)) {
            popMsgObj.ShowMsg('跳转页数格式不对，必须是正整数！');
            return;
        }
        if (newPageCount <= 0 || newPageIndex <= 0 || newPageIndex > ((totalRecord - 1) / newPageCount) + 1) {
            popMsgObj.ShowMsg('转到页数超出查询范围！');
            return false;
        }
        else {
            this.pageCountproduct = parseInt(newPageCount);
            TurnToPageProduct(parseInt(newPageIndex));
            document.getElementById("btnProductAll").checked = false;
        }
    }

    //排序
    function OrderByProduct(orderColum, orderTip) {
        var ordering = "a";
        //var orderTipDOM = $("#"+orderTip);
        var allOrderTipDOM = $(".orderTip");
        if ($("#" + orderTip).html() == "↓") {
            allOrderTipDOM.empty();
            $("#" + orderTip).html("↑");
        }
        else {
            ordering = "d";
            allOrderTipDOM.empty();
            $("#" + orderTip).html("↓");
        }
        orderByP = orderColum + "_" + ordering;
        TurnToPageProduct(1);
    }

    function ClearProductInfo() 
    {
        if (typeof (popTechObj.CleraHidden) != "undefined") {
            document.getElementById(popTechObj.CleraHidden).value = "";
        }
        if (typeof (popTechObj.CleraInput) != "undefined") {
            document.getElementById(popTechObj.CleraInput).value = "";
            document.getElementById(popTechObj.CleraInput).title = "";
        }
        closeProductdiv();
    }
 
    function closeProductdiv() 
    {
        document.getElementById("divStorageProduct").style.display = "none";
        document.getElementById("txt_ProdNO").value = "";
        document.getElementById("txt_ProdName").value = "";
        document.getElementById("txt_PYShort").value = "";
        document.getElementById("hf_typeid").value = "";
        document.getElementById("txt_Specification").value = "";
        document.getElementById("txt_Manufacturer").value = "";
        document.getElementById("txt_FromAddr").value = "";
        document.getElementById("ProductInfoControl12_sel_Material").value = "0";
        document.getElementById("txt_StartStorage").value = "";
        document.getElementById("txt_EndStorage").value = "";
        var ProductBigDiv = document.getElementById("ProductBigDiv");
        var divStorageProduct = document.getElementById("divStorageProduct");
        document.body.removeChild(ProductBigDiv);
        divStorageProduct.style.display = "none";
        document.getElementById('divzhezhao1').style.display = 'none';
    }

    function AlertProductMsg() 
    {
        /**第一步：创建DIV遮罩层。*/
        var sWidth, sHeight;
        sWidth = window.screen.availWidth;
        //屏幕可用工作区高度： window.screen.availHeight;
        //屏幕可用工作区宽度： window.screen.availWidth;
        //网页正文全文宽：     document.body.scrollWidth;
        //网页正文全文高：     document.body.scrollHeight;
        if (window.screen.availHeight > document.body.scrollHeight) {  //当高度少于一屏
            sHeight = window.screen.availHeight;
        } else {//当高度大于一屏
            sHeight = document.body.scrollHeight;
        }
        //创建遮罩背景
        var maskObj = document.createElement("div");
        maskObj.setAttribute('id', 'ProductBigDiv');
        maskObj.style.position = "absolute";
        maskObj.style.top = "0";
        maskObj.style.left = "0";
        maskObj.style.background = "#fff";
        maskObj.style.filter = "Alpha(opacity=70);";
        maskObj.style.opacity = "0.3";
        maskObj.style.width = sWidth + "px";
        maskObj.style.height = sHeight + "px";
        maskObj.style.zIndex = "100";
        document.body.appendChild(maskObj);
    }
    function OptionCheckAll1() 
    {
        if (document.getElementById("btnProductAll").checked) 
        {
            var ck = document.getElementsByName("CheckboxProdID");
            for (var i = 0; i < ck.length; i++) 
            {
                ck[i].checked = true;
            }
        }
        else if (!document.getElementById("btnProductAll").checked) 
        {
            var ck = document.getElementsByName("CheckboxProdID");
            for (var i = 0; i < ck.length; i++) {
                ck[i].checked = false;
            }
        }
    }
    function SelectedNodeChanged1(code_text, type_code) 
    {
        document.getElementById("hf_typeid").value = type_code;
        document.getElementById("txt_TypeID").value = code_text;
        hideUserList();
    }
    function SelectedNodeChanged2(code_text, type_code) {
        document.getElementById("hf_bigtype").value="";
        document.getElementById("hf_typeid").value = type_code;     
//        document.getElementById("txt_TypeID").value = code_text;
        Fun_Search_Product();
    }
    function SelectedNodeChanged3(code_text, type_code) {
        document.getElementById("hf_typeid").value ="";
        document.getElementById("hf_bigtype").value = type_code;
        Fun_Search_Product();
    }
    function hidetxtUserList() 
    {
        hideUserList();
        document.getElementById("txt_TypeID").value = "";
        document.getElementById("hf_typeid").value = "";
    }

    function getChildNodes(nodeTable) 
    {
        if (nodeTable.nextSibling == null)
            return [];
        var nodes = nodeTable.nextSibling;

        if (nodes.tagName == "DIV") {
            return nodes.childNodes; //return childnodes's nodeTables;
        }
        return [];
    }
    function showUserList() 
    {
        var list = document.getElementById("Product_List");

        if (list.style.display != "none") {
            list.style.display = "none";
            return;
        }

        var pos = elePos(document.getElementById("txt_TypeID"));

        list.style.left = pos.x;
        list.style.top = pos.y + 20;
        document.getElementById("Product_List").style.display = "block";
        document.getElementById("Product_List").style.top = pos.y - 60;
        document.getElementById("Product_List").style.left = pos.x + 60;
    }
    function elePos(et) 
    {

        var left = -140;
        var top = -145;
        while (et.offsetParent) 
        {
            left += et.offsetLeft;
            top += et.offsetTop;
            et = et.offsetParent;
        }
        left += et.offsetLeft;
        top += et.offsetTop;
        return { x: left, y: top };
    }

    function hideUserList() {
        document.getElementById("Product_List").style.display = "none";
    }


    /*控件居中
    *objID 需要居中的控件 ID名称 
    *div中的样式 top: 30%; left: 40%; margin: 5px 0 0 -400px;" 需删除
    *isPercent 表示 该控件 定义的高度是百分比（true） 还是数值（fasle）
    *必须在控件显示之后调用该方法
    *by pdd
    */
 
    function PCenterToDocument(objID, isPercent) 
    {
        var obj = document.getElementById(objID);
        /*定义位置*/
        var _top = 0;
        var _left = 0;
        var objWidth = 0, objHeight = 0;

        //获取滚动条滚动的长度
        var scrollLength = PgetScrollTop();
        /*获取控件尺寸*/
        if (isPercent) 
        {
            objWidth = obj.style.width.replace("px", "") == "" ? 0 : PPercentToFloat(obj.style.width);
            //  objHeight=obj.style.height.replace("px","")==""?0:PercentToFloat(obj.style.height); 
        }
        else 
        {
            objWidth = obj.style.width.replace("px", "") == "" ? 0 : obj.style.width.replace("px", "");
        }
        objHeight = obj.offsetHeight == "" ? 0 : obj.offsetHeight;

        /*定义文档尺寸*/
        var docWidth = 0, docHight = 0;

        /*获取当前文档尺寸*/
        if (document.documentElement.clientHeight > document.body.scrollHeight) {
            //有垂直滚动条
            docWidth = parseInt(document.documentElement.scrollWidth);
            //docHight=parseInt(document.documentElement.clientHeight);
        }
        else {
            //无垂直滚动条
            docWidth = parseInt(document.documentElement.scrollWidth);
            //docHight=parseInt( document.documentElement.scrollHeight);
        }
        
        docHight = parseInt(document.documentElement.clientHeight);
        /*设置位置*/
        if (isPercent) 
        {
            /*定义的控件尺寸为百分比*/
            //_top=docHight*(1-(objHeight==0?0.3:objHeight))/2;
            _left = docWidth * (1 - (objWidth == 0 ? 0.3 : objWidth)) / 2;
        }
        else {
            /*定义的控件尺寸为数值*/

            _left = (docWidth - (objWidth == 0 ? 100 : objWidth)) / 2;
        }
        _top = (docHight - (objHeight == 0 ? 200 : objHeight)) / 3;
        //alert(_top+","+_left+","+scrollLength+","+objHeight);
        obj.style.bottom = "0px";
        obj.style.left = "12px";
    }

    /*
    *设置浮点数百分比格式
    *使用前需要的num 做验证
    *num 需要格式的数字 默认 2位
    * PDD
    */
    function PFormatPercent(num) 
    {
        var tmp = parseFloat(num * 100);
        return tmp.toFixed(2) + "%";
    }

    /*将百分数转化成浮点 4位有效数字 需自己对参数进行验证 PDD*/
    function PPercentToFloat(str) 
    {
        if (str == "")
            return "";
        var tmp = str.replace("%", "");
        return parseFloat(parseFloat(tmp) / 100).toFixed(4);
    }
    /********************
    * 取窗口滚动条高度 
    ******************/

    function PgetScrollTop() 
    {
        var scrollTop = 0;
        if (document.documentElement && document.documentElement.scrollTop) 
        {
            scrollTop = document.documentElement.scrollTop;
        }
        else if (document.body) {
            scrollTop = document.body.scrollTop;
        }
        return scrollTop;
    }


    /********************
    * 取窗口可视范围的高度 
    *******************/
    function PgetClientHeight() {
        var clientHeight = 0;
        if (document.body.clientHeight && document.documentElement.clientHeight) {
            var clientHeight = (document.body.clientHeight < document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight;
        }
        else {
            var clientHeight = (document.body.clientHeight > document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight;
        }
        return clientHeight;
    }

    /********************
    * 取文档内容实际高度 
    *******************/

    function PgetScrollHeight() 
    {
        return Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
    }
    
    /*验证规格只允许+和*特殊字符可以输入*/
    function CheckSpecification(str) 
    {
        var SpWord = new Array("'", "\\", "<", ">", "%", "?", "/"); //可以继续添加特殊字符 此 /  字符也不可输入 输出时会破坏JSON格式
        for (var i = 0; i < SpWord.length; i++) {
            for (var j = 0; j < str.length; j++) {
                if (SpWord[i] == str.charAt(j)) {
                    return false;
                    break;
                }
            }
        }
        return true;
    }
    document.onkeydown = function(e)
    //function document.onkeydown() 
    {     
        var theEvent= window.event || e;
        if(theEvent.keyCode == 13)
        {            
            Fun_Search_Product();
            theEvent.returnValue = false;
        } 
    }
</script>


