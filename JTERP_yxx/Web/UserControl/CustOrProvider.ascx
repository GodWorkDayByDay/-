﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CustOrProvider.ascx.cs" Inherits="UserControl_CustOrProvider" %>

<div id="sellModuleCust">
    <!--提示信息弹出详情start-->
    <a name="pageCustDataList1Mark"></a>
    <div id="divSellModuleCustSelect" style="border: solid 10px #93BCDD; background: #fff;
        padding: 10px; width: 700px; z-index: 21; position: absolute; display:none;
        top: 20%; left: 60%; margin: 5px 0 0 -400px;">
        <table width="99%" border="0" align="center" cellpadding="0" id="Table1" cellspacing="0"
            bgcolor="#CCCCCC">
            <tr>
                <td bgcolor="#FFFFFF">
                    <table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC"
                        class="table">
                        <tr class="table-item">
                            <td height="25" colspan="6" bgcolor="#E7E7E7" align="left" style="width: 50%;">
                             <img src="../../../Images/Button/Bottom_btn_close.jpg" alt="关闭" onclick="closeSellModuCustdiv()" />
                                
                                
                                <img src="../../../Images/Button/Main_btn_qk.jpg" alt="清空" onclick="ClearSellModuCustdiv()" />
                            
                               
                            </td>
                        </tr>
                        <tr class="table-item">
                            <td width="13%" height="20" align="right" class="td_list_fields">
                                往来单位编号
                            </td>
                            <td width="20%" bgcolor="#FFFFFF">
                                <input id="CustNoUC_1" type="text" style="width: 120px;" class="tdinput" maxlength="50" />
                            </td>
                            <td width="13%"  align="right" class="td_list_fields">
                                往来单位名称
                            </td>
                            <td width="20%" bgcolor="#FFFFFF">
                                <input id="CustNameUC_1" class="tdinput" maxlength="50" type="text" />
                            </td>
                            <td width="13%"  align="right" class="td_list_fields">
                            往来单位类型
                            </td>
                            <td width="21%" bgcolor="#FFFFFF">
                                <select ID="CustTypes" runat="server" onchange="SellCustTurnToPages1(1)" >
                                    <option value="2">供应商</option>
                                    <option value="1">客户</option>
                                    <%--<option value="2">外协加工厂</option>--%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" align="center" bgcolor="#FFFFFF">
                                <img alt="检索" src="../../../images/Button/Bottom_btn_search.jpg" style='cursor: pointer;'
                                    onclick='SellCustTurnToPages1(1)' />&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br />
        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" id="sellCustList"
            bgcolor="#999999">
            <tbody>
                <tr>
                    <th height="20" class="td_list_fields" align="center" >
                        选择
                    </th>
                    <th align="center" class="td_list_fields">
                        <div class="orderClick" onclick="SellCustOrderBy('CustNo','oSellCustUC');return false;">
                            单位编号<span id="oSellCustUC" class="orderTip"></span></div>
                    </th>
                    <th align="center" class="td_list_fields">
                        <div class="orderClick" onclick="SellCustOrderBy('CustName','oSCustUC1');return false;">
                            单位名称<span id="oSCustUC1" class="orderTip"></span></div>
                    </th>
                   <%-- <th align="center" class="td_list_fields">
                        <div class="orderClick" onclick="SellCustOrderBy('ArtiPerson','oSCustUC2');return false;">
                            法人代表<span id="oSCustUC2" class="orderTip"></span></div>
                    </th>
                    <th align="center" class="td_list_fields">
                        <div class="orderClick" onclick="SellCustOrderBy('CustNote','oSCustUC3');return false;">
                            单位简介<span id="oSCustUC3" class="orderTip"></span></div>
                    </th>
                    <th align="center" class="td_list_fields">
                        <div class="orderClick" onclick="SellCustOrderBy('Relation','oSCustUC4');return false;">
                            关系描述<span id="oSCustUC4" class="orderTip"></span></div>
                    </th>--%>
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
                            <td height="28" background="../../../images/Main/PageList_bg.jpg" width="28%">
                                <div id="pageSellCustcount">
                                </div>
                            </td>
                            <td height="28" align="right">
                                <div id="sellCustList_Pager" class="jPagerBar">
                                </div>
                            </td>
                            <td height="28" align="right">
                                <div id="divSellCustPage">
                                    <span id="pageSellCustList_Total"></span>每页显示
                                    <input name="text" type="text" style="width: 30px;" id="ShowSellCustPageCount" maxlength="3" />
                                    条 转到第
                                    <input name="text" type="text" style="width: 30px;" id="ToSellCustPage" maxlength="7" />
                                    页
                                    <img src="../../../images/Button/Main_btn_GO.jpg" style='cursor: hand;' alt="go"
                                        width="36" height="28" align="absmiddle" onclick="ChangeSellCustPageCountIndex($('#ShowSellCustPageCount').val(),$('#ToSellCustPage').val());" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br />
    </div>
    <!--提示信息弹出详情end-->
