﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CustNameSel1.ascx.cs" Inherits="UserControl_CustNameSel1" %>
<script language="javascript" type="text/javascript" src="../../../js/common/PageBar-1.1.1.js"></script>
<link href="../../../css/pagecss.css" type="text/css" rel="Stylesheet" />
<style>

	.OfficeThingsListCss
    {
	    position:absolute;top:250px;left:250px;
	    border-width:1pt;border-color:#EEEEEE;border-style:solid;
	    width:800px;
	    display:none;
	    height:220px;
	    z-index:21;
	}
</style>
<script type="text/javascript">

 var popSellCustObj = new Object();
    popSellCustObj.SearchModel = 'protion'; //查询的模式，all是取出所有的客户，protion时取出所有启用的客户
    popSellCustObj.returnName = false;

    popSellCustObj.ShowList = function(model) {
        if (model != null && typeof (model) != "undefined") {
            popSellCustObj.SearchModel = model;
        }
        ShowPreventReclickDiv();
        $("#txtUcCustNo").val('');
        $("#txtUcCustNameS").val('');
        $("#txtUcCustShort").val('');
        document.getElementById('HolidaySpan').style.display = 'block';
        TurnToPageUc(currentPageIndexUc);
    }
    var pageCountUc = 10;//每页计数
    var totalRecord = 0;
    var pagerStyle = "flickr";//jPagerBar样式
    
    var currentPageIndexUc = 1;
    var action = "";//操作
    var orderByUc = "";//排序字段    
    var ifdelUc = "0";

 function TurnToPageUc(pageIndex)
    {
     
           currentPageIndexUc = pageIndex;
           var CustNo =document.getElementById("txtUcCustNo").value;           
           var CustName =document.getElementById("txtUcCustNameS").value;
           var CustShort = document.getElementById("txtUcCustShort").value;
           
          
           $.ajax({
           type: "POST",//用POST方式传输
           dataType:"json",//数据格式:JSON
           url:  '../../../Handler/Office/CustManager/CustName.ashx',//目标地址
           cache:false,
           data: "pageIndex="+pageIndex+"&pageCount="+pageCountUc+"&action="+action+"&orderbyuc="+orderByUc+"&UcCustNo="+escape(CustNo)+"&UcCustName="+escape(CustName)+
                    '&UcCustShort='+escape(CustShort),//数据
           beforeSend:function(){AddPop();$("#pageDataListUc_Pager").hide();},//发送数据之前
           
           success: function(msg){
                    //数据获取完毕，填充页面据显示
                    //数据列表
                    $("#pageDataListUc tbody").find("tr.newrow").remove();                   
                    $.each(msg.data,function(i,item){
                    
                    if (item.id != null && item.id != "")
                        
                            $("<tr class='newrow'></tr>").append("<td height='22' align='center'>" + "<input  onclick=\"GetCust('" + item.id + "','" + item.CustNo + "','" + item.CustName + "','" + item.ReceiveAddress + "','" + item.Tel + "','"+item.Gmspdata+"','"+ item.LinkMan + "','"+ item.Phone + "','"+ item.AreaID + "')\" id='Checkbox1' value=" + item.ID + "  type='radio'/>" + "</td>" +
                       
                       
                            // $("<tr class='newrow'></tr>").append("<td height='22' align='center'>" + "<input  onclick=\"GetCust('" + item.id + "','" + item.CustNo + "','" + item.CustName + "','" + item.ReceiveAddress + "','" + item.Tel + "','"+item.Gmspdata+"','"+ item.LinkMan + "','"+ item.Phone + "','"+ item.AreaID + "')\" id='Checkbox1' value=" + item.ID + "  type='radio'/>" + "</td>" +
                       
                        
                        
                        "<td height='22' align='center'>" + item.CustNo + "</td>"+
                        "<td height='22' align='center'>" + item.CustName + "</td>"+                       
                        "<td height='22' align='center'>" + item.CustShort + "</td>"+                       
                        "<td height='22' align='center'>" + item.TypeName + "</td>"+                        
                        "<td height='22' align='center'>"+item.Tel+"</td>").appendTo($("#pageDataListUc tbody"));
                   });
                   // 
                    //页码
                   ShowPageBar("pageDataListUc_Pager",//[containerId]提供装载页码栏的容器标签的客户端ID
                   "<%= Request.Url.AbsolutePath %>",//[url]
                    {style:pagerStyle,mark:"pageDataList1MarkUc",
                    totalCount:msg.totalCount,showPageNumber:3,pageCount:pageCountUc,currentPageIndex:currentPageIndexUc,noRecordTip:"没有符合条件的记录",preWord:"上一页",nextWord:"下一页",First:"首页",End:"末页",
                    onclick:"TurnToPageUc({pageindex});return false;"}//[attr]
                    );
                  totalRecord = msg.totalCount;
                 // $("#pageDataListUc_Total").html(msg.totalCount);//记录总条数
                  document.getElementById("TextUc2").value=msg.totalCount;
                  $("#ShowPageCountUc").val(pageCountUc);
                  ShowTotalPage(msg.totalCount,pageCountUc,pageIndex,$("#pagecountUc"));
                  $("#ToPageUc").val(pageIndex);
                  },
           error: function() 
           {
                showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif","请求发生错误！");
           }, 
           complete:function(){if(ifdelUc=="0"){hidePopup();}$("#pageDataListUc_Pager").show();IfshowUc(document.getElementById("TextUc2").value);pageDataList1("pageDataListUc","#E7E7E7","#FFFFFF","#cfc","cfc");}//接收数据完毕
           });
    }
