<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InitGuid.aspx.cs" Inherits="Pages_Office_SystemManager_InitGuid" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>ϵͳ��ʼ����</title>
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
                    <img src="../../../images/number/logo_csh.jpg" width="320" height="65" /><strong>
                        <br />
                        <br />
                    </strong><span class="redbold">�״�ʹ��ϵͳ���밴����˵���벽�����ϵͳ��ʼ����׼��������</span></p>
            </td>
        </tr>
        <tr>
            <td>
                <p>
                    <strong>һ�����ȸ��ݹ�˾ʵ��ʹ����������滮�ñ�ϵͳ�Ĳ����û���Ȩ�޷��䷽������ȷ����ҵ����Ĺ�����Ա���滮ȷ������ϵͳ��������Ա�û�������˾��Я�ܿͷ���ȡ��Ψһ����Ա�û�����¼��ϵͳ��������ҵ����Ĺ���Ա�û���������Щ�û������Ȩ�ޡ�</strong><br />
                    <br />
                    <img src="../../../images/number/Num_01.jpg" width="26" height="26" align="absmiddle" />
                    <a href="<%=GetLinks(int.Parse(XBase.Common.ConstUtil.MODULE_ID_HUMAN_EMPLOYEE_ADD),"../HumanManager/EmployeeInfo_Add.aspx?FromPage=7&ModuleID=") %>">
                        ����Ա������</a><br />
                    <br />
                    ����Ҫ����ϵͳ�����û���Ա����������������ֻ���������ֶ����ݣ������Ǳ����ֶο�����������Դ���ĸ�����Ա��½ϵͳ���ٽ�һ�������ơ�
                </p>
                <p>
                    <img src="../../../images/number/Num_02.jpg" width="26" height="26" align="absmiddle" />
                    <a href="<%=GetLinks(int.Parse(XBase.Common.ConstUtil.Menu_AddRoleInfo),"../Systemmanager/RoleInfo_Edit.aspx?ModuleID=") %>">
                        ����ϵͳ�����û��Ľ�ɫ</a>
                    <br />
                    <br />
                    ��ϵͳͨ����ɫ������͹���Ȩ�ޣ�Ȩ��Ϊ��ϵͳ�ĸ������˵����ܰ�ť�ȣ�����ɫ������һ����λ����Ȩ���飬�Ƚ�����ɫ��������ɫ�����Ȩ�ޣ�Ȼ��Ȩ�޸���ϵͳ�Ĳ����û���<br />
                    <br />
                    <img src="../../../images/number/setup_test01.png" /><br />
                    <br />
                    <br />
                    <img src="../../../images/number/Num_03.jpg" width="26" height="26" align="absmiddle" />
                    <a href="<%=GetLinks(int.Parse(XBase.Common.ConstUtil.Menu_SerchRoleFunction),"../Systemmanager/RoleFunction_Edit.aspx?ModuleID=") %>">
                        ����ɫ����Ȩ��</a>
                    <br />
                    <br />
                    �����ý�ɫ�Ժ󣬻���Ҫ����ɫ�������Ĳ���Ȩ�ޡ�
                    <br />
                    <br />
                    <img src="../../../images/number/Num_04.jpg" width="26" height="26" align="absmiddle" />
                    <a href="<%=GetLinks(int.Parse(XBase.Common.ConstUtil.Menu_AddUserInfo),"../Systemmanager/UserInfo_Add.aspx?ModuleID=") %>">
                        ����ϵͳ�����û�</a>
                    <br />
                    <br />
                    ����ϵͳ�Ĳ����û�����ָ���������Ա��������
                    <br />
                    <br />
                    <img src="../../../images/number/Num_05.jpg" width="26" height="26" align="absmiddle" />
                    <a href="<%=GetLinks(int.Parse(XBase.Common.ConstUtil.Menu_AddUserRole),"../Systemmanager/UserRole_Add.aspx?ModuleID=") %>">
                        Ϊ�����û�������ɫ</a>
                    <br />
                    <br />
                    �����ò����û��󣬼��ɸ��û�����һ����ɫ��ֻ�й����˽�ɫ�Ĳ����û���ӵ��ϵͳ��ʵ�ʲ���Ȩ�ޡ�
                    <br />
                    <br />
                    <img src="../../../images/number/Num_06.jpg" width="26" height="26" align="absmiddle" />
                    <a href="<%=GetLinks(2191301,"../Systemmanager/ItemCodingRuleList.aspx?TypeFlag=0&ModuleID=") %>">
                        ϵͳ��������</a>
                    <br />
                    Ϊ�˱�֤��˾�������ݱ���������Ժ�һ���ԣ�����Ҫ���ø��������ݵı�Ź���
                    <br />
                    <br />
                    <strong>�����ɸ���������Դ������û���¼ϵͳ��������֯������Ա������<br />
                    </strong><strong></strong>
                    <br />
                    <img src="../../../images/number/Num_01.jpg" width="26" height="26" align="absmiddle" />
                    <a href="<%= GetLinks(int.Parse(XBase.Common.ConstUtil.MODULE_ID_HUMAN_DEPT_EDIT),"../HumanManager/DeptInfo_Info.aspx?ModuleID=") %>">
                        ���ù�˾����֯����</a><br />
                    <br />
                    ���չ�˾����֯�������֣����ϵ�������Ӹ������ŵ���Ϣ��<br />
                    <br />
                    <img src="../../../images/number/Num_02.jpg" width="26" height="26" align="absmiddle" />
                    <a href="<%= GetLinks(int.Parse(XBase.Common.ConstUtil.MODULE_ID_HUMAN_DEPTQUARTER_EDIT),"../HumanManager/DeptQuarter_Info.aspx?ModuleID=") %>">
                        ���ù�˾�ĸ�λ</a><br />
                    <br />
                    ���ݹ�˾�������ŵĸ�λ���֣����ϵ�������Ӹ�����λ����Ϣ��
                    <br />
                    <br />
                    <img src="../../../images/number/Num_03.jpg" width="26" height="26" align="absmiddle" />
                    <a href="<%=GetLinks(int.Parse(XBase.Common.ConstUtil.MODULE_ID_HUMAN_EMPLOYEE_ADD),"../HumanManager/EmployeeInfo_Add.aspx?FromPage=7&ModuleID=") %>">
                        ����Ա������</a><br />
                    <br />
                    ��������ְԱ���ĵ���¼��ϵͳ�������Ƶ�һ��������������Ա��������<br />
                    ��ϸ��������Դ��ϵ�����������������Դ�������µ���˵����
                    <br />
                    <br />
                    <strong>�����ù���Ա�û���¼ϵͳ��������ҵ��ģ��Ĳ����û�������Ȩ��</strong><strong></strong><br />
                    ��������ͬ��һ���ֵĲ���2������5��
                    <br />
                    <br />
                    <strong>�ġ���ҵ����Ĺ���Ա�û���¼ϵͳ����ɸ�ҵ��ģ��ĳ�ʼ������</strong><strong></strong><br />
                    <br />
                    <img src="../../../images/number/Num_01.jpg" width="26" height="26" align="absmiddle" />
                    ��ģ��Ļ�������<br />
                    <br />
                    Ϊ�˷��㵥�ݵĿ���¼�룬��ģ����ṩ�˻������ù��ܣ���ģ��ʹ��֮ǰ��׼�����������ڻ�����������ɡ�<br />
                    ��Ҫ���������ĵ��ݣ����ڻ������������ø����ݵ��������̡�<br />
                    <br />
                    <img src="../../../images/number/Num_02.jpg" width="26" height="26" align="absmiddle" />
                    ��Ӧ������
                    <br />
                    <br />
                    ����ͨ�˽�����ģ�飬������Ƚ��й�Ӧ����صĻ������ã�������Ʒ����Ʒ���������ֿ⵵�������ڹ�Ӧ����������ɸ������á�
                    <br />
                    <br />
                    ����ͨ�˽�����ģ�飨�磺�ɹ������ۡ���棩��������Ƚ��й�Ӧ����صĻ������ã�������Ʒ����Ʒ������������ҵ����������ڹ�Ӧ�������Լ�����������ɸ������á�<br />
                    <span class="Blue">��1�� <a href="<%=GetLinks(2081301,"../Systemmanager/CodePublicType.aspx?TypeFlag=5&ModuleID=") %>">
                        ��������</a></span><br />
                    �ڹ�Ӧ������ģ���µĻ��������а�����˳��ֱ�������ã�<br />
                    ������������ - ��Ʒ���� - ��Ʒ�������� - ������λ��������λ�� - ԭ������ - �������� - ����������� - ���ι������� - ������չ��������<br />
                    <br />
                    <span class="Blue">��2��<a href="<%=GetLinks(20818,"../Systemmanager/ParameterSetting.aspx?ModuleID=") %>">ҵ���������</a></span><br />
                    ���ݹ�˾��ҵ���������ҵ���������ã�ҵ���������ú���Ҫ������ϸ���ã���Щ������ɺ󲻿��ٱ����<br />
                    <br />
                    <span class="Blue">��3��<a href="<%=GetLinks(int.Parse(XBase.Common.ConstUtil.MODULE_ID_STORAGE_STORAGEINFO),"../StorageManager/StorageInfo.aspx?ModuleID=") %>">�����ֿ⵵��</a></span><br />
                    ���ݹ�˾�Ĳֿ�ֲ���������������ֿ�ĵ�����ϵͳҪ��������ٽ���һ���ֿ⡣<br />
                    <br />
                    <span class="Blue">��4��<a href="<%=GetLinks(int.Parse(XBase.Common.ConstUtil.Menu_AddProduct),"../SupplyChain/ProductInfoAdd.aspx?SysModuleID=21915&ModuleID=") %>">������Ʒ����</a></span><br />
                    ��Ʒ����Ʒ������������������ϵͳ����������ݣ����Ե���¼�룬Ҳ����ͨ��ģ���ļ�����������Ʒ������ϵͳ�С�<br />
                    ֻ�о���ȷ�ϣ����״̬Ϊ����������Ʒ�������ܱ������浥�ݵ��á�<br />
                    <br />
                    <span class="Blue">��5��<a href="<%=GetLinks(int.Parse(XBase.Common.ConstUtil.Menu_OtherCorpInfo),"../SupplyChain/OtherCorpInfo.aspx?ModuleID=") %>">��������������λ����</a></span><br />
                    ���ݹ�˾��ʵ�����������Ҫ�Կͻ��͹�Ӧ��֮�������������λ�磺���С������̵Ƚ��й�������������λ�����½���������λ������<br />
                    �˲���Ҳ�����������������á�<br />
                    <br />
                    <span class="Blue">��6�����п���ʼ��</span><br />
                    ��μ��������µĳ�ʼ���򵼡�<br />
                    <br />
                    <br />
                    <strong>�塢��ʼ����ʹ��ϵͳ<br />
                        <br />
                    </strong>����Ժ��ʼ����׼�������󣬼��ɿ�ʼ����ʹ�ñ�ϵͳ��
                </p>
            </td>
        </tr>
    </table>
</body>
</html>
