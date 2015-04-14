<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SendedInfo.aspx.cs" Inherits="Pages_Personal_MessageBox_SendedInfo" %>

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

    <script src="../../../js/Personal/MessageBox/SendedInfo.js" type="text/javascript"></script>

    <script src="../../../js/common/check.js" type="text/javascript"></script>

    <script src="../../../js/common/page.js" type="text/javascript"></script>

    <script src="../../../js/common/Common.js" type="text/javascript"></script>

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
            width: 400px;
            background-color: #fefefe;
            position: absolute;
            border: solid 1px #000000;
            padding: 5px;
        }
    </style>
    <title>�ѷ�����</title>
</head>
<body>
    <input type="hidden" id="isSearched" value="0" />
    <form id="form1" runat="server">
    <a name="pageDataList1Mark"></a><span id="Forms" class="Spantype" name="Forms"></span>
    <table width="95%" height="57" border="0" cellpadding="0" cellspacing="0" class="checktable"
        id="mainindex">
        <tr>
            <td valign="top">
                <img src="../../../images/Main/Line.jpg" width="122" height="7" />
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
                                    <td height="20" class="td_list_fields" align="right" width="10%">
                                        ����ʱ��
                                    </td>
                                    <td bgcolor="#FFFFFF" width="23%">
                                        <input onkeydown="return false;" name="createDate" id="createDate1" class="tdinput"
                                            type="text" size="14" onclick="WdatePicker()" />
                                        ~<input onkeydown="return false;" name="createDate" id="createDate2" class="tdinput"
                                            type="text" size="14" onclick="WdatePicker()" />
                                    </td>
                                   <td class="td_list_fields" align="right" width="10%">
                                        ����
                                    </td>
                                    <td bgcolor="#FFFFFF" width="23%">
                                        <input name="txtTitle" id="txtTitle" type="text" class="tdinput" style="width: 180px;" />
                                    </td>
                                   <td class="td_list_fields" align="right" width="10%">
                                    </td>
                                    <td bgcolor="#FFFFFF" width="24%">
                                    </td>
                                </tr>
                                <tr class="table-item">
                                    <td colspan="6" height="20" bgcolor="#FFFFFF" align="center">
                                        <img title="����" src="../../../images/Button/Bottom_btn_search.jpg" style='cursor: pointer;'
                                            onclick='SearchEquipData()' />
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
                �ѷ�����
            </td>
        </tr>
        <tr>
            <td height="35" colspan="2" valign="top">
                <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999">
                    <tr>
                        <td height="28" bgcolor="#FFFFFF">
                            &nbsp;&nbsp;&nbsp;
                            <img src="../../../images/Button/Main_btn_delete.jpg" title="ɾ��" id="btn_del" runat="server"
                                visible="false" onclick="DelMessage()" style='cursor: pointer;' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" id="pageDataList1"
                    bgcolor="#999999">
                    <tbody>
                        <tr>
                            <th height="20" align="center" class="td_list_fields">
                                ѡ��
                            </th>
                            <th align="center" class="td_list_fields">
                                <div class="orderClick" onclick="OrderBy(this,'SendUserID','oGroup');return false;">
                                    ������<span></span></div>
                            </th>
                            <th align="center" class="td_list_fields">
                                <div class="orderClick" onclick="OrderBy(this,'CreateDate','oC1');return false;">
                                    ����ʱ��<span></span></div>
                            </th>
                            <th align="center" class="td_list_fields">
                                <div class="orderClick" onclick="OrderBy(this,'ReceiveUserID','oC2');return false;">
                                    ������<span></span></div>
                            </th>
                            <th width="20%" align="center" class="td_list_fields">
                                <div class="orderClick" onclick="OrderBy(this,'Title','oC2');return false;">
                                    ����<span></span></div>
                            </th>
                            <th width="30%" align="center" class="td_list_fields">
                                <div class="orderClick" onclick="OrderBy(this,'Content','oC5');return false;">
                                    ����<span></span></div>
                            </th>
                            <th align="center" class="td_list_fields">
                                <div onclick="OrderBy(this,'Status','oC6');return false;">
                                    ����״̬<span></span></div>
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
                                        <div id="PageCount">
                                        </div>
                                    </td>
                                    <td height="28" align="right">
                                        <div id="pageDataList1_Pager" class="jPagerBar">
                                        </div>
                                    </td>
                                    <td height="28" align="right">
                                        <div id="divpage">
                                            <input name="text" type="text" id="Text2" style="display: none" />
                                            <span id="pageDataList1_Total" style="display: none"></span>ÿҳ��ʾ
                                            <input name="text" type="text" id="ShowPageCount" />
                                            �� ת����
                                            <input name="text" type="text" id="ToPage" />
                                            ҳ
                                            <img src="../../../images/Button/Main_btn_GO.jpg" style='cursor: pointer;' alt="go"
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
    </table>
    </form>
    <div id="editPanel" style="display: none;">
        <table id="itemContainer" border="1" width="100%" cellpadding="3" style="border-collapse: collapse;">
            <tr>
                <td style="width: 40px;">
                    ����
                </td>
                <td>
                    <span id="ttTitle"></span>
                </td>
            </tr>
            <tr>
                <td>
                    ����ʱ��
                </td>
                <td>
                    <span id="ttSendDate"></span>
                </td>
            </tr>
            <tr>
                <td>
                    ������
                </td>
                <td>
                    <span id="ReceiveUserID"></span>
                </td>
            </tr>
            <tr>
                <td>
                    �Ķ�״̬
                </td>
                <td>
                    <span id="ttState"></span>
                </td>
            </tr>
            <tr>
                <td>
                    �������ݣ�
                </td>
                <td align="left" valign="top">
                    <span id="ttContent"></span>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="padding: 3px;">
                    <a href="#" onclick="hideMsg()">ȷ��</a>&nbsp;&nbsp;
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
