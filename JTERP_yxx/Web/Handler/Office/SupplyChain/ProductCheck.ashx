﻿<%@ WebHandler Language="C#" Class="ProductCheck" %>

using System;
using System.Web;
using XBase.Model.Office.SupplyChain;
using XBase.Business.Office.SupplyChain;
using System.Collections;
using System.Data;
using System.Linq;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Web.Script.Serialization;
using System.IO;
using XBase.Common;

public class ProductCheck : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        if (context.Request.RequestType == "POST")
        {
            DataTable dt = null;
            DataTable aliasdt = new DataTable();
            string companyCD = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).CompanyCD;
            string CustID = "0";
            if (context.Request.Form["CustID"] != null)
            {
                CustID = context.Request.Form["CustID"].ToString();
            }
            //设置行为参数
            string strid = "";
            try
            {
                strid = context.Request.Form["str"].ToString();
            }
            catch (Exception)
            {
                strid = context.Request.QueryString["str"].ToString();
            }
            string issc ="";
            try
            {
                issc = context.Request.Form["issc"].ToString();
            }
            catch (Exception)
            {
                issc = "";
            }

            dt = ProductInfoBus.GetProductInfoTableByCheckcondition(strid,issc);
            dt.Columns.Add("ProdAlias",typeof(string));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string prodno = dt.Rows[i]["ProdNo"].ToString();
                aliasdt = CustProductBus.GetDataTableByCustProduct(companyCD,CustID,prodno);
                if (aliasdt != null)
                {
                    if (aliasdt.Rows.Count > 0)
                    {
                        dt.Rows[i]["ProdAlias"] = aliasdt.Rows[0]["ProdAlias"];
                    }
                    else
                    {
                        dt.Rows[i]["ProdAlias"] = "";
                    }
                }
                else
                {
                    dt.Rows[i]["ProdAlias"] = "";  
                }
            }
            
            

            //XElement dsXML = ConvertDataTableToXML(dt);
            ////linq排序
            //var dsLinq =
            //    (from x in dsXML.Descendants("Data")
            //     select new DataSourceModel()
            //     {
            //         BatchNo=x.Element("BatchNo").Value,
            //         PieceCount=x.Element("PieceCount").Value,
            //         size=x.Element("size").Value,
            //         ID = x.Element("ID").Value,//物品id
            //         ProdNo = x.Element("ProdNo").Value,//物品编号
            //         CodeTypeName = x.Element("CodeTypeName").Value,//物品种类
            //         ProductName = x.Element("ProductName").Value,//物品名称
            //         TypeID = x.Element("TypeID").Value,//物品分类ID
            //         CodeName = x.Element("CodeName").Value,//物品单位
            //         UnitID = x.Element("UnitID").Value,//物品单位ID
            //         StandardSell = x.Element("StandardSell").Value,//去税售价
            //         TaxRate = x.Element("TaxRate").Value,//销项税率
            //         SellTax = x.Element("SellTax").Value,//含税售价
            //         Discount = x.Element("Discount").Value,//折扣
            //         Specification = x.Element("Specification").Value,//规格型号
            //         InTaxRate = x.Element("InTaxRate").Value,//进项税率
            //         CurrentStore = x.Element("CurrentStore").Value,//可用存量
            //         PYShort = x.Element("PYShort").Value,//拼音缩写
            //         TaxBuy = x.Element("TaxBuy").Value,//去税进价
            //         StandardCost = x.Element("StandardCost").Value,//物品标准成本
            //         MinusIs = x.Element("MinusIs").Value,//否允许负库存
            //         StandardBuy=x.Element ("StandardBuy").Value,
            //         SaleUnitName = x.Element("SaleUnitName").Value,
            //         InUnitName = x.Element("InUnitName").Value,
            //         StockUnitName = x.Element("StockUnitName").Value,
            //         GroupUnitNo = x.Element("GroupUnitNo").Value,
            //         IsBatchNo = x.Element("IsBatchNo").Value,
            //         InUnitID = x.Element("InUnitID").Value,
            //         StockUnitID = x.Element("StockUnitID").Value,
            //         MakeUnitID = x.Element("MakeUnitID").Value,
            //         ColorName = x.Element("ColorName").Value,
            //         SaleUnitID = x.Element("SaleUnitID").Value,
            //         StorageID = x.Element("StorageID").Value,
            //         BomNo = x.Element("BomNo").Value,
            //         RouteNo = x.Element("RouteNo").Value,
            //         BomID = x.Element("BomID").Value,//BomID add 20110425 lcb
            //         RouteID = x.Element("RouteID").Value//RouteID add 20110425 lcb
            //     });
            int totalCount = dt.Rows.Count;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("{");
            sb.Append("data:");
            sb.Append(JsonClass.DataTable2Json(dt));
            sb.Append("}");

            context.Response.ContentType = "text/plain";
            context.Response.Write(sb.ToString());
            context.Response.End();
        }
    }
    /// <summary>
    /// datatabletoxml
    /// </summary>
    /// <param name="xmlDS"></param>
    /// <returns></returns>
    private XElement ConvertDataTableToXML(DataTable xmlDS)
    {
        StringWriter sr = new StringWriter();
        xmlDS.TableName = "Data";
        xmlDS.WriteXml(sr, System.Data.XmlWriteMode.IgnoreSchema, true);
        string contents = sr.ToString();
        return XElement.Parse(contents);
    }

    public static string ToJSON(object obj)
    {
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        return serializer.Serialize(obj);
    }


    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
    //数据源结构
    public class DataSourceModel
    {
        public string ID { get; set; }
        public string ProdNo { get; set; }
        public string ProductName { get; set; }
        public string TypeID { get; set; }
        public string CodeTypeName { get; set; }
        public string UnitID { get; set; }
        public string StandardSell { get; set; }
        public string CodeName { get; set; }
        public string TaxRate { get; set; }
        public string SellTax { get; set; }
        public string Discount { get; set; }
        public string Specification { get; set; }
        public string InTaxRate { get; set; }
        public string CurrentStore { get; set; }
        public string PYShort { get; set; }
        public string TaxBuy { get; set; }
        public string StandardCost { get; set; }
        public string MinusIs { get; set; }
        public string StandardBuy { get; set; }
        public string SaleUnitName { get; set; }
        public string InUnitName { get; set; }
        public string StockUnitName { get; set; }
        public string MakeUnitName { get; set; }
        public string GroupUnitNo { get; set; }
        public string IsBatchNo { get; set; }
        public string InUnitID { get; set; }
        public string StockUnitID { get; set; }
        public string MakeUnitID { get; set; }
        public string SaleUnitID { get; set; }
        public string ColorName { get; set; }
       
        public string StorageID { get; set; }
        public string BomNo { get; set; }
        public string RouteNo { get; set; }
        public string size { get; set; }
        public string PieceCount { get; set; }
        public string BomID { get; set; }
        public string RouteID { get; set; }
        public string BatchNo { get; set; }
    }


}