<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckNote.aspx.cs" Inherits="Pages_Personal_MessageBox_CheckNote" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="../../../css/jt_default.css" />
<link href="../../../css/pagecss.css" type="text/css" rel="Stylesheet" />
<script src="../../../js/JQuery/jquery_last.js" type="text/javascript"></script>
<script src="../../../js/Calendar/WdatePicker.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="../../../js/common/PageBar-1.1.1.js"></script>
<script src="../../../js/Personal/Common.js" type="text/javascript"></script>

<script src="../../../js/Personal/MessageBox/Notice.js" type="text/javascript"></script>

<script src="../../../js/common/check.js" type="text/javascript"></script>
<script src="../../../js/common/page.js" type="text/javascript"></script>
<script src="../../../js/common/Common.js" type="text/javascript"></script>
<title>�����б�</title>
        <style type="text/css">
            .style1
            {
                width: 266px;
            }
            .style2
            {
                width: 77px;
            }
            .style3
            {
                width: 212px;
            }
            .style4
            {
                width: 218px;
            }
           #editPanel
        {
            width:400px;
            background-color:#fefefe;
            position:absolute;
            border:solid 1px #000000;
            padding:5px;
        }
            #spNewsContent
            {
                height: 114px;
                width: 278px;
            }
        </style>
        <script language="javascript" type="text/javascript">
        
        
        
        
        
        
        function ConfirmBat()
        {
        
            if(!confirm("ȷ�����ͨ����?")){
            return;
            }
        
     

             var ck = document.getElementsByName("Checkbox1");
                var ids = "";    
                for( var i = 0; i < ck.length; i++ )
                {
                    if ( ck[i].checked )
                    {
                        if( ids != "")
                            ids += ",";
                        ids += ck[i].value;
                    }
                }        
             
                if(ids == "")
                {
                   ShowInfo("������ѡ��һ��");
                    return;
                }
                
                
                
              
        
        
            //ƴд����URL����
            var postParams = "Action=ConfirmBat&&id="+ids;
            $.ajax({ 
                type: "POST",
                url: "../../../Handler/Personal/MessageBox/Notice.ashx?" + postParams,
                dataType:'string',
                data: '',
                cache:false,
                success:function(data) 
                {                      
                    var result = null;
                    eval("result = "+data);
                    
                    if(result.result)                    
                    {                   
                       alert("��˳ɹ�");
                        TurnToPage(currentPageIndex);       
                    }
                    else
                    {
                        ShowInfo(result.data);
                    }    
                },
                error:function(data)
                {
                     ShowInfo(data.responseText);
                }
            });
        }
        
        
       function EditItem()
        {    
            var chks = document.getElementsByName("Checkbox1");
            var ic = 0;
            for(var j=0;j<chks.length;j++)
            {  
                if(chks[j].checked)
                    ic++
            }
            
            if(ic>1)
            {
                showInfo("����ͬʱ�޸�2������2�����ϵļ�¼");
                return;
            }
            
            for(var i=0;i<chks.length;i++)
            {                
                if(chks[i].checked)
                {                    
                   showEditPanel(chks[i].value);
                   //chks[i].nextSibling.value;
                   return;
                }
            }
            
            showInfo("��ѡ��Ҫ�޸ĵ���Ϣ");
        
    }

    function showEditPanel(id,uid)
    {
             if( document.getElementById("UserID").value == uid )
         {
            document.getElementById("btnNoteEdit").style.display = "";
         }else{
            document.getElementById("btnNoteEdit").style.display = "none";
         }
         
        //ƴд����URL����
        var postParams = "Action=GetItem&id="+id;
        $.ajax({ 
            type: "POST",
            url: "../../../Handler/Personal/MessageBox/Notice.ashx?" + postParams,
            dataType:'string',
            data: '',
            cache:false,
            success:function(data) 
            {                      
                var result = null;
                eval("result = "+data);
                
                if(result.result)                    
                {
                    showEditPanelData(result.data);
                }
                else
                {
                    ShowInfo(result.data);
                }    
            },
            error:function(data)
            {
                 ShowInfo(data.responseText);
            }
        });
    }

    function CancelEdit()
    {
        document.getElementById("editPanel").style.display = "none";
    }
    
    function HtmlEncode(input)
    {
       var converter=document.createElement("DIV");
       converter.innerText=input;
       var output=converter.innerHTML;
       converter=null;
       return output;
    }
    function HtmlDecode(input)
    {
       var converter=document.createElement("DIV");
       converter.innerHTML=input;
       var output=converter.innerText;
       converter=null;
       return output;
    }
    function showEditPanelData(data)
    {        
    

        document.getElementById("itemID").value = data.ID;
    
        document.getElementById("spNewsTitle").value = HtmlDecode(data.NewsTitle);
        document.getElementById("spNewsContent").value = HtmlDecode(data.NewsContent.replace(/<br><br>/g,"\r"));
        document.getElementById("slStatus").value = data.Status;
        document.getElementById("slIsShow").value = data.IsShow;
        document.getElementById("spCreateDate").innerHTML = data.CreateDate;
        
        //alert(data.Status);
        if(data.Status != "0")
        {
            document.getElementById("spNewsTitle").disabled = true;
            document.getElementById("spNewsContent").disabled = true;
            document.getElementById("slStatus").disabled = true;
        }
     
        var ele = document.getElementById("editPanel");
        ele.style.display = "block";
        ele.style.left = "200";
        ele.style.top = "160";
        
    }
    
    
    
    
    function saveEdit()
    {
        
    
        var title = HtmlEncode(document.getElementById("spNewsTitle").value);
        var content = HtmlEncode(document.getElementById("spNewsContent").value);
        var id =  document.getElementById("itemID").value;
        var Status = document.getElementById("slStatus").value;
        var IsShow = document.getElementById("slIsShow").value;
          
         if(title + "" == "")
            {
                showInfo("����д��Ϣ����");
                return;
            }
             if(title.length>50)
            {
                showInfo("���� ���Ȳ��ܳ���50");
                return;
            }
            
             if(content + "" == "")
            {
                showInfo("����д��Ϣ����");
                return;
            }
              if(content.length>500)
            {
                showInfo("���� ���Ȳ��ܳ���500");
                return;
            }
            title =UrlEncode(title);
            content =UrlEncode(content)
       
        //ƴд����URL����
        var postParams = "Action=EditItem&Status="+Status+"&IsShow="+IsShow+"&id="+id+"&title="+title+"&content="+content;
        $.ajax({ 
            type: "POST",
            url: "../../../Handler/Personal/MessageBox/Notice.ashx?" + postParams,
            dataType:'string',
            data: '',
            cache:false,
            success:function(data) 
            {                      
                var result = null;
                eval("result = "+data);
                
                if(result.result)                    
                {                  
                    alert("����ɹ�");
                    TurnToPage(currentPageIndex);
                    
                    document.getElementById("editPanel").style.display = "none";
                }
                else
                {
                    ShowInfo(result.data);
                }    
            },
            error:function(data)
            {
                 ShowInfo(data.responseText);
            }
        });
       
    }
    
    function isCanDelete( uid){

         if( document.getElementById("UserID").value == uid )
         {
           return "  isDel='1' ";
         }else{
           return "   isDel='0'    ";
         }
    }
        
        </script>