//弹出客户信息
function SearchCustData()
{
    if(!CheckCustName())
    {
        return;
    }
    ifdelUc = "0";
    search="1";
        
    TurnToPageUc(1);  
   openRotoscopingDiv(false,"divCustNameS","ifmCustNameS");//弹遮罩层
    document.getElementById("HolidaySpan").style.display= "block";
}
    
function IfshowUc(count)
{
    if(count=="0")
    {
        document.getElementById("divUcpage").style.display = "none";
        document.getElementById("pagecountUc").style.display = "none";
    }
    else
    {
        document.getElementById("divUcpage").style.display = "block";
        document.getElementById("pagecountUc").style.display = "block";
    }
}
//改变每页记录数及跳至页数
function ChangePageCountIndexUc(newPageCount,newPageIndex)
{
if(!PositiveInteger(newPageCount))
    {
        showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif","每页显示应为正整数！");
        return;
    } 
    if(!PositiveInteger(newPageIndex))
    {
        showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif","转到页数应为正整数！");
        return;
    } 

    if(newPageCount <=0 || newPageIndex <= 0 ||  newPageIndex  > ((totalRecord-1)/newPageCount)+1 )
    {
        showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif","转到页数超出查询范围！");
        return false;
    }
    else
    {
        ifdelUc = "0";
        this.pageCountUc=parseInt(newPageCount);
        TurnToPageUc(parseInt(newPageIndex));
    }
}
//排序
function OrderByUc(orderColum,orderTip)
{
    if (totalRecord == 0) 
     {
        return;
     }
    ifdelUc = "0";
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
    orderByUc = orderColum+"_"+ordering;
    TurnToPageUc(1);
}

