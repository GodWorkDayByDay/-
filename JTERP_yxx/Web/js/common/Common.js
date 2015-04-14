/**********************************************
* �����ã�   ͨ��JS
* �����ˣ�   wuchenghao
* ����ʱ�䣺 2009-1-3 
* Copyright (C) 2007-2009 wuchenghao
* All rights reserved
***********************************************/

/*Ĭ���½�ҳ����ϸ�б�עʡ����ʾ�ĳ���*/
var dRemarkLength = 6;
/*Ĭ���б�ҳ��������ʾ����*/
var LTitleLength = 10;



/*****����ļ���С*****/
//filePath:�ļ�·����string
//result:�����string
function GetFileSize(filePath) {
    var result = "";
    var fso = new ActiveXObject("Scripting.FileSystemObject");
    result = fso.GetFile(filePath).size;
    //alert(result);
    return result;
}

/*****�ж��ļ���С�Ƿ񳬳��޶���С*****/
//filePath:�ļ�·����string
//fileSizeMax:�ļ���С�޶����ֵ,int
//result: ���,boolean.���������Ʒ���false;δ��������true
function CheckFileSize(filePath) {
    var result = false;
    var fileSizeMax = 1024 * 1024 * 10; //ĿǰΪ10M
    var fileSize = GetFileSize(filePath);
    if (fileSize > fileSizeMax) {
        result = false;
    } else {
        result = true;
    }
    //alert(result);
    return result;
}

/*****�ж��ļ���ʽ�Ƿ���Ϲ涨*****/
//filePath:�ļ�·����string
//fileTypeAllow:������ļ�����,array
//result: ���,boolean.���������Ʒ���false;δ��������true
function CheckFileType(filePath) {
    //������ļ�����
    var fileTypeAllow = new Array();
    var fileTypeAllowStr = ".gif||.jpg||.jpeg||.doc||.ppt||.xls||.pdf||.rar||.zip";
    fileTypeAllow = fileTypeAllowStr.split("||");
    var pos = filePath.lastIndexOf(".");
    var lastname = filePath.substring(pos, filePath.length);
    var iCount = 0;
    while (iCount < fileTypeAllow.length) {
        if (lastname.toLowerCase() == fileTypeAllow[iCount]) {
            return true;
        }
        iCount = iCount + 1;
    }
    return false;
}

/*****JSִ�е���RAR.exeʵ��ѹ���ν�ѹ��*****/
function RunRar(fName, dName) {
    var winRar = new ActiveXObject("WScript.Shell");
    fName = fName.replace(/\\/, "\\\\");
    //dName=dName.replace(/\./,"_");
    //var cmd="winrar a "+ rName + ".rar " + fName + " -ep1" ;
    var cmd = "winrar a \"" + dName + "\" \"" + fName + "\" -ep1";
    //alert(cmd);
    winRar.run(cmd, 1, true);
}

/*****��ȡע�����Ϣ*****/
function GetBoardKey() {
    WSHShell = new ActiveXObject("WScript.Shell");
    var bkey = WSHShell.RegRead("HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\ShockwaveFlash\\DisplayVersion");
    alert(bkey);
}

/*
* У�����볤��
* ����   objCheck У��Ŀؼ�
* ����   length   ��Ҫ�ĳ���
* ����ֵ true     ��ȷ����
*        false    ��������
*/
function CheckInputLength(objCheck, length) {
    var inputValue = objCheck.value;
    if (inputValue == "undefined" || inputValue == null || inputValue == "") {
        return false;
    }
    else {
        if (inputValue.length < length) {
            return false;
        }
    }
    return true;
}

/*
* У���Ƿ�����ȷ������
* ����   val   У��Ŀؼ�
* ����   split ���ڷָ���
* ����ֵ true  ��ȷ������
*        false ���������
*/
function IsRightDateWithSplit(val, split) {
    if (val == null || val == "") {
        return true;
    }
    var year, month, day, checkDate;
    if (split != "undefined" && split != null && split != "") {
        var tempDate = val.split(split);
        if (tempDate.length == 3) {
            checkDate = tempDate[0].toString() + tempDate[1].toString() + tempDate[2].toString();
        } else {
            return false;
        }
    }
    else {
        checkDate = val;
    }
    if (!/\d/.test(checkDate)) {
        return false;
    }

    year = checkDate.substring(0, 4) - 0;
    month = checkDate.substring(4, 6) - 0;
    day = checkDate.substring(6) - 0;

    var date = new Date(year, month - 1, day);

    xYear = date.getFullYear();
    xMonth = date.getMonth() + 1;
    xDay = date.getDate();

    if (day != xDay || month != xMonth || year != xYear) {
        return false;
    }
    return true;
}

/*
* У���Ƿ�����ȷ������
* ����   val   У����ַ�
* ����ֵ true  ��ȷ������
*        false ���������
*/
function IsRightDate(val) {
    if ("undefined" == val || val == null || val == "") {
        return true;
    }
    //�ָ���Ϊ��-��
    if (val.indexOf("-") >= 0) {
        return IsRightDateWithSplit(val, "-");
    }
    //�ָ���Ϊ��/��
    else if (val.indexOf("/") >= 0) {
        return IsRightDateWithSplit(val, "/");
    }
    //û�зָ���
    else {
        return IsRightDateWithSplit(val, "");
    }
}

/*
* ת�����ڵĸ�ʽ
* ����   val       У����ַ�
* ����   formatFlg ���ڸ�ʽ��־λ  
*                  1 YYYYMMDD 
*                  2 YYYY/MM/DD 
*                  3 YYYY-MM-DD
* ����ֵ ת���������
*        ���val������ȷ�����ڣ��򷵻�null
*        ���formatFlgΪ1��2��3����ʱ������null
*/
function ChangeDate(val, formatFlg) {
    if (IsRightDate(val)) {
        var year, month, day;
        //�ָ���Ϊ��-��
        if (val.indexOf("-") >= 0) {
            //�����Ϊԭ����ʽ������
            if ("3" == formatFlg) return val;
            //��ȡ������
            var date = val.split("-");
            year = date[0].length == 1 ? "0" + date[0] : date[0];
            month = date[1].length == 1 ? "0" + date[1] : date[1];
            day = date[2].length == 1 ? "0" + date[2] : date[2];

        }
        //�ָ���Ϊ��/��
        else if (val.indexOf("/") >= 0) {
            //�����Ϊԭ����ʽ������
            if ("2" == formatFlg) return val;
            //��ȡ������
            var date = val.split("/");
            year = date[0];
            month = date[1];
            day = date[2];

            year = date[0].length == 1 ? "0" + date[0] : date[0];
            month = date[1].length == 1 ? "0" + date[1] : date[1];
            day = date[2].length == 1 ? "0" + date[2] : date[2];
        }
        //û�зָ���
        else {
            //�����Ϊԭ����ʽ������
            if ("1" == formatFlg) return val;
            //��ȡ������
            year = parseInt(val.substring(0, 4));
            month = parseInt(val.substring(4, 6));
            day = parseInt(val.substring(6));
        }
        if ("1" == formatFlg) return year.toString() + month.toString() + day.toString();
        else if ("2" == formatFlg) return year + "/" + month + "/" + day;
        else if ("3" == formatFlg) return year + "-" + month + "-" + day;
        else return null;
    }
    else {
        return null;
    }
}

