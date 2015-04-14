﻿function getMoney()
{
alert (document .getElementById ("divSalaryList").innerHTML);
}

/*
* 添加社会保险
*/
function DoAdd(){
    //获取表格
    table = document.getElementById("tblSalary");
    //获取行号
    var no = table.rows.length;
    if (no>1)
    {
        var ssd=no-1;
        var getTemp=document .getElementById ("txtMaxMoney_"+ssd).value.Trim();
        if (getTemp =="" || getTemp ==null  || getTemp =="undifine")
        {
            document .getElementById ("txtMaxMoney_"+ssd).focus();
        return ;
        }
        else
        {
            var getMaxMoney=document .getElementById ("txtPersonTaxPercent_"+ssd).value.Trim();
                  if (getMaxMoney =="" || getMaxMoney ==null  || getMaxMoney =="undifine")
                  {
                    document .getElementById ("txtPersonTaxPercent_"+ssd).focus();
                    return ;
                 }
        
        
        }
    }
    
    //添加新行
	var objTR = table.insertRow(-1);
	/* 添加行的单元格 */
	//选择框
	var objTD = objTR.insertCell(-1);
	objTD.className = "tdColInputCenter";
	objTD.innerHTML = "<input type='hidden' id='txtSalaryID_" + no + "' value='' />"
	                + "<input type='hidden' id='txtEditFlag_" + no + "' value='0' />"
	                + "<input type='checkbox' onclick='SetCheckAll(this);' id='chkSelect_" + no + "'>";
	//上限
	if (no==1)
	{
	objTD = objTR.insertCell(-1);
	objTD.className = "tdColInputCenter";
	objTD.innerHTML = "<input type='text' maxlength='12' style='width:98%;' readonly ='readonly' onchange='Number_round(this,0);'     class='tdinput' id='txtMinMoney_" + no + "' value='0' />";
	}
	else
	{
	var row=no-1;
	document .getElementById ("chkSelect_"+row).style.display="none";
		document .getElementById ("txtMaxMoney_"+row).readOnly="true";
			document .getElementById ("txtMinMoney_"+row).readOnly="true";
			document .getElementById ("txtPersonTaxPercent_"+row).readOnly="true";
	var preMoney=document .getElementById ("txtMaxMoney_"+row).value.Trim();
	objTD = objTR.insertCell(-1);
	objTD.className = "tdColInputCenter";
	objTD.innerHTML = "<input type='text' maxlength='12' style='width:98%;' readonly ='readonly'    onchange='Number_round(this,0);'   class='tdinput' id='txtMinMoney_" + no + "' value="+preMoney+" />";
	}
	//下限
	objTD = objTR.insertCell(-1);
	objTD.className = "tdColInputCenter";
	objTD.innerHTML = "<input type='text' maxlength='12' style='width:98%;'  onchange='Number_round(this,0);'   class='tdinput' id='txtMaxMoney_" + no + "' />";
	
	//税率
	objTD = objTR.insertCell(-1);
	objTD.className = "tdColInputCenter";
	objTD.innerHTML = "<input type='text' maxlength='6' style='width:98%;'   onchange='Number_round(this,2);'  onblur='CalculateTotalSalary(this, \"" + no+ "\");'    class='tdinput' id='txtPersonTaxPercent_" + no + "' />";
	//速算扣除数
	objTD = objTR.insertCell(-1);
	objTD.className = "tdColInputCenter";
	objTD.innerHTML = "<input type='text' maxlength='6' readonly ='readonly'  style='width:98%;' class='tdinput'  id='txtPersonMinusMoney_" + no + "' />";

}



//function Allchange(row)
//{
//    if (row==1)
//    {
//    CalculateTotalSalary(1);
//    }
//    else
//    {
//    var newRow=row+1;
//    if ()
//    
//    
//    }
//}
/*
* 设置全选CheckBox
*/
function SetCheckAll(obj){
    //获取全选择控件
    checkAll = document.getElementById("chkAll");
    //如果checkbox未选中
    if (!obj.checked)
    {
        checkAll.checked = false;
        return;
    }
    else
    {
        isSelectAll = true;        
        //获取表格
        table = document.getElementById("tblSalary");
        //获取表格行数
	    var count = table.rows.length;
	    if (count < 2) return;
	    //遍历表格中的数据，判断是否选中
	    for (var row = count - 1; row > 0; row--)
	    { 
	        //行未被删除时
	        if (table.rows[row].style.display != "none")
	        {
	            //获取选择框控件
	            chkControl = document.getElementById("chkSelect_" + row);
	            //如果未选中，则返回
	            if (!chkControl.checked)
	            {
	                isSelectAll = false;
	                break;
	            }
	        }
	    }
	    //列表中全部选中时，选择checkbox选中
	    if (isSelectAll)
	    {
	        checkAll.checked = true;
	    }
	    //列表中有一个未选中时，选择checkbox未选中
	    else
	    {
	        checkAll.checked = false;
	    }
    }
}

