﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ExpensesApplyList.ascx.cs" Inherits="UserControl_Personal_ExpensesApplyList" %>

<div id="divExpApplyList">
    <a name="pageExpApplyMark"></a>
    <!--提示信息弹出详情start-->
    <div id="divExpApplyListSelect" style="border: solid 10px #93BCDD; background: #fff;
        padding: 10px; width: 800px; z-index: 20; position: absolute; display: none;
        top: 20%; left: 50%; margin: 5px 0 0 -400px;">
        <table width="99%" border="0" align="center" cellpadding="0" id="Table1" cellspacing="0"
            bgcolor="#CCCCCC">
            <tr>
                <td bgcolor="#FFFFFF">
                    <table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC"
                        class="table">
                        <tr class="table-item">
                            <td height="25" colspan="3" bgcolor="#E7E7E7" align="center" style="width: 50%;">
                                <img id="closed" runat="server" src="../../Images/Button/Bottom_btn_close.jpg" 
                                        alt="关闭" style="cursor:pointer; float:left;" onclick="closeExpApplyListdiv();" />
                            </td>
                            <td height="25" colspan="3" bgcolor="#E7E7E7" align="center" style="width: 50%;">
                                <img id="clear" runat="server" src="../../Images/Button/Bottom_btn_del.jpg" 
                                        alt="清除" style="cursor:pointer; float:left;" onclick="clearExpApplyList();" />
                            </td>
                        </tr>
                        <tr class="table-item">
                            <td width="13%" height="20" align="right" class="td_list_fields">
                                单据编号
                            </td>
                            <td width="20%" bgcolor="#FFFFFF">
                                <input id="HExpCode" type="text" style="width: 120px;" class="tdinput" maxlength="50" />
                            </td>
                            <td width="13%"  align="right" class="td_list_fields">
                                主题
                            </td>
                            <td width="20%" bgcolor="#FFFFFF">
                                <input id="HExpTitle" class="tdinput" maxlength="50" type="text" />
                            </td>
                            <td width="13%" height="20" align="right" class="td_list_fields">
                                经办人
                            </td>
                            <td width="20%" bgcolor="#FFFFFF">
                                <asp:DropDownList ID="UserTransactor" runat="server" Width="100px" AppendDataBoundItems="True">
                                    <asp:ListItem Selected="True" Value="">--请选择--</asp:ListItem>
                                </asp:DropDownList>
                                <%--<asp:TextBox ID="CustName" runat="server" class="tdinput" onkeyup="textchange(this)"></asp:TextBox>--%>
                            </td>
                        </tr>
                        <tr class="table-item">
                            <td width="13%" height="20" align="right" class="td_list_fields">
                                申请人
                            </td>
                            <td width="20%" bgcolor="#FFFFFF">
                                <asp:DropDownList ID="UserApplyor" runat="server" Width="120px" AppendDataBoundItems="True">
                                    <asp:ListItem Selected="True" Value="">--请选择--</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="td_list_fields" align="right">
                                日期
                            </td>
                            <td bgcolor="#FFFFFF">
                                <table cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                       <td style="width:50%">
                                            <input name="HAriseDate" style="width: 98%;" readonly="readonly" id="HAriseDate" class="tdinput"
                                                    type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',el:$dp.$('HAriseDate')})"/>
                                            <input type="hidden" id="hiddHAriseDate" runat="server" />
                                        </td>
                                        <td>
                                            至
                                        </td>
                                        <td style="width:50%">
                                            <input name="HAriseDate1" style="width: 98%;" readonly="readonly" id="HAriseDate1" class="tdinput"
                                                 type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',el:$dp.$('HAriseDate1')})"/>
                                            <input type="hidden" id="hiddHAriseDate1" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="13%"  align="right" class="td_list_fields">
                                单据状态
                            </td>
                            <td width="21%" bgcolor="#FFFFFF">
                                <select name="HStatus"  style="width: 120px;margin-top:2px;margin-left:2px;" id="HStatus">
                                            <option value="" selected="selected">--请选择--</option>
                                            <option value="1">制单</option>
                                            <option value="2">执行</option>
                                            <option value="3">作废</option>
                                 </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" align="center" bgcolor="#FFFFFF">
                                <input type="hidden" id="hiddSellSearchModel" value="all" />
                                <img alt="检索" src="../../../images/Button/Bottom_btn_search.jpg" style='cursor: pointer;'
                                    onclick='TurnToExpApplyAllPage(1)' />&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br />
        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" id="ExpApplyDataListAll"
            bgcolor="#999999">
            <tbody>
                <tr>
                    <th height="20" align="center" class="td_list_fields">
                        选择
                    </th>
                    <th align="center" class="td_list_fields">
                        <div class="orderClick" onclick="ExpApplyOrderBy('ExpCode','ExpCodeTip');return false;">
                            申请单编号<span id="ExpCodeTip" class="orderTip"></span></div>
                    </th>
                    <th align="center" class="td_list_fields">
                        <div class="orderClick" onclick="ExpApplyOrderBy('Title','TitleTip');return false;">
                            主题<span id="TitleTip" class="orderTip"></span></div>
                    </th>
                    <th align="center" class="td_list_fields">
                        <div class="orderClick" onclick="ExpApplyOrderBy('ApplyorName','ApplyorNameTip');return false;">
                            申请人<span id="ApplyorNameTip" class="orderTip"></span></div>
                    </th>
                    <th align="center" class="td_list_fields">
                        <div class="orderClick" onclick="ExpApplyOrderBy('AriseDate','AriseDateTip');return false;">
                            申请日期<span id="AriseDateTip" class="orderTip"></span></div>
                    </th>
                    <th align="center" class="td_list_fields">
                        <div class="orderClick" onclick="ExpApplyOrderBy('TotalAmount','TotalAmountTip');return false;">
                            申请金额<span id="TotalAmountTip" class="orderTip"></span></div>
                    </th>
                    <th align="center" class="td_list_fields">
                        <div class="orderClick" onclick="ExpApplyOrderBy('DeptName','DeptNameTip');return false;">
                            申请人部门<span id="DeptNameTip" class="orderTip"></span></div>
                    </th>
                    <th align="center" class="td_list_fields">
                        <div class="orderClick" onclick="ExpApplyOrderBy('TransactorName','TransactorNameTip');return false;">
                            经办人<span id="TransactorNameTip" class="orderTip"></span></div>
                    </th>
                    <th align="center" class="td_list_fields">
                        <div class="orderClick" onclick="ExpApplyOrderBy('Status','StatusTextTip');return false;">
                            单据状态<span id="StatusTextTip" class="orderTip"></span></div>
                    </th>
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
                                <div id="pageExpApplyCount"></div>
                            </td>
                            <td height="28" align="right">
                                <div id="pageExpApplyList_Pager1" class="jPagerBar">
                                </div>
                            </td>
                            <td height="28" align="right">
                                <div id="divOrderPage">
                                    <span id="pageOrderList_Total"></span>每页显示
                                    <input name="text" type="text" id="ShowExpApplyPageCount" style="width: 20px;" maxlength="3" />
                                    条 转到第
                                    <input name="text" type="text" style="width: 20px;" id="ExpApplyToPage" maxlength="7" />
                                    页
                                    <img src="../../../images/Button/Main_btn_GO.jpg" style='cursor: hand;' alt="go"
                                        width="36" height="28" align="absmiddle" onclick="ChangeExpApplyPageCountIndex($('#ShowExpApplyPageCount').val(),$('#ExpApplyToPage').val());" />
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