</div>

<script language="javascript">
    var popSellCustObj = new Object();
    popSellCustObj.SearchModel = 'protion'; //查询的模式，all是取出所有的客户，protion时取出所有启用的客户
    popSellCustObj.returnName = false;
    var custid="";
    var custname="";
    var tbname="";
    var file="";
    var type="";
    function fnSelectCust(id,cust,iscust)
    {
        if(custid==""&&custname=="")
        {
            alert("请求错误");
            return;
        }
        document.getElementById(custid).value=id;
        document.getElementById(custname).value=cust;
        if(iscust=="Yes")
        {
            if(tbname!="")
            {
                 document.getElementById(tbname).value="officedba.CustInfo";
            }
            if(file!="")
            {
                 document.getElementById(file).value="CustName";
            }
        }
        if(type!=""&&type!=undefined)
        {
            var thisvalue=document.getElementById("CustOrProvider1_CustTypes").value;
            if(thisvalue=="2")
            {
                thisvalue="5";
            }
            else
            {
                thisvalue=(parseInt(thisvalue)+1).toString();
            }
            
            document.getElementById(type).value=thisvalue;
        }
        closeSellModuCustdiv(); //关闭客户选择控件
    }
    function ClearSellModuCustdiv()
    {
         if(custid==""&&custname=="")
        {
            alert("请求错误");
            return;
        }
        document.getElementById(custid).value="";
        document.getElementById(custname).value="";
        closeSellModuCustdiv(); //关闭客户选择控件
    }
    popSellCustObj.ShowList = function(model,textcustid,textcustname,fromname,filename,gettype,custval) {
     
        if (model != null && typeof (model) != "undefined") {
            popSellCustObj.SearchModel = model;
        }
        
        if(custval!=null&&custval!=undefined)
        {
            document.getElementById("CustOrProvider1_CustTypes").value=custval;
        }
        
        custid=textcustid;
        custname=textcustname;
        tbname=fromname;
        file=filename;
        type=gettype;
        ShowPreventReclickDiv();
        $("#CustNoUC_1").val('');
        $("#CustNameUC_1").val('');//在这里可以进行判断
        document.getElementById('divSellModuleCustSelect').style.display = 'block';
        SellCustTurnToPages1(currentSellCustPageIndex);
    }

    var pageSellCustCount = 10; //每页计数
    var totalSellCustRecord = 0;
    var pagerSellCustStyle = "flickr"; //jPagerBar样式

    var currentSellCustPageIndex = 1;
    var actionSellCust = ""; //操作
    var orderSellCustBy = ""; //排序字段
    //jQuery-ajax获取JSON数据
    function SellCustTurnToPages1(pageIndex) {
         
        if(!CheckCustName())
        {
            return;
        }
        var Title = $("#CustNameUC_1").val();
        var OrderNo = $("#CustNoUC_1").val();
        
        var model = popSellCustObj.SearchModel;
        var CustType=null;
        try{
            //CustType=document.getElementById("CustOrProvider1$CustTypes").value;//
            CustType=document.getElementById("CustOrProvider1$CustTypes").value;//作用
        }catch(ex)
        {
             CustType=document.getElementById("CustOrProvider1_CustTypes").value;
        }
        currentSellCustPageIndex = pageIndex;
        $.ajax({
            type: "POST", //用POST方式传输
            dataType: "json", //数据格式:JSON
            url: '../../../Handler/Office/HumanManager/SellModuleSelectCustUC.ashx', //目标地址
            cache: false,
            data: "pageIndex=" + pageIndex + "&pageSellCustCount=" + pageSellCustCount + "&actionSellCust=getinfo&orderby=" + orderSellCustBy +
            "&Title=" + escape(Title) + "&orderNo=" + escape(OrderNo) + "&model=" + escape(model)+"&CustType="+escape(CustType),
            beforeSend: function() { $("#sellCustList_Pager").hide(); }, //发送数据之前

            success: function(msg) {
                //数据获取完毕，填充页面据显示
                //数据列表
                $("#sellCustList tbody").find("tr.newrow").remove();
                $.each(msg.data, function(i, item) {
                    if (item.ID != null && item.ID != "") {
                        var OrderNo = item.CustNo;
                        var Title = item.CustName;
                        var ArtiPerson=item.ArtiPerson;
                        var CustNote=item.CustNote;
                        var Relation=item.Relation;
                        if (Title != null) {
                            if (Title.length > 10) {
                                Title = Title.substring(0, 10) + '...';
                            }
                        }
                        if (OrderNo != null) {
                            if (OrderNo.length > 15) {
                                OrderNo = OrderNo.substring(0, 15) + '...';
                            }
                        }
                        if(ArtiPerson != null)
                        {
                          if(ArtiPerson.length > 10){
                            ArtiPerson = ArtiPerson.substring(0,10) + '...';
                            }
                        }
                        if(CustNote != null)
                        {
                          if(CustNote.length>20){
                              CustNote = CustNote.substring(0,20) + '...'; 
                              }            
                        }
                        if(Relation != null)
                        {
                           if(Relation.length > 15)
                             Relation = Relation.substring(0,15) + '...';
                        }
                        var istrue="";
                        if(CustType=="0")
                        {
                            istrue="Yes";
                        }
                        else
                        {
                            istrue="No";
                        }
                        var clickhandler = "fnSelectCust(" + item.ID + ",'"+item.CustName+"','"+istrue+"');";
                        if (popSellCustObj.returnName) {
                            clickhandler = "fnSelectCust(" + item.ID + ",'" + item.CustName + "','"+istrue+"');";
                        }

                        $("<tr class='newrow'></tr>").append("<td height='22' align='center'>" + " <input type=\"radio\" name=\"radioCust\" id=\"radioCust_" + item.ID + "\" value=\"" + item.ID + "\" onclick=\""+clickhandler+"\"/>" + "</td>" +
                         "<td height='22' align='center'><span title=\"" + item.CustNo + "\">" + OrderNo + "</td>" +
                         "<td height='22' align='center'><span title=\"" + item.CustName + "\">" + Title + "</td>").appendTo($("#sellCustList tbody"));
                    }
                });
                //页码
                ShowPageBar("sellCustList_Pager", //[containerId]提供装载页码栏的容器标签的客户端ID
                    "<%= Request.Url.AbsolutePath %>", //[url]
                    {style: pagerSellCustStyle, mark: "pageCustDataList1Mark",
                    totalCount: msg.totalCount,
                    showPageNumber: 3,
                    pageCount: pageSellCustCount,
                    currentPageIndex: pageIndex,
                    noRecordTip: "没有符合条件的记录",
                    preWord: "上页",
                    nextWord: "下页",
                    First: "首页",
                    End: "末页",
                    onclick: "SellCustTurnToPages1({pageindex});return false;"}//[attr]
                    );
                totalSellCustRecord = msg.totalCount;
                $("#ShowSellCustPageCount").val(pageSellCustCount);
                ShowTotalPage(msg.totalCount, pageSellCustCount, pageIndex, $("#pageSellCustcount"));
                $("#ToSellCustPage").val(pageIndex);
            },
            error: function() { },
            complete: function() { $("#sellCustList_Pager").show(); pageSellCustDataList1("sellCustList", "#E7E7E7", "#FFFFFF", "#cfc", "cfc"); } //接收数据完毕
        });
    }
    //table行颜色
    function pageSellCustDataList1(o, a, b, c, d) {
        var t = document.getElementById(o).getElementsByTagName("tr");
        for (var i = 0; i < t.length; i++) {
            t[i].style.backgroundColor = (t[i].sectionRowIndex % 2 == 0) ? a : b;
            t[i].onmouseover = function() {
                if (this.x != "1") this.style.backgroundColor = c;
            }
            t[i].onmouseout = function() {
                if (this.x != "1") this.style.backgroundColor = (this.sectionRowIndex % 2 == 0) ? a : b;
            }
        }
    }


    //改变每页记录数及跳至页数
    function ChangeSellCustPageCountIndex(newPageCount, newPageIndex) {
        var fieldText = "";
        var msgText = "";
        var isFlag = true;
        $("#checkall").removeAttr("checked")
        if (!IsNumber(newPageIndex) || newPageIndex == 0) {
            isFlag = false;
            fieldText = fieldText + "跳转页面|";
            msgText = msgText + "必须为正整数格式|";
        }
        if (!IsNumber(newPageCount) || newPageCount == 0) {
            isFlag = false;
            fieldText = fieldText + "每页显示|";
            msgText = msgText + "必须为正整数格式|";
        }
        if (!isFlag) {
            popMsgObj.Show(fieldText, msgText);
        }
        else {
            if (newPageCount <= 0 || newPageIndex <= 0 || newPageIndex > ((totalSellCustRecord - 1) / newPageCount) + 1) {
                showPopup("../../../Images/Pic/Close.gif", "../../../Images/Pic/note.gif", "转到页数超出查询范围！");
                return false;
            }
            else {
                this.pageSellCustCount = parseInt(newPageCount);
                SellCustTurnToPages1(parseInt(newPageIndex));
            }
        }
    }
    //排序
    function SellCustOrderBy(orderColum, orderTip) {
        var ordering = "d";
        var orderTipDOM = $("#" + orderTip);
        var allOrderTipDOM = $(".orderTip");
        if ($("#" + orderTip).html() == "↓") {
            ordering = "a";
            allOrderTipDOM.empty();
            $("#" + orderTip).html("↑");
        }
        else {

            allOrderTipDOM.empty();
            $("#" + orderTip).html("↓");
        }
        orderSellCustBy = orderColum + "_" + ordering;
        SellCustTurnToPages1(1);
    }

    function closeSellModuCustdiv() {
        obj = document.getElementById("divPreventReclick");
        //隐藏遮挡的DIV
        if (obj != null && typeof (obj) != "undefined") obj.style.display = "none";
        document.getElementById("divSellModuleCustSelect").style.display = "none";
    }
    //主表单验证
function CheckCustName()
{
    var fieldText = "";
    var msgText = "";
    var isFlag = true;
    
    var txtUcCustNo = document.getElementById('CustNoUC_1').value;//客户编号
    var txtUcCustName = document.getElementById('CustNameUC_1').value;//客户名称
    

    if(txtUcCustNo.length>0 && txtUcCustNo.match(/^[A-Za-z0-9_]+$/) == null)
    {
        isFlag = false;       
	    msgText = msgText + "客户编号输入不正确|";
    }    
    if(txtUcCustName.length>0 && ValidText(txtUcCustName) == false)
    {
        isFlag = false;       
	    msgText = msgText + "客户名称输入不正确|";
    }  
    
    if(!isFlag)
    {
        showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif",msgText);        
    }
    return isFlag;
}

</script>