/*
* 全选择表格行
*/
function SelectAll(){
    //获取表格
    table = document.getElementById("tblSalary");
    //获取表格行数
	var count = table.rows.length;
	if (count < 2) return;
	var isSelectAll = document.getElementById("chkAll").checked;
	//遍历表格中的数据，判断是否选中
	for (var row = count - 1; row > 0; row--)
	{
	    //行未被删除时
	    if (table.rows[row].style.display != "none")
	    {
	        //获取选择框控件
	        chkControl = document.getElementById("chkSelect_" + row);
	        //全选择
	        if (isSelectAll)
	        {
	            chkControl.checked = true;
	        }
	        else
	        {
	            chkControl.checked = false;
	        }
	    }
	}
}


 function   tofloat(f,dec)   {     
  if(dec<0)   return   "Error:dec<0!";     
  result=parseInt(f)+(dec==0?"":".");     
  f-=parseInt(f);     
  if(f==0)     
  for(i=0;i<dec;i++)   result+='0';     
  else   {     
  for(i=0;i<dec;i++)   f*=10;     
  result+=parseInt(Math.round(f));     
  }     
  return   result;     
  }  
/*
* 删除表格行
*/
function DoDelete(){

  if(!confirm("删除后不可恢复，确认删除吗！"))
      {
      return ;
      }

    //获取表格
    table = document.getElementById("tblSalary");
    //获取表格行数
	var count = table.rows.length;
	if (count < 2) return;
	//遍历表格中的数据，判断是否选中
	for (var row = count - 1; row > 0; row--)
	{
	    //获取选择框控件
	    chkControl = document.getElementById("chkSelect_" + row);
	    //如果控件为选中状态，删除该行，并对之后的行改变控件名称
	    if (chkControl.checked)
	    {
	       //删除行，实际是隐藏该行
	      // table.rows[row].style.display = "none";
	            table.deleteRow(row);
	            var ss=row-1;
	            if (ss>0)
	            {
	            document .getElementById ("txtMaxMoney_"+ss).readOnly=false;
	            if (ss!=1)
	            {
		//	document .getElementById ("txtMinMoney_"+ss).readOnly=false;
			}
			document .getElementById ("txtPersonTaxPercent_"+ss).readOnly=false;
	          document .getElementById ("chkSelect_"+ss).style.display="Block";
	          }
	          		
	    }
	}
}