// 重写 与T6相连时，填充客户信息函数， 
// 本函数直接使用原值 来填充页面
// edit by liuch 20130411
function GetCustYY(CustID,CustNo,CustName,ReceiveAddress,Tel,Gmspdata, LinkMan,Phone,AreaID)
{
    //   ;
    try
    {
        LinkManClear(); //每次选择客户时，使客户联系人为空
        if (document.getElementById("HomeAddress")) {
            document.getElementById("HomeAddress").value ="";
        }
        if (document.getElementById("txtCustLinkTel")) {
            document.getElementById("txtCustLinkTel").value = "";
        }
        if (document.getElementById("Telphone")) {
            document.getElementById("Telphone").value = "";
        }
        if(document.getElementById("gmsDate")){
           document.getElementById("gmsDate").value="";
        }
    }
    catch(err)
    {
        
    }
    var yyphone = Phone;
    if (yyphone =="")
       yyphone = Tel;
    
       
    if ( ReceiveAddress=="")ReceiveAddress="请在T6系统添加发货地址";
    if ( LinkMan=="")LinkMan="请在T6系统添加联系人";
    if ( yyphone=="")yyphone="00000000";
    
    
    document.getElementById("hfCustID").value = CustID;
    document.getElementById("CustNameSel1_hfCustID_Ser").value = CustID;
    document.getElementById("hfCustNo").value = CustNo;         
    document.getElementById("CustID").value = CustName;
    document.getElementById("ReceiveAddress").value = ReceiveAddress;      
    document.getElementById("txtUcLinkMan").value =LinkMan; 
    document.getElementById("tell").value = yyphone;
    
    
   
    var newGmspDate=Gmspdata.split('T')[0];
    if(newGmspDate=="1900-01-01")
        document.getElementById("gmsDate").value="";
    else
        document.getElementById("gmsDate").value=newGmspDate.split('-')[0]+"年"+newGmspDate.split('-')[1]+"月"+newGmspDate.split('-')[2]+"日"; 
   
    
    document.getElementById('HolidaySpan').style.display = "none";
    closeRotoscopingDiv(false,"divCustNameS");//关闭遮罩层
}
/*
* 20121226 添加参数 Gmspdata edit by dyg
*/
//function GetCust(CustID,CustNo,CustName,ReceiveAddress,Tel,Gmspdata)
function GetCust(CustID,CustNo,CustName,ReceiveAddress,Tel,Gmspdata, LinkMan,Phone,AreaID)
{
var cp_version = '<%=((XBase.Common.UserInfoUtil)XBase.Common.SessionUtil.Session["UserInfo"]).Version.ToString() %>';
if (cp_version == "medicine")
{
try
    {
        LinkManClear(); //每次选择客户时，使客户联系人为空
        if (document.getElementById("HomeAddress")) {
            document.getElementById("HomeAddress").value ="";
        }
        if (document.getElementById("txtCustLinkTel")) {
            document.getElementById("txtCustLinkTel").value = "";
        }
        if (document.getElementById("Telphone")) {
            document.getElementById("Telphone").value = "";
        }
        if(document.getElementById("gmsDate")){
           document.getElementById("gmsDate").value="";
        }
    }
    catch(err)
    {
        
    }
    var yyphone = Phone;
    if (yyphone =="")
       yyphone = Tel;
    
       
    if ( ReceiveAddress=="")ReceiveAddress="请在T6系统添加发货地址";
    if ( LinkMan=="")LinkMan="请在T6系统添加联系人";
    if ( yyphone=="")yyphone="00000000";
    
    
    document.getElementById("hfCustID").value = CustID;
    document.getElementById("CustNameSel1_hfCustID_Ser").value = CustID;
    document.getElementById("hfCustNo").value = CustNo;         
    document.getElementById("CustID").value = CustName;
    document.getElementById("ReceiveAddress").value = ReceiveAddress;      
    document.getElementById("txtUcLinkMan").value =LinkMan; 
    document.getElementById("tell").value = yyphone;
    
    
   
    var newGmspDate=Gmspdata.split('T')[0];
    if(newGmspDate=="1900-01-01")
        document.getElementById("gmsDate").value="";
    else
        document.getElementById("gmsDate").value=newGmspDate.split('-')[0]+"年"+newGmspDate.split('-')[1]+"月"+newGmspDate.split('-')[2]+"日"; 
   
    
    document.getElementById('HolidaySpan').style.display = "none";
    closeRotoscopingDiv(false,"divCustNameS");//关闭遮罩层

}

else
{
   
    try
    {
        LinkManClear(); //每次选择客户时，使客户联系人为空
        if (document.getElementById("HomeAddress")) {
            document.getElementById("HomeAddress").value ="";
        }
        if (document.getElementById("txtCustLinkTel")) {
            document.getElementById("txtCustLinkTel").value = "";
        }
        if (document.getElementById("Telphone")) {
            document.getElementById("Telphone").value = "";
        }
        if(document.getElementById("gmsDate")){
           document.getElementById("gmsDate").value="";
        }
    }
    catch(err)
    {
        
    }    

    if(document.getElementById('selllorderL')!=undefined)  //add by  linfei  销售报表-客户应收款查询
    {
     
        if(document.getElementById('selllorderL').value=='1')
        {
            document.getElementById('CustID').value=CustName;
            document.getElementById('txtUcCustID').value=CustID;
             
        }
        if(document.getElementById('selllorderL').value=='2')
        {
            document.getElementById('CustID').value=CustNo;
            document.getElementById('CustName').value=CustName;
            document.getElementById('hiddenCustIDL').value=CustID;
          
             
        }
        if(document.getElementById('selllorderL').value=='3')
        {
            document.getElementById('hiddenCustIDL').value=CustID;
            document.getElementById("hfCustID").value = CustID;              
            document.getElementById("hfCustNo").value = CustNo;
            document.getElementById("CustID").value = CustName;
             
        }
        else
        {
        document.getElementById('CustID').value=CustNo;
        
        }
    }
    else {
     //---------20121128 添加 选择客户后检查是否存在默认联系人------------//
     var param=location.search;
        var str1 = param.split("?")[1].split("ModuleID=")[1];   
        if(str1=="2021201")
        {
          checkDefaultLcMan(CustNo);
          }
         // alert("program is running at this line");
          //---------------------------------------------------------//
        if (document.getElementById("DepType")) {
            document.getElementById("txtProviderID").value = CustID;
            document.getElementById("txtProviderName").value = CustName;
            document.getElementById("txtProviderNo").value = CustNo;
            document.getElementById("hfCustNo").value = CustNo;
            
        }
        else {
            document.getElementById("hfCustID").value = CustID;
            document.getElementById("CustNameSel1_hfCustID_Ser").value = CustID;
            document.getElementById("hfCustNo").value = CustNo;
           
            document.getElementById("CustID").value = CustName;
           
            $("#CustID").attr("title", CustID);
            //document.getElementById("ReceiveAddress").value;//自动填充收货地址
            if(document.getElementById("gmsDate"))
            {
           // alert(newGmspDate);
              var newGmspDate=Gmspdata.split('T')[0];
              if(newGmspDate=="1900-01-01")
               document.getElementById("gmsDate").value="";
               else
              document.getElementById("gmsDate").value=newGmspDate.split('-')[0]+"年"+newGmspDate.split('-')[1]+"月"+newGmspDate.split('-')[2]+"日";
              }
        }
        if(document.getElementById("txtUcLinkMan"))
        {
        //----20121130注释---------//  document.getElementById("CustNo").value=CustNo; 
       document.getElementById("hfCustNo").value=CustNo; //20121130添加
            $.ajax({
                type: "POST", //用POST方式传输
                dataType: "json", //数据格式:JSON
                url: "../../../Handler/Office/CustManager/CustLinkMan.ashx", //目标地址
                data: 'CustNo=' + escape(CustNo),
                cache: false,
                beforeSend: function() { AddPop(); }, //发送数据之前           
                success: function(msg) {
                    //数据获取完毕，填充页面据显示
                      ;
                    if (msg.data == 0) {
                        document.getElementById("txtUcLinkMan").value = ""; //客方联系人姓名
                        document.getElementById("hfLinkmanID").value = ""; //客方联系人编号
                    }
                    else {
                        $.each(msg.data, function(i, item) {
                            document.getElementById("txtUcLinkMan").value = item.LinkManName; //客方联系人姓名
                            document.getElementById("hfLinkmanID").value = item.ID; //客方联系人编号
//                            document.getElementById("cashier").value=item.LinkManName;
                           
                            if (document.getElementById("ReceiveAddress")) {
                                document.getElementById("ReceiveAddress").value = item.HomeAddress;
                            }
                            if (document.getElementById("txtCustLinkTel")) {
                                document.getElementById("txtCustLinkTel").value = item.WorkTel;
                            }
                            if (document.getElementById("txtTelphone")) {
                                document.getElementById("txtTelphone").value = item.HandSet;
                            }
                            //------20130114添加 联系人地址------//
                            if (document.getElementById("HomeAddress")) {
                              document.getElementById("HomeAddress").value =item.HomeAddress;;
                                  }
                            if(document.getElementById("Telphone"))
                            {
                            if(item.HandSet!=null)
                              document.getElementById("Telphone").value=item.HandSet;
                             else
                               document.getElementById("Telphone").value="";
                            }      
                            //--------------end------------------//
                            //------20121208添加-----------------//
                            if(document.getElementById("tell")){
                               if(document.getElementById("tell").value=="")
                                //document.getElementById("tell").value ="888";
                                document.getElementById("tell").value=item.HandSet;
                                else
                                // document.getElementById("tell").value ="99";
                                document.getElementById("tell").value=item.WorkTel; 
                            }
                            //----------------------------------//
                        });
                    }
                },
                complete: function() { hidePopup(); } //接收数据完毕

            });
          }

          if (document.getElementById("txtcustlinkaddress")) {
              document.getElementById("txtcustlinkaddress").value = ReceiveAddress;
          }

          if (document.getElementById("txtRepairDate")) {
              document.getElementById("txtRepairDate").value = "";
          }
          if (document.getElementById("txtSellDate")) {
              document.getElementById("txtSellDate").value = "";
          }
          if (document.getElementById("txtFromBillID")) {
              document.getElementById("txtFromBillID").value = "";
          }
          if (document.getElementById("txtProductNo")) {
              document.getElementById("txtProductNo").value = "";
          }
          if (document.getElementById("txtSpecification")) {
              document.getElementById("txtSpecification").value = "";
          }
        try
        {
            LoadBomInfo(CustID,CustNo,CustName);
        }
        catch(e)
        {}
    }
    document.getElementById('HolidaySpan').style.display = "none";
    closeRotoscopingDiv(false,"divCustNameS");//关闭遮罩层
//    try
//    {
//        GetSomeLinkInfoByID(CustID);
//    }
//    catch(err)
//    {
//        
//    }
}
}
//主表单验证
function CheckCustName()
{
    var fieldText = "";
    var msgText = "";
    var isFlag = true;
    
    var txtUcCustNo = document.getElementById('txtUcCustNo').value;//客户编号
    var txtUcCustName = document.getElementById('txtUcCustNameS').value;//客户名称
    

    if(txtUcCustNo.length>0 && txtUcCustNo.match(/^[A-Za-z0-9_]+$/) == null)
    {
        isFlag = false;       
	    msgText = msgText + "客户编号输入不正确|";
    }    
    if(txtUcCustName.length>0 && ValidText(txtUcCustName) == false)
    {
        isFlag = false;       
	    msgText = msgText + "客户简称输入不正确|";
    }
    
    
    if(!isFlag)
    {
        showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif",msgText);        
    }
    return isFlag;
}

