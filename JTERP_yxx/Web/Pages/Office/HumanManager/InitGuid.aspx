<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InitGuid.aspx.cs" Inherits="Pages_Office_HumanManager_InitGuid" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>������Դ��ϵ������</title>
   <link href="../../../css/default.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        <!
        -- body
        {
            margin-left: 30px;
            margin-top: 30px;
            margin-right: 30px;
            margin-bottom: 30px;
        }
        -- ></style>
</head>
<body>
    <table width="100%" border="0" cellpadding="10" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
            <td height="40">
                <p align="center" class="Title">
                    <img src="../../../images/number/logo_hr.jpg" width="420" height="65" /><strong>
                        <br />
                        <br />
                    </strong><span class="redbold">����ʹ��������Դ����ϵͳ����������²��蹹����˾��������Դ������ϵ��</span></p>
            </td>
        </tr>
        <tr>
            <td>
                <p>
                    <img src="../../../images/number/Num_01.jpg" width="26" height="26" align="absmiddle" />
                     <a href="<%= GetLinks(2011901,"../Systemmanager/CodePublicType.aspx?TypeFlag=2&ModuleID=") %>">��������</a>
                    <br />
                    <br />
                    Ϊ�˷��㵥�ݵĿ���¼�룬������Դ����ϵͳ�ṩ�˻������ù��ܣ�������Դ����ϵͳ���漰���Ĺ����������ԣ������б�ѡ��Լ����ݵı�Ź���ͳһ���������á�<br />
                    <br />
                    <img src="../../../images/number/Num_02.jpg" width="26" height="26" align="absmiddle" />
                    <a href="<%= GetLinks(int.Parse(XBase.Common.ConstUtil.MODULE_ID_HUMAN_DEPT_EDIT),"../HumanManager/DeptInfo_Info.aspx?ModuleID=") %>">���ù�˾����֯����</a>
                    <br />
                    <br />
                    ���չ�˾����֯�������֣����ϵ�������Ӹ������ŵ���Ϣ��<br />
                    <br />
                    <img src="../../../images/number/Num_03.jpg" width="26" height="26" align="absmiddle" />
                    <a href="<%= GetLinks(int.Parse(XBase.Common.ConstUtil.MODULE_ID_HUMAN_DEPTQUARTER_EDIT),"../HumanManager/DeptQuarter_Info.aspx?ModuleID=") %>">���ù�˾�ĸ�λ</a>
                    <br />
                    <br />
                    ���ݹ�˾�������ŵĸ�λ���֣����ϵ�������Ӹ�����λ����Ϣ����ȷ������λ��ְ�����ְ�ʸ�Ҫ�󣬶����λ˵���顣
                    <br />
                    <br />
                    <img src="../../../images/number/Num_04.jpg" width="26" height="26" align="absmiddle" />
                   <a href="<%= GetLinks(int.Parse(XBase.Common.ConstUtil.MODULE_ID_HUMAN_EMPLOYEE_ADD),"../HumanManager/EmployeeInfo_Add.aspx?FromPage=6&ModuleID=") %>">������ְԱ������</a>
                    <br />
                    <br />
                    ��������ְԱ���ĵ���¼��ϵͳ��<br />
                    <br />
                    <img src="../../../images/number/Num_05.jpg" width="26" height="26" align="absmiddle" />
                    <a href="<%= GetLinks(int.Parse(XBase.Common.ConstUtil.MODULE_ID_HUMAN_RECTCHECKELEM_EDIT),"../HumanManager/RectCheckElem_Info.aspx?ModuleID=") %>">������Ƹ��������ģ��</a>
                    <br />
                    <br />
                    ���ݸ�λ˵����Ķ���ĸ���λ��ְ�ʸ�ȷ������λ��Ӧ����������ģ�塣
                    <br />
                    ��������������ģ���Ҫ�أ�Ȼ��������λ������ģ�塣
                    <br />
                    <br />
                    <img src="../../../images/number/Num_06.jpg" width="26" height="26" align="absmiddle" />
                    <a href="<%= GetLinks(int.Parse(XBase.Common.ConstUtil.MODULE_ID_HUMAN_SALARY_SET),"../HumanManager/SalarySet_Edit.aspx?ModuleID=") %>">����н����ϵ�ṹ</a>
                    <br />
                    <br />
                    ���ݹ�˾��н����ϵ�ṹ��������Աн��ṹ���������̶����������á��������������á���ᱣ�����á���������˰���á���λ�������á�Ա��н�ʽṹ���á�<br />
                    <br />
                    <img src="../../../images/number/Num_07.jpg" width="26" height="26" align="absmiddle" />
                    <a href="<%= GetLinks(int.Parse(XBase.Common.ConstUtil.MODULE_ID_HUMAN_PERFORMANCECHECK),"../HumanManager/PerformanceType.aspx?ModuleID=") %>">������Ч����ģ��</a>
                    <br />
                    <br />
                    ���ݹ�˾�Ŀ���Ҫ���Ƚ�����Ч���˵����ͣ��磺�¿��ˡ����ȿ��ˡ����տ��ˣ���
                    <br />
                    Ȼ�����ÿ���ָ��͸���λ��Ӧ�ļ�Ч����ģ�塣
                    <br />
                    ������úø���Ա���Ŀ������̣��ճ����п���ʱϵͳ���Զ����ݿ������̽��п�������<br />
                    <br />
                    <img src="../../../images/number/Num_08.jpg" width="26" height="26" align="absmiddle" />
                    <a href="<%= GetLinks(int.Parse(XBase.Common.ConstUtil.Menu_Flow),"../Systemmanager/ApprovalFlowSet.aspx?TypeFlag=2&ModuleID=") %>">������������</a>
                </p>
                ���ú��ճ�������Դ��������Ҫ���������ĸ��൥�ݶ�Ӧ���������̣�ȷ�������̲���������ˡ���ʵ��ҵ�񵥾��ύ����ʱ��������úõ����̽�����ת������
            </td>
        </tr>
    </table>
</body>
</html>
