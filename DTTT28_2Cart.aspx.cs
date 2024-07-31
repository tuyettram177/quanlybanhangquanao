using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DTTT28_2Cart : System.Web.UI.Page
{
    static DataTable cart = new DataTable();//biến toàn cục cart = sẽ dùng để lưu giữ "giỏ hàng"
    /// <summary>
    //THỦ TỤC TỰ ĐỘNG CHẠY MỖI KHI PAGE NÀY ĐƯỢC TẢI LÊN TRÌNH DUYỆT = TẢI "GIỎ HÀNG" LÊN {NẾU ĐÃ CÓ GIỎ HÀNG TRONG Session THÌ LẤY LÊN TRANG, NÊU CHƯA T.B RỔNG}
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["cart"] == null)//Đã có giỏ hàng
        {
            lbTitle.Text = "HIỆN TẠI, GIỎ HÀNG CỦA QUÝ VỊ ĐANG TRỐNG, XIN MỜI SANG TRANG DANH MỤC HÀNG HÓA ";
            btnHome.Text = "Chọn mua! ";
            
            lbSUM.Text = ""; //Xóa trống phần tính tiền
            GridViewCart.DataSource = null; //Xóa trống danh mục MH trong giỏ

            btnorder.Visible = false; // Nếu giỏ hàng rổng thì KHÔNG đặt hàng được
        }
        else//Giỏ hàng đã có
        {
            lbTitle.Text = "GIỎ HÀNG HIỆN TẠI CỦA QUÝ VỊ NHƯ SAU:";
            btnHome.Text = "Chọn mua tiếp! ";
            //B1: LẤY GIỎ HÀNG TỪ Session XUỐNG
            cart = Session["cart"] as DataTable;
            //B2: GÁN GIỎ HÀNG VÀO GridViewMH : QUANG TRỌNG NHẤT
            GridViewCart.DataSource = cart;
            //B3: TẢI DỮ LIỆU TỪ tbl LÊN GridViewMH
            GridViewCart.DataBind();
            //B4: TÍNH TOÁN: SỐ LƯỢNG MÓN + TỔNG TIỀN
            lbSUM.Text = "GIỎ HÀNG ĐANG CHỌN :" + cart.Compute("Count(maquanao)", "").ToString() +
            " MẶT HÀNG, TỔNG TIỀN = " + cart.Compute("Sum(tien)", "").ToString() + " Đồng.";

            btnorder.Visible = true;// Nếu giỏ hàng có MH nên đặt hàng được
        }
    }

    protected void btnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("~\\DTTT28_1Homepage.aspx");

    }

    //hủy giỏ 
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Session["cart"] = null;
        Response.Redirect("~\\DTTT28_1Homepage.aspx");

    }

    protected void btnorder_Click(object sender, EventArgs e)
    {
        Response.Redirect("~\\DTTT28_5Order.aspx");
    }
}