function CalculateTotalSalary(obj, row)
{ 
    //获取输入的值
    inputValue = obj.value;
    //判断输入的小数点
    var arr = inputValue.split(".");
    if (arr.length <= 2)
    {
        index = inputValue.indexOf(".");
        //输入的第一位是小数点时，前面加0
        if (index == 0)
        {
            obj.value = "0" + inputValue;
        }
        //最后一位是小数点时
        else if (index == inputValue.length - 1)
        {
            obj.value = inputValue.replace(".", "");
        }
        else if (index > -1)
        {
            obj.value = inputValue.substring(0, index + 3);
        }
        
   
        var minMoney=document.getElementById("txtMinMoney_"+row ).value.Trim();
        var maxMoney=document.getElementById("txtMaxMoney_"+row ).value.Trim(); 
        var personTaxPercent=document.getElementById("txtPersonTaxPercent_"+row ).value.Trim(); 
          var personMinusMoney=document.getElementById("txtPersonMinusMoney_"+row ).value.Trim(); 
          var isErrorFlag=false ;
             var fieldText = "";
    //出错提示信息
    var msgText = "";
//          if (!IsNumeric(minMoney ,12,2))
//          {
//            fieldText +=   "第"+row+"行" +"税率项" + "|";
//                msgText += "请输入税率！|";
//                isErrorFlag=true ;
//          }
          if (maxMoney ==null || maxMoney =="")
           {  
          }
          else
          {
             if (!IsNumeric(maxMoney  ,12,2))
                  {
                  fieldText +=   "第"+row +"行" +"应缴税下限项" + "|";
                        msgText += "请输入正确的应缴税下限！|";
                        isErrorFlag=true ;
                  }
          }
            if (personTaxPercent ==null || personTaxPercent =="")
           {
                 
            } 
            else
            {
                if (!IsNumeric(personTaxPercent  ,6,2))
                  {
                  fieldText +=   "第"+row+"行" +"税率项" + "|";
                        msgText += "请输入正确的税率！|";
                        isErrorFlag=true ;
                  }
            }     
               if ((personTaxPercent ==null || personTaxPercent =="")&&(maxMoney ==null || maxMoney =="")  )
            {
            }
            else
            {
                  if (!isErrorFlag )
                  {
                      if (parseFloat (maxMoney )<parseFloat (minMoney ) )
                      {
                          fieldText +=   "第"+row+"行" +"应缴税下限项" + "|";
                            msgText += "应缴税下限项应大于应缴税上限项！|";
                            isErrorFlag=true ;
                      }
                  }
          }
           
    //如果有错误，显示错误信息
    if(isErrorFlag)
    {
        //显示错误信息
        //popMsgObj.Show(fieldText, msgText);
        
	    document.getElementById("spanMsg").style.display = "block";
	    document.getElementById("spanMsg").style.top = "240px";
	    document.getElementById("spanMsg").style.left = "450px";
	    document.getElementById("spanMsg").style.width = "290px";
	    document.getElementById("spanMsg").style.position = "absolute";
	    document.getElementById("spanMsg").style.filter = "progid:DXImageTransform.Microsoft.DropShadow(color=#cccccc,offX=4,offY=4,positives=true)";
	    document.getElementById("spanMsg").innerHTML = CreateErrorMsgDiv(fieldText, msgText);
	    return ;
    }
          
          
        if (row==1)
        {
        document.getElementById("txtPersonMinusMoney_"+row ).value=0;
        }
        else
        {
        
         var info=new Array ();
         var sum=0;
         var leftMoney=0;
            if (row>1)
            {
              
                    for (var i=1;i<row;i++)
                    {
                     
                        var PreMinMoney=document.getElementById("txtMinMoney_"+i ).value.Trim();
                        var PreMaxMoney=document.getElementById("txtMaxMoney_"+i ).value.Trim(); 
                        var PrePersonTaxPercent=document.getElementById("txtPersonTaxPercent_"+i ).value.Trim(); 
                        var PrePersonMinusMoney=document.getElementById("txtPersonMinusMoney_"+i ).value.Trim(); 
                          
                          if (leftMoney ==0)
                          {
                                   leftMoney= minMoney -PreMaxMoney ;
                                   if (leftMoney >0)
                                   {
                                    sum=sum+PreMaxMoney *(personTaxPercent-PrePersonTaxPercent)/100;
                                   }
                                   else  if (leftMoney ==0)
                                   {
                                     sum=sum+PreMaxMoney *(personTaxPercent-PrePersonTaxPercent)/100;
                                   }
                                    else  if (leftMoney <0)
                                    {
                                    sum=0;
                                    }
                                   
                          }else
                          {
                              
                                   if (leftMoney -PreMaxMoney >0)
                                   {
                                    sum=sum+PreMaxMoney *(personTaxPercent-PrePersonTaxPercent)/100;
                                   }
                                   else  if (leftMoney -PreMaxMoney ==0)
                                   {
                                   sum=sum+leftMoney *(personTaxPercent-PrePersonTaxPercent)/100;
                                   }
                                     else  if (leftMoney -PreMaxMoney <0)
                                   {
                                         sum=sum+leftMoney *(personTaxPercent-PrePersonTaxPercent)/100;
                                   }
                           leftMoney= leftMoney -PreMaxMoney ;
                          
                          }
                   
                    
                    }
               
            } 
          sum=tofloat (sum,2);
            document.getElementById("txtPersonMinusMoney_"+row ).value=sum;
        }
         
        
//        
//        //获取工资ID相同部门
//        salaryRowID = "txtSalaryMoney_" + row + "_";
//        //获取工资项个数
//        salaryCount = parseInt(document.getElementById("txtSalaryCount").value);
//        //定义变量
//        var totalSalaryMoney = 0;
//        //遍历所有工资输入
//        for (var i = 1; i <= salaryCount; i++)
//        {
//            //工资额 
//            salaryMoney = document.getElementById(salaryRowID + i).value;
//            //是否扣款
//            payFlag = document.getElementById("txtPayFlag_" + row + "_" + i).value;
//            if (salaryMoney != null && salaryMoney != "" && IsNumeric(salaryMoney, 10, 2))
//            {
//                //扣款时
//                if ("1" == payFlag)
//                {
//                    //计算总金额
//                    totalSalaryMoney -= parseFloat(salaryMoney);
//                }
//                //加款
//                else
//                {
//                    //计算总金额
//                    totalSalaryMoney += parseFloat(salaryMoney);
//                }
//            }
//        }
	    //设置面试总成绩
	    /* 未考虑 NaN的情况 有时间再做 */
//	    document.getElementById("txtTotalSalary_" + row).value = parseInt(totalSalaryMoney * 100 + 0.5) / 100;
    }
}