</head>
<body>
<input type="hidden" id="isSearched" value="0" />
<input type="hidden" id="hidStatus" value="0" />
<input type="hidden" id="UserID" runat="server" />

<form id="form1" runat="server">
<a name="pageDataList1Mark"></a>
<span id="Forms" class="Spantype" name="Forms"></span>
<table width="98%"  border="0" cellpadding="0" cellspacing="0" id="mainindex">
    <tr>
        <td valign="middle" align="center">
            <table width="99%" border="0" border="0" cellpadding="0" cellspacing="0" >

                <tr class="menutitle1">
                    <td align="left" valign="middle" >
                        &nbsp;&nbsp;��������
                    </td>
                    <td align="right" valign="middle" >
                        <div id='searchClick'>
                            <img src="../../../images/Main/Close.jpg" style="CURSOR: pointer"  onclick="oprItem('searchtable','searchClick')"/>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <tr>
        <td   >
            <table width="99%" border="0" align="center" cellpadding="0" id="searchtable"  cellspacing="0" bgcolor="#CCCCCC">
                  <tr>
                        <td bgcolor="#FFFFFF">
                       
                            <table width="100%" border="0"  cellpadding="2" cellspacing="1" bgcolor="#CCCCCC" class="table">
                                <tr class="table-item">
                                    <td class="td_list_fields" >
                                        ����ʱ��   
                                    </td>
                                    <td class="tdColInput"> 
                                        <input onkeypress="return false;" name="createDate" id="createDate1" class="tdinput" type="text" size="14" onclick="WdatePicker()" />
                                        &nbsp;~&nbsp;<input onkeypress="return false;" name="createDate" id="createDate2" class="tdinput" type="text" size="14" onclick="WdatePicker()" />
                                    </td>
                                    <td   align="right"  class="td_list_fields" >
                                        ��������
                                    </td>
                                    <td class="tdColInput" colspan="3">
                                        <input name="txtTitle" id="txtTitle" type="text" class="tdinput" style="width:180px;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" align="center" bgcolor="#FFFFFF">
                                        <img title="����" src="../../../images/Button/Bottom_btn_search.jpg" style='cursor:pointer;' onclick='SearchEquipData()'  />
                                 
                                 
                                    </td>
                                    
                                    
                        
                             
                                </tr>      
                            </table>
                        </td>
                  </tr>
            </table>
        </td>
  </tr>
