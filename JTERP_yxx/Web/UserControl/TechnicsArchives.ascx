<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TechnicsArchives.ascx.cs" Inherits="UserControl_TechnicsArchives" %>
 <div id="divPopTechShadow" style="display: none">
    <iframe id="PopTechShadowIframe" frameborder="0" width="100%"></iframe>
</div>
<div id="layout">
    <!--��ʾ��Ϣ��������start-->
    <div id="divTechnicsArchives" style="border: solid 10px #93BCDD; background: #fff;
        padding: 10px; width: 600px; z-index: 1000; position: absolute; display: none;
        top: 20%; left: 70%; margin: 5px 0 0 -400px;">
        <table width="99%">
            <tr>
                <td>
                    <img id="btnClose" alt="�ر�" src="../../../images/Button/Bottom_btn_close.jpg" style='cursor: hand;' onclick="document.getElementById('divTechnicsArchives').style.display='none';closeRotoscopingDiv(false,'divPopTechShadow');"  />
                </td>
            </tr>
        </table>
        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" id="pageDataList1"
            bgcolor="#999999">
            <tbody>
                <tr>
                    <th height="20" class="td_list_fields" align="center" >
                        ѡ��
                    </th>
                    <th align="center" class="td_list_fields">
                        <div class="orderClick">
                            ���մ���<span id="oID" class="orderTip"></span></div>
                    </th>
                    <th align="center" class="td_list_fields">
                        <div class="orderClick">
                            ��������<span id="oC1" class="orderTip"></span></div>
                    </th>
                    <th align="center" class="td_list_fields">
                        <div class="orderClick">
                            ƴ����д<span id="oC2" class="orderTip"></span></div>
                    </th>
                    <th align="center" class="td_list_fields">
                        <div class="orderClick">
                            ��������<span id="oC3" class="orderTip"></span></div>
                    </th>
                    <th align="center" class="td_list_fields">
                        <div class="orderClick">
                            ʹ��״̬<span id="oC4" class="orderTip"></span></div>
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
                            <td height="28" background="../../../images/Main/PageList_bg.jpg" width="25%">
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
        <br />
    </div>
    <!--��ʾ��Ϣ��������end-->
</div>

<script language="javascript">
var popTechObj=new Object();
popTechObj.InputObj = null;

popTechObj.ShowList=function(objInput)
{
    popTechObj.InputObj = objInput;
    openRotoscopingDiv(false,'divPopTechShadow','PopTechShadowIframe');
    document.getElementById('divTechnicsArchives').style.display='block';
}

$(document).ready(function(){
      TurnToPage(currentPageIndex);
    });    
    var pageCount = 10;//ÿҳ����
    var totalRecord = 0;
    var pagerStyle = "flickr";//jPagerBar��ʽ
    
    var currentPageIndex = 1;
    var action = "";//����
    var orderBy = "ModifiedDate_d";//�����ֶ�
    //jQuery-ajax��ȡJSON����
    function TurnToPage(pageIndex)
    {
           currentPageIndex = pageIndex;
           var TechNo= "";
           var TechName="";
           var PYShort="";
           var UsedStatus = "1";
           
           $.ajax({
           type: "POST",//��POST��ʽ����
           dataType:"json",//���ݸ�ʽ:JSON
           url:  '../../../Handler/Office/ProductionManager/TechnicsArchivesList.ashx',//Ŀ���ַ
           cache:false,
           data: "pageIndex="+pageIndex+"&pageCount="+pageCount+"&action="+action+"&orderby="+orderBy+"&TechNo="+escape(TechNo)+"&TechName="+escape(TechName)+"&PYShort="+escape(PYShort)+"&UsedStatus="+escape(UsedStatus)+"",//����
           beforeSend:function(){AddPop();$("#pageDataList1_Pager").hide();},//��������֮ǰ
           
           success: function(msg){
                    //���ݻ�ȡ��ϣ����ҳ�����ʾ
                    //�����б�
                    $("#pageDataList1 tbody").find("tr.newrow").remove();
                    $.each(msg.data,function(i,item){
                        var tempUsedStatus = '';
                        if(item.UsedStatus==0) tempUsedStatus='ͣ��';
                        if(item.UsedStatus==1) tempUsedStatus='����';
                        
                        if(item.ID != null && item.ID != "")
                        $("<tr class='newrow'></tr>").append("<td height='22' align='center'>"+" <input type=\"radio\" name=\"radioTech\" id=\"radioTech_"+item.ID+"\" value=\""+item.ID+"\" onclick=\"Fun_FillParent_Content("+item.ID+",'"+item.TechName+"');\" />"+"</td>"+
                        "<td height='22' align='center'>" + item.TechNo + "</td>"+
                        "<td height='22' align='center'>" + item.TechName +"</td>"+
                        "<td height='22' align='center'>"+item.PYShort+"</td>"+
                        "<td height='22' align='center'>"+item.Remark+"</td>"+
                        "<td height='22' align='center'>"+tempUsedStatus+"</td>").appendTo($("#pageDataList1 tbody"));
                   });
                    //ҳ��
                   ShowPageBar("pageDataList1_Pager",//[containerId]�ṩװ��ҳ������������ǩ�Ŀͻ���ID
                   "<%= Request.Url.AbsolutePath %>",//[url]
                    {style:pagerStyle,mark:"pageDataList1Mark",
                    totalCount:msg.totalCount,showPageNumber:3,pageCount:pageCount,currentPageIndex:pageIndex,noRecordTip:"û�з��������ļ�¼",preWord:"��һҳ",nextWord:"��һҳ",First:"��ҳ",End:"ĩҳ",
                    onclick:"TurnToPage({pageindex});return false;"}//[attr]
                    );
                  totalRecord = msg.totalCount;
                  document.getElementById("Text2").value=msg.totalCount;
                  $("#ShowPageCount").val(pageCount);
                  ShowTotalPage(msg.totalCount,pageCount,pageIndex);
                  $("#ToPage").val(pageIndex);
                  ShowTotalPage(msg.totalCount,pageCount,pageIndex,$("#pagecount"));
                  },
           error: function() {}, 
           complete:function(){hidePopup();$("#pageDataList1_Pager").show();Ifshow(document.getElementById("Text2").value);pageDataList1("pageDataList1","#E7E7E7","#FFFFFF","#cfc","cfc");}//�����������
           });
    }
    //table����ɫ
