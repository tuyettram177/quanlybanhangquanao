using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DTTT28_7QLTH : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnThem_Click(object sender, EventArgs e)
    {
        btnhuythem.Visible = !btnhuythem.Visible;

        if (btnThem.Text == "Thêm thương hiệu mới")//[2] NẾU CHƯA CÓ KH THÌ THÊM KH MỚI
        {
            //2.1. Hiển thị các ô nhập thông tin KH mới
            lbKHnew.Visible = true;
            lbmaTH.Visible = true;
            lbtenTH.Visible = true;


            txtmaTH.Visible = true;
            txttenTH.Visible = true;



            txtmaTH.ToolTip = "KHÔNG ĐỂ TRỐNG MÃ KH, KHÔNG NHẬP TRÙNG";
            txttenTH.Text = "";


            //2.3. Đổi nhãn nút lệnh: "Lưu thông tin KH"
            btnThem.Text = "LƯU TH MỚI";
        }
        else if (btnThem.Text == "LƯU TH MỚI")//[3] LƯU THÔNG TIN KH MỚI VỪA NHẬP
        {
            try
            { //3.1. Lưu thông tin KH mới đã nhập vào DB
                SqlDataSourceQLDMTH.Insert(); //Thêm thông tin KH mới vào DB
                this.Title = "THÊM TH MỚI: OK";//thông báo thêm KH mới OK

                //3.2. Tải KH vừa nhập mới lên 
                GridViewTH.DataBind();
            }
            catch (System.Exception ex) { this.Title = "LỖI THÊM TH MỚI = " + ex.Message; }
            //3.3. Ẩn các ô nhập thông tin KH mới 
            lbmaTH.Visible = false;
            lbtenTH.Visible = false;
            txtmaTH.Visible = false;
            txttenTH.Visible = false;
            //3.4. đổi nhãn => Chọn KH
            btnThem.Text = "Thêm thương hiệu mới";//CÓ 2 tr. h CHỌN = khi tìm thấy KH [1] hoặc khi nhập mới KH, tại đây [3]

        }
    }



    protected void btnhuythem_Click(object sender, EventArgs e)
    {

        //Ẩn các TextBox,...nhập thông tin món ăn mới
        lbmaTH.Visible = false;
        lbtenTH.Visible = false;
        txtmaTH.Visible = false;
        txttenTH.Visible = false;
        btnhuythem.Visible = false;
        btnThem.Text = "Thêm thương hiệu mới";
    }
}
