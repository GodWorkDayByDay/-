﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CodeCompanyType.aspx.cs" Inherits="Pages_Office_SystemManager_CodeCompanyType" %>

<%@ Register src="../../../UserControl/Message.ascx" tagname="Message" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>物品分类</title>

    <script src="../../../js/common/Check.js" type="text/javascript"></script>
    <script src="../../../js/common/Common.js" type="text/javascript"></script>
    <script src="../../../js/JQuery/jquery_last.js" type="text/javascript"></script>
       <link href="../../../css/BaseDataTree.css" rel="stylesheet" type="text/css" />
    <link href="../../../css/pagecss.css" type="text/css" rel="Stylesheet" />
    <link href="../../../css/default.css" rel="stylesheet" type="text/css" />
    
     <style type="text/css">
        #treeContainer A{color:Black;text-decoration:none;}
        #treeContainer TD{padding:1px;}
        #divDept
        {
            border:solid 1px #111111;
            width:180px;
            height:300px;
            overflow:auto;    
            z-index:11;
            display:none;
            position:absolute;
            background-color:White;
            left:600px;
            
        }
     </style>
</head>
<body>
    <form id="form1" runat="server">
    <input type="hidden" id="txtID" />
    <div>
    <table width="99%" border="0" align="center" cellpadding="2" cellspacing="1" >
        <tr>
          <td   align="left">
          
          <table border="0" cellpadding="3" height="300" width="95%">
            <tr>
                <td valign="top" width="200" style="padding-left:20px;" id="treeContainer">
                    
                    <input id="hf_tablename" name="hf_tablename" type="hidden" 
                        value="officedba.CodeCompanyType" />
                   
                </td>
                <td valign="top">
                    <table cellpadding="2">
                        <tr><td></td><td class="Title"><span id="curAction" style="color:Black;font-weight:bold;">往来单位分类</span></td></tr>
                        <tr><td>
                            <asp:HiddenField ID="hf_flagid" runat="server" />
                            </td><td>
                            <input id="hf_supper" type="hidden" />
                                <asp:HiddenField ID="hf_typeflag" runat="server" />
                            <br />
             <a href="#" id="img_new">
                <a href="#" id="A1">
                <img border="0" onclick="treeview_cancel()" style="cursor:pointer;" 
                                src="../../../images/Button/Bottom_btn_new.jpg" runat="server" visible="false" id="btnNew"/></a><img id="btnSave" runat="server" visible="false" alt="" src="../../../Images/Button/Bottom_btn_save.jpg" 
                               onclick="treeview_save();" /><a href="#" id="img_delete" ><img 
                                border="0" onclick="treeview_delete()" style="cursor:pointer;" 
                                src="../../../images/Button/Main_btn_delete.jpg" id="btnDel" runat="server" visible="false" /></a></td></tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#999999"
                    id="Tb_01" style="display: block">
                    <tr>
                        <td  class="td_list_fields" align="right">
                            类别名称<span class="redbold">*</span>
                        </td>
                        <td bgcolor="#FFFFFF">
                            &nbsp;<input type="text"  id="CodeName" specialworkcheck="类别名称" name="TypeName" class="tdinput"/></td>
                        <input id="hf_deptID" type="hidden" />
                      <td  class="td_list_fields" align="right">
                            上级分类<span class="redbold">*</span>                       </td>
                               <input type="hidden" id="hidSelectValue" />
                        <td bgcolor="#FFFFFF" width="200px"><select id="slSupperTypeID" name="D1"></select>  <span style="float:left"><input id="divSelectName"  class="tdinput" type="text" onclick="showdiv();"/></span>  
<div id="divDept" style="display:none;"><iframe id="aaaa" style="position: absolute; z-index: -1; width:400px; height:25px;" frameborder="1">  </iframe>
<div style="background-color:#f1f1f1;padding:3px;padding-left:50px;">
<a href="javascript:hideMList()">关闭</a>
</div>
     <div id="divDeptTree" style="overflow-x:auto;overflow-y:auto;height:500px;width:400px;"> <a href="#" onclick="SetSelectValue('','','');">上级分类</a>正在获取数据,请稍等......</div>
                </div>
                        <td  class="td_list_fields" align="right">
                            启用状态
                        </td>
                        <td bgcolor="#FFFFFF">
                            &nbsp;<font color="red"><select id="UsedStatus" runat="server" name="SetPro2" width="139px">
                           <option value="1">启用</option>
                          <option value="0">停用</option>
                                </select></font></td>
                    </tr>
                    <tr id="CloseDate">
                       <td  height="20" align="right" class="td_list_fields">
                            往来单位大类<span class="redbold">*</span>
                        </td>
                        <td height="20" bgcolor="#FFFFFF" >
                            <font color="red"><select id="selBigType" runat="server" name="SetPro3" 
                                width="139px">
                           <option value="1">客户</option>
                          <option value="2">供应商</option>
                          <option value="3">竞争对手</option>
                          <option value="4">银行</option>
                          <option value="5">外协加工厂</option>
                          <option value="6">运输商</option>
                           <option value="7">其他</option>
                                </select></font></td>
                       <td  height="20" align="right" class="td_list_fields">
                            描述
                        </td>
                        <td height="20" bgcolor="#FFFFFF" class="tdinput" colspan="3">
                            <input type="text" id="txt_Description" specialworkcheck="描述" name="TypeName1" class="tdinput"/></td>
                    </tr>
                    </table>
                    <br />
                    <uc1:Message ID="Message1" runat="server" />
                </td>
            </tr>
          </table>
          </td>
        </tr>
      </table>
    </div>
    </form>
</body>
</html>
 <script src="../../../js/office/SystemManager/CodeBigType.js" type="text/javascript"></script>