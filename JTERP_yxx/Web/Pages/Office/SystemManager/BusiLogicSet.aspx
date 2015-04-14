<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BusiLogicSet.aspx.cs" Inherits="Pages_Office_SystemManager_BusiLogicSet" %>

<%@ Register src="../../../UserControl/Message.ascx" tagname="Message" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>������־</title>
    <link href="../../../css/default.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script src="../../../js/KnowledgeCenter/common.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="../../../js/common/PageBar-1.1.1.js"></script>
    <script src="../../../js/JQuery/jquery_last.js" type="text/javascript"></script>
    <script src="../../../js/office/SystemManager/ProcessLog.js" type="text/javascript"></script>
    <script src="../../../js/common/Common.js" type="text/javascript"></script>

    <link href="../../../css/pagecss.css" rel="stylesheet" type="text/css" />
    <script src="../../../js/common/Page.js" type="text/javascript"></script>
    <script src="../../../js/common/Check.js" type="text/javascript"></script>
     <script language="javascript" type="text/javascript">
        //����س��¼�Ǯ���2010-11-04
        function document.onkeydown() 
        { 
            var button = document.getElementById("btnQuery");
            if(event.keyCode == 13)
            {
                button.click();
                event.returnValue = false;
            } 
        }
          function GetSelTreeNodes()
      {
            hideUserList();
            var idlist = "";
            var chks = document.getElementById("TreeView1").getElementsByTagName("input");
            for(var i=1;i<chks.length;i++)
            {
                if(chks[i].type != "checkbox")
                    continue;
                if(!chks[i].checked)
                    continue;
                var node = null;
                try
                {
                    node = chks[i].parentElement.parentElement.parentElement.parentElement;//get node Table
                                   
                }catch(e){continue;}
                if( getChildNodes(node).length > 0)
                    continue;
                
                if(idlist != "")
                    idlist += ",";
                idlist += chks[i].nextSibling.innerText;   
            }
            
            document.getElementById("uids").value =  idlist;
      }
   
    function GetSelMTreeNodes()
      {
            hideMList();
            
            var idlist = "";
            
            var chks = document.getElementById("TreeView2").getElementsByTagName("input");
            for(var i=0;i<chks.length;i++)
            {
                if(chks[i].type != "checkbox")
                    continue;
                if(!chks[i].checked)
                    continue;
                var node = null;
                try
                {
                    node = chks[i].parentElement.parentElement.parentElement.parentElement;//get node Table
                                   
                }catch(e){continue;}
                if( getChildNodes(node).length > 0)
                    continue;
                
                if(idlist != "")
                    idlist += ",";
                idlist += chks[i].nextSibling.innerText;   
            }
            
            document.getElementById("uds").value =  idlist;
      }
   
  
      function OnTreeNodeChecked() 
      {
            var ele = event.srcElement; 
            if(ele.type != 'checkbox')
                return;
                
            var s = null;
            var node = null;
            try
            {
                node = ele.parentElement.parentElement.parentElement.parentElement;//get node Table
                               
            }catch(e){return;}
            
            
            //�����ڵ�
            var pNode = getParentNode(node);     
            if(pNode != null)
            {     
                var checkBoxs = pNode.getElementsByTagName('INPUT'); 
                for(var i=0;i<checkBoxs.length;i++) 
                { 
                    if(checkBoxs[i].type=='checkbox') 
                    {                   
                        if(ele.checked)
                        {
                            if(checkBoxs[i].checked == false)
                                checkBoxs[i].checked=true; 
                        }else{
                        
                            checkBoxs[i].checked=getChildNodesChecked(pNode);
                        }                 
                                            
                        break;
                    }
                } 
            }
            
            
            //�����ӽڵ�
            var childnodes = getChildNodes(node);
            for(var i=0;i<childnodes.length;i++)
            {
                var checkBoxs = childnodes[i].getElementsByTagName('INPUT'); 
                for(var j=0;j<checkBoxs.length;j++) 
                { 
                    if(checkBoxs[j].type=='checkbox') 
                    {                   
                        checkBoxs[j].checked= ele.checked;   
                        break;
                    }
                } 
            }
        
      }
      
      
      function getChildNodesChecked(node)
      {
      
            var r = false;
            
             //�����ӽڵ�
            var childnodes = getChildNodes(node);
            for(var i=0;i<childnodes.length;i++)
            {
                var checkBoxs = childnodes[i].getElementsByTagName('INPUT'); 
                for(var j=0;j<checkBoxs.length;j++) 
                { 
                    if(checkBoxs[j].type=='checkbox') 
                    {                   
                        r =  r || checkBoxs[j].checked;                        
                        break;
                    }
                } 
            }
            
            return r;
      }
      
      function getChildNodes(nodeTable)
      {
            if(nodeTable.nextSibling == null)
                return [];
            var nodes = nodeTable.nextSibling;  
           
            if(nodes.tagName == "DIV")
            {
                return nodes.childNodes;//return childnodes's nodeTables;
            }
            return [];
      }
      
      function getParentNode(nodeTable)
      {
            var s = null;
            try
            {
                s = (nodeTable.parentElement) ;//get nodes DIV
                if(s.tagName != "DIV")
                    s = null;                       
                s = s.previousSibling ;//get previous Node Table
            }catch(e){s = null;}

            return s;
      }
        function showUserList()
        {
            var list = document.getElementById("userList");
           
            if(list.style.display != "none")
            {
                list.style.display = "none";
                return;
            }
            
            var pos = elePos(document.getElementById("uids"));
            
            list.style.left = pos.x;
            list.style.top = pos.y+20;
            
            document.getElementById("userList").style.display = "block";
                 var pNode=document.getElementById("TreeView1");
                var checkBoxs = pNode.getElementsByTagName('INPUT'); 
                for(var i=0;i<checkBoxs.length;i++) 
                { 
                    if(checkBoxs[i].type=='checkbox') 
                    {                   
                       
                            checkBoxs[i].checked = false;
                                
                    }
            }
            document.getElementById("uids").value =  "";
        }
        
        function showMList()
        {
          var list = document.getElementById("MList");
           
            if(list.style.display != "none")
            {
                list.style.display = "none";
                return;
            }
            
            var pos = elePos(document.getElementById("uds"));
            
            list.style.left = pos.x;
            list.style.top = pos.y+20;
            
            document.getElementById("MList").style.display = "block";
            var pNode=document.getElementById("TreeView2");
                var checkBoxs = pNode.getElementsByTagName('INPUT'); 
                for(var i=0;i<checkBoxs.length;i++) 
                { 
                    if(checkBoxs[i].type=='checkbox') 
                    {                   
                       
                            checkBoxs[i].checked = false;
                                
                    }
            }
            document.getElementById("uds").value =  "";
        }
       function showBList()
        {
          var list = document.getElementById("BList");
           
            if(list.style.display != "none")
            {
                list.style.display = "none";
                return;
            }
            
            var pos = elePos(document.getElementById("ds"));
            
            list.style.left = pos.x;
            list.style.top = pos.y+20;
            
            document.getElementById("BList").style.display = "block";
        }
         function hideMList()
        {
            document.getElementById("MList").style.display = "none";
        }
         function hideBList()
        {
            document.getElementById("BList").style.display = "none";
        }
        function hideUserList()
        {
            document.getElementById("userList").style.display = "none";
        }
        function OnTreeNodeMChecked()
        {
          
          var ele = event.srcElement; 
        if(ele.type=='checkbox') 
        { 
        var childrenDivID = ele.id.replace('CheckBox','Nodes'); 
        var div = document.getElementById(childrenDivID); 
        if(div==null)return; 
        var checkBoxs = div.getElementsByTagName('INPUT'); 
        for(var i=0;i<checkBoxs.length;i++) 
        { 
        if(checkBoxs[i].type=='checkbox') 
        checkBoxs[i].checked=ele.checked; 
        } 
        }
        }
    </script>
    <script src="../../../js/Calendar/WdatePicker.js" type="text/javascript"></script>
      <style type="text/css">
        .MList 
        {
            border:solid 1px #111111;
             width:200px;
            z-index:11;
            display:none;
            position:absolute;
            background-color:White;
            
        }
    </style>