function pageDataList1(o,a,b,c,d){
	var t=document.getElementById(o).getElementsByTagName("tr");
	for(var i=0;i<t.length;i++){
		t[i].style.backgroundColor=(t[i].sectionRowIndex%2==0)?a:b;
		t[i].onmouseover=function(){
			if(this.x!="1")this.style.backgroundColor=c;
		}
		t[i].onmouseout=function(){
			if(this.x!="1")this.style.backgroundColor=(this.sectionRowIndex%2==0)?a:b;
		}
	}
}

function Fun_Search_TechnicsArchives(aa)
{
      search="1";
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
        document.getElementById("divpage").style.display = "block";
        document.getElementById("pagecount").style.display = "block";
    }
}
    
//�ı�ÿҳ��¼��������ҳ��
function ChangePageCountIndex(newPageCount,newPageIndex)
{
    var fieldText = "";
    var msgText = "";
    var isFlag = true;
    
    if(!IsNumber(newPageIndex) || newPageIndex==0)
    {
        isFlag = false;
        fieldText = fieldText + "��תҳ��|";
   		msgText = msgText +  "����Ϊ��������ʽ|";
    }
    if(!IsNumber(newPageCount) || newPageCount==0)
    {
        isFlag = false;
        fieldText = fieldText + "ÿҳ��ʾ|";
   		msgText = msgText +  "����Ϊ��������ʽ|";
    }
    if(!isFlag)
    {
        popMsgObj.Show(fieldText,msgText);
    }
    else
    {
        if(newPageCount <=0 || newPageIndex <= 0 ||  newPageIndex  > ((totalRecord-1)/newPageCount)+1 )
        {
            popMsgObj.Show("ת��ҳ��|","������ѯ��Χ|");
            return false;
        }
        else
        {
            this.pageCount=parseInt(newPageCount);
            TurnToPage(parseInt(newPageIndex));
        }
    }
}
//����
function OrderBy(orderColum,orderTip)
{
    var ordering = "a";
    //var orderTipDOM = $("#"+orderTip);
    var allOrderTipDOM  = $(".orderTip");
    if( $("#"+orderTip).html()=="��")
    {
         allOrderTipDOM.empty();
         $("#"+orderTip).html("��");
    }
    else
    {
        ordering = "d";
        allOrderTipDOM.empty();
        $("#"+orderTip).html("��");
    }
    orderBy = orderColum+"_"+ordering;
    TurnToPage(1);
}
   
function AddPop()
{
    //showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/extanim64.gif","���ݴ����У����Ժ򡭡�");
}
 
function hidePopup()
{
    //document.all.Forms.style.display = "none";
}


</script>

