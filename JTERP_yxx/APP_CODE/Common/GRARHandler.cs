﻿/**********************************************
 * 类作用：   文件压缩解压缩
 * 建立人：   吴成好
 * 建立时间： 2009-01-07 
 * Copyright (C) 2007-2009 吴成好
 * All rights reserved
 ***********************************************/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;


namespace XBase.Common
{
    public class GRARHandler
    {
        /// 
        /// 执行cmd.exe命令
        /// 
        ///命令文本
        /// 命令输出文本
        public static string ExeCommand(string commandText)
        {
            return ExeCommand(new string[] { commandText });
        }
        /// 
        /// 执行多条cmd.exe命令
        /// 
        ///命令文本数组
        /// 命令输出文本
        public static string ExeCommand(string[] commandTexts)
        {
            Process p = new Process();
            p.StartInfo.FileName = "cmd.exe";
            p.StartInfo.UseShellExecute = false;
            p.StartInfo.RedirectStandardInput = true;
            p.StartInfo.RedirectStandardOutput = true;
            p.StartInfo.RedirectStandardError = true;
            p.StartInfo.CreateNoWindow = true;
            string strOutput = null;
            try
            {
                p.Start();
                p.StandardInput.WriteLine("C:");
                p.StandardInput.WriteLine("cd C:\\Program Files\\WinRAR");
                foreach (string item in commandTexts)
                {                    
                    p.StandardInput.WriteLine(item);
                }
                p.StandardInput.WriteLine("exit");
                strOutput = p.StandardOutput.ReadToEnd();
                //strOutput = Encoding.UTF8.GetString(Encoding.Default.GetBytes(strOutput));
                p.WaitForExit();
                p.Close();
            }
            catch (Exception e)
            {
                strOutput = e.Message;
            }
            return strOutput;
        }
        /// 
        /// 启动外部Windows应用程序，隐藏程序界面
        /// 
        ///应用程序路径名称
        /// true表示成功，false表示失败
        public static bool StartApp(string appName)
        {
            return StartApp(appName, ProcessWindowStyle.Hidden);
        }
        /// 
        /// 启动外部应用程序
        /// 
        ///应用程序路径名称
        ///进程窗口模式
        /// true表示成功，false表示失败
        public static bool StartApp(string appName, ProcessWindowStyle style)
        {
            return StartApp(appName, null, style);
        }
        /// 
        /// 启动外部应用程序，隐藏程序界面
        /// 
        ///应用程序路径名称
        ///启动参数
        /// true表示成功，false表示失败
        public static bool StartApp(string appName, string arguments)
        {
            return StartApp(appName, arguments, ProcessWindowStyle.Hidden);
        }
        /// 
        /// 启动外部应用程序
        /// 
        ///应用程序路径名称
        ///启动参数
        ///进程窗口模式
        /// true表示成功，false表示失败
        public static bool StartApp(string appName, string arguments, ProcessWindowStyle style)
        {
            bool blnRst = false;
            Process p = new Process();
            p.StartInfo.FileName = appName;//exe,bat and so on
            p.StartInfo.WindowStyle = style;
            p.StartInfo.Arguments = arguments;
            try
            {
                p.Start();
                p.WaitForExit();
                p.Close();
                blnRst = true;
            }
            catch
            {
            }
            return blnRst;
        }

        public static void Rar(string s, string d)
        {
            //System.Web.HttpContext.Current.Server.MapPath("~/rar.exe") + " a \"" + d + "\" \"" + s + "\" -ep1"
            //return ExeCommand("C:\\Program Files\\WinRAR\\rar.exe a \"" + d + "\" \"" + s + "\" -ep1");
            ExeCommand("rar.exe a \"" + d + "\" \"" + s + "\" -ep1");
            //return "rar.exe a \"" + d + "\" \"" + s + "\" -ep1";
        }

        public static void UnRar(string s, string d)
        {
            //ExeCommand(System.Web.HttpContext.Current.Server.MapPath("~/rar.exe") + " x \"" + s + "\" \"" + d + "\" -o+");
           ExeCommand("rar.exe x \"" + s + "\" \"" + d + "\" -o+");
        }

    }
}
