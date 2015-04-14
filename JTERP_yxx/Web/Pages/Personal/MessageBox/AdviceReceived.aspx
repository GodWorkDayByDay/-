<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdviceReceived.aspx.cs" Inherits="Pages_Personal_MessageBox_AdviceReceived" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="../../../css/default.css" />
<link href="../../../css/pagecss.css" type="text/css" rel="Stylesheet" />
<script src="../../../js/JQuery/jquery_last.js" type="text/javascript"></script>
<script src="../../../js/Calendar/WdatePicker.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="../../../js/common/PageBar-1.1.1.js"></script>
<script src="../../../js/Personal/Common.js" type="text/javascript"></script>


<script src="../../../js/common/check.js" type="text/javascript"></script>
<script src="../../../js/common/page.js" type="text/javascript"></script>
<script src="../../../js/common/Common.js" type="text/javascript"></script>


<script src="../../../js/personal/MessageBox/UserListCtrl2.js" type="text/javascript"></script>

<script src="../../../js/Personal/MessageBox/AdviceReceived.js" type="text/javascript"></script>

<title>���յ��Ľ���</title>
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
            width:500px;
            background-color:#fefefe;
            position:absolute;
            border:solid 1px #000000;
            padding:5px;
        }
        
         #selUserBox{background:#ffffff;}
        
        #userList  {border:solid 1px #3366cc;width:200px;height:300px;overflow:auto;padding-left:10px;}
        
        #typeListTab {background: #2255bb;padding:5px;margin:0px;width:202px;background:#3366cc;}
       /* #typeListTab LI{cursor:pointer;display:inline;color:White;margin-left:5px;border:solid 1px #0000ff;padding:2px;}
       */
       
       
       .tab{cursor:pointer;display:inline;color:White;background-color:inherit;margin-left:5px;border:solid 1px #0000ff;padding:2px;}
       .selTab{cursor:pointer;display:inline;color:Black;background-color:White;margin-left:5px;border:solid 1px #0000ff;padding:2px;}
       
       
        </style>
        <script language="javascript" type="text/javascript">
        
         function showInfo(msg)
        {
            showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif",msg);
        };
    
    
        $(document).ready(function(){
           
            LoadUserList('LoadUserList',BuildTree);      
                
            
        });
        
        var curFlag = 0;
        function swithEditPanel(flag)
        {
            var lastEle = document.getElementById("tab_"+curFlag);
            lastEle.className = "tab";
        
            curFlag = flag;
            
            
        document.getElementById("tab_"+flag).className = "selTab";
           
            
        }
        
        
        
        function LoadUserList(action,callback)
        {
            $.ajax({ 
                    type: "POST",
                    url: "../../../Handler/Personal/MessageBox/SendInfo.ashx?action=" + action,
                    dataType:'string',
                    data: '',
                    cache:false,
                    success:function(data) 
                    {                          
                        var result = null;
                        eval("result = "+data);
                        
                        if(result.result)                    
                        {
                            callback(result.data);
                                             
                        }else{                  
                               showInfo(result.data);               
                        }                   
                    },
                    error:function(data)
                    {
                         showInfo(data.responseText);
                    }
                });
        }
        
        
        function clearSel()
        {
 
               document.getElementById("txtSender").value = "";
               document.getElementById("txtSenderHidden").value = "";
               treeview_unsel();
               
        }
        
        function hideSelPanel()
        {
             var box = document.getElementById("selUserBox");
        
            box.style.display = "none";
        }
        
        
        
         function showSelPanel()
        {
            var box = document.getElementById("selUserBox");
            box.style.left = "510px";
            box.style.top = "70px";
            box.style.display = "";
            
            
        }
        
        
                  function viewMsg(id)
        {
              var action  ="GetItem";              
              $.ajax({ 
                    type: "POST",
                    url: "../../../Handler/Personal/MessageBox/AdviceInput.ashx?action=" + action,
                    dataType:'string',
                    data: 'id='+id,
                    cache:false,
                    success:function(data) 
                    {                          
                        var result = null;
                        eval("result = "+data);
                        
                        if(result.result)                    
                        {
                              //showInfo(result.data);  
                               dispData(result.data);              
                        }else{                  
                              showInfo(result.data);               
                        }                   
                    },
                    error:function(data)
                    {
                         showInfo(data.responseText);
                    }
                });
                
        }
        
        function dispData(data)
        {
            var ttID = document.getElementById("ttID");
            var ttTitle = document.getElementById("ttTitle");
            var ReceiveUserID = document.getElementById("ReceiveUserID");
            var ttSendDate = document.getElementById("ttSendDate");
            var ttContent = document.getElementById("ttContent");
            ttTitle.innerHTML = data.ID;
            
            ttTitle.innerHTML = data.Title;
            ttSendDate.innerHTML = data.CreateDate;
            ttContent.innerHTML = data.Content;
           
           document.getElementById("spDisplayName").innerHTML = (data.DisplayName == "0"?"��":"��");
           
           if(data.DisplayName == "0")
           {
                ReceiveUserID.innerHTML = data.FromUserID;
           }
           
           document.getElementById("spAdviceType").innerHTML = data.AdviceType == "1"?"����":"���";
                       
            document.getElementById("editPanel").style.left = "200px";
            document.getElementById("editPanel").style.top ="200px";
            document.getElementById("editPanel").style.display = "";
        }
        function hideMsg()
        {
            document.getElementById("editPanel").style.display = "none";
        }
        
        </script>
</head>
<body>
<input type="hidden" id="isSearched" value="0" />
<form id="form1" runat="server">
<a name="pageDataList1Mark"></a>
<span id="Forms" class="Spantype" name="Forms"></span>
<table width="95%" height="57" border="0" cellpadding="0" cellspacing="0" class="checktable" id="mainindex">
  <tr>
    <td valign="top"><img src="../../../images/Main/Line.jpg" width="122" height="7" /></td>
    <td rowspan="2" align="right" valign="top"><div id='searchClick'><img src="../../../images/Main/Close.jpg" style="CURSOR: pointer"  onclick="oprItem('searchtable','searchClick')"/></div>
        &nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td  valign="top" class="Blue"><img src="../../../images/Main/Arrow.jpg" width="21" height="18" align="absmiddle" />��������</td>
  </tr>
  <tr>
    <td colspan="2"  >
    <table width="99%" border="0" align="center" cellpadding="0" id="searchtable"  cellspacing="0" bgcolor="#CCCCCC">
      <tr>
        <td bgcolor="#FFFFFF">
       
        <table width="100%" border="0"  cellpadding="2" cellspacing="1" bgcolor="#CCCCCC" class="table">
          <tr class="table-item">
            <td width="10%" height="20"  align="right" class="td_list_fields" >����ʱ��   </td>
            <td bgcolor="#FFFFFF" class="style1"> <input onkeypress="return false;" name="createDate" id="createDate1" class="tdinput" type="text" size="14" onclick="WdatePicker()" />
                ~<input onkeypress="return false;" name="createDate" id="createDate2" class="tdinput" type="text" size="14" onclick="WdatePicker()" />
           </td>
            <td   align="right" class="td_list_fields" >������</td>
            <td bgcolor="#FFFFFF" class="style3">
           <input name="txtSender" id="txtSender" onclick="showSelPanel()" readonly="readonly" value=""   type="text" class="tdinput" style="width:180px;" />
              <input type="hidden" value="" id="txtSenderHidden"/>
            </td>
            <td bgcolor="#FFFFFF" align=left class="style4"><img title="����" src="../../../images/Button/Bottom_btn_search.jpg" style='cursor:pointer;' onclick='SearchEquipData()'  /></td>
            <td bgcolor="#FFFFFF">&nbsp;</td>
            
          </tr>   
          
                 
          
          <tr class="table-item">
            <td width="10%" height="20"  align="right" class="td_list_fields" >&nbsp;</td>
            <td bgcolor="#FFFFFF" class="style1">&nbsp;</td>
          <td colspan="6" align="left" bgcolor="#FFFFFF">
          </td>
           </tr>  
        </table></td>
      </tr>
    </table>
    </td>
  </tr>
</table>

<table width="95%"  height="57" border="0" cellpadding="0" cellspacing="0" class="maintable" id="mainindex" >
  <tr>
    <td valign="top"><img src="../../../images/Main/Line.jpg" width="122" height="7" /></td>
    <td align="center" valign="top">&nbsp;
    
    </td>
  </tr>
  <tr>
    <td height="30" colspan="2" align="center" valign="top" class="Title">���յ��Ľ���</td>
  </tr>
  
  <tr>
    <td height="35" colspan="2" valign="top">
    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999">
        <tr>
          <td height="28" bgcolor="#FFFFFF">
          &nbsp;&nbsp;&nbsp;
          <img src="../../../images/Button/Main_btn_delete.jpg" title="ɾ��" id="btn_del" visible="false" runat="server" onclick="DelMessage()" style='cursor:pointer;'  />
          </td>
        </tr>
      </table>
    </td>
  </tr>
  
  <tr>
    <td colspan="2">
    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" id="pageDataList1" bgcolor="#999999">
    <tbody>
      <tr>
      
        <th height="20" align="center" class="td_list_fields">
            ѡ��</th>
        <th align="center" class="td_list_fields">
        <div class="orderClick" onclick="OrderBy(this,'AdviceType','oGroup');return false;">
            ����<span></span></div></th>
        <th width="20%" align="center" class="td_list_fields" >
              <div class="orderClick" onclick="OrderBy(this,'Title','oC1');return false;">
            ����<span></span></div></th>
        <th width="30%"  align="center" class="td_list_fields">
        <div class="orderClick" onclick="OrderBy(this,'Content','oC2');return false;">
            ����<span></span></div></th>
        <th align="center" class="td_list_fields" > 
              <div class="orderClick"  onclick="OrderBy(this,'CreateDate','oC2');return false;">
            ����ʱ��<span></span></div></th>    
        <th align="center" class="td_list_fields" > 
             <div class="orderClick" onclick="OrderBy(this,'DisplayName','oC5');return false;">
            �Ƿ�����<span></span></div></th>
        <th align="center" class="td_list_fields">
        <div onclick="OrderBy(this,'FromUserID','oC6');return false;">
            ������<span></span></div></th>                
        
      </tr>
    </tbody>
    </table>

      <br/>
    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999" class="PageList">
      <tr>
        <td height="28"  background="../../../images/Main/PageList_bg.jpg" >
        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="PageList">
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
        </table></td>
        </tr>
    </table>
    <br/></td>
  </tr>
</table>
</form>



<div id="selUserBox" style="position:absolute;display:none;">
    <ul id="typeListTab">
         <li id="tab_0" class="selTab" onclick="swithEditPanel(0);LoadUserList('LoadUserList',BuildTree)">ȫ��</li>
                            <li  id="tab_1" class="tab" onclick="swithEditPanel(1);LoadUserList('LoadUserListWithDepartment',BuildTree)">����</li>
                            <li  id="tab_2" class="tab" onclick="swithEditPanel(2);LoadUserList('LoadUserListWithGroup',BuildTree)">����</li>                            
                           
                          <li style="display:inline;"  onclick="hideSelPanel()"><img style="margin-left:60px;cursor:pointer;" align="absbottom" src="../../../Images/Pic/Close.gif"/></li>
    </ul>
    <div id="userList"></div>
    <div style="border:solid 1px #3366cc;padding:5px;text-align:center;width:200px;" >
        <a href="#" onclick="clearSel()">���</a> &nbsp;&nbsp;<a href="#" onclick="hideSelPanel()">ȷ��</a>
    </div>
    
</div>


<div id="editPanel" style="display:none;">            
    <table id="itemContainer" border="1" width="100%" cellpadding="3" borderColor="#000000" style="border-collapse:collapse;background:#eeeeee;">
       
        <tr>
            <td style="width:40px;">����</td><td>
                <span id="ttTitle"></span>
            </td>
        </tr>       
         <tr>
            <td>����ʱ��</td><td>
                <span id="ttSendDate"></span>
            </td>
        </tr>     
        <tr>
            <td>�Ƿ�����</td><td>
                <span id="spDisplayName"></span>
            </td>
        </tr>          
         <tr>
            <td>������</td><td>
                <span id="ReceiveUserID"></span>
            </td>
        </tr>
         <tr>
            <td>��������</td><td>
                <span id="spAdviceType"></span>
            </td>
        </tr>
     
        
        <tr><td>�������ݣ�</td><td align="left" valign="top">
            <span id="ttContent"></span>
        </td></tr>
        
        <tr><td></td><td style="padding:3px;">
            <a href="#" onclick="hideMsg()">ȷ��</a>&nbsp;&nbsp;            
        </td></tr>
    </table>
</div>

</body>
</html>
