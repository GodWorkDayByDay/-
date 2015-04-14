﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SelectUserOrRole.aspx.cs" Inherits="Pages_Common_SelectUserOrRole" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>角色</title>
    <base target="_self" ></base>
      <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
        <META HTTP-EQUIV="Expires" CONTENT="0">


    <link href="../../css/css.css" rel="stylesheet" type="text/css" /> 

    <script src="../../js/common/UserOrRoleSelect.js" type="text/javascript"></script>
    <style type="text/css">
        
        div.bottom {
  position:relative;
  }
div.bottom p {
  position:absolute;
  bottom:0;
  }



body {
	color: #000000;
	font-family: 宋体;
	font-size: 12px;
	line-height: 150%;
	margin-bottom: 0px;
	margin-left: 0px;
	margin-right: 0px;
	margin-top: 0px;
	scrollbar-3dlight-color: #999999;
	scrollbar-arrow-color: #888888;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-face-color: #EBEBEB;
	scrollbar-highlight-color: #FFFFFF;
	scrollbar-shadow-color: #7A7A7A;
	scrollbar-track-color: #FFFFFF;} /*滚动条样式*/

.hidden{display:none}

table {  font-family: "宋体"; font-size: 12px;}

a:link {
	color: #135294;
	text-decoration: none;
}
.pt13{color:#000000; font-size:12px}

.pt12{color:#000000; font-size:12px}

.pt12B{color:#000000; font-size:12px}

a:visited {
	color: #135294;
	text-decoration: none;
}

a:hover {
	color: #FF0000;
	text-decoration: underline;
}

a:active {
	background-color: transparent;
	color: #000000;
	text-decoration: none;} /*加了链接的字符样式*/

table.top {
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: none;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-top-color: #9DB3ED;
	border-right-color: #9DB3ED;
	border-bottom-color: #9DB3ED;
	border-left-color: #9DB3ED;} /*只有上方无实线边框的表格*/
	
.font13 {
	font-size: 13px;
	color: #333333;
}
.tbhe {
	height: auto;
	width: 50px;}/*规定了宽度的表格*/
	
.tablelb {
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: none;
	border-left-style: solid;
	border-top-color: #327AC6;
	border-right-color: #327AC6;
	border-bottom-color: #327AC6;
	border-left-color: #327AC6;
	font-size: 13px;
	color: #000000;} /*只有下方无实线边框的表格*/
	
.font12w {
	font-size: 12px;
	color: #FFFFFF;}
	
.font13b {
	font-size: 12px;
	color: #000000;}
	
.tableleft {
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: solid;
	border-left-style: solid;
	border-top-color: #4A8ED9;
	border-right-color: #4A8ED9;
	border-bottom-color: #4A8ED9;
	border-left-color: #4A8ED9;
	font-size: 12px;
	color: #000000;}/*下方和左边有实线边框的表格*/
	
		
.lefttopbg {
	PADDING-RIGHT: 20px; BACKGROUND: url(../images/folders_top.gif) right top; WIDTH: 165px; PADDING-TOP: 6px; height: 28px;
	}
	
.leftmiddlebg{
	PADDING-RIGHT: 9px; PADDING-LEFT: 8px; BACKGROUND: url(../images/folders_bg.gif) right 50%; WIDTH: 165px; PADDING-TOP: 6px
	}
	
.leftbottombg{
	BACKGROUND: url(../images/folders_bottom.gif) right bottom; WIDTH: 165px
	}
	
.tablex {
	font-size: 12px;
	color: #000000;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: solid;
	border-left-style: none;
	border-top-color: #4A8ED9;
	border-right-color: #4A8ED9;
	border-bottom-color: #4A8ED9;
	border-left-color: #4A8ED9;}/*只有下方有实线的表格*/

.INPUT{BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 1px; PADDING-LEFT: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 9pt; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #cccccc; PADDING-BOTTOM: 1px; BORDER-TOP-COLOR: #cccccc; PADDING-TOP: 1px; HEIGHT: 13px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #cccccc}

.botton02 {
	font-size: 12px;
	color: #000000;
	background-image: url(../images/but02.gif);
	height: 21px;
	width: 58px;
	border: none;}/*两个字的按钮*/

.cn-blue {
	FONT-SIZE: 12px; COLOR: #283195; FONT-FAMILY: "宋体"
}




.button05 {
	font-size: 12px;
	color: #000000;
	background-image: url(images/but05.gif);
	height: 21px;
	width: 80px;
	border: none;}/*五个字的按钮*/
	
.button04 {
	font-size: 12px;
	color: #000000;
	background-image: url(../images/but04.gif);
	height: 21px;
	width: 70px;
	border: none;}/*四个字的按钮*/
	
.button02{
	background-image: url(../images/but02.gif); 
	height: 23px;
	width: 70px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: none;
}
.button01{
	background-image: url(../images/but02.gif); 
	height: 23px;
	width: 58px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: none;
}
.bottonmini {
	font-size: 12px;
	color: #000000;
	background-image: url(images/b_min02.gif);
	height: 21px;
	width: 36px;
	border: none;}/*两个字的按钮*/
	
.table {
	font-size: 12px;
	border: 1px solid #4A8ED9;}/*四周都有实线的表格*/
	
.tableZ {
 	background-color:#4A8ED9;
	font-size: 12px;
	border: 1px solid #4A8ED9;}/*四周都有实线的表格*/
.tdbj01 {
	border-top-style: none;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-top-color: #C7D1F0;
	border-right-color: #C7D1F0;
	border-bottom-color: #C7D1F0;
	border-left-color: #C7D1F0;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
}
.tdbj02 {
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: solid;
	border-top-color: #C7D1F0;
	border-right-color: #C7D1F0;
	border-bottom-color: #C7D1F0;
	border-left-color: #C7D1F0;
}

/*以下table0-3发文稿纸样式*/
.table0 {
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: none;
	border-bottom-style: solid;
	border-left-style: none;
	border-top-color: #ff0000;
	border-right-color: #ff0000;
	border-bottom-color: #ff0000;
	border-left-color: #ff0000;
}
.table1 {
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: none;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: none;
	border-top-color: #ff0000;
	border-right-color: #ff0000;
	border-bottom-color: #ff0000;
	border-left-color: #ff0000;
}
.table2 {
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: none;
	border-right-style: solid;
	border-bottom-style: none;
	border-left-style: none;
	border-top-color: #ff0000;
	border-right-color: #ff0000;
	border-bottom-color: #ff0000;
	border-left-color: #ff0000;
}
.table3 {
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: solid;
	border-left-style: none;
	border-top-color: #ff0000;
	border-right-color: #ff0000;
	border-bottom-color: #ff0000;
	border-left-color: #ff0000;
	font-size: 12px;

}
.table5_blue {
	border: 1px solid #0000FF;
}
.seaechbon {
	background-image: url(images/seaech.gif);
	height: 35px;
	width: 68px;
	border: none;
}
.tablebbs {
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: none;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: none;
	border-right-color: #C7D1F0;
	border-bottom-color: #4A8ED9;

}
p.a{color:#000000; font-size:12px}
font.d{color:#000000; font-size:12px}
td.c{color:#000000; font-size:13px}
table.b{color:#000000; font-size:12px}
select.1 {
	border: 1px solid #95B9DD;
	background-color: #F8FAFC;
	font-size: 9pt; color: #6E97BF}

input.1 {
	border: 1px solid #7094B9;
	background-color: #F8FAFC;
	font-size: 9pt;
	}
.Alternatingback {
   background-color: #ECF1F8;
   border-color :#99ccff;
   border-width :1px;
}
.gridheader {
	background-color: #58A7FA;
	font-weight: bold;
	text-decoration: none;
	 
}
.SelectedItemback {
	background-color: #FDB452;
}
.griditem {
	background-color: #ffffff;	
    border-color :#99ccff;
    border-width :1px;
}
.gridSetting
{
   /* background-color :#99ccff;*/
}
.borders {
 font-size: 12px;
 background-color: #0099FF;
}
.borderstd{
 font-size: 12px;
}

.boardstate {
	border-width: 1px;
	border-style: none;
	border-right-style: solid;
	border-bottom-style :solid ;
	border-color: #ffffff;
}
.gridheaderstyle{
 color:#000000;
}
.tableborder {
	border: 1px solid #FFFFFF;
} 
.td0{
	table-layout:fixed;word-break:break-all;
	word-wrap:break-word;
	table-layout:fixed;
}
.button01_enter{
	background-image: url(images/button01_enter.gif); 
	height: 23px;
	width: 60px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: none;
}
.button02_min {
	background-image: url(images/button01_min.gif);
	height: 21px;
	width: 39px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: none;
}


#menu {
	MARGIN: 0px auto; WIDTH: 600px;TEXT-ALIGN: center
}
#menu  {
	MARGIN: 0px;HEIGHT: 30px; MARGIN-bottom: -25px
}
#dropmenu {
	CLEAR: both; DISPLAY: block; WIDTH: 600px; TEXT-ALIGN: center;HEIGHT: 30px
}
#dropmenu LI {
	DISPLAY: block; Z-INDEX: 10; FLOAT: left; POSITION: relative
}
#dropmenu UL {
	DISPLAY: none; LEFT: 0px; POSITION: absolute; HEIGHT: auto; TEXT-ALIGN: left
}
#dropmenu LI.over A {
	BACKGROUND-POSITION: 50% bottom; FONT-WEIGHT: bold; BACKGROUND-IMAGE: url(../images/menu_overbg.gif); COLOR: #ec8035; BACKGROUND-REPEAT: no-repeat; TEXT-DECORATION: none
}
#dropmenu LI.clicked A {
	BACKGROUND-POSITION: 50% bottom; FONT-WEIGHT: bold; BACKGROUND-IMAGE: url(../images/menu_clicked.gif); COLOR: #ec8035; BACKGROUND-REPEAT: no-repeat; TEXT-DECORATION: none
}
#dropmenu LI:hover A {
	BACKGROUND-POSITION: 50% bottom; FONT-WEIGHT: bold; BACKGROUND-IMAGE: url(../images/menu_overbg.gif); COLOR: #ec8035; BACKGROUND-REPEAT: no-repeat; TEXT-DECORATION: none
}
#dropmenu LI.over UL A {
	FONT-WEIGHT: normal; BACKGROUND: url(../images/submenu_bg.gif) repeat-x 50% top; COLOR: #008bbc
}
#dropmenu LI:hover UL A #dropmenu {
	FONT-WEIGHT: normal; BACKGROUND: url(../images/submenu_bg.gif) repeat-x 50% top; COLOR: #008bbc
}
#dropmenu LI.over UL A:hover {
	COLOR: #333
}
#dropmenu LI:hover UL A:hover {
	COLOR: #333
}
#dropmenu A {
	DISPLAY: block; WIDTH: 75px; COLOR: #fff; LINE-HEIGHT: 28px; BACKGROUND-IMAGE: url(../images/menu_overbg1.gif)
}
#dropmenu UL LI {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px; TEXT-ALIGN: center
}
#dropmenu UL A {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px; BACKGROUND-COLOR: #eef0f1
}
#dropmenu LI:hover UL {
	DISPLAY: block
}
#dropmenu LI.over UL {
	DISPLAY: block
}



iframe{v:expression(this.src='about:blank',this.outerHTML='');}
#district{v:expression('');}/*允许自己iframe加载*/
#editor{v:expression('');}/*允许自己iframe加载*/






         </style>

    <script language="javascript" type="text/javascript">
    
    //获取元素指定tagName的父元素
function public_GetParentByTagName(element, tagName) 
{
    var parent = element.parentNode;
    var upperTagName = tagName.toUpperCase();
    while (parent && (parent.tagName.toUpperCase() != upperTagName)) 
    {
        parent = parent.parentNode ? parent.parentNode : parent.parentElement;
    }
    return parent;
}

//设置节点的父节点Cheched——该节点可访问，则他的父节点也必能访问
function setParentChecked(objNode)
{ 
    var objParentDiv = public_GetParentByTagName(objNode,"div");
    if(objParentDiv==null || objParentDiv == "undefined")
    {
        return;
    }
    var objID = objParentDiv.getAttribute("ID");
    objID = objID.substring(0,objID.indexOf("Nodes"));
    objID = objID+"CheckBox";
    var objParentCheckBox = document.getElementById(objID);
    if(objParentCheckBox==null || objParentCheckBox == "undefined")
    {
        return;
    } 
    if(objParentCheckBox.tagName!="INPUT" && objParentCheckBox.type == "checkbox")
        return; 
    objParentCheckBox.checked = true;
    setParentChecked(objParentCheckBox);
}

//检查子节点有无checked
function checkChildAnyChecked(objParentDiv)
{
    var b = false;
    var objchild = objParentDiv.children;
    var count = objchild.length; 
    for(var i=0;i<count;i++)
    {
        var tempObj = objchild[i];
        if(tempObj.tagName=="INPUT" && tempObj.type == "checkbox")
        {
            if(tempObj.checked)
            {
                b = true;
            }
        }
        else
        {
            b=checkChildAnyChecked(tempObj);
        }
        if(b)
        {
            break;
        }
    }
    return b;
}

//设置父节点合理状态 子节点都不选中则父节点也不选中
function checkParentChecked(objNode)
{
    var objParentDiv = public_GetParentByTagName(objNode,"div");
    if(objParentDiv==null || objParentDiv == "undefined")
    {
        return;
    }
    var objID = objParentDiv.getAttribute("ID");
    objID = objID.substring(0,objID.indexOf("Nodes"));
    objID = objID+"CheckBox";
    var objParentCheckBox = document.getElementById(objID);
    if(objParentCheckBox==null||objParentCheckBox=="undefined")
    {
        return;
    }
    objParentCheckBox.checked = checkChildAnyChecked(objParentDiv);
    checkParentChecked(objParentCheckBox);
}

//设置节点的子节点uncheched——该节点不可访问，则他的子节点也不能访问
function setChildUnChecked(divID)
{ 
    var objchild = divID.children;
    var count = objchild.length; 
    for(var i=0;i<count;i++)
    {
        var tempObj = objchild[i];
        if(tempObj.tagName=="INPUT" && tempObj.type == "checkbox")
        {
            tempObj.checked = false;
        }
        setChildUnChecked(tempObj); 
    }
}

//设置节点的子节点cheched——该节点可以访问，则他的子节点也都能访问
function setChildChecked(divID)
{ 
    var objchild = divID.children;
    var count = objchild.length; 
    for(var i=0;i<count;i++)
    {
        var tempObj = objchild[i];
        if(tempObj.tagName=="INPUT" && tempObj.type == "checkbox")
        {
            tempObj.checked = true;
        }
        setChildChecked(tempObj); 
    }
}

//主函数 处理事件
function CheckEvent()
{
    var objNode = event.srcElement; 
    if(objNode.tagName!="INPUT" || objNode.type!="checkbox")
    {
        return;
    }
    if(objNode.checked==true)
    {
        setParentChecked(objNode);
        var objID = objNode.getAttribute("ID");
        var objID = objID.substring(0,objID.indexOf("CheckBox")); 
        var objParentDiv = document.getElementById(objID+"Nodes");
        if(objParentDiv==null || objParentDiv == "undefined")
        {
            return;
        } 
        setChildChecked(objParentDiv);
    }
    else
    {
        var objID = objNode.getAttribute("ID");
        var objID = objID.substring(0,objID.indexOf("CheckBox")); 
        var objParentDiv = document.getElementById(objID+"Nodes");
        if(objParentDiv==null || objParentDiv == "undefined")
        {
            checkParentChecked(objNode);
            return;
        }
        setChildUnChecked(objParentDiv);
        checkParentChecked(objNode);
    }
}


    function getUserOrRole()
    {
        var div_id=document.getElementById("dv_tree");
        var objs=div_id.getElementsByTagName('input');
        var select="";
                //遍历所有控件
                for(var i = 0; i < objs.length; i++)
                {
                    //判断是否是选中的checkbox
                    if(objs[i].getAttribute("type") == "checkbox" && objs[i].checked)
                    {
                          var s = objs[i].nextSibling.href;
                          if(s.indexOf("void")>=0)
                          {
                      
                           var startindex=s.indexOf("(");
                           var endindex=s.indexOf(")");
                           var getinfo=s.substring(startindex+2,endindex-1);
                          
                           if(getinfo!="0")
                           {
                           
                              var splitinfo=getinfo.split(",");
                             var madeValue=splitinfo[1].toString()+"|"+splitinfo[0].toString();
                              select += madeValue + ",";
                           }
                           
                          }
                    }
                     //判断是否是选中的radiobutton
                    if(objs[i].getAttribute("type") == "radio" && objs[i].checked)
                    {
                        //获取列的值
                       var values = objs[i].value;
                        select += values.toString() + ",";
                    }
                }
                if(select=="")
                {
                    alert("请选择部门或人员！");
                    return;
                }
                select=select.substring(0,select.length - 1);
                window.returnValue=select;
                window.close();
    }
    

    	
    function ClearInfo() 	
    {
                window.returnValue="ClearInfo";
                window.close();

    }


    </script>
</head>
<body style="background-color:#FFFFFF; ">
    <form id="form1" runat="server">
    <input type="hidden"  id="IsMul" runat ="server"/>
    <div style="height:325px; width:340px;overflow-x:hidden;overflow-y:auto;" id="dv_tree">
        <asp:TreeView ID="UserRoleTree" runat="server" ShowLines="True" >
        </asp:TreeView>
      
           </div>
             <div style="text-align:center;";  class="bottom" >
             <img src="../../Images/Button/Bottom_btn_confirm.jpg" runat="server"   id="btnOk"  onclick="getUserOrRole();"/>&nbsp;
        <img src="../../Images/Button/Bottom_btn_cancel.jpg" runat="server"    id="btnCancel" onclick="window.close();" />
        <img src="../../images/Button/Bottom_btn_del.jpg" alt="清空"  id="btnclear"    onclick="ClearInfo();"   runat="server"  style='cursor:pointer;'  />
           </div> 
     <input type="hidden" id="hidaction" value="" />
    
    </form>
</body>
</html>
