﻿/* 分页相关变量定义 */  

var pageCount = 10;//每页显示记录数
var totalRecord = 0;//总记录数
var pagerStyle = "flickr";//jPagerBar样式
var currentPageIndex = 1;//当前页
var orderBy = "";//排序字段
var deleFlag = "0";//删除标识

$(document).ready(function()
{
      requestobj = GetRequest();
      var flag = requestobj['Flag'];
    if (flag=="1")
    {
        //编号
        $("#txtEmplApplyNo").val(requestobj['EmplApplyNo']);
        //申请人
        $("#UserApply").val(requestobj['ApplyName']);
        $("#hidApplyID").val(requestobj['ApplyID']);
        //申请日期
        $("#txtApplyDate").val(requestobj['ApplyDate']);
         $("#txtApplyToDate").val(requestobj['ApplyToDate']);
        //审批状态
        $("#ddlFlowStatus").val(requestobj['FlowStatus']);

        //获取当前页
       var pageIndex = requestobj['PageIndex'];
        //获取每页显示记录数 
        pageCount = requestobj['PageCount'];
        //执行查询
        DoSearch(pageIndex);
    }
 });
/*
* 查询
*/
function DoSearch(currPage)
{
    var search = "";
    //申请编号
    search += "EmplApplyNo=" + document.getElementById("txtEmplApplyNo").value;
    //申请人
    search += "&ApplyID=" + document.getElementById("hidApplyID").value;
    search += "&ApplyName=" + document.getElementById("UserApply").value;
    //申请日期
    search += "&ApplyDate=" + document.getElementById("txtApplyDate").value;
    search += "&ApplyToDate=" + document.getElementById("txtApplyToDate").value;
    //审批状态
    search += "&FlowStatus=" + document.getElementById("ddlFlowStatus").value;
    //设置检索条件
    document.getElementById("hidSearchCondition").value = search;
    if (currPage == null || typeof(currPage) == "undefined")
    {
        TurnToPage(1);
    }
    else
    {
        TurnToPage(parseInt(currPage, 10));
    }
}

/*
* 重置页面
*/
function ClearInput()
{
    //申请编号
    document.getElementById("txtEmplApplyNo").value = "";
    //申请人
    document.getElementById("hidApplyID").value = "";
    document.getElementById("UserApply").value = "";
    //申请日期
    document.getElementById("txtApplyDate").value = "";
    //审批状态
    document.getElementById("ddlFlowStatus").value = "";
}

/*
* 改页显示
*/
function ChangePageCountIndex(newPageCount, newPageIndex)
{
    //判断是否是数字
    if (!IsNumber(newPageCount))
    {
        popMsgObj.ShowMsg('请输入正确的显示条数！');
        return;
    }
    if (!IsNumber(newPageIndex))
    {
        popMsgObj.ShowMsg('请输入正确的转到页数！');
        return;
    }
    //判断重置的页数是否超过最大页数
    if(newPageCount <=0 || newPageIndex <= 0 || newPageIndex > ((totalRecord - 1)/newPageCount) + 1)
    {
        popMsgObj.ShowMsg('转至页数超出查询范围！');
    }
    else
    {
        //设置每页显示记录数
        this.pageCount = parseInt(newPageCount, 10);
        //显示页面数据
        TurnToPage(parseInt(newPageIndex, 10));
    }
}


