﻿<%@ WebHandler Language="C#" Class="Login" %>

using System;
using System.Web;
using XBase.Common;
using System.Data;
using XBase.Business;
using XBase.Business.Common;
using System.Configuration;
using System.Web.SessionState;
using XBase.Business.Office.SystemManager;
using XBase.Data;
public class Login : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{

    /// <summary>
    /// 用户已经登陆标志
    /// </summary>
    private const string HAD_LOGIN = "1";
    /// <summary>
    /// 用户被锁标志
    /// </summary>
    private const string HAD_LOCKED = "1";

    public void ProcessRequest(HttpContext context)
    {

        //获得页面输入的用户名
        string userID = context.Request.QueryString["UserID"];
        string action = context.Request.QueryString["action"];
        //获得页面输入的密码
        string passwordInput = context.Request.QueryString["Password"];

        //验证码对错验证
        string checkCode = (string)SessionUtil.Session["CheckCode"];
        if (action == "Logindata")
        {
            string checkCodeInput = context.Request.QueryString["CheckCode"].ToUpper();
            if (!checkCodeInput.Equals(checkCode))
            {
                //设置报错消息param
                string[] param = { "验证码" };
                SetError(userID, context.Response, "txtCheckCode", "Common", "E003", "验证码错误");
                return;
            }

            //判断是否已经登陆
            if (ConfigurationSettings.AppSettings["enableSSEION"] == "1")
            {
                if (UserSessionManager.Exists(userID))
                {

                    //设置报错消息
                    SetError(userID, context.Response, "txtUserID", "Login", "E001", "该用户名已经登陆，不能重复登陆。");
                    return;
                }
            }


            //校验用户名，密码，公司等信息
            DataTable loginInfo = LoginBus.DoLogin(userID);

            //用户名 不存在
            if (loginInfo == null || loginInfo.Rows.Count < 1)
            {
                //设置报错消息
                SetError(userID, context.Response, "txtUserID", "Login", "E002", "用户名或密码错误");
                return;
            }
            //用户名 不存在
            if (loginInfo.Rows[0]["UsedStatus"].ToString() != "1")
            {
                //设置报错消息
                SetError(userID, context.Response, "txtUserID", "Login", "E002", "帐套已停用");
                return;
            }

            //2014-02-22 by bsd
            string position = context.Request.QueryString["position"]; ;//1-职员  2-客户
            //检查是职员还是客户
            if (position == "1" && loginInfo.Rows[0]["roletype"].ToString() == "2")
            {
                //设置报错消息
                SetError(userID, context.Response, "txtUserID", "Login", "E002", "您的账号身份是客户，请在客户登录页面登录");
                return;
            }
            if (position == "2" && loginInfo.Rows[0]["roletype"].ToString() == "1")
            {
                //设置报错消息
                SetError(userID, context.Response, "txtUserID", "Login", "E002", "您的账号身份是公司职员，请在职员登录页面登录");
                return;
            }

            string snList = context.Request.QueryString["snList"];
            //if (snList + "" == "")
            //{
            //    /*验证登陆用户所属公司和用户是否都开启 USBKEY验证*/
            //    if (ConfigurationSettings.AppSettings["enableUSBKEYLOGIN"] == "1" && loginInfo.Rows[0]["EnableUSBKEYLOGIN"].ToString() == "True" && loginInfo.Rows[0]["IsHardValidate"].ToString() == "1")
            //    {
            //        //设置报错消息
            //        SetError(userID, context.Response, "txtUserID", "Login", "E002", "没有读取到USBKEY");
            //        return;
            //    }




            //    //if (ConfigurationSettings.AppSettings["enableUSBKEYLOGIN"] == "1" && loginInfo.Rows[0]["EnableUSBKEYLOGIN"].ToString() == "True")
            //    //{
            //    //    //设置报错消息
            //    //    SetError(userID, context.Response, "txtUserID", "Login", "E002", "没有读取到USBKEY");
            //    //    return;
            //    //}
            //}

            string passwordDataBase = (string)loginInfo.Rows[0]["password"];
            //对输入密码进行加密
            string decryptPassword = StringUtil.EncryptPasswordWitdhMD5(passwordInput);
            //两密码不同时报错
            if (!decryptPassword.Equals(passwordDataBase))
            {
                //设置报错消息
                string[] param = { "密码" };
                SetError(userID, context.Response, "txtPassword", "Common", "E003", "用户名或密码错误");
                return;
            }

            ////验证USBKEY
            //if (ConfigurationSettings.AppSettings["enableUSBKEYLOGIN"] == "1" && loginInfo.Rows[0]["EnableUSBKEYLOGIN"].ToString() == "True" && loginInfo.Rows[0]["IsHardValidate"].ToString() == "1")
            //{

            //    DataTable usbkeyList = XBase.Business.LoginBus.GetUSBKEYListByCompnayCD(loginInfo.Rows[0]["CompanyCD"].ToString());
            //    bool usbkeyok = false;
            //    foreach (DataRow row in usbkeyList.Rows)
            //    {
            //        if ((snList).IndexOf(row["USBKEY"].ToString()) != -1)
            //        {
            //            usbkeyok = true;
            //            break;
            //        }
            //    }
            //    if (usbkeyok == false)
            //    {
            //        SetError(userID, context.Response, "txtUserID", "Login", "E002", "USBKEY验证失败");
            //        return;
            //    }
            //}


            //UserOpenDate UserCloseDate
            DateTime UserOpenDate = (DateTime)loginInfo.Rows[0]["UserOpenDate"];
            DateTime UserCloseDate = (DateTime)loginInfo.Rows[0]["UserCloseDate"];

            if (DateTime.Now < UserOpenDate)
            {
                SetError(userID, context.Response, "txtPassword", "Common", "E003", "账户未生效");
                return;
            }

            if (DateTime.Now > UserCloseDate)
            {
                SetError(userID, context.Response, "txtPassword", "Common", "E003", "账户已过期");
                return;
            }


            //判断是否被锁定
            string lockFlag = (string)loginInfo.Rows[0]["LockFlag"];
            if (HAD_LOCKED.Equals(lockFlag))
            {
                //设置报错消息
                SetError(userID, context.Response, "txtUserID", "Login", "E003", "账户被锁定");
                return;
            }

            //获得当前时间
            string toDay = DateTime.Now.ToString("yyyyMMdd");
            //获得用户公司服务开始时间
            string startDate = (string)loginInfo.Rows[0]["CompanyOpenDate"];
            //获得用户公司服务结束时间
            string endDate = (string)loginInfo.Rows[0]["CompanyCloseDate"];
            //当前时间不在公司服务时间范围内时报错
            if (toDay.CompareTo(endDate) > 0 || toDay.CompareTo(startDate) < 0)
            {
                //设置报错消息
                string[] param = { "公司" };
                SetError(userID, context.Response, "txtUserID", "Login", "E004", "公司不在服务时间");
                return;
            }

            //获得用户ID服务开始时间
            startDate = ((DateTime)loginInfo.Rows[0]["UserOpenDate"]).ToString("yyyyMMdd");
            //获得用户ID服务结束时间
            endDate = ((DateTime)loginInfo.Rows[0]["UserCloseDate"]).ToString("yyyyMMdd");
            //当前时间不在用户ID服务时间范围内时报错
            if (toDay.CompareTo(endDate) > 0 || toDay.CompareTo(startDate) < 0)
            {
                //设置报错消息
                string[] param = { "用户名" };
                SetError(userID, context.Response, "txtUserID", "Login", "E004", "用户不在服务时间");
                return;
            }

            //获得用户公司代码
            string companyCD = (string)loginInfo.Rows[0]["CompanyCD"];
            //获得用户姓名
            string userName = (string)loginInfo.Rows[0]["UserName"];
            //获取是否超管信息
            string IsRoot = (string)loginInfo.Rows[0]["IsRoot"];
            //获取用户角色列表
            int[] role = LoginBus.GetRoleInfo(userID, companyCD);
            //char rolerange = LoginBus.GetRoleRangeInfo(role);
            string rolerange = loginInfo.Rows[0]["RoleRange"].ToString();//获取当前登录账户的权限范围
            //只读取顶级菜单信息
            //全部菜单信息放到LEFT.CS内读取并缓存
            //获得用户菜单信息
            DataTable menuInfo = SafeUtil.InitMenuData(userID, companyCD, "len(C.ModuleID) <= 2");

            //获得用户页面操作信息
            DataTable authoInfo = null;
            //null;SafeUtil.InitPageAuthority(userID, companyCD);

            //设置Session中用户信息
            UserInfoUtil userInfo = new UserInfoUtil();

            DataTable cmpinfo = XBase.Business.SystemManager.CompanyBus.GetCompanyByCD("CompanyCD='" + companyCD + "'");
            if (cmpinfo.Rows.Count > 0)
            {
                userInfo.CompanyName = cmpinfo.Rows[0]["NameCN"].ToString();
            }

            //2014-03-28 bao add   系统静态数据，采用 配置文件的方式（xml格式），系统登录时，由程序直接读取，并放于缓存中
            OprXML opxml = new OprXML();
            //设置采购合同单据类型
            userInfo.BillType_CGHTD = opxml.ReadXML("jthyRoot", "Ywtype", "采购合同");
            //设置调运单单据类型
            userInfo.BillType_DYD = opxml.ReadXML("jthyRoot", "Ywtype", "调运单");
            //设置采购到货单单据类型
            userInfo.BillType_CGDHD = opxml.ReadXML("jthyRoot", "Ywtype", "采购到货单");
            //设置质检单单据类型
            userInfo.BillType_CGZJD = opxml.ReadXML("jthyRoot", "Ywtype", "质检单");
            //设置采购入库单单据类型
            userInfo.BillType_CGRKD = opxml.ReadXML("jthyRoot", "Ywtype", "采购入库单");
            //设置销售合同单据类型
            userInfo.BillType_XSHTD = opxml.ReadXML("jthyRoot", "Ywtype", "销售合同");
            //设置采购直销单单据类型
            userInfo.BillType_CGZXD = opxml.ReadXML("jthyRoot", "Ywtype", "采购直销单");
            //设置销售发货单单据类型
            userInfo.BillType_XSFHD = opxml.ReadXML("jthyRoot", "Ywtype", "销售发货单");
            //设置销售出库单单据类型
            userInfo.BillType_XSCKD = opxml.ReadXML("jthyRoot", "Ywtype", "销售出库单");

            //火车调运表状态
            //未生效
            userInfo.DiaoyunType_NoEffec = opxml.ReadXML("jthyRoot", "HuocheDiaoyunType", "未生效");
            //装车
            userInfo.DiaoyunType_InCar = opxml.ReadXML("jthyRoot", "HuocheDiaoyunType", "装车");
            //发货
            userInfo.DiaoyunType_Send = opxml.ReadXML("jthyRoot", "HuocheDiaoyunType", "发货");
            //在途
            userInfo.DiaoyunType_InLoad = opxml.ReadXML("jthyRoot", "HuocheDiaoyunType", "在途");
            //到货
            userInfo.DiaoyunType_Arrive = opxml.ReadXML("jthyRoot", "HuocheDiaoyunType", "到货");

            //审批状态值
            //待审核
            userInfo.ShenpiType_Wait = opxml.ReadXML("jthyRoot", "ShenpiType", "待审核");
            //审核通过
            userInfo.ShenpiType_ApproveComp = opxml.ReadXML("jthyRoot", "ShenpiType", "审核通过");
            //审核退回
            userInfo.ShenpiType_Back = opxml.ReadXML("jthyRoot", "ShenpiType", "审核退回");



            //设置用户ID
            userInfo.UserID = userID;
            //设置用户姓名
            userInfo.UserName = userName;
            //设置超管信息
            userInfo.IsRoot = IsRoot;
            //设置用户公司代码
            userInfo.CompanyCD = companyCD;
            //获取人员编号
            string employeeID = GetSafeData.GetStringFromInt(loginInfo.Rows[0], "EmployeeID");
            //人员ID设置的场合，设置人员ID
            if (!string.IsNullOrEmpty(employeeID))
            {
                //设置人员ID 
                userInfo.EmployeeID = int.Parse(employeeID);
                //设置人员名
                userInfo.EmployeeName = GetSafeData.ValidateDataRow_String(loginInfo.Rows[0], "EmployeeName");
                //设置人员工号
                userInfo.EmployeeNum = GetSafeData.ValidateDataRow_String(loginInfo.Rows[0], "EmployeeNum");
                //获取部门ID
                string deptID = GetSafeData.GetStringFromInt(loginInfo.Rows[0], "DeptID");
                //部门ID设置的场合，设置部门ID
                if (!string.IsNullOrEmpty(deptID))
                {
                    //设置部门ID
                    userInfo.DeptID = int.Parse(deptID);
                }
                //部门名称
                userInfo.DeptName = GetSafeData.ValidateDataRow_String(loginInfo.Rows[0], "DeptName");
            }

            //设置角色列表
            userInfo.Role = role;
            //设置角色权限范围
            userInfo.RoleRange = rolerange;
            //设置用户菜单信息
            userInfo.MenuInfo = menuInfo;
            //设置用户页面操作信息
            userInfo.AuthorityInfo = authoInfo;
            //根据DeptID判断是否分店
            userInfo.IsSubStore = XBase.Business.Common.SubStore.IsSubStore(userInfo.DeptID, userInfo.CompanyCD);

            //设置用户是客户还是内部员工
            userInfo.IsCust = GetSafeData.ValidateDataRow_String(loginInfo.Rows[0], "isCust");

            //根据是否分店 插入 分店ID 总店为0
            //if (userInfo.IsSubStore)
            //{
            userInfo.BranchID = Convert.ToInt32(XBase.Business.Common.SubStore.GetSubStoreID(userInfo.DeptID.ToString()));
            //获取从属当前组织的分店或者分公司
            userInfo.SubStoreList = XBase.Business.Common.SubStore.GetSubStoreIDListIn(userInfo.BranchID.ToString());
            // }
            //else
            //    userInfo.BranchID = 0;

            //设置分店名称
            userInfo.SubStoreName = XBase.Business.Common.SubStore.GetSubStoreName(userInfo.BranchID.ToString());
            //出入库价格是否显示
            if (XBase.Business.Office.SystemManager.ParameterSettingBus.Get(userInfo.CompanyCD, "1", true))
                userInfo.IsDisplayPrice = true;
            else
                userInfo.IsDisplayPrice = false;

            //是否启用条码
            if (XBase.Business.Office.SystemManager.ParameterSettingBus.Get(userInfo.CompanyCD, "2", true))
                userInfo.IsBarCode = true;
            else
                userInfo.IsBarCode = false;

            //是否启用多计量单位
            if (XBase.Business.Office.SystemManager.ParameterSettingBus.Get(userInfo.CompanyCD, "3", false))
                userInfo.IsMoreUnit = true;
            else
                userInfo.IsMoreUnit = false;

            //是否启用批次规则设置
            //if (XBase.Business.Office.SystemManager.ParameterSettingBus.Get(userInfo.CompanyCD, "4", false))
            //    userInfo.IsBatch = true;
            //else
            //    userInfo.IsBatch = false;
            if (XBase.Business.Office.SystemManager.BatchNoRuleSetBus.GetBatchStatus(userInfo.CompanyCD))
            {
                userInfo.IsBatch = true;
            }
            else
            {
                userInfo.IsBatch = false;
            }

            //是否启用自动生成凭证
            if (XBase.Business.Office.SystemManager.ParameterSettingBus.Get(userInfo.CompanyCD, "6", false))
                userInfo.IsVoucher = true;
            else
                userInfo.IsVoucher = false;

            //是否启用自动审核登帐
            if (XBase.Business.Office.SystemManager.ParameterSettingBus.Get(userInfo.CompanyCD, "7", false))
                userInfo.IsApply = true;
            else
                userInfo.IsApply = false;
            //是否启用超订单发货
            if (XBase.Business.Office.SystemManager.ParameterSettingBus.Get(userInfo.CompanyCD, "8", false))
                userInfo.IsOverOrder = true;
            else
                userInfo.IsOverOrder = false;

            //允许出入库价格为零
            if (XBase.Business.Office.SystemManager.ParameterSettingBus.Get(userInfo.CompanyCD, "9", false))
                userInfo.IsZero = true;
            else
                userInfo.IsZero = false;

            //小数位数
            userInfo.SelPoint = "2";//默认 
            DataTable dtPoint = XBase.Business.Office.SystemManager.ParameterSettingBus.GetPoint(userInfo.CompanyCD, "5");
            if (dtPoint != null)
            {
                if (dtPoint.Rows.Count > 0)
                {
                    userInfo.SelPoint = dtPoint.Rows[0]["SelPoint"].ToString();
                }
            }
            //版本
            DataTable dt = ParameterSettingBus.GetPoint(companyCD, "10");
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    //---------------医药行业 2012-09-25----------------------//
                    //if (dt.Rows[0]["SelPoint"].ToString() == "3")
                    //    userInfo.Version = "medicine";
                    //---------------------------------------------//
                    if (dt.Rows[0]["SelPoint"].ToString() == "0")
                        userInfo.Version = "general";//通用版
                    if (dt.Rows[0]["SelPoint"].ToString() == "1")
                        userInfo.Version = "floor";//地板
                    if (dt.Rows[0]["SelPoint"].ToString() == "2")
                        userInfo.Version = "chemical";//化工  数据表中2代表化工行业
                    if (dt.Rows[0]["SelPoint"].ToString() == "3")
                        userInfo.Version = "medicine";//医药   数据表中数字3代表医药行业

                }
            }
            //是否启用定制打印
            if (XBase.Business.Office.SystemManager.ParameterSettingBus.Get(userInfo.CompanyCD, "11", false))
                userInfo.IsPrint = "true";
            else
                userInfo.IsPrint = "false";
            //定制打印编码
            dt = ParameterSettingBus.GetPoint(companyCD, "12");
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    userInfo.PrintNo = dt.Rows[0]["PrintNo"].ToString();
                }
            }
            dt = ParameterSettingBus.GetPoint(companyCD, "13");
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    userInfo.PrintWidth = dt.Rows[0]["PrintNo"].ToString();
                }
            }
            //是否启用超任务单领料
            if (XBase.Business.Office.SystemManager.ParameterSettingBus.Get(userInfo.CompanyCD, "14", false))
                userInfo.IsOverTake = true;
            else
                userInfo.IsOverTake = false;

            if (BusiLogicSetBus.GetBus(companyCD, "4", "7", false))
                userInfo.IsStorageOver = true;
            else
                userInfo.IsStorageOver = false;
            if (BusiLogicSetBus.GetBus(companyCD, "4", "6", false))
                userInfo.IsStorageZero = true;
            else
                userInfo.IsStorageZero = false;


            //往Session保存用户信息
            SessionUtil.Session.Add("UserInfo", userInfo);
            //往Cache中添加该用户
            HttpContext.Current.Cache.Insert(userID, HAD_LOGIN);

            //获取可删除标识
            string canDelFlag = GetSafeData.ValidateDataRow_String(loginInfo.Rows[0], "LastLoginTime");
            //第一次登陆时，更新标识
            if (string.IsNullOrEmpty(canDelFlag))
            {
                LoginBus.UpdateUserFlag(userID, companyCD);
            }
            
            //更新登陆列表
            UserSessionModel umdl = new UserSessionModel();
            umdl.SessionId = context.Session.SessionID;
            umdl.LastActiveTime = DateTime.Now.Ticks;
            umdl.LastLifeTime = DateTime.Now.Ticks;
            umdl.UserID = userID;
            UserSessionManager.Add(umdl);
            //输出日志 liuch 20160618 del
            // WriteLog(userID, LogInfo.OperateStatus.SUCCESS);
        }
        else if (action == "chkCompanyCD")
        {
            string password = StringUtil.EncryptPasswordWitdhMD5(passwordInput);
            int totalCount = 0;
            DataTable dt = LoginBus.GetCompany(userID, password);
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("{");
            sb.Append("totalCount:");
            sb.Append(totalCount.ToString());
            sb.Append(",data:");
            if (dt.Rows.Count == 0)
                sb.Append("[{\"ItemTypeID\":\"\"}]");
            else
                sb.Append(JsonClass.DataTable2Json(dt));
            sb.Append("}");
            context.Response.ContentType = "text/plain";
            context.Response.Write(sb.ToString());
            context.Response.End();
        }
    }

    #region 设置出错信息

    /// <summary>
    /// 设置出错信息
    /// </summary>
    /// <param name="userID">用户名ID</param>
    /// <param name="response">响应</param>
    /// <param name="cotrolID">控件ID</param>
    /// <param name="moduleID">信息属于模块</param>
    /// <param name="messageID">信息ID</param>
    /// <param name="param">信息中需要的参数</param>
    private void SetError(string userID, HttpResponse response, string cotrolID, string moduleID, string messageID, string msg)
    {
        //从message文件中读取信息
        //string msg = MessageUtil.GetMessage(moduleID, messageID, param);
        string[] msgs = new string[4];
        msgs[0] = "该户名已经登陆，不能重复登陆。";
        msgs[1] = "该用户名不存在。";
        msgs[2] = "该用户名已被锁定。";
        msgs[3] = "不在服务时间范围内。";
        try
        {
            int msgid = int.Parse(messageID.Substring(messageID.Length - 2, 1)) - 1;
            if (msgid > 0 && msgid < msgs.Length)
            {
                msg = msgs[msgid];
            }
        }
        catch (Exception ex)
        {

        }

        //往响应中输出错误信息
        response.Write(cotrolID + "|" + msg);
        //输出日志
        WriteLog(userID, LogInfo.OperateStatus.FAILED);
    }

    #endregion

    #region 输出日志

    /// <summary>
    /// 输出登陆日志
    /// </summary>
    /// <param name="userID">用户名ID</param>
    /// <param name="status">登陆状态</param>
    private void WriteLog(string userID, LogInfo.OperateStatus status)
    {
        //输出日志
        LogInfo log = new LogInfo();
        //用户信息
        UserInfoUtil userInfo = new UserInfoUtil();
        userInfo.UserID = userID;
        //登陆日志
        log.Type = LogInfo.LogType.LOGIN;
        //登陆
        log.LoginKind = LogInfo.LoginLogKind.LOGIN_LOGIN;
        //用户ID
        log.UserInfo = userInfo;
        //操作状态
        log.Status = status;
        LogUtil.WriteLog(log);
    }

    #endregion

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}