</head>
<body>
    <form id="frmMain" runat="server">
    
    <table width="95%" height="57" border="0" cellpadding="0" cellspacing="0" class="checktable"
        id="mainindex">
        <tr>
            <td valign="top">
                <img src="../../../images/Main/Line.jpg" width="122" height="7" />
                <uc1:Message ID="Message1" runat="server" />
            </td>
            <td rowspan="2" align="right" valign="top">
                <div id='searchClick'>
                    <img src="../../../images/Main/Close.jpg" style="cursor: pointer" onclick="oprItem('searchtable','searchClick')" /></div>
                &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" class="Blue">
                <img src="../../../images/Main/Arrow.jpg" width="21" height="18" align="absmiddle" />��������
             
                <uc1:Message ID="Message2" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="99%" border="0" align="center" cellpadding="0" id="searchtable" cellspacing="0"
                    bgcolor="#CCCCCC">
                    <tr>
                        <td bgcolor="#FFFFFF">
                            <table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC"
                                class="table">
                                <tr class="table-item">
                                    <td width="10%" height="20" class="td_list_fields" align="right">
                                        ��ѯʱ��</td>
                                    <td width="20%" bgcolor="#FFFFFF">
                                        &nbsp;<input id="txtOpenDate"  runat="server"  class="tdinput" readonly="readonly" name="txtOpenDate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',el:$dp.$('txtOpenDate')})"
                                            size="15" type="text" />~
                                        <input id="txtCloseDate" runat="server" class="tdinput"  readonly="readonly"   name="txtCloseDate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',el:$dp.$('txtCloseDate')})"
                                            size="15" type="text" /></td>
                                    <td class="td_list_fields" align="right" width="10%">
                                        �����û�
                                    </td>
                                    <td width="25%" bgcolor="#FFFFFF" colspan="2">
                                        &nbsp;
                                        <input onclick="showUserList()" class="tdinput" type="text" style="width:300px;" readonly id="uids" onkeydown="return false;"/></td>
                                </tr>
                                <tr class="table-item">
                                    <td width="10%" height="20" class="td_list_fields" align="right">
                                        ����ģ��
                                    </td>
                                    <td width="20%" bgcolor="#FFFFFF">
                                         <input onclick="showMList();" type="text" class="tdinput" readonly id="uds" onkeydown="return false;"/>
                                    </td>
                                    <td class="td_list_fields" align="right" width="10%">
                                        ���ݱ��
                                    </td>
                                    <td width="25%" bgcolor="#FFFFFF" colspan="2">
                                        <input id="ds" type="text" class="tdinput" specialworkcheck="���ݱ��"/></td>
                                   
                                </tr>
                                <tr>
                                    <td colspan="5" align="center" bgcolor="#FFFFFF">
                                        <img alt="����" src="../../../images/Button/Bottom_btn_search.jpg" style='cursor: hand;'
                                            onclick='Fun_Search_LogInfo()'  id="btnQuery" visible="true" runat="server" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    
    <table width="95%" height="57" border="0" cellpadding="0" cellspacing="0" class="maintable"
        id="mainindex">
        <tr>
            <td valign="top">
                <img src="../../../images/Main/Line.jpg" width="122" height="7" />
            </td>
            <td align="center" valign="top">
                &nbsp;
            </td>
        </tr>
        <tr>
             <td height="30" colspan="2" align="center" valign="top" class="Title">
                 <input id="hidSearchCondition" type="hidden" />
               ������־�б�
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" id="pageDataList1"
                    bgcolor="#999999">
                    <tbody>
                        <tr>
                            <th height="20" align="center" class="td_list_fields" >
                             <div class="orderClick" onclick="OrderBy('UserID','oID');return false;">
                                    �����û�<span id="Span1" class="orderTip"></span></div>
                                
                            </th>
                            <th align="center" class="td_list_fields" >
                                <div class="orderClick" onclick="OrderBy('OperateDate','oID');return false;">
                                    ����ʱ��<span id="oID" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_list_fields" >
                                <div class="orderClick" onclick="OrderBy('ModuleID','oGroup');return false;">
                                    ����ģ��<span id="oGroup" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_list_fields" >
                                <div class="orderClick" onclick="OrderBy('ObjectID','oC1');return false;">
                                    �������ݱ��<span id="oC1" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_list_fields" >
                                <div class="orderClick" onclick="OrderBy('ObjectName','oC2');return false;">
                                    ��������<span id="oC2" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_list_fields" >
                                <div class="orderClick" onclick="OrderBy('Element','oC3');return false;">
                                    ��������<span id="oC3" class="orderTip"></span></div>
                            </th>
                            <th align="center" class="td_list_fields" >
                                <div class="orderClick" onclick="OrderBy('Remark','oC3');return false;">
                                    ��ע<span id="Span3" class="orderTip"></span></div>
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
                                    <td height="28" background="../../../images/Main/PageList_bg.jpg" width="40%">
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
            </td>
        </tr>
    </table><a name="pageDataList1Mark"></a><span id="Forms" class="Spantype"></span>
<div id="userList" style="display:none;" class="MList">

<div style="background-color:#f1f1f1;padding:3px; height:20px; padding-left:50px; padding-top:1px">
<a href="javascript:hideUserList()">�ر�</a>
<a style="margin-left:20px;" href="javascript:GetSelTreeNodes()">ȷ��</a>
</div>
<div style=" padding-top:5px; height:300px; width:200px; overflow:auto; margin-top:1px">
    <asp:TreeView ID="TreeView1" runat="server" ShowLines="True">
    </asp:TreeView></div>
</div>




    <div id="MList" style="display:none;" class="MList">
<div style="background-color:#f1f1f1;padding:3px;padding-left:50px;">
<a href="javascript:hideMList()">�ر�</a>
<a style="margin-left:20px;" href="javascript:GetSelMTreeNodes()">ȷ��</a>
</div>

  <div style=" padding-top:5px; height:300px; width:200px; overflow:auto; margin-top:1px">
    <asp:TreeView ID="TreeView2" runat="server" ShowLines="True">
    </asp:TreeView></div>
</div> 
    </form>
</body>
</html>

