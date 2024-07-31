using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DTTT28_8QLLQA : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnThem_Click(object sender, EventArgs e)
    {
        btnhuythem.Visible = !btnhuythem.Visible;

        if (btnThem.Text == "Thêm loại quần áo mới")//[2] NẾU CHƯA CÓ KH THÌ THÊM KH MỚI
        {
            //2.1. Hiển thị các ô nhập thông tin KH mới
            lbKHnew.Visible = true;
            lbmaLQA.Visible = true;
            lbtenLQA.Visible = true;
            lbmota.Visible = true;

            txtmaLQA.Visible = true;
            txttenLQA.Visible = true;
            txtmota.Visible = true;


            txtmaLQA.ToolTip = "KHÔNG ĐỂ TRỐNG MÃ, KHÔNG NHẬP TRÙNG";
            txttenLQA.Text = "";
            txtmota.Text = "";

            //2.3. Đổi nhãn nút lệnh: "Lưu thông tin KH"
            btnThem.Text = "LƯU LQA MỚI";
        }
        else if (btnThem.Text == "LƯU LQA MỚI")//[3] LƯU THÔNG TIN KH MỚI VỪA NHẬP
        {
            try
            { //3.1. Lưu thông tin KH mới đã nhập vào DB
                SqlDataSourceQLDMLQA.Insert(); //Thêm thông tin KH mới vào DB
                this.Title = "THÊM LQA MỚI: OK";//thông báo thêm KH mới OK

                //3.2. Tải KH vừa nhập mới lên 
                GridViewLQA.DataBind();
            }
            catch (System.Exception ex) { this.Title = "LỖI THÊM LQA MỚI = " + ex.Message; }
            //3.3. Ẩn các ô nhập thông tin KH mới 
            lbmaLQA.Visible = false;
            lbtenLQA.Visible = false;
            lbmota.Visible = false;
            txtmaLQA.Visible = false;
            txttenLQA.Visible = false;
            txtmota.Visible = false;
            //3.4. đổi nhãn => Chọn KH
            btnThem.Text = "Thêm loại quần áo mới";//CÓ 2 tr. h CHỌN = khi tìm thấy KH [1] hoặc khi nhập mới KH, tại đây [3]

        }
    }

    protected void btnhuythem_Click(object sender, EventArgs e)
    {
        //Ẩn các TextBox,...nhập thông tin món ăn mới
        lbmaLQA.Visible = false;
        lbtenLQA.Visible = false;
        lbmota.Visible = false;
        txtmaLQA.Visible = false;
        txttenLQA.Visible = false;
        txtmota.Visible = false;
        btnhuythem.Visible = false;
        btnThem.Text = "Thêm loại quần áo mới";
    }
}