<script type="text/javascript">
    var popExpApplyListObj = new Object();
    popExpApplyListObj.InputObj = null;


    popExpApplyListObj.ShowList = function(objInput) {
        popExpApplyListObj.InputObj = objInput;
        ShowPreventReclickDiv();
        $("#HExpTitle").val('');
        $("#HExpCode").val('');
        $("#ExpensesApplyList1_UserTransactor").val('');
        $("#ExpensesApplyList1_UserApplyor").val('');
        $("#HAriseDate").val('');
        $("#HAriseDate1").val('');
        $("#HStatus").val('');
        $("#hiddSellSearchModel").val(objInput); //查询的模式，all是取出所有的，protion时取出所有执行状态的
        document.getElementById('divExpApplyListSelect').style.display = 'block';
        TurnToExpApplyAllPage(currentOrderPageIndex);
    }

    var pageExpApplyCount = 10; //每页计数
    var totalExpApplyRecord = 0;
    var pagerOrderStyle = "flickr"; //jPagerBar样式

    var currentOrderPageIndex = 1;
    var orderBy = ""; //排序字段
    //jQuery-ajax获取JSON数据
    function TurnToExpApplyAllPage(pageIndex) {
        if(!CheckInputUC())
        {
            return;
        }
        currentOrderPageIndex = pageIndex;
        var UserTransactor = $.trim($("#ExpensesApplyList1_UserTransactor").val());//经办人
        var UserApplyor = $.trim($("#ExpensesApplyList1_UserApplyor").val());//申请人
        var Title = $.trim($("#HExpTitle").val());//主题
        var ExpCode = $.trim($("#HExpCode").val());//单据编号
        var AriseDate = $("#HAriseDate").val();//申请日期
        var AriseDate1 = $("#HAriseDate1").val();
        var Status=$("#HStatus").val();//单据状态
        
        $.ajax({
            type: "POST", //用POST方式传输
            dataType: "json", //数据格式:JSON
            url: '../../../Handler/Personal/Expenses/ExpensesList.ashx', //目标地址
            cache: false,
            data: 'pageIndex=' + pageIndex + '&pageExpApplyCount=' + pageExpApplyCount + '&action=getHistoryExpList&orderBy=' + orderBy +
            '&Title=' + escape(Title) + '&ExpCode=' + escape(ExpCode) + '&TransactorID=' + escape(UserTransactor) + '&Applyor=' + escape(UserApplyor) +
            '&AriseDate=' + escape(AriseDate)+ '&AriseDate1=' + escape(AriseDate1)+'&Status='+escape(Status), //数据
            beforeSend: function() { $("#pageExpApplyList_Pager1").hide();}, //发送数据之前

            success: function(msg) {
                //数据获取完毕，填充页面据显示
                //数据列表
                $("#ExpApplyDataListAll tbody").find("tr.newrow").remove();
                $.each(msg.data, function(i, item) {
                    if (item.ID != null && item.ID != "") {
                        var ExpCode = item.ExpCode;
                        var Title = item.Title;
                        var ApplyorName = item.ApplyorName;
                        var AriseDate=item.AriseDate;
                        var TotalAmount=item.TotalAmount;
                        var DeptName=item.DeptName;
                        var TransactorName = item.TransactorName;
                        var Status=billStatusToStr(item.Status);
                        
                        if (Title != null) {
                            if (Title.length > 6) {
                                Title = Title.substring(0, 6) + '...';
                            }
                        }
                       
                        if (TransactorName != null) {
                            if (TransactorName.length > 6) {
                                TransactorName = TransactorName.substring(0, 6) + '...';
                            }
                        }
                        if (ApplyorName != null) {
                            if (ApplyorName.length > 6) {
                                ApplyorName = ApplyorName.substring(0, 6) + '...';
                            }
                        }
                        
                        $("<tr class='newrow'></tr>").append("<td height='22' align='center'>" + " <input type=\"radio\"  id=\"radioExpApply_" + item.ID + "\" value=\"" + item.ID + "\" onclick=\"fnSelectExpApplyList(" + item.ID + ",'" + item.ExpCode + "');\" name=\"radioExpApply\" />" + "</td>" +
                         "<td height='22' align='center'><span title=\"" + item.ExpCode + "\">" + ExpCode + "</td>" +
                         "<td height='22' align='center'><span title=\"" + item.Title + "\">" + Title + "</td>" +
                         "<td height='22' align='center'><span title=\"" + item.ApplyorName + "\">" + ApplyorName + "</td>" +
                         "<td height='22' align='center'><span title=\"" + item.AriseDate + "\">" + AriseDate + "</td>" +
                         "<td height='22' align='center'><span title=\"" + item.TotalAmount + "\">" + TotalAmount + "</td>"+
                         "<td height='22' align='center'><span title=\"" + item.DeptName + "\">" + DeptName + "</td>"+
                         "<td height='22' align='center'><span title=\"" + item.TransactorName + "\">" + TransactorName + "</td>" +
                         "<td height='22' align='center'><span title=\"" + item.Status  + "\">" + Status+ "</td>" ).appendTo($("#ExpApplyDataListAll tbody"));
                    }
                });
                //页码
                ShowPageBar("pageExpApplyList_Pager1", //[containerId]提供装载页码栏的容器标签的客户端ID
                   "<%= Request.Url.AbsolutePath %>", //[url]
                    {style: pagerOrderStyle
                    , mark: "pageExpApplyMark",
                    totalCount: msg.totalCount,
                    showPageNumber: 3,
                    pageCount: pageExpApplyCount,
                    currentPageIndex: pageIndex,
                    noRecordTip: "没有符合条件的记录",
                    preWord: "上页",
                    nextWord: "下页",
                    First: "首页",
                    End: "末页",
                    onclick: "TurnToExpApplyAllPage({pageindex});return false;"}//[attr]
                    );
                totalExpApplyRecord = msg.totalCount;
                $("#ShowExpApplyPageCount").val(pageExpApplyCount);
                ShowTotalPage(msg.totalCount, pageExpApplyCount, pageIndex, $("#pageExpApplyCount"));
                $("#ExpApplyToPage").val(pageIndex);
            },
            error: function() { },
            complete: function() { $("#pageExpApplyList_Pager1").show(); ExpApplyDataListAll("ExpApplyDataListAll", "#E7E7E7", "#FFFFFF", "#cfc", "cfc"); } //接收数据完毕
        });
    }
  //状态显示  
  function billStatusToStr(billStatus)
  {
    if(billStatus==1)
    {
        return "制单";
    }else if(billStatus==2)
    {
        return "执行";
    }else if(billStatus==4)
    {
        return "作废";
    }
  }
    //table行颜色
    function ExpApplyDataListAll(o, a, b, c, d) {
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
    function ChangeExpApplyPageCountIndex(newPageCount, newPageIndex) {
        var fieldText = "";
        var msgText = "";
        var isFlag = true;
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
            if (newPageCount <= 0 || newPageIndex <= 0 || newPageIndex > ((totalExpApplyRecord - 1) / newPageCount) + 1) {
                showPopup("../../../Images/Pic/Close.gif", "../../../Images/Pic/note.gif", "转到页数超出查询范围！");
                return false;
            }
            else {
                this.pageExpApplyCount = parseInt(newPageCount);
                TurnToExpApplyAllPage(parseInt(newPageIndex));
            }
        }
    }

    //排序
    function ExpApplyOrderBy(orderColum, orderTip) {
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
        orderBy = orderColum + "_" + ordering;
        TurnToExpApplyAllPage(1);
    }
    //关闭
    function closeExpApplyListdiv() {
        obj = document.getElementById("divPreventReclick");
        //隐藏遮挡的DIV
        if (obj != null && typeof (obj) != "undefined") obj.style.display = "none";
        document.getElementById("divExpApplyListSelect").style.display = "none";
    }
    //表单验证
    function CheckInputUC() {
        var fieldText = "";
        var isFlag = true;
        var msgText = "";

        var ReimbNo = $("#HExpCode").val();
        var HAriseDate = $("#HAriseDate").val(); //申请日期
        var HAriseDate1 = $("#HAriseDate1").val(); //申请日期
        var RetVal = CheckSpecialWords();
        if (RetVal != "") {
            isFlag = false;
            fieldText = fieldText + RetVal + "|";
            msgText = msgText + RetVal + "不能含有特殊字符|";
        }

        if (ReimbNo != '') {
            if (!CodeCheck(ReimbNo)) {
                isFlag = false;
                fieldText = fieldText + "费用申请单编号|";
                msgText = msgText + "编号只能由英文字母 (a-z大小写均可)、数字 (0-9)、字符（_-/.()[]{}）组成|";
            }
        }

        if (HAriseDate != '' && HAriseDate1 != '') {
            if (HAriseDate > HAriseDate1) {
                isFlag = false;
                fieldText = fieldText + "申请日期范围|";
                msgText = msgText + "申请日期范围输入错误|";
            }
        }
        if((HAriseDate=='' && HAriseDate1!='')||(HAriseDate!='' && HAriseDate1==''))
        {
            isFlag=false;
            fieldText=fieldText+"申请日期填写不完整|";
            msgText=msgText+"申请日期范围需填写完整|";
        }
        
        if (!isFlag) {
            //注：两个方法显示弹出提示信息层,方法一是对字段用红色处理，方法二是所有的提示信息传入未处理颜色

            //方法一
            popMsgObj.Show(fieldText, msgText);
            //方法二
            //popMsgObj.ShowMsg('所有的错误信息字符串');
        }
        return isFlag;
    }
</script>