function DivCustNameClose()
{
    document.getElementById("txtUcCustNo").value = "";
    document.getElementById("txtUcCustNameS").value = "";
    document.getElementById("txtUcCustShort").value = "";
    closeRotoscopingDiv(false,"divCustNameS");//关闭遮罩层
    document.getElementById('HolidaySpan').style.display='none'; 
}

function CustClear()
{
    document.getElementById("hfCustID").value = "";
    document.getElementById("CustNameSel1_hfCustID_Ser").value = "";  
    document.getElementById("hfCustNo").value = "";
    document.getElementById("CustID").value = "";
    if(document.getElementById('selllorderL')!=undefined)  //add by  linfei  销售报表-客户应收款查询
    {
        if(document.getElementById('selllorderL').value=='1')
        {
            document.getElementById('CustID').value='';
            document.getElementById('txtUcCustID').value='0';
        }
        if(document.getElementById('selllorderL').value=='2')
        {
            document.getElementById('CustID').value='';
            document.getElementById('CustName').value='';
            document.getElementById('hiddenCustIDL').value='0';
        }
    }
    try
    {
        document.getElementById("hidCustID_Tree").value = "";//客户ID
        document.getElementById("hidCustNo_Tree").value = "";//客户No
    }
    catch(e)
    { }
    if (document.getElementById("txtUcLinkMan")) {
        document.getElementById("txtUcLinkMan").value = "";
        document.getElementById("hfLinkmanID").value = "";
        if (document.getElementById("HomeAddress")) {
            document.getElementById("HomeAddress").value = "";
        }
        if (document.getElementById("txtCustLinkTel")) {
            document.getElementById("txtCustLinkTel").value = "";
        }
        if (document.getElementById("Telphone")) {
            document.getElementById("Telphone").value = "";
        }
    }
    DivCustNameClose();
}