/*
* 翻页处理
*/
function TurnToPage(pageIndex)
{
    var fieldText = "";
        var msgText = "";

        var RetVal=CheckSpecialWords();
        if(RetVal!="")
        {
                fieldText = fieldText + RetVal+"|";
	            msgText = msgText +RetVal+  "不能含有特殊字符|";
	            popMsgObj.Show(fieldText,msgText);
	            return;
        } 
    //设置全选按钮为非选中状态
    document.getElementById("chkCheckAll").checked = false;
    //设置当前页
    currentPageIndex = pageIndex;
    //获取查询条件
    var searchCondition = document.getElementById("hidSearchCondition").value;
    //设置动作种类
    var action="GetInfo";
    var postParam = "PageIndex=" + pageIndex + "&PageCount=" + pageCount + "&Action=" + action + "&OrderBy=" + orderBy + "&" + searchCondition;
    //进行查询获取数据
    $.ajax({
        type: "POST",//用POST方式传输
        url:  '../../../Handler/Office/HumanManager/EmplApply_Query.ashx?' + postParam,//目标地址
        dataType:"json",//数据格式:JSON
        cache:false,
        beforeSend:function()
        {
            AddPop();
        },//发送数据之前
        success: function(msg)
        {
            //数据获取完毕，填充页面据显示
            //数据列表
            $("#tblDetailInfo tbody").find("tr.newrow").remove();
            $.each(msg.data
                ,function(i,item)
                {
                    if(item.ID != null && item.ID != "")
                    {
                        var StatusName=item.FlowStatusName;
                        $("<tr class='newrow'></tr>").append("<td height='22' align='center'>"
                            + "<input id='chkSelect' name='chkSelect' value='" + item.EmplApplyNo + "'  type='checkbox' onclick=\"SetCheckAll(this, 'chkSelect', 'chkCheckAll');\" />" + "</td>" //选择框
                            + "<td height='22' align='center'><a href='" + GetLinkParam() + "&ID=" + item.ID + "&StatusName="+StatusName+"')>" + item.EmplApplyNo + "</a></td>" //申请编号
                            + "<td height='22' align='center'>" + item.EmployeeName + "</td>" //申请人
                            + "<td height='22' align='center'>" + item.ApplyDate + "</td>" //申请时间
                            + "<td height='22' align='center'>" + item.NowDeptName + "</td>" //目前部门
                            + "<td height='22' align='center'>" + item.NowQuarterName + "</td>" //目前岗位
                            + "<td height='22' align='center'>" + item.NowAdminLevelName + "</td>" //目前岗位职等
                            + "<td height='22' align='center'>" + item.HopeDate + "</td>"  //希望调职日期 
                            + "<td height='22' align='center'>" + item.NewDeptName + "</td>"  //调至部门 
                            + "<td height='22' align='center'>" + item.NewQuarterName + "</td>" //调至岗位
                            + "<td height='22' align='center'>" + item.NewAdminLevelName + "</td>" //调至岗位职等
                            + "<td height='22' align='center'>" + item.FlowStatusName + "</td>").appendTo($("#tblDetailInfo tbody")//审批状态
                   
                    );}
            });
            //页码
            ShowPageBar(
                "divPageClickInfo",//[containerId]提供装载页码栏的容器标签的客户端ID
                "<%= Request.Url.AbsolutePath %>",//[url]
                {
                    style:pagerStyle,mark:"DetailListMark",
                    totalCount:msg.totalCount,
                    showPageNumber:3,
                    pageCount:pageCount,
                    currentPageIndex:pageIndex,
                    noRecordTip:"没有符合条件的记录",
                    preWord:"上一页",
                    nextWord:"下一页",
                    First:"首页",
                    End:"末页",
                    onclick:"TurnToPage({pageindex});return false;"
                }
            );
            totalRecord = msg.totalCount;
            $("#txtShowPageCount").val(pageCount);
            ShowTotalPage(msg.totalCount, pageCount, pageIndex,$("#pagecount"));
            $("#txtToPage").val(pageIndex);
        },
        error: function() 
        {
            popMsgObj.ShowMsg('请求发生错误！');
        },
        complete:function(){
            if (deleFlag == "0")
            {
                hidePopup();
            }
            else
            {
                deleFlag = "0";
            }
            $("#divPageClickInfo").show();
            SetTableRowColor("tblDetailInfo","#E7E7E7","#FFFFFF","#cfc","cfc");
        }
    });
}