</table>

<table width="98%"  border="0" cellpadding="0" cellspacing="0" class="maintable" id="mainindex" >
    <tr>
        <td height="30" colspan="2" align="center" valign="top" class="Title">
            <table width="99%" border="0" cellpadding="0" cellspacing="0" >
                <tr class="menutitle1">
                    <td  align="left" valign="middle" >
                        &nbsp;&nbsp;�������
                </td>
                <td align="right" valign="middle" >
                  
                    <a id="btn_new" runat="server" visible="false" href="AddNotice.aspx?ModuleID=10619">
                        <img src="../../../images/Button/Bottom_btn_new.png" border="0" />
                    </a>
                 
                                 
                    <asp:HyperLink NavigateUrl="javascript:ConfirmBat()"
                         ID="btn_confirm"     runat="server"   ImageUrl="../../../images/Button/Main_btn_sh.jpg">
                    </asp:HyperLink> 
                    
                    
                       <asp:HyperLink NavigateUrl="javascript:DelMessage();"
                        ID="btn_del" runat="server" ImageUrl="../../../images/Button/Main_btn_delete.png">
                    </asp:HyperLink>
                </td>
            </tr>
        </table>
    </td>
    
  </tr>
 

  
    <tr>
        <td colspan="2">
            <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" id="pageDataList1" bgcolor="#999999">
                <tbody>
                    <tr class="table-item">
                      
                        <th width="3%" class="td_main_detail">
                            ѡ��</th>
                            
                         <th  width="5%" class="td_main_detail" >
                            <div class="orderClick"  onclick="OrderBy(this,'NewsTitle','oC2');return false;">
                                ��������<span id="oC2" class="orderTip"></span>
                            </div>
                     
                     
                        </th>    
                        <th width="5%"class="td_main_detail">
                            <div class="orderClick" onclick="OrderBy(this,'Creator','oGroup');return false;">
                                ������<span id="oGroup" class="orderTip"></span>
                            </div>
                        </th>
                        <th width="5%"class="td_main_detail" >
                            <div class="orderClick" onclick="OrderBy(this,'CreateDate','oC1');return false;">
                                ����ʱ��<span id="oC1" class="orderTip"></span>
                            </div>
                        </th>       
                       
                        <th  width="5%"class="td_main_detail" >
                            <div class="orderClick" onclick="OrderBy(this,'NewsContent','oC5');return false;">
                                ��������<span id="oC5" class="orderTip"></span>
                            </div>
                        </th>
                        
                        <th width="5%"class="td_main_detail">
                            <div onclick="OrderBy(this,'Status','oC6');return false;">
                                ���״̬<span id="oC6" class="orderTip"></span>
                            </div>
                        </th>   
                         
                        <th width="5%"class="td_main_detail">
                            <div onclick="OrderBy(this,'IsShow','ss');return false;">
                                �Ƿ��ڹ������ʾ<span id="ss" class="orderTip"></span>
                            </div>
                        </th>
                        
                        <th width="5%"class="td_main_detail"  style=" display:none">
                            <div class="orderClick" onclick="OrderBy(this,'ComfirmDate','sss');return false;">
                                ���ʱ��<span id="sss" class="orderTip"></span>
                            </div>
                        </th>       
                                
                        <th width="5%"class="td_main_detail"     style=" display:none" >
                            <div class="orderClick" onclick="OrderBy(this,'Comfirmor]','ssss');return false;">
                                �����<span id="ssss" class="orderTip"></span>
                            </div>
                        </th>             
                        
                    </tr>
                </tbody>
            </table>

            <br/>
            <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999" class="PageList">
                <tr>
                    <td height="28"  background="../../../images/Main/PageList_bg.jpg" >
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="PageList">
                            <tr>
                                <td height="28"  background="../../../images/Main/PageList_bg.jpg" width="40%"  ><div id="PageCount"></div></td>
                                <td height="28"  align="right"><div id="pageDataList1_Pager" class="jPagerBar"></div></td>
                                <td height="28" align="right"><div id="divpage">
                                  <input name="text" type="text" id="Text2" style="display:none" />
                                  <span id="pageDataList1_Total" style="display:none"></span>ÿҳ��ʾ
                                  <input name="text" type="text" id="ShowPageCount"/>
                                    �� ת����
                                  <input name="text" type="text" id="ToPage"/>
                                    ҳ <img src="../../../images/Button/Main_btn_GO.jpg" style='cursor:pointer;' alt="go" width="36" height="28" align="absmiddle" onclick="ChangePageCountIndex($('#ShowPageCount').val(),$('#ToPage').val());" /> </div></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br/>
        </td>
    </tr>
