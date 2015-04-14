﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddNotice.aspx.cs" Inherits="Pages_Personal_MessageBox_AddNotice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>新建公告</title>
    <link rel="stylesheet" type="text/css" href="../../../css/default.css" />
    <link href="../../../css/validatorTidyMode.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #txtTitle
        {
            width: 342px;
        }
        #txtToList
        {
            width: 467px;
        }
        .style1
        {
            width: 470px;
        }
        .style3
        {
            width: 59px;
        }
        .style4
        {
            color: #044d77;
            background-color: #dfebf8;
            width: 129px;
        }
    </style>

    <script src="../../../js/JQuery/jquery_last.js" type="text/javascript"></script>

    <script src="../../../js/personal/common.js" type="text/javascript"></script>

    <script src="../../../js/common/Common.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
        function showInfo(msg)
        {
            showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif",msg);
        }    
    
        
        
       
    
        function HtmlEncode(input)
        {
           var converter=document.createElement("DIV");
           converter.innerText=input;
           var output=converter.innerHTML;
           converter=null;
           return output;
        }
        
        function SendInfo(obj)
        {
             // document.getElementById("txtToList").value = userlist;
             // document.getElementById("seluseridlist").value = useridlist
            
            var title =HtmlEncode(document.getElementById("txtTitle").value);
            var content =HtmlEncode(document.getElementById("txtContent").value);
                        
            if(document.getElementById("txtTitle").value + "" == "")
            {
                showInfo("请填写信息标题");
                return;
            }
             if(document.getElementById("txtTitle").value.length>50)
            {
                showInfo("标题 长度不能超过50字符");
                return;
            }
            
            
             if(document.getElementById("txtContent").value + "" == "")
            {
                showInfo("请填写信息内容");
                return;
            }
              if(document.getElementById("txtContent").value.length>500)
            {
                showInfo("内容 长度不能超过500字符");
                return;
            }
                       
            
            var slStatus = document.getElementById("slStatus").value;
           var slIsShow= document.getElementById("slIsShow").value;
            
            var action ="AddItem";
            var prams = "title="+UrlEncode(title);
            prams += "&content="+UrlEncode(content);            
            prams += "&Status="+slStatus;
            prams += "&isshow="+slIsShow;
             
            obj.disabled = true;
            
            $.ajax({ 
                    type: "POST",
                    url: "../../../Handler/Personal/MessageBox/Notice.ashx?action=" + action,
                    dataType:'string',
                    data: prams,
                    cache:false,
                    success:function(data) 
                    {                          
                        obj.disabled = false;
                        
                        var result = null;
                        eval("result = "+data);
                        
                        if(result.result)                    
                        {      
                              //showInfo(result.data);
                              showInfo("保存成功");
                               document.getElementById("txtTitle").value = "";
                               document.getElementById("txtContent").value = "";                               
                        
                              
                        }else{                  
                               showInfo(result.data);               
                        }                   
                    },
                    error:function(data)
                    {
                        obj.disabled = false;
                        
                         showInfo(data.responseText);
                    }
                });
                        
        }
    </script>

</head>
<body>
    <br />
    <form id="EquipAddForm" runat="server">
    <div id="popupContent">
    </div>
    <span id="Forms" class="Spantype"></span>
    <table width="95%" height="57" border="0" cellpadding="0" cellspacing="0" class="maintable"
        id="mainindex">
        <tr>
            <td valign="top">
                <input type="hidden" id="hiddenEquipCode" value="" />
                <img src="../../../images/Main/Line.jpg" width="122" height="7" />
            </td>
            <td align="center" valign="top">
            </td>
        </tr>
        <tr>
            <td height="30" colspan="2" valign="top" class="Title">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="30" align="center" class="Title">
                            新建公告
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" valign="top" width="100%">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="6">
                        </td>
                    </tr>
                </table>
                <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999">
                    <tr>
                        <td height="28" bgcolor="#FFFFFF">
                            <div id="infoTip" style="margin-left: 110px; color: Red;">
                            </div>
                        </td>
                    </tr>
                </table>
                <table width="99%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#999999">
                    <tr>
                        <td height="20" class="td_list_title">
                            <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                <tr>
                                    <td class="style3">
                                        <img id="btn_save" visible="false" runat="server" src="../../../images/Button/Bottom_btn_save.jpg"
                                            onclick="SendInfo(this)" style="cursor: pointer;" />
                                    </td>
                                    <td>
                                        <a id="alink_back" href="PublicNotice.aspx?moduleid=10620">
                                            <img border="0" src="../../../images/Button/Bottom_btn_back.jpg" align="absbottom" />
                                        </a>
                                    </td>
                                    <td align="left">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table width="99%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#999999"
                    id="Tb_01">
                    <tr>
                        <td align="right" class="td_list_fields" style="width: 10%">
                            公告主题<font color="red">*</font>
                        </td>
                        <td bgcolor="#FFFFFF" style="width: 23%">
                            <input type="text" id="txtTitle" class="tdinput" />
                        </td>
                        <td height="20" align="right" class="td_list_fields">
                            审核状态<font color="red">*</font>
                        </td>
                        <td height="20" align="left" bgcolor="#FFFFFF">
                            <select id="slStatus" disabled>
                                <option value="0" selected>-----未审核-----</option>
                                <option value="1">-----已审核-----</option>
                            </select>
                        </td>
                        <td height="20" align="right" class="td_list_fields"">
                            是否在公告板显示<font color="red">*</font>
                        </td>
                        <td height="20" align="left" bgcolor="#FFFFFF">
                            <select id="slIsShow">
                                <option value="1" selected>-----是-----</option>
                                <option value="0">-----否-----</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td height="50" align="right" class="td_list_fields" valign="top" width="10%">
                            公告内容<font color="red">*</font>
                        </td>
                        <td height="50" bgcolor="#FFFFFF" colspan="5">
                            <asp:TextBox ID="txtContent" TextMode="MultiLine" class="tdinput" runat="server" Rows="16" Columns="60"
                                Height="300px" Width="100%"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="28" bgcolor="#FFFFFF">
                &nbsp;
            </td>
        </tr>
    </table>
    </form>

    <script language="javascript" type="text/javascript">
    if(document.referrer.toLowerCase().indexOf("left.aspx") != -1)
    {
        document.getElementById("alink_back").style.display = "none";
    }
    </script>

</body>
</html>