/*
* 设置数据明细表的行颜色
*/
function SetTableRowColor(elem,colora,colorb, colorc, colord){
    //获取DIV中 行数据
    var tableTr = document.getElementById(elem).getElementsByTagName("tr");
    for(var i = 1; i < tableTr.length; i++)
    {
        //设置行颜色
        tableTr[i].style.backgroundColor = (tableTr[i].sectionRowIndex%2 == 0) ? colora:colorb;
        //设置鼠标落在行上时的颜色
        tableTr[i].onmouseover = function()
        {
            if(this.x != "1") this.style.backgroundColor = colorc;
        }
        //设置鼠标离开行时的颜色
        tableTr[i].onmouseout = function()
        {
            if(this.x != "1") this.style.backgroundColor = (this.sectionRowIndex%2 == 0) ? colora:colorb;
        }
    }
}

/*
* 排序处理
*/
function OrderBy(orderColum,orderTip)
{
    var ordering = "a";
    //var orderTipDOM = $("#"+orderTip);
    var allOrderTipDOM  = $(".orderTip");
    if( $("#"+orderTip).html()=="↓")
    {
         allOrderTipDOM.empty();
         $("#"+orderTip).html("↑");
    }
    else
    {
        ordering = "d";
        allOrderTipDOM.empty();
        $("#"+orderTip).html("↓");
    }
    orderBy = orderColum+"_"+ordering;
    //获取查询条件
    var searchCondition = document.getElementById("hidSearchCondition").value;
    if (searchCondition == null || searchCondition == "") return;
    TurnToPage(1);
}

/*
* 删除招聘申请信息
*/
function DoDelete()
{
    //定义删除动作变量
    var action="del";
    //获取选择框
    var chkList = document.getElementsByName("chkSelect");
    var chkValue = "";    
    for( var i = 0; i < chkList.length; i++ )
    {
        //判断选择框是否是选中的
        if ( chkList[i].checked )
        {
           chkValue += "'" + chkList[i].value + "',";
        }
    }
    var deleteNos = chkValue.substring(0, chkValue.length - 1);
    selectLength = chkValue.split("',");
    if(chkValue == "" || chkValue == null || selectLength.length < 1)
    {
        showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif","请至少选择一项删除！");
        return;
    }
    else
    {
        
        if(!confirm("删除后将不可恢复，确认删除吗！"))
        {
            return;
        }
        var postParam = "Action=" + action + "&DeleteNOs=" + escape(deleteNos);
        //删除
        $.ajax(
        { 
            type: "POST",
            url: "../../../Handler/Office/HumanManager/EmplApply_Query.ashx?" + postParam,
            dataType:'json',//返回json格式数据
            cache:false,
            beforeSend:function()
            {  
                AddPop();
            },
            error: function() 
            {
                showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif","请求发生错误！");
            }, 
            success:function(data) 
            {  
                deleFlag = "1";
                if(data.sta==1) 
                { 
                    TurnToPage(1);
                    hidePopup();
                    showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif","删除成功！");
                }
                else if(data.sta==0)
                {
                    showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif","删除失败！");
                } 
                else if(data.sta==2)
                {
                    showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif","已提交审批的单据不能删除！");
                } 
            } 
        });
    }
}
/*
* 新建
*/
function DoNew()
{
    window.location.href = GetLinkParam();
}

/*
* 获取链接的参数
*/
function GetLinkParam()
{
    //获取模块功能ID
    var ModuleID = document.getElementById("hidModuleID").value;
    //获取查询条件
    searchCondition = document.getElementById("hidSearchCondition").value;
    //是否点击了查询标识
    var flag = "0";//默认为未点击查询的时候
    if (searchCondition != "") flag = "1";//设置了查询条件时
    linkParam = "EmplApply_Edit.aspx?ModuleID=" + ModuleID 
                            + "&PageIndex=" + currentPageIndex + "&PageCount=" + pageCount + "&" + searchCondition + "&Flag=" + flag;
    //返回链接的字符串
    return linkParam;
}
/*
* 导出
*/
function DoExport()
{
    alert("该功能还未完成！");
}