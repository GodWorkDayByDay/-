﻿/* 显示文件上传页面 */
function ShowUploadFile()
{
    var sH = window.screen.height; //窗口的高度
    var sW = window.screen.width; //窗口的宽度
    //当鼠标点击时的x坐标的值加上div的宽度大于窗口的宽度
    var left, top;
    left = (sW - 900)/2;
    top = (sH - 500)/2;
    //设置div的位置

    var uploadFile ="";
    // 整个div的大小和位子
    uploadFile += "<div id='divJTNameS_InBus' style='display:none'><iframe id='ifmJTNameS_InBus' frameborder='0' width='100%' ></iframe></div>";
    uploadFile += "<div id='divCommonUploadFile' style='z-index:21; background-color:white; position:absolute; left:" + left + "px; top:" + top + "px;'>";
    // 白色div中的信息
    uploadFile += "<table cellpadding='0' cellspacing='1' border='0' class='border' align='center' valign='middle'>";
    uploadFile += "<tr><td>";
    uploadFile += "<iframe src='../../../Pages/Common/UploadFile.aspx' scrolling=no width='640' height='150' frameborder='0'></iframe>";
    uploadFile += "</td></tr>";
    uploadFile += "</table>";
    //--end
    uploadFile += "</div>";
    //document.write(str);
    //document.body.insertAdjacentHTML("afterBegin",uploadFile);
    insertHtml("afterBegin", document.body, uploadFile);
    openRotoscopingDiv(false,"divJTNameS_InBus","ifmJTNameS_InBus");//弹遮罩层
}

/* 显示文件扫描页面 */
function ScanUploadFile()
{
    var sH = window.screen.height; //窗口的高度
    var sW = window.screen.width; //窗口的宽度
    //当鼠标点击时的x坐标的值加上div的宽度大于窗口的宽度
    var left, top;
    left = (sW - 650)/2;
    top = (sH - 500)/2;
    //设置div的位置

    var uploadFile ="";
    // 整个div的大小和位子
    uploadFile += "<div id='divCommonUploadFile' style='z-index:11; background-color:white;position:absolute;left:" + left + ";top:" + top + ";'>";
    // 白色div中的信息
    uploadFile += "<table cellpadding='0' cellspacing='1' border='0' class='border' align=left>";
    uploadFile += "<tr><td>";
    uploadFile += "<iframe src='../../../Pages/Common/UploadImage.aspx' scrolling=no width='640' height='550' frameborder='0'></iframe>";
    uploadFile += "</td></tr>";
    uploadFile += "</table>";
    //--end
    uploadFile += "</div>";
    //document.write(str);
    //document.body.insertAdjacentHTML("afterBegin",uploadFile);
    insertHtml("afterBegin", document.body, uploadFile);
}

/* 隐藏文件上传页面 */
function HideUploadFile(fileUrl,docName, flag)
{ 
    //隐藏DIV
    document.getElementById("divCommonUploadFile").style.display = "none";
    closeRotoscopingDiv(false,"divJTNameS_InBus");//关闭遮罩层
    //确定按钮返回时
    if ("1" == flag)
    {
        //调用父窗口函数
        //window.parent.AfterUploadFile(fileUrl);
        //window.parent["Main"].
        AfterUploadFile(fileUrl, docName);
    }
}

/*
* where：插入位置。包括beforeBegin,beforeEnd,afterBegin,afterEnd。
* el：用于参照插入位置的html元素对象
* html：要插入的html代码
*/
function insertHtml(where, el, html)
{   
    where = where.toLowerCase();   
    if(el.insertAdjacentHTML)
    {   
        switch(where)
        {   
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
    var range = el.ownerDocument.createRange();   
    var frag;   
    switch(where)
    {   
        case "beforebegin":   
            range.setStartBefore(el);   
            frag = range.createContextualFragment(html);   
            el.parentNode.insertBefore(frag, el);   
            return el.previousSibling;   
        case "afterbegin":   
            if(el.firstChild)
            {   
                range.setStartBefore(el.firstChild);   
                frag = range.createContextualFragment(html);   
                el.insertBefore(frag, el.firstChild);   
                return el.firstChild;   
            }
            else
            {   
                el.innerHTML = html;   
                return el.firstChild;   
            }   
        case "beforeend":   
            if(el.lastChild)
            {   
                range.setStartAfter(el.lastChild);   
                frag = range.createContextualFragment(html);   
                el.appendChild(frag);   
                return el.lastChild;   
            }
            else
            {   
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

