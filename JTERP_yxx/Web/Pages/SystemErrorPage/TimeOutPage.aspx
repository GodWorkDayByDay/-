﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TimeOutPage.aspx.cs" Inherits="Pages_System_TimeOutPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Session过期</title>
</head>
<body>
    <form id="frmMain" runat="server">
    <div>
        <h1>Session已经过期，请<a href="/login.aspx" target="_parent">重新登陆</a>。</h1>
    </div>
    </form>
</body>
</html>
