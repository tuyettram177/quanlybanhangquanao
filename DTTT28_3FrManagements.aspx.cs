using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DTTT28_3FrManagements : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnQLQA_Click(object sender, EventArgs e)
    {
        Response.Redirect("~\\DTTT28_4QLQA.aspx");
    }

    protected void btnQLTH_Click(object sender, EventArgs e)
    {
        Response.Redirect("~\\DTTT28_7QLTH.aspx");
    }

    protected void btnQLLQA_Click(object sender, EventArgs e)
    {
        Response.Redirect("~\\DTTT28_8QLLQA.aspx");
    }

    protected void btnQLKV_Click(object sender, EventArgs e)
    {
        Response.Redirect("~\\DTTT28_9QLKV.aspx");
    }

    protected void btnQLCM_Click(object sender, EventArgs e)
    {
        Response.Redirect("~\\DTTT28_10QLCM.aspx");
    }

    protected void btnQLNV_Click(object sender, EventArgs e)
    {
        Response.Redirect("~\\DTTT28_11QLNV.aspx");
    }

    protected void btnQLDDPP_Click(object sender, EventArgs e)
    {
        Response.Redirect("~\\DTTT28_12QLDDPP.aspx");
    }

    protected void btnQLTonHang_Click(object sender, EventArgs e)
    {
        Response.Redirect("~\\DTTT28_13QLTONHANG.aspx");
    }
}