/*
* �Ƚ��������ڵĴ�С
* ����    date1 ����1
* ����    date2 ����2
* ����ֵ  null  �Ƚϵ�����������������һ��������ȷ������
*         -1    date1����date2
*         0     date1����date2
*         1     date1����date2
*         2     date1��date2����һ��Ϊ��
*/
function CompareDate(date1, date2) {
    if (date1 == "" || date2 == "") {
        return 2;
    }
    //�������ȷ����������бȽ�
    if (IsRightDate(date1) && IsRightDate(date2)) {
        dateOne = ChangeDate(date1, 2);
        dateTwo = ChangeDate(date2, 2);
        tempDate1 = Date.parse(dateOne);
        tempDate2 = Date.parse(dateTwo);
        if (tempDate1 > tempDate2) return 1;
        else if (tempDate1 < tempDate2) return -1;
        else return 0;

    }
    else {
        return null;
    }
}



/*
* ��ȡѡ�����
* ����ֵ˵��
*           null ���û��
*           ѡ����е�ʱ������֮���ö��Ÿ������кŴ�0��ʼ
*/
function GetSelectValue() {
    //��ȡһ����
    var table = document.getElementById("xgoss_tb");
    if (table == "undefined" || table == null) {
        return null;
    }
    //��ȡ�������
    var rowCount = table.rows.length;
    var objs = document.getElementsByTagName('input');
    var select = "";
    for (var i = 0; i < objs.length; i++) {
        //CheckBox���Ϳؼ�
        if (objs[i].getAttribute("type") == "checkbox" && objs[i].checked) {
            var index = objs[i].id.indexOf("CheckBox");
            if (index > -1) {
                var row = objs[i].id.substring(index + 9);
                if (select == "") {
                    select = row.toString();
                }
                else {
                    select += "," + row.toString();
                }
            }
        }
    }
    return select;
}


/*
* �����εı�񣬵���򿪹رռ�¼����
* ����    index ���������
* ����    key   ��֧��keyֵ
*/
function DoTreeTableDisplay(index, key) {
    //��ȡ���
    table = document.getElementById("xgossTreeTable");
    //��ȡ��񳤶�
    rowCount = table.rows.length;
    //��ȡ��ʾͼƬ
    img = document.getElementById("img" + key);
    //��ȡͼƬ��ַ
    src = img.src;
    //��־λ����    
    if (src.indexOf("icon_list_open") > -1) {
        //�򿪷�֧
        isOpen = false;
    }
    else {
        //�����֧
        isOpen = true;
    }
    index = parseInt(index);
    //����key�µ�ֵ
    for (var i = index + 2; i < rowCount; i++) {
        //��ȡ��
        row = table.rows[i];
        //�к�keyֵ���ʱ��ִ�д���
        if (row.id == key) {
            //��ʾ����������
            if (isOpen) {
                row.style.display = "";
            }
            //����ʾ����������
            else {
                row.style.display = "none";
            }
        }
        else {
            break;
        }
    }
    //������ʾͼƬ
    if (isOpen) {
        img.src = "Images/Menu/icon_list_open.gif";
    }
    else {
        img.src = "Images/Menu/icon_list_close.gif";
    }

}

function ShowPreventReclickDiv() {

    /**��һ��������DIV���ֲ㡣*/
    var sWidth, sHeight;
    sWidth = window.screen.availWidth - 300;
    //��Ļ���ù������߶ȣ� window.screen.availHeight;
    //��Ļ���ù�������ȣ� window.screen.availWidth;
    //��ҳ����ȫ�Ŀ�     document.body.scrollWidth;
    //��ҳ����ȫ�ĸߣ�     document.body.scrollHeight;
//    if (window.screen.availHeight > document.body.scrollHeight) {  //���߶�����һ��
//        sHeight = window.screen.availHeight - 200;
//    } else {//���߶ȴ���һ��
//        sHeight = document.body.scrollHeight - 200;
//    }
    if (window.screen.availHeight > document.body.scrollHeight) {  //���߶�����һ��
        sHeight = window.screen.availHeight;
    }
    else {
        sHeight = document.body.scrollHeight;
    }

    obj = document.getElementById("divPreventReclick");
    //������Ϣ��ʾDIV
    if (obj != null && typeof (obj) != "undefined") obj.style.display = "block";
    else {

        //	    //�������ֱ���
        //	    var maskObj = document.createElement("div");
        //	    maskObj.setAttribute('id','divPreventReclick');
        //	    maskObj.style.position = "absolute";
        //	    maskObj.style.top = "0";
        //	    maskObj.style.left = "0";
        //	    maskObj.style.background = "#777";
        //	    maskObj.style.filter = "Alpha(opacity=50);";
        //	    maskObj.style.opacity = "0.3";
        //	    maskObj.style.width = sWidth + "px";
        //	    maskObj.style.height = sHeight + "px";
        //	    maskObj.style.zIndex = "2";
        //	    maskObj.innerHTML = "<iframe style='position: absolute; z-index:-1; width:"+sWidth+"; height:"+sHeight+";' frameborder='0'>  </iframe>";
        //	    //document.body.appendChild(maskObj);
        //	    //return maskObj.outerHTML;
        //	    document.body.appendChild(maskObj);

        // ����div�Ĵ�С��λ��
        var preventReclick = "<div id='divPreventReclick' style='position:absolute;z-index:2; background-color:#777;"
                        + "left:0;top:0;filter:Alpha(opacity=70);width:100%;height:" + sHeight + ";' >";
        preventReclick += "<iframe style='position: absolute; width:100%; height:" + sHeight + ";' frameborder='0'>  </iframe>";
        preventReclick += "</div>";

        insertHtml("afterBegin", document.body, preventReclick);
    }
}

///////��ʾ�������ʱ�ĵȴ���
function AddPop() {
    showPopup("../../../Images/Pic/Close.gif", "../../../Images/Pic/extanim64.gif", "���������У����Ժ򡭡�");
}
function showPopup(img, img1, retstr) {
    //    try{
    //          openRotoscopingDiv(true,"divMsgShadow","MsgShadowIframe");
    //        }
    //    catch(e)
    //    {
    ShowPreventReclickDiv();
    document.getElementById("Forms").style.display = "block";
    document.getElementById("Forms").innerHTML = Create_Div(img, img1, true);
    document.getElementById("FormContent").innerText = retstr;
    //    }
}
///////�����������ʱ�ĵȴ���
function hidePopup() {
    //try{closeRotoscopingDiv(true,"divMsgShadow");}
    //catch(e)
    //{
    obj = document.getElementById("divPreventReclick");
    //�����ڵ���DIV
    if (obj != null && typeof (obj) != "undefined") obj.style.display = "none";
    /* modified by wuzq 2009-05-21 end */
    document.getElementById("Forms").style.display = "none";

    //}


}
///////�����㣨��
function Create_Div(img, img1, bool) {
    FormStr = "<table width=100% height='100' border='0' cellpadding=0 cellspacing=0 bgcolor=#FFFFFF>"
    FormStr += "<tr>"
    FormStr += "<td width=90%  bgcolor=#3F6C96>&nbsp;</td>"
    FormStr += "<td width=10% height=20 align=\"right\" bgcolor=#3F6C96>"
    if (bool) {
        FormStr += "<img src='" + img + "' style='cursor:pointer;display:block;' id='CloseImg' onClick='hidePopup()'>"
    }
    FormStr += "</td></tr><tr><td height='1' colspan='2' background='../../../Images/Pic/bg_03.gif'></td></tr><tr><td valign=top height=104 id='FormsContent' colspan=2 align=center>"
    FormStr += "<table width=100% border=0 cellspacing=0 cellpadding=0>"
    FormStr += "<tr>"
    FormStr += "<td width=25% align='center' valign=top style='padding-top:20px;'>"
    FormStr += "<img name=exit src='" + img1 + "' border=0></td>";
    FormStr += "<td width=75% height=50 id='FormContent' style='padding-left:5pt;padding-top:20px;line-height:17pt;' valign=top></td>"
    FormStr += "</tr></table>"
    FormStr += "</td></tr></table>"
    return FormStr;
}