</table>
</form>



<div id="editPanel" style="display:none;">            
    <table id="itemContainer" border="1" width="100%" cellpadding="3" style="border-collapse:collapse;">
        
        <tr>
            <td style="width:80px;">��������</td><td>               
                <input type="text" id="spNewsTitle"   style=" width:94%;"  />
                <input type="hidden" id="itemID" />
            </td>
        </tr>
         <tr>
            <td valign="top"  style="width:80px;">��������</td><td>
                <textarea id="spNewsContent" > </textarea>               
            </td>
        </tr>
       
         <tr>
            <td>���״̬</td><td>
                   
                       <select id="Select1">
                       
                        <option value="0">δ���</option>
                        <option value="1" >�����</option>
                    </select>
                    
            </td>
        </tr>
        
        <tr>
            <td>�Ƿ��ڹ������ʾ</td><td>
                    <select id="slIsShow">
                       
                        <option value="1">��</option>
                        <option value="0">��</option>
                    </select>
            </td>
        </tr>
        
         <tr>
            <td>����ʱ��</td><td>
                <span id="spCreateDate"></span>
            </td>
        </tr>
              
        <tr><td></td><td style="padding:3px;">
             <span id="btnNoteEdit"  runat="server"><a href="javascript:saveEdit()">ȷ��</a>&nbsp;&nbsp;
            |&nbsp;&nbsp;</span><a href="javascript:CancelEdit()">ȡ��</a>
        </td></tr>
    </table>
</div>




</body>
</html>