function aa()
{
    //document.getElementById("txtUcLinkMan").value = "";
    LinkManClear();
}

 </script>

<%--<input onclick="SearchCustData();" id="txtUcCustName" style="width:95%"  type="text" class="tdinput" readonly/>--%>

<div id="divCustNameS" style="display:none">
<iframe id="ifmCustNameS" frameborder="0" width="100%" ></iframe>
</div>
<div id="HolidaySpan" style="border: solid 5px #999999; background: #fff;
        width: 750px; z-index: 21; position: absolute;  display: none;
        top: 20%; left: 60%; margin: 5px 0 0 -400px"><!--;padding: 10px;class="OfficeThingsListCss"-->
<table width="99%" border="0" align="center" cellpadding="0" id="Table1"  cellspacing="0" >
      <tr bgcolor="#E7E7E7">
      <td  style="width:33%">
       <img id="btn_cancel" alt="关闭" src="../../../Images/Button/Bottom_btn_close.jpg" style='cursor:hand;' onclick="DivCustNameClose();" />
        <img id="btn_clear" alt="清除" src="../../../Images/Button/Bottom_btn_del.jpg" style='cursor:hand;' onclick="CustClear();" /> 
       </td>      
       </tr>
      </table>
    <table width="99%" border="0" align="center" cellpadding="0" id="searchtable"  cellspacing="0" bgcolor="#CCCCCC">
      <tr>
        <td bgcolor="#FFFFFF"><table width="100%" border="0"  cellpadding="2" cellspacing="1" bgcolor="#CCCCCC" class="table">
          <tr class="table-item">
            <td width="10%" height="20" class="td_list_fields" align="right"> 客户编号</td>
            <td width="23%" bgcolor="#FFFFFF"><input name="txtUcCustNo" id="txtUcCustNo"  class="tdinput"  type="text" style="width:95%" /></td>
            
            <td class="td_list_fields" align="right" width="10%">客户名称</td>
            <td width="23%" bgcolor="#FFFFFF"><input id="txtUcCustNameS"  class="tdinput"  type="text"  style="width:95%" /></td>            
            <td class="td_list_fields" align="right" width="10%">
                拼音缩写</td>
            <td bgcolor="#FFFFFF" style="width: 24%">
                <input name="txtUcCustShort" id="txtUcCustShort"  class="tdinput"  type="text"  style="width:95%"  /></td>
          </tr>
          <tr>
            <td colspan="6" align="center" bgcolor="#FFFFFF">
            <img id="btn_search" alt="检索" src="../../../Images/Button/Bottom_btn_search.jpg" style='cursor:hand;' onclick='SearchCustData()' /> 
            <span class="redbold">仅显示500条，使用条件检索更多</span>
           
            </td>
          </tr>
        </table></td>
      </tr>
    </table>
      <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" id="pageDataListUc" bgcolor="#999999">
    <tbody>
      <tr>
        <th height="20" align="center" class="td_list_fields">选择</th>
        <th align="center" class="td_list_fields"><div class="orderClick" onclick="OrderByUc('CustNo','oCustNo');return false;">客户编号<span id="oCustNo" class="orderTip"></span></div></th>
        <th align="center" class="td_list_fields"><div class="orderClick" onclick="OrderByUc('CustName','oCustName');return false;">客户名称<span id="oCustName" class="orderTip"></span></div></th>        
        <th align="center" class="td_list_fields"><div class="orderClick" onclick="OrderByUc('CustShort','oCustShort');return false;">拼音缩写<span id="oCustShort" class="orderTip"></span></div></th>        
        <th align="center" class="td_list_fields"><div class="orderClick" onclick="OrderByUc('TypeName','oTypeName');return false;">所在区域<span id="oTypeName" class="orderTip"></span></div></th>        
        <th align="center" class="td_list_fields"><div class="orderClick" onclick="OrderByUc('Tel','oTel');return false;">联系电话<span id="oTel" class="orderTip"></span></div></th>
        
      </tr>
    </tbody>
    </table>
    <br/>
    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999" class="PageList">
      <tr>
        <td height="28"  background="../../../images/Main/PageList_bg.jpg" >
        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="PageList">
          <tr>
            <td height="28"  background="../../../images/Main/PageList_bg.jpg" width="40%"  ><div id="pagecountUc"></div></td>
            <td height="28"  align="right"><div id="pageDataListUc_Pager" class="jPagerBar"></div></td>
            <td height="28" align="right"><div id="divUcpage">
              <input name="text" type="text" id="TextUc2" style="display:none" />
              <span id="pageDataListUc_Total"></span>每页显示
              <input name="text" size="3" type="text" id="ShowPageCountUc"/>
              条  转到第
              <input name="text" type="text" id="ToPageUc" size="3" />
              页 <img src="../../../images/Button/Main_btn_GO.jpg" style='cursor:hand;' alt="go" align="absmiddle" onclick="ChangePageCountIndexUc($('#ShowPageCountUc').val(),$('#ToPageUc').val());" /> </div></td>
          </tr>
        </table><a name="pageDataList1MarkUc"></a>
        <input id="hfCustID" type="hidden"  />
<input id="hfCustID_Ser" type="hidden" runat="server" />
<input id="hfCustNo" type="hidden"  /></td>
        </tr>
    </table>
</div>