///firefox��innertext
(function(bool) {
    function setInnerText(o, s) {
        while (o.childNodes.length != 0) {
            o.removeChild(o.childNodes[0]);
        }

        o.appendChild(document.createTextNode(s));
    }

    function getInnerText(o) {
        var sRet = "";

        for (var i = 0; i < o.childNodes.length; i++) {
            if (o.childNodes[i].childNodes.length != 0) {
                sRet += getInnerText(o.childNodes[i]);
            }

            if (o.childNodes[i].nodeValue) {
                if (o.currentStyle.display == "block") {
                    sRet += o.childNodes[i].nodeValue + "\n";
                } else {
                    sRet += o.childNodes[i].nodeValue;
                }
            }
        }

        return sRet;
    }

    if (bool) {
        HTMLElement.prototype.__defineGetter__("currentStyle", function() {
            return this.ownerDocument.defaultView.getComputedStyle(this, null);
        });

        HTMLElement.prototype.__defineGetter__("innerText", function() {
            return getInnerText(this);
        })

        HTMLElement.prototype.__defineSetter__("innerText", function(s) {
            setInnerText(this, s);
        })
    }
})(/Firefox/.test(window.navigator.userAgent));

//��ȡurl��"?"������ִ�
function GetRequest() {
    var url = location.search;
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for (var i = 0; i < strs.length; i++) {
            theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
        }
    }
    return theRequest;
}
//jsȥ��ǰ��ո�
String.prototype.Trim = function() {
    return this.replace(/(^\s*)|(\s*$)/g, "");
}
String.prototype.LTrim = function() {
    return this.replace(/(^\s*)/g, "");
}
String.prototype.RTrim = function() {
    return this.replace(/(\s*$)/g, "");
}
//ȥ�����пո�
function Trim(str, is_global) {
    var result;
    result = str.replace(/(^\s+)|(\s+$)/g, "");
    if (is_global.toLowerCase() == "g")
        result = result.replace(/\s/g, "");
    return result;
}

/***********************************************************
Function formatnumber(value,num)
Written by zergling
javascript�汾��FormatNumber�������÷���VBScript��ͬ����һ�������Ǵ���ʽ������ֵ���ڶ����Ǳ���С��λ��
ע�⣺���ص����ַ�������
��һ��������Ҫ���õڶ������������Եڶ�������ȥ��
***********************************************************/
function FormatAfterDotNumber(value, num) //��������
{
    if (value != '' && typeof (value) != 'undefined') {
        var a_str = formatnumber(value, num);
        var a_int = parseFloat(a_str);
        if (value.toString().length > a_str.length) {
            var b_str = value.toString().substring(a_str.length, a_str.length + 1)
            var b_int = parseFloat(b_str);
            if (b_int < 5) {
                return a_str
            }
            else {
                var bonus_str, bonus_int;
                if (num == 0) {
                    bonus_int = 1;
                }
                else {
                    bonus_str = "0."
                    for (var i = 1; i < num; i++)
                        bonus_str += "0";
                    bonus_str += "1";
                    bonus_int = parseFloat(bonus_str);
                }
                a_str = formatnumber(a_int + bonus_int, num)
            }
        }
        return a_str
    }
    else {
        //�˴�ԭʼΪ return "0.00"; ���Ѹĳ�������ʽ(����С������Ϊnum��0ֵ)
        //2010-4-22 Modified by hexw
        var valuestr = "0.";
        var numLen = num;
        if (num == 0) {
            num = 1;
        }
        for (var i = 0; i < numLen; i++) {
            valuestr = valuestr + "0";
        }
        return valuestr;
    }
}

function formatnumber(value, num) //ֱ��ȥβ
{
    var a, b, c, i
    a = value.toString();
    b = a.indexOf('.');
    c = a.length;
    if (num == 0) {
        if (b != -1)
            a = a.substring(0, b);
    }
    else {
        if (b == -1) {
            a = a + ".";
            for (i = 1; i <= num; i++)
                a = a + "0";
        }
        else {
            a = a.substring(0, b + num + 1);
            for (i = c; i <= b + num; i++)
                a = a + "0";
        }
    }
    return a
}
/***********************************************************
Function formatnumber(value,num)
Written by zergling
javascript�汾��FormatNumber�������÷���VBScript��ͬ����һ�������Ǵ���ʽ������ֵ���ڶ����Ǳ���С��λ��
ע�⣺���ص����ַ�������
��һ��������Ҫ���õڶ������������Եڶ�������ȥ��
***********************************************************/


/*
* ��������������
* ����ֵ ֻ�������� 0-9
*/
function Number_OnKeyDown() {
    var event = arguments[0] || window.event;
    //��ȡ���¼���ֵ
    var keyCode = event.charCode || event.keyCode;

    //���ּ�
    if ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105) || (keyCode >= 37 && keyCode <= 40)
        || keyCode == 46 || keyCode == 8 || keyCode == 9 || keyCode == 13) {
    }
    else {
        window.event.returnValue = false;
    }
}

/*
* ��������������
* ����ֵ ֻ�������� 0-9 С����
*/
//hm edit at 0929/ keycode==229 ����ȫ�ǵ�ʱ�������������
function Numeric_OnKeyDown() {
    var event = arguments[0] || window.event;
    //��ȡ���¼���ֵ
    var keyCode = event.charCode || event.keyCode;
    //���ּ�
    if ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105) || (keyCode >= 37 && keyCode <= 40)
        || keyCode == 46 || keyCode == 8 || keyCode == 110 || keyCode == 190 || keyCode == 9 || keyCode == 13 || keyCode == 229) {
    }

    else {
        window.event.returnValue = false;
    }
}




/*
* ��������������
* ����ֵ ֻ�������� 0-9 ����shift��-Modify By Moshenlin 
*/
function Number_KeyDown() {
    var event = arguments[0] || window.event;
    //��ȡ���¼���ֵ
    var keyCode = event.charCode || event.keyCode;
    //���ּ�
    if (event.shiftKey && (keyCode >= 48 && keyCode <= 57)) {
        window.event.returnValue = false;
    }
    else if ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105) || (keyCode >= 37 && keyCode <= 40)
        || keyCode == 46 || keyCode == 8 || keyCode == 9 || keyCode == 13) {
    }
    else {
        window.event.returnValue = false;
    }
}


