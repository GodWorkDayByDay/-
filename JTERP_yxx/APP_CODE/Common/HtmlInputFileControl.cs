/**********************************************
 * �����ã�   �ϴ���
 * �����ˣ�   ��ɺ�
 * ����ʱ�䣺 2008-09-30 
 * Copyright (C) 2007-2008 ��ɺ�
 * All rights reserved
 ***********************************************/

using System;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Collections;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace XBase.Common
{
    /// <summary>
    /// HtmlInputFileControl ��ժҪ˵����
    /// </summary>
    public class HtmlInputFileControl
    {

        //�ļ�����
        public String fileContentType = "";
        //�ļ���С
        public int fileContentLength = 0;

        #region HtmlInputFileControl
        public HtmlInputFileControl()
        {
        }
        #endregion

        #region IsAllowedExtension�Ƿ��������չ���ϴ�
        public bool IsAllowedExtension(HttpPostedFile hifile)
        {
            string strOldFilePath = "", strExtension = "";

            //�����ϴ�����չ�������Ըĳɴ������ļ��ж���
            string[] arrExtension = { ".gif", ".GIF", ".JPG", ".jpg", ".JPEG", ".BMP", ".PNG", ".jpeg", ".bmp", ".png", ".rar", ".zip", ".doc", ".xls" };

            if (hifile.FileName != string.Empty)
            {
                strOldFilePath = hifile.FileName;
                //ȡ���ϴ��ļ�����չ��
                strExtension = strOldFilePath.Substring(strOldFilePath.LastIndexOf("."));
                //�жϸ���չ���Ƿ�Ϸ�
                for (int i = 0; i < arrExtension.Length; i++)
                {
                    if (strExtension.Equals(arrExtension[i]))
                    {
                        return true;
                    }
                }
            }
            return false;
        }
        #endregion

        #region IsAllowedLength�ж��ϴ��ļ���С�Ƿ񳬹����ֵ
        public bool IsAllowedLength(HttpPostedFile hifile)
        {
            //�����ϴ��ļ���С�����ֵ,���Ա�����xml�ļ���,��λΪKB
            int i = 512;
            //����ϴ��ļ��Ĵ�С�������ֵ,����flase,���򷵻�true.
            if (hifile.ContentLength > i * 512)
            {
                return false;
            }
            return true;
        }
        #endregion

        #region SaveFile�ϴ��ļ��������ļ���
        public string SaveFile(HttpPostedFile hifile, string strAbsolutePath)
        {
            string strOldFilePath = "", strExtension = "", strNewFileName = "";

            if (hifile.FileName != string.Empty)
            {
                strOldFilePath = hifile.FileName;
                //�ж��Ƿ���ϴ�С����
                /*if (!this.IsAllowedLength(strOldFilePath))
                {
                    return "notAllowedLength";
                }*/
                //ȡ���ϴ��ļ�����չ��
                strExtension = strOldFilePath.Substring(strOldFilePath.LastIndexOf("."));
                //�ļ��ϴ��������
                strNewFileName = GetUniqueString() + strExtension;
                //�ж��ļ����ͣ���ָ����Ӧ·��
                this.fileContentType = strOldFilePath.Substring(strOldFilePath.LastIndexOf("."));
                if (this.fileContentType.Equals(".jpg") || this.fileContentType.Equals(".gif") || this.fileContentType.Equals(".gif") || this.fileContentType.Equals(".GIF") || this.fileContentType.Equals(".JPG") || this.fileContentType.Equals(".jpg") || this.fileContentType.Equals(".JPEG") || this.fileContentType.Equals(".BMP") || this.fileContentType.Equals(".PNG") || this.fileContentType.Equals(".jpeg") || this.fileContentType.Equals(".bmp") || this.fileContentType.Equals(".png"))
                {
                    strAbsolutePath += "\\" + "picture";
                }
                else if (this.fileContentType.Equals(".doc") || this.fileContentType.Equals(".ppt") || this.fileContentType.Equals(".xls") || this.fileContentType.Equals(".pdf"))
                {
                    strAbsolutePath += "\\" + "office";
                }
                else if (this.fileContentType.Equals(".zip") || this.fileContentType.Equals(".rar"))
                {
                    strAbsolutePath += "\\" + "winrar";
                }
                else
                {
                    return "notAllowedExtension";
                }

                if (strAbsolutePath.LastIndexOf("\\") == strAbsolutePath.Length)
                {
                    hifile.SaveAs(strAbsolutePath + strNewFileName);
                }
                else
                {
                    hifile.SaveAs(strAbsolutePath + "\\" + strNewFileName);
                }
                //�ļ�������ֵ                
                this.fileContentLength = hifile.ContentLength; //�ļ���С
            }
            return strNewFileName;
        }
        #endregion

        #region CoverFile�����ϴ��ļ���ɾ��ԭ���ļ�
        public void CoverFile(HttpPostedFile ffFile, string strAbsolutePath, string strOldFileName)
        {
            //������ļ���
            string strNewFileName = GetUniqueString();

            if (ffFile.FileName != string.Empty)
            {
                //��ͼƬ��Ϊ��ʱ��ɾ����ͼƬ
                if (strOldFileName != string.Empty)
                {
                    DeleteFile(strAbsolutePath, strOldFileName);
                }
                SaveFile(ffFile, strAbsolutePath);
            }
        }
        #endregion

        #region DeleteFileɾ��ָ���ļ�
        public void DeleteFile(string strAbsolutePath, string strFileName)
        {
            if (strAbsolutePath.LastIndexOf("\\") == strAbsolutePath.Length)
            {
                if (File.Exists(strAbsolutePath + strFileName))
                {
                    File.Delete(strAbsolutePath + strFileName);
                }
            }
            else
            {
                if (File.Exists(strAbsolutePath + "\\" + strFileName))
                {
                    File.Delete(strAbsolutePath + "\\" + strFileName);
                }
            }
        }
        #endregion

        #region GetUniqueString��ȡһ�����ظ����ļ���
        public static string GetUniqueString()
        {
            return DateTime.Now.ToString("yyyyMMddHHmmssffffff");
        }
        #endregion

        #region �ϴ��ļ��������ļ������·��
        /// <summary>
        /// �ϴ��ļ��������ļ������·��
        /// </summary>
        /// <param name="hpFile">�ϴ��ļ�</param>
        /// <param name="companySavePath">��˾����·��</param>
        /// <returns></returns>
        public static string SaveUploadFile(HttpPostedFile hpFile, string companySavePath)
        {
            //�ϴ�����ļ���
            string newFileName = "";

            //��ȡ�ļ���
            string oldFilePath = hpFile.FileName;
            string docName = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString()+"_" + oldFilePath.Substring(hpFile.FileName.LastIndexOf("\\") + 1);
            //�ϴ�·������ʱ
            if (!string.IsNullOrEmpty(oldFilePath))
            {
                //ȡ���ϴ��ļ�����չ��
                string extension = oldFilePath.Substring(oldFilePath.LastIndexOf(".")).ToLower();
                //�������ϴ����ļ���ʽʱ
                if (StringUtil.GetInArrayID(extension, ConstUtil.SAVE_PILE_TYPE) < 0)
                {
                    return null;
                }
                //�ļ��ϴ��������
                //newFileName = GetUniqueString() + extension;
                newFileName = docName;
                //�ļ�·���Ƿ����
                DirectoryInfo folder = new DirectoryInfo(companySavePath);
                //Ŀ¼�����ڣ��򴴽��µ�Ŀ¼
                if (!folder.Exists)
                {
                    //����Ŀ¼
                    folder.Create();
                }
                //�����ļ�
                hpFile.SaveAs(companySavePath + "\\" + newFileName);
            }
            else
                return null;
            //�����µ��ļ�·��
            return companySavePath + "\\" + newFileName;
        }
        #endregion

    }
}