/*
* 保存操作
*/
function DoSave()
{
    /* 页面信息进行校验 */
    //基本信息校验 有错误时，返回
    if (CheckInput())
    {
        return;
    }
    //获取人员基本信息参数
    postParams = "?Action=Save&message=" + GetPostParams();
    $.ajax({ 
        type: "POST",
        url: "../../../Handler/Office/HumanManager/SalaryInsuPersonaIncomeTax_Edit.ashx"+postParams ,
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
            if(data.sta == 1) 
            { 
                 showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif","保存成功！");
            }
            else 
            { 
                hidePopup();
                showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif","保存失败,请确认！");
            } 
        } 
    }); 
}


function   GetPostParams()
{

var tempInfo=new Array ();
table = document.getElementById("tblSalary");
    //获取行号
var no = table.rows.length;
for (var i=1;i<no;i++)
{
      var minMoney=document.getElementById("txtMinMoney_"+i ).value.Trim();
        var maxMoney=document.getElementById("txtMaxMoney_"+i ).value.Trim(); 
        var personTaxPercent=document.getElementById("txtPersonTaxPercent_"+i ).value.Trim(); 
          var personMinusMoney=document.getElementById("txtPersonMinusMoney_"+i ).value.Trim(); 
          tempInfo .push (i,minMoney ,maxMoney,personTaxPercent ,personMinusMoney );
}
return tempInfo ;


}

/*
* 输入信息校验
*/
function CheckInput()
{ 
     //出错字段
    var fieldText = "";
    //出错提示信息
    var msgText = "";
    //是否有错标识
    var isErrorFlag = false;    
   
table = document.getElementById("tblSalary");
    //获取行号
var no = table.rows.length;
for (var i=1;i<no;i++)
{
      var minMoney=document.getElementById("txtMinMoney_"+i ).value.Trim();
         if (minMoney =="" || minMoney ==null  || minMoney =="undifine")
         {
                isErrorFlag = true;
                fieldText +=   "第"+no+"行" +"应缴税上限项" + "|";
                msgText += "请输入应缴税上限项！|";
                  break ;
         }
        var maxMoney=document.getElementById("txtMaxMoney_"+i ).value.Trim(); 
            if (maxMoney =="" || maxMoney ==null  || maxMoney =="undifine")
         {
                isErrorFlag = true;
                fieldText +=   "第"+no+"行" +"应缴税下限项" + "|";
                msgText += "请输入应缴税下限项！|";
                  break ;
         }
        var personTaxPercent=document.getElementById("txtPersonTaxPercent_"+i ).value.Trim(); 
                 if (personTaxPercent =="" || personTaxPercent ==null  || personTaxPercent =="undifine")
         {
                isErrorFlag = true;
                fieldText +=   "第"+no+"行" +"税率项" + "|";
                msgText += "请输入税率！|";
                break ;
         }
   
    
}

    
    
    
              fieldText +=   "第"+no+"行" +"税率项" + "|";
                msgText += "请输入税率！|";
    //如果有错误，显示错误信息
    if(isErrorFlag)
    {
        //显示错误信息
        //popMsgObj.Show(fieldText, msgText);
        
	    document.getElementById("spanMsg").style.display = "block";
	    document.getElementById("spanMsg").style.top = "240px";
	    document.getElementById("spanMsg").style.left = "450px";
	    document.getElementById("spanMsg").style.width = "290px";
	    document.getElementById("spanMsg").style.position = "absolute";
	    document.getElementById("spanMsg").style.filter = "progid:DXImageTransform.Microsoft.DropShadow(color=#cccccc,offX=4,offY=4,positives=true)";
	    document.getElementById("spanMsg").innerHTML = CreateErrorMsgDiv(fieldText, msgText);
    }

    return isErrorFlag;
}
///////创建层（）
function CreateErrorMsgDiv(fieldText, msgText)
{
    errorMsg = "";
    if(fieldText != null && fieldText != "" && msgText != null && msgText != "")
    {
        var fieldArray = fieldText.split("|");
        var alertArray = msgText.split("|");
        for(var i = 0; i < fieldArray.length - 1; i++)
        {
            errorMsg += "<strong>[</strong><font color=\"red\">" + fieldArray[i].toString()
                        + "</font><strong>]</strong>：" + alertArray[i].toString() + "<br />";
        }
    }
    table = "<table width='100%' border='0' cellspacing='0' cellpadding='0' bgcolor='#FFFFFF'>"
            + "<tr><td align='center' height='1'>&nbsp;</td></tr>"
            + "<tr><td align='center'>" + errorMsg + "</td></tr>"
            + "<tr><td align='right'>"
            + "<img src='../../../Images/Button/closelabel.gif' onclick=\"document.getElementById('spanMsg').style.display='none';\" />"
            + "&nbsp;&nbsp;</td></tr></table>";
	
	return table;
} 