/***********************************************************
�ַ�ת���ڣ��ɽ������ڱȽϣ�
***********************************************************/
function StringToDate(DateStr) {
    var converted = Date.parse(DateStr);
    var myDate = new Date(converted);
    if (isNaN(myDate)) {
        var arys = DateStr.split('-');
        myDate = new Date(arys[0], --arys[1], arys[2]);
    }
    return myDate;
}
/***********************************************************
�������ж�
***********************************************************/
function PositiveInteger(retval) {
    var r = /^\+?[1-9][0-9]*$/; //������ 
    if (r.test(retval))
        return true;
    else
        return false;
}

/*
* where������λ�á�����beforeBegin,beforeEnd,afterBegin,afterEnd��
* el�����ڲ��ղ���λ�õ�htmlԪ�ض���
* html��Ҫ�����html����
*/
function insertHtml(where, el, html) {
    where = where.toLowerCase();
    //IE  
    if (el.insertAdjacentHTML) {
        switch (where) {
            case "beforebegin":
                el.insertAdjacentHTML('BeforeBegin', html);
                return el.previousSibling;
            case "afterbegin":
                el.insertAdjacentHTML('AfterBegin', html);
                return el.firstChild;
            case "beforeend":
                el.insertAdjacentHTML('BeforeEnd', html);
                return el.lastChild;
            case "afterend":
                el.insertAdjacentHTML('AfterEnd', html);
                return el.nextSibling;
        }
        throw 'Illegal insertion point -> "' + where + '"';
    }
    //FF
    var range = el.ownerDocument.createRange();
    var frag;
    switch (where) {
        case "beforebegin":
            range.setStartBefore(el);
            frag = range.createContextualFragment(html);
            el.parentNode.insertBefore(frag, el);
            return el.previousSibling;
        case "afterbegin":
            if (el.firstChild) {
                range.setStartBefore(el.firstChild);
                frag = range.createContextualFragment(html);
                el.insertBefore(frag, el.firstChild);
                return el.firstChild;
            }
            else {
                el.innerHTML = html;
                return el.firstChild;
            }
        case "beforeend":
            if (el.lastChild) {
                range.setStartAfter(el.lastChild);
                frag = range.createContextualFragment(html);
                el.appendChild(frag);
                return el.lastChild;
            }
            else {
                el.innerHTML = html;
                return el.lastChild;
            }
        case "afterend":
            range.setStartAfter(el);
            frag = range.createContextualFragment(html);
            el.parentNode.insertBefore(frag, el.nextSibling);
            return el.nextSibling;
    }
    throw 'Illegal insertion point -> "' + where + '"';
}


/****************************���ַ����ĳ���*********************************/
/**
*obj������strValue��Ҫ���Ե��ַ�����len����󳤶�,
*����ֵ:�������ֵ������false�����𷵻�true��
*/
function fnCheckStrLen(strValue, len) {
    var newvalue = strValue.replace(/[^\x00-\xff]/g, "**");
    var length = newvalue.length;
    if (length > len) {
        return false;
    }
    else {
        return true;
    }
}
/****************************Inputֻ������С������λ*********************************/
/**
*obj����������Ŀؼ�ID,
*/

function FractionDigits(obj) {
    try {
        obj.value = obj.value.replace(/[^\d+\.]|(^\..*)/g, '').replace(/(\d+\.\d{1,1})((?:\d+)|(?:\.+))?/g, '$1');
    }
    catch (err) {

    }
}
/****************************�����ַ�У��ʱ����*********************************/
function CheckSpecialWords() {
    var RetvalStr = "";
    try {
        $("input:text", document.forms[0]).each(function() {

            if (this.value != "") {
                if (this.getAttribute("SpecialWorkCheck") != null) {
                    if (!CheckSpecialWord(this.value)) {
                        RetvalStr += this.getAttribute("SpecialWorkCheck") + ",";
                    }
                }
            }
        }
               );
        $("textarea", document.forms[0]).each(function() {
            if (this.value != "") {

                if (this.getAttribute("SpecialWorkCheck") != null) {
                    if (!CheckSpecialWord(this.value))
                        RetvalStr += this.getAttribute("SpecialWorkCheck") + ",";
                }
            }
        }
               );
        $("asp:TextBox", document.forms[0]).each(function() {
            if (this.value != "") {

                if (this.getAttribute("SpecialWorkCheck") != null) {
                    if (!CheckSpecialWord(this.value))
                        RetvalStr += this.getAttribute("SpecialWorkCheck") + ",";
                }
            }
        }
               );
        if (RetvalStr != "")
            RetvalStr = RetvalStr.substr(0, RetvalStr.length - 1);
        return RetvalStr;
    }
    catch (err) {
        return "";
    }
}

/*ֻ�������ֲ��  
*����ҳ�������
<div id="divRotoscoping" style="display:none">
<iframe id="divIframe" frameborder="0" width="100%" ></iframe>
</div>
*isLoading Ϊ�Ƿ���Ҫloading
*divRotoscoping ҳ�����Լ������div��ID(����divMask)
*divIframe ҳ�����Լ������iframe��ID(����MaskIframe)
* by pdd*/
/*********�����ֲ�*********/
function openRotoscopingDiv(isLoading, divRotoscoping, divIframe) {
    var sWidth, sHeight;
    sWidth = window.screen.availWidth;
    if (window.screen.availHeight > document.body.scrollHeight) {  //���߶�����һ��
        sHeight = window.screen.availHeight;
    }
    else {
        sHeight = document.body.scrollHeight;
    }

    /**��������DIV����**/
    var maskObj = document.getElementById(divRotoscoping)
    maskObj.style.position = "absolute";
    maskObj.style.top = "0";
    maskObj.style.left = "0";
    maskObj.style.background = "#777";
    maskObj.style.filter = "Alpha(opacity=70);";
    maskObj.style.opacity = "0.3";
    maskObj.style.offsetWidth = sWidth + "px";
    maskObj.style.offsetHeight = sHeight + "px";
    maskObj.style.zIndex = "20";
    maskObj.style.display = "block";
    /*����Iframe�߶�*/
    //alert(document.documentElement.clientHeight+","+document.body.scrollHeight)
    /*�ж��Ƿ������ֱ������*/
    if (document.documentElement.clientHeight > document.body.scrollHeight)
        document.getElementById(divIframe).height = document.documentElement.clientHeight - 3; //�д�ֱ������
    else
        document.getElementById(divIframe).height = document.documentElement.scrollHeight - 3; //�޴�ֱ������

    document.getElementById(divIframe).width = document.documentElement.clientWidth - 3;
    if (isLoading) {
        document.getElementById("Forms").style.display = "block";
        document.getElementById("Forms").innerHTML = Create_Div("../../../Images/Pic/Close.gif", "../../../Images/Pic/extanim64.gif", true);
        document.getElementById("FormContent").innerText = "���������У����Ժ򡭡�";
    }
}
/**********�ر����ֲ�*********/
function closeRotoscopingDiv(isLoading, divRotoscoping) {
    document.getElementById(divRotoscoping).style.display = "none";
    if (isLoading) {
        document.getElementById("Forms").style.display = "none";
    }
}




//��ȡ��ǰ����
function GetNow() {
    var today = new Date();
    var todaynow = today.getYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate(); //��ǰ����
    return todaynow;
}

/*
*���ø������ٷֱȸ�ʽ
*ʹ��ǰ��Ҫ��num ����֤
*num ��Ҫ��ʽ������ Ĭ�� 2λ
* PDD
*/
function FormatPercent(num) {
    var tmp = parseFloat(num * 100);
    return tmp.toFixed(2) + "%";
}

/*���ٷ���ת���ɸ��� 4λ��Ч���� ���Լ��Բ���������֤ PDD*/
function PercentToFloat(str) {
    if (str == "")
        return "";
    var tmp = str.replace("%", "");
    return parseFloat(parseFloat(tmp) / 100).toFixed(4);
}

//�����������ƽ�ȡ
function GetStandardString(value, length) {
    if (strlen(value.toString()) > length) {
        return value.substring(0, length - 3) + "...";
    }
    return value;
}

/***--------------------------��ȡ�ַ���-------------------------------------***/
function fnjiequ(str, strlen) {
    if(str!=null&&str!=undefined)
    {
        return str.length > strlen + 3 ? str.slice(0, strlen) + "��" : str;
    }
}


//�ж��Ƿ�ΪNumeric��
function IsNumeric(NUM, countInt, countFloat) {
    var i, j, strTemp, tempDotArray, dotCount;
    strTemp = "0123456789.";
    dotCount = 0;
    if (NUM.length == 0)
        return false;
    for (i = 0; i < NUM.length; i++) {
        j = strTemp.indexOf(NUM.charAt(i));
        if (j == -1) {
            //˵�����ַ���������
            return false;
        }
        if (NUM.charAt(i) == '.') {
            dotCount = dotCount + 1;
        }

    }
    tempDotArray = NUM.split('.');
    if (tempDotArray.length > 1) {
        if (NUM.length > (countInt + countFloat + 1)) {
            return false;
        }
        if (tempDotArray[1].toString().length > countFloat) {
            return false;
        }
        if (tempDotArray[0].toString().length > countInt) {
            return false;
        }
    }
    else {
        if (NUM.length > countInt) {
            return false;
        }
    }
    if (dotCount > 1) {
        return false;
    }
    //˵������ȷ��Numeric��
    return true;
}
//�ж��Ƿ�ΪNumeric��(�ɴ�����)
function IsNumericFH(NUM, countInt, countFloat) {
    var i = NUM.toString();
    var i1 = i.substring(0, 1);
    if (i1 == "-") {
        var i2 = i.substring(1, i.length);
        return IsNumberOrNumeric(i2, countInt, countFloat);
    }
    return IsNumberOrNumeric(NUM, countInt, countFloat)
}


//�ж����ֻ�Numeric��
function IsNumberOrNumeric(NUM, countInt, countFloat) {
    if (IsNumeric(NUM, countInt, countFloat))
        return true;
    return false;
}



//������������Զ�������λС������������
/*
obj �������ֵĿؼ�
fractionDigits ������С��λ��
flag �ж��Ƿ�Ϊ���� pg��Number_round(this,2,1)������֤����������
Number_round(this,2)������֤����������
�����Զ�������λС�� pg: N.00
���ã��磺onchange="Number_round(this,2)";
*/

function Number_round(obj, fractionDigits, flag) {
    var numberStr = CtoH(obj);

    if (flag) {
        if (!IsNumericFH(numberStr, 1000, 1000)) {
            obj.value = "";
            return;
        }
    }
    else {
        if (!IsNumeric(numberStr, 1000, 1000)) {
            obj.value = "";
            return;
        }
    }

    var RetValue = "";
    var num = numberStr.toString().split('.');
    if (num[1] != "" && num[1] != null && parseInt(num[1]) == 0) {
        RetValue = numberStr;
    }
    else {
        if (numberStr != parseInt(numberStr)) {
            with (Math) {
                RetValue = round(numberStr * pow(10, fractionDigits)) / pow(10, fractionDigits);
            }
            var Rev = RetValue.toString().split('.');
            if (Rev[1] == undefined || Rev[1] == null || Rev[1] == "") {
                RetValue = RetValue + ".00";
            }
            else if (Rev[1].toString().length == 1) {
                RetValue = RetValue + "0";
            }
        }
        else {
            RetValue = numberStr + ".00";
        }
    }
    obj.value = parseFloat(RetValue).toFixed(fractionDigits);

}

/*
Ctoh�������ڸ���Number_round�����������뷨�ϵ�ȫ������
�Ӷ�ֱ�ӽ�ȫ�������ɰ��
*/

function CtoH(obj) {
    var str = obj.value;
    var result = "";
    for (var i = 0; i < str.length; i++) {
        if (str.charCodeAt(i) == 12288) {
            result += String.fromCharCode(str.charCodeAt(i) - 12256);
            continue;
        }
        if (str.charCodeAt(i) > 65280 && str.charCodeAt(i) < 65375)
            result += String.fromCharCode(str.charCodeAt(i) - 65248);
        else result += String.fromCharCode(str.charCodeAt(i));
    }
    return result;

}

function reescape(val) {
    return " " + escape(val).Trim();
}

function fracDigits(num) {
    var ReturnValue;
    for (var i = 0; i < num; i++) {
        ReturnValue += "0";
    }
    return ReturnValue;
}


//�����ֱ�����λС������ҳ������������--hm���
//a_Num---��Ҫ���������
//a_Bit---��Ҫ�����ļ�λС��
function NumRound(a_Num, a_Bit) {
    return ((Math.round(a_Num * Math.pow(10, a_Bit)) / Math.pow(10, a_Bit)).toFixed(a_Bit));
}



//���۱����õĶ����ֱ�����λС������ҳ������������--hm���
//a_Num---��Ҫ���������
//a_Bit---��Ҫ�����ļ�λС��
function NumRoundOfSellModule(a_Num, a_Bit) {
    if (a_Num != '') {
        return ((Math.round(a_Num * Math.pow(10, a_Bit)) / Math.pow(10, a_Bit)).toFixed(a_Bit));
    } else {
        return '';
    }
}

//������������
function getDateDiff(date1, date2) {

    var re = /^(\d{4})\S(\d{1,2})\S(\d{1,2})$/;
    var dt1, dt2;
    if (re.test(date1)) {
        dt1 = new Date(RegExp.$1, RegExp.$2 - 1, RegExp.$3);
    }

    if (re.test(date2)) {
        dt2 = new Date(RegExp.$1, RegExp.$2 - 1, RegExp.$3);
    }

    return Math.floor((dt2 - dt1) / (1000 * 60 * 60 * 24))

}

//��ȡĳ�������ݵķ���
function SubValue(num, value) {
    if (strlen(value) > num) {
        return value.substr(0, num) + "��";
    }
    else {
        return value;
    }
}

/*�ؼ�����
*objID ��Ҫ���еĿؼ� ID���� 
*div�е���ʽ top: 30%; left: 40%; margin: 5px 0 0 -400px;" ��ɾ��
*isPercent ��ʾ �ÿؼ� ����ĸ߶��ǰٷֱȣ�true�� ������ֵ��fasle��
*�����ڿؼ���ʾ֮����ø÷���
*by pdd
*/
function CenterToDocument(objID, isPercent) {
    var obj = document.getElementById(objID);

    /*����λ��*/
    var _top = 0;
    var _left = 0;
    var objWidth = 0, objHeight = 0;

    //��ȡ�����������ĳ���
    var scrollLength = getScrollTop();
    /*��ȡ�ؼ��ߴ�*/
    if (isPercent) {
        objWidth = obj.style.width.replace("px", "") == "" ? 0 : PercentToFloat(obj.style.width);
        //  objHeight=obj.style.height.replace("px","")==""?0:PercentToFloat(obj.style.height); 
    }
    else {
        objWidth = obj.style.width.replace("px", "") == "" ? 0 : obj.style.width.replace("px", "");
    }
    objHeight = obj.offsetHeight == "" ? 0 : obj.offsetHeight;

    /*�����ĵ��ߴ�*/
    var docWidth = 0, docHight = 0;

    /*��ȡ��ǰ�ĵ��ߴ�*/
    if (document.documentElement.clientHeight > document.body.scrollHeight) {
        //�д�ֱ������
        docWidth = parseInt(document.documentElement.scrollWidth);
        //docHight=parseInt(document.documentElement.clientHeight);
    }
    else {
        //�޴�ֱ������
        docWidth = parseInt(document.documentElement.scrollWidth);
        //docHight=parseInt( document.documentElement.scrollHeight);
    }
    docHight = parseInt(document.documentElement.clientHeight);
    /*����λ��*/
    if (isPercent) {
        /*����Ŀؼ��ߴ�Ϊ�ٷֱ�*/
        //_top=docHight*(1-(objHeight==0?0.3:objHeight))/2;
        _left = docWidth * (1 - (objWidth == 0 ? 0.3 : objWidth)) / 2;
    }
    else {
        /*����Ŀؼ��ߴ�Ϊ��ֵ*/

        _left = (docWidth - (objWidth == 0 ? 100 : objWidth)) / 2;
    }
    _top = (docHight - (objHeight == 0 ? 200 : objHeight)) / 3;
    //alert(_top+","+_left+","+scrollLength+","+objHeight);
    obj.style.top = parseInt(_top + scrollLength) + "px";
    obj.style.left = parseInt(_left) + "px";


}

/********************
* ȡ���ڹ������߶� 
******************/
function getScrollTop() {
    var scrollTop = 0;
    if (document.documentElement && document.documentElement.scrollTop) {
        scrollTop = document.documentElement.scrollTop;
    }
    else if (document.body) {
        scrollTop = document.body.scrollTop;
    }
    return scrollTop;
}


/********************
* ȡ���ڿ��ӷ�Χ�ĸ߶� 
*******************/
function getClientHeight() {
    var clientHeight = 0;
    if (document.body.clientHeight && document.documentElement.clientHeight) {
        var clientHeight = (document.body.clientHeight < document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight;
    }
    else {
        var clientHeight = (document.body.clientHeight > document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight;
    }
    return clientHeight;
}

/********************
* ȡ�ĵ�����ʵ�ʸ߶� 
*******************/
function getScrollHeight() {
    return Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
}


/*
*�϶���
*objID div��ID
*evt ֱ�Ӵ�event����
* ����ʾ����onmousedown="MoveDiv('divGetProductInfo',event)"
*�в�������DIV�����������������϶�������������inputʧЧ
**By pdd
*/
function MoveDiv(objID, evt) {
    /*��ȡ�ؼ�*/
    var o = document.getElementById(objID);

    /*��֤�ؼ�*/
    if (!o) return;

    /*���������ʽ*/
    o.style.cursor = "move";

    /*��߾�*/
    var relLeft = evt.clientX - o.offsetLeft;
    /*�ϱ߾�*/
    var relTop = evt.clientY - o.offsetTop;

    /*ץȡ�¼�*/
    if (!window.captureEvents)
        o.setCapture();
    else
        window.captureEvents(Event.MOUSEMOVE | Event.MOUSEUP);

    /*����ƶ�*/
    document.onmousemove = function(e) {
        if (!o) return;
        e = e ? e : window.event;
        if (e.clientX - relLeft <= 0)
            o.style.left = 0 + "px";
        else if (e.clientX - relLeft >= document.documentElement.clientWidth - o.offsetWidth - 2)
            o.style.left = (document.documentElement.clientWidth - o.offsetWidth - 2) + "px";
        else
            o.style.left = e.clientX - relLeft + "px";
        if (e.clientY - relTop <= 1)
            o.style.top = 1 + "px";
        else if (e.clientY - relTop >= document.documentElement.clientHeight - o.offsetHeight - 2)
            o.style.top = (document.documentElement.clientHeight - o.offsetHeight - 2) + "px";
        else
            o.style.top = e.clientY - relTop + "px";

    }

    /*����ͷ�*/
    document.onmouseup = function() {
        if (!o) return;
        if (!window.captureEvents)
            o.releaseCapture();
        else
            window.releaseEvents(Event.MOUSEMOVE | Event.MOUSEUP);

        document.onmousemove = null;
        document.onmouseup = null;

        /*��������ƶ���ʽ*/
        o.style.cursor = "default";
    }

}


/*
*Ϊonkeydown׷���¼�
*/


//ff && ie Event start here
function SearchEvent() {
    if (document.all)
        return event;

    func = SearchEvent.caller;
    while (func != null) {
        var arg0 = func.arguments[0];
        if (arg0) {
            if (arg0.constructor == MouseEvent) // �������event ����
                return arg0;
            if (arg0.constructor == KeyboardEvent) // �������event ����
                return arg0;
            if (arg0.constructor == Event) // �������event ����
                return arg0;
        }
        func = func.caller;
    }
    return null;
}
//eventName,without 'on' for: click
function AddEvent(obj, eventName, handler) {
    if (document.all) {
        obj.attachEvent("on" + eventName, handler);
    } else {
        obj.addEventListener(eventName, handler, false);
    }
}

function diabledF5(e) {
    var obj;
    if (window.parent.document.getElementById("txtIsFresh") != null)
        obj = window.parent.document.getElementById("txtIsFresh");
    else
        obj = document.getElementById("txtIsFresh");
    if (document.all) {
        if (event.keyCode == 116) {
        try //20130118 DYG��� ��׽�ű����� ����document.all�����Խ���IE���������Ч�����鲻ʹ��
        {
            obj.value = true;
        }
        catch(e)
        {
            
        }
        }
    }

    var evt = SearchEvent();
    if (evt.charCode == 116) {
        obj.value = true;
    }

};


AddEvent(document, "keydown", diabledF5);

/*׷���¼�����*/


/*����ProductID�Ͳֿ�ID,�������б�*/
/*ProductID:��ƷID��StorageControlID�ֿ�ؼ�ID��ListControlID�������б�ؼ�ID��IsBatchNo���Ƿ��������Σ�BatchNo������(�½�ʱ���ô�ֵ���鿴ʱ��������)*/
function GetBatchList(ProductID, StorageControlID, ListControlID, IsBatchNo, BatchNo) {
    if (IsBatchNo == "" || IsBatchNo == "0") {
        document.getElementById(ListControlID).options[0] = new Option("-δ����-", "");
    }
    else {
        var StorageID = $("#" + StorageControlID).val();
        var paUrl = "Act=GetBatchList&ProductID=" + ProductID + "&StorageID=" + StorageID;
        $.ajax({
            type: "POST",
            url: '../../../Handler/Office/StorageManager/StorageOutSellInfo.ashx?' + paUrl, //Ŀ���ַ
            dataType: 'json', //����json��ʽ����
            cache: false,
            beforeSend: function() {
                //AddPop();
            },
            complete: function() {// hidePopup();
            },
            error: function() {
                //popMsgObj.ShowMsg('����������');                        
            },
            success: function(item) {
                ClearBatchList(ListControlID); //�������ǰ�����һ���б�
                if (item.data.length > 0)//���������������
                {
                    if (item.data.length == 1 && item.data[0].BatchNo == "") {
                        document.getElementById(ListControlID).options[0] = new Option("-��ѡ��-", "");
                    }
                    else {
                        for (var i = 0; i < item.data.length; i++) {
                            //��������б�
                            document.getElementById(ListControlID).options[i] = new Option(item.data[i].BatchNo, item.data[i].BatchNo);
                            if (typeof (BatchNo) != "undefined") { $("#" + ListControlID).val(BatchNo); }
                        }
                    }
                }
                else {
                    document.getElementById(ListControlID).options[0] = new Option("-��ѡ��-", "");
                }
            }
        });
    }

}
//�������ǰ�����һ���б�
function ClearBatchList(ListControlID) {
    var length = document.getElementById(ListControlID).options.length;
    if (length > 1) {
        for (i = length - 1; i >= 0; i--) {
            document.getElementById(ListControlID).remove(i);
            length--;
        }
    }
}

//�ֵ�
//����ProductID�������б�
//ProductID:��ƷID��ListControlID�������б�ؼ�ID��IsBatchNo���Ƿ��������Σ�BatchNo������(�½�ʱ���ô�ֵ���鿴ʱ��������)
function GetSubBatchList(ProductID, ListControlID, IsBatchNo, BatchNo, deptID, companyCD) {
    $("#" + ListControlID).html("");
    if (IsBatchNo == "" || IsBatchNo == "0") {
        document.getElementById(ListControlID).options[0] = new Option("-δ����-", "");
    }
    else {
        var paUrl = "action=GETBATCHNO&productID=" + ProductID + "&deptID=" + deptID + "&companyCD=" + companyCD;
        $.ajax({
            type: "POST",
            url: '../../../Handler/Office/LogisticsDistributionManager/StorageProductQuery.ashx', //Ŀ���ַ
            dataType: 'json', //����json��ʽ����
            data: paUrl,
            cache: false,
            beforeSend: function() {
            },
            complete: function() {// hidePopup();
            },
            error: function() {
            },
            success: function(item) {
                if (item.data.length > 0)//���������������
                {
                    if (item.data.length == 1 && item.data[0].BatchNo == "") {
                        document.getElementById(ListControlID).options[0] = new Option("-��ѡ��-", "");
                    }
                    else {
                        for (var i = 0; i < item.data.length; i++) {
                            //��������б�
                            document.getElementById(ListControlID).options[i] = new Option(item.data[i].BatchNo, item.data[i].BatchNo);
                        }
                    }
                    if (typeof (BatchNo) != "undefined") { $("#" + ListControlID).val(BatchNo); }

                }
                else {
                    document.getElementById(ListControlID).options[0] = new Option("-��ѡ��-", "");
                }
            }
        });
    }

}


/*Start ��ϸ���㴦�����*/
/*

1.����˵��
objSelf:��ǰ��������,�����¼�ʱ����������ƶ�
objNext:��һ����Ҫ��ý���������
rows:��ǰ����,����һ�е�������������ûس�������ϸ���޵ڶ�����ϸ�����¼�һ�У����еڶ��У���ֱ��ʹ�ڶ��е���Ʒ��Ż�ý���
isAddRow:�Ƿ��������(true:�ǣ�false:��),��������Ʒ��ŵ���ʱ��false,�ں������������ʱ��true,Ŀǰ����ģ��ֻ����Ʒ��ź����������ط�������

2.��ע
����ϸ��Ʒ��ź������У�����onkeydown���Ե��ô˷���,Ŀǰֻ���ƻس�(ƽ���ƶ�)�����¼�(ָ���������ƶ�)
ҳ������eventObj.Table(��ϸtableID���󲿷�ҳ����ϸ�õ���dg_Log,����ҳ���õķ�dg_Log)
*/
var eventObj = new Object();
eventObj.Table = ''; //'dg_Log';

function SetEventFocus(objSelf, objNext, rows, isAddRow) {
    /*  onkeydownʱ�����÷���
    Enter:13
    Backspace:8
    Left Arrow:37
    Up Arrow:38
    Right Arror:39
    Down Arror:40
    */
    if (eventObj.Table != '' && eventObj.RowLine != '') {

        var haveRows = 0; /*��ϸ�пɼ�����*/
        var signFrame = findObj(eventObj.Table, document);
        for (var i = 0; i < signFrame.rows.length - 1; i++) {
            if (signFrame.rows[i + 1].style.display != "none") {
                haveRows++;
            }
        }
        var keyS = GetCommonEventCode();
        if (keyS == 13) {
            if (isAddRow) {

                if (((rows + 1) > haveRows)) {
                    AddSignRow();
                }
                /*��ȡ��һ��:����������У��м�ڶ��б�ɾ��ʱ���ڵ�һ�е����ݺ��ûس�����������˳�� */
                rows++;
                SetEventObjFocus(EventNextRow(rows), objNext);

            }
            else {
                SetEventObjFocus(rows, objNext);
            }
        }
        /*���ϼ�ͷ*/
        if (keyS == 38) {
            rows--;
            SetEventObjFocus(EventPreviousRow(rows), objSelf);

        }
        /*���¼�ͷ*/
        if (keyS == 40) {
            rows++;
            SetEventObjFocus(EventNextRow(rows), objSelf);

        }
    }

}
/*���ö����ȡ����*/
function SetEventObjFocus(rows, objEvent) {
    var signFrame = findObj(eventObj.Table, document);
    if (signFrame.rows[rows].style.display != "none") {
        if (!document.getElementById(objEvent + rows).disabled) {
            document.getElementById(objEvent + rows).focus();
        }

    }
}
/*��ȡ��һ��*/
function EventNextRow(rows) {
    var signFrame = findObj(eventObj.Table, document);
    if (rows > signFrame.rows.length - 1) {
        return --rows;
    }

    if (signFrame.rows[rows].style.display != "none") {
        return rows;
    }
    else {
        rows++;
        return EventNextRow(rows);
    }
}

/*��ȡ��һ��*/
function EventPreviousRow(rows) {

    if (rows < 1) {
        return ++rows;
    }
    var signFrame = findObj(eventObj.Table, document);
    if (signFrame.rows[rows].style.display != "none") {
        return rows;
    }
    else {
        rows--;
        return EventPreviousRow(rows);
    }
}





function GetCommonEventCode(evt) {

    if (typeof evt == "undefined" || evt == null) {
        evt = SearchCommonEvent();
        if (typeof evt == "undefined" || evt == null) {
            return null;
        }
    }

    return evt.keyCode || evt.charCode;
}
function SearchCommonEvent() {
    if (document.all)
        return event;

    func = SearchCommonEvent.caller;
    while (func != null) {
        var arg0 = func.arguments[0];
        if (arg0) {
            if (arg0.constructor == MouseEvent) // �������event ����
                return arg0;
            if (arg0.constructor == KeyboardEvent) // �������event ����
                return arg0;
            if (arg0.constructor == Event) // �������event ����
                return arg0;
        }
        func = func.caller;
    }
    return null;
}
/*End ��ϸ���㴦�����*/

 
//�õ����ʱ����ȫѡ  2012-10-19  ����쳣����
try
{
$(document).click(function(){

    var e=event?event:window.event;
    var obj=e.srcElement;
    if(obj){

        if(obj.type=="text"){
            if(!obj.disabled && !obj.readOnly){
                obj.select();
            }            
        }
    }
  
}); 
 }
    catch(e)
    {
      
    }

//��ȡϵͳ��ǰ����
function getSysDate()
{
    var date="";
    var myDate = new Date();
    var month=myDate.getMonth()+1;
    if(month<=9)
    {
        date=myDate.getFullYear()+"-0"+month;
    }
    else
    {
         date=myDate.getFullYear()+"-"+month;
    }
    if( myDate.getDate()<=9)
    {
        date+="-0"+myDate.getDate();
    }
    else
    {
        date+="-"+myDate.getDate();
    }
    return date;
}

//----------------------��ǧ��λ��ʽ��ʾ ����------------- liuch20140722
// num ��Ҫת�������֣� XiaoShuWei����ȷ����С��λ
function QfwFormat (num,XiaoShuWei) { 
   if (typeof num != "undefined" && num != null) {
       return (num.toFixed(XiaoShuWei) + '').replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g, '$&,'); 
    }
    else
    {return "0.00";}
} 

//---------------------shjp:2011-7-18 �ƶ���-------------------
  function getoObj(_sId){return document.getElementById(_sId);}
  
   function moveStart(event, _sId){
   if(event!=null&&_sId!=null&&_sId!=undefined)
   {
  var oObj = getoObj(_sId);
  oObj.onmousemove = mousemove;
  oObj.onmouseup = mouseup;
  oObj.setCapture ? oObj.setCapture() : function(){};
  oEvent = window.event ? window.event : event;
  var dragData = {x : oEvent.clientX, y : oEvent.clientY};
 
  var backData = {x : parseInt(oObj.style.top), y : parseInt(oObj.style.left)
  };
  var toptype=(oObj.style.top).toString();
  var lefttype=(oObj.style.left).toString();
  if(toptype.substring(toptype.length-1,toptype.length)=="%"&&lefttype.substring(lefttype.length-1,lefttype.length)!="%")
  {
    backData={x : parseInt(parseInt(oObj.style.top)/100*parseInt(document.documentElement.clientHeight)),  y : parseInt(oObj.style.left)};
  }else if(lefttype.substring(lefttype.length-1,lefttype.length)=="%"&&toptype.substring(toptype.length-1,toptype.length)!="%")
  {
    backData={x : parseInt(oObj.style.top), y : parseInt(parseInt(oObj.style.left)/100*parseInt(document.documentElement.clientWidth))};
  }else if(lefttype.substring(lefttype.length-1,lefttype.length)=="%"&&toptype.substring(toptype.length-1,toptype.length)=="%")
  {
    backData={x : parseInt(parseInt(oObj.style.top)/100*parseInt(document.documentElement.clientHeight)), y : parseInt(parseInt(oObj.style.left)/100*parseInt(document.documentElement.clientWidth))};
  }else
  {
    backData={x : parseInt(oObj.style.top),  y : parseInt(oObj.style.left)};
  }
  function mousemove(){
   var oEvent = window.event ? window.event : event;
   var iLeft = oEvent.clientX - dragData["x"] + parseInt(oObj.style.left);
   var iTop = oEvent.clientY - dragData["y"] + parseInt(oObj.style.top);
   var toptype=(oObj.style.top).toString();
    var lefttype=(oObj.style.left).toString();
  if(toptype.substring(toptype.length-1,toptype.length)=="%")
  {
    
    iTop=oEvent.clientY - dragData["y"] +parseInt(parseInt(oObj.style.top)/100*parseInt(document.documentElement.clientHeight))
   
  }
  if(lefttype.substring(lefttype.length-1,lefttype.length)=="%")
  {
    iLeft= oEvent.clientX - dragData["x"] + parseInt(parseInt(oObj.style.left)/100*parseInt(document.documentElement.clientWidth));
  }
   oObj.style.left = iLeft;
   oObj.style.top = iTop;
   dragData = {x: oEvent.clientX, y: oEvent.clientY};   
  }
  function mouseup(){
   var oEvent = window.event ? window.event : event;
   oObj.onmousemove = null;
   oObj.onmouseup = null;
//   if(oEvent.clientX < 1 || oEvent.clientY < 1 || oEvent.clientX > document.body.clientWidth || oEvent.clientY > document.body.clientHeight){
//    oObj.style.left = dragData.y;
//    oObj.style.top = dragData.x;
//   }
   oObj.releaseCapture ? oObj.releaseCapture() : function(){};
  }
  }
  }
//---------------------shjp:2011-7-18 �ƶ���-------------------


  /**********************************************
  * �������ã�   �ж��Ƿ�ǰ�ֵ�
  * �����ˣ�   lysong
  * ����ʱ�䣺 2009-12-29 
  * All rights reserved
  * �÷���
  ҳ���������js�ļ���ҳ��鿴ʱ����IsCurrentBranch��������CompanyCD��BranchID�ͷ��ذ�ť��ID��ControlID��
  zyy����ó��copy������
  ***********************************************/
  function IsCurrentBranch(CompanyCD, BranchID, ContronID) {
      $.ajax({
          type: "POST",
          url: "../../../Handler/Common/IsCurrentBranch.ashx",
          data: 'CompanyCD=' + escape(CompanyCD) +
      '&BranchID=' + escape(BranchID),
          dataType: 'json', //����json��ʽ����
          cache: false,
          beforeSend: function()
          { },
          success: function(data) {
              if (data.sta == "1")
              { }
              else
              { DealWithControl(ContronID); }
          }
      });
  }
  function DealWithControl(ContronID) {

      $(":text").each(function() {
          this.disabled = true;
      });
      $(":button").each(function() {
          this.disabled = true;
      });
      var ControlArrary = new Array();
      ControlArrary = ContronID.split('|');
      for (var i = 0; i < ControlArrary.length; i++) {
          $("#" + ControlArrary[i]).attr("disabled", false);
      }

      var tmpA = document.getElementsByTagName('a');
      for (var i = 0; i < tmpA.length; i++) {
          tmpA[i].href = '#this';
          tmpA[i].onclick = '';
          tmpA[i].style.color = '#999999';
          tmpA[i].style.cursor = 'default';
      }
  }

