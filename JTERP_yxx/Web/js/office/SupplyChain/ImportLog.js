﻿$(document).ready(function(){
    });    
    var pageCount = 10;//每页计数
    var totalRecord = 0;
    var pagerStyle = "flickr";//jPagerBar样式
    var currentPageIndex = 1;
    var action = "";//操作
    var orderBy = "";//排序字段
    //jQuery-ajax获取JSON数据
    function openwindow(url,name,iWidth,iHeight)
     {
      var url;                                 //转向网页的地址;
      var name;                           //网页名称，可为空;
      var iWidth;                          //弹出窗口的宽度;
      var iHeight;                        //弹出窗口的高度;
      var iTop = (window.screen.availHeight-30-iHeight)/2;       //获得窗口的垂直位置;
      var iLeft = (window.screen.availWidth-10-iWidth)/2;           //获得窗口的水平位置;
      window.open(url,name,'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
     
     }
    function ShowError(obj)
    {
        openwindow("LogResult.aspx?getid="+obj,"NewWin",680,300);
    }
    function TurnToPage(pageIndex)
    {
      var serch=document.getElementById("hidSearchCondition").value;
            $.ajax({
           type: "POST",//用POST方式传输
           dataType:"json",//数据格式:JSON
           url:  '../../../Handler/Office/SupplyChain/ImportLog.ashx',//目标地址
           cache:false,
           data: "pageIndex="+pageIndex+"&pageCount="+pageCount+"&action="+action+"&orderby="+orderBy+"&" + serch,//数据
           beforeSend:function(){AddPop();$("#pageDataList1_Pager").hide();},//发送数据之前
           
           success: function(msg){
                    //数据获取完毕，填充页面据显示
                    //数据列表
                    
                    $("#pageDataList1 tbody").find("tr.newrow").remove();
                    
                    $.each(msg.data,function(i,item){
                    if(item.ID != null && item.ID != "")
                    {  
                            $("<tr class='newrow'></tr>").append("<td height='22' align='center'>"+item.ExportEmpID
                             +"</td>"+
                            "<td height='22' align='center'>"+item.ExportDate+"</td>"+
                            "<td height='22' align='center'>"+item.ModuleName+"</td>"+
                            "<td height='22' align='center'>"+item.ExportNum+"</td>"+
                            "<td height='22' align='center'><a href='#' onclick='ShowError("+item.ID+")'>查看</a></td>"+
                            "<td height='22' align='center'>"+item.ExportResult+"</td>").appendTo($("#pageDataList1 tbody"));
                            }
                   });
                     //页码
                       ShowPageBar("pageDataList1_Pager",//[containerId]提供装载页码栏的容器标签的客户端ID
                       "<%= Request.Url.AbsolutePath %>",//[url]
                        {style:pagerStyle,mark:"pageDataList1Mark",
                        totalCount:msg.totalCount,showPageNumber:3,pageCount:pageCount,currentPageIndex:pageIndex,noRecordTip:"没有符合条件的记录",preWord:"上一页",nextWord:"下一页",First:"首页",End:"末页",
                        onclick:"TurnToPage({pageindex});return false;"}//[attr]
                        );
                      totalRecord = msg.totalCount;
                     // $("#pageDataList1_Total").html(msg.totalCount);//记录总条数
                      document.getElementById("Text2").value=msg.totalCount;
                      $("#ShowPageCount").val(pageCount);
                      ShowTotalPage(msg.totalCount,pageCount,pageIndex);
                      $("#ToPage").val(pageIndex);
                        ShowTotalPage(msg.totalCount,pageCount,pageIndex,$("#pagecount"));
                      //document.getElementById('tdResult').style.display='block';
                      },
               error: function() {}, 
               complete:function(){hidePopup();$("#pageDataList1_Pager").show();Ifshow(document.getElementById("Text2").value);pageDataList1("pageDataList1","#E7E7E7","#FFFFFF","#cfc","cfc");}//接收数据完毕
               });
           
    }
    //table行颜色
function pageDataList1(o,a,b,c,d){
	var t=document.getElementById(o).getElementsByTagName("tr");
	for(var i=1;i<t.length;i++){
		t[i].style.backgroundColor=(t[i].sectionRowIndex%2==0)?a:b;
		t[i].onmouseover=function(){
			if(this.x!="1")this.style.backgroundColor=c;
		}
		t[i].onmouseout=function(){
			if(this.x!="1")this.style.backgroundColor=(this.sectionRowIndex%2==0)?a:b;
		}
	}
}
function CheckDate(startDate,endDate)
{
    startDate=startDate.replace(/-/g,"/");  
    endDate=endDate.replace(/-/g,"/");   
    if(Date.parse(startDate)-Date.parse(endDate)>0)
    {   
        return false;   
    }
    else
    {
        return true;
    }
}

function Fun_Search_LogInfo()
{
    var opendate=document.getElementById("txtOpenDate").value;
    var closedate = document.getElementById("txtCloseDate").value;
    var mod = document.getElementById("btn_mod").value;
   
    if(!CheckDate(opendate,closedate))
    {
        showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif","开始时间不能大于结束时间！");
        return;
    }
    
    
     
      var search = "";
           var OpenDate=document.getElementById("txtOpenDate").value;
           var CloseDate = document.getElementById("txtCloseDate").value;
           
           var UserID= document.getElementById("uids").value;

          search+="UserID="+escape(UserID);
          search+="&OpenDate="+escape(OpenDate);
          search+="&CloseDate="+escape(CloseDate); 
          search+="&mod="+escape(mod);
    //设置检索条件
    document.getElementById("hidSearchCondition").value = search;    
    TurnToPage(1);
}

function Ifshow(count)
    {
        if(count=="0")
        {
            document.getElementById("divpage").style.display = "none";
            document.getElementById("pagecount").style.display = "none";
        }
        else
        {
            document.getElementById('divpage').style.display = "block";
            document.getElementById('pagecount').style.display = "block";
        }
    }
    
    
    function SelectDept(retval)
    {
        alert(retval);
    }
    
    //改变每页记录数及跳至页数
    function ChangePageCountIndex(newPageCount,newPageIndex)
    {
       if(!IsNumber(newPageCount))
       {
//          popMsgObj.ShowMsg('显示条数格式不对，必须是数字！');
          showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif","显示条数格式不对，必须是数字！");
          return;
       }
       if(!IsNumber(newPageIndex))
       {
//          popMsgObj.ShowMsg('跳转页数格式不对，必须是数字！');
           showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif","跳转页数格式不对，必须是数字！");
          return;
       }
        if(newPageCount <=0 || newPageIndex <= 0 ||  newPageIndex  > ((totalRecord-1)/newPageCount)+1 )
        {
            showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif","转到页数超出查询范围！");
            return false;
        }
        else
        {
            this.pageCount=parseInt(newPageCount);
            TurnToPage(parseInt(newPageIndex));
        }
    }
    //排序
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
        TurnToPage(1);
    }

