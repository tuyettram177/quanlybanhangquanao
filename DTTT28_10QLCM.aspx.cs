using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DTTT28_10QLCM : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnThem_Click(object sender, EventArgs e)
    {
        btnhuythem.Visible = !btnhuythem.Visible;

        if (btnThem.Text == "Thêm chuyên môn mới")//[2] NẾU CHƯA CÓ KH THÌ THÊM KH MỚI
        {
            //2.1. Hiển thị các ô nhập thông tin KH mới
            lbKHnew.Visible = true;
            lbmaCM.Visible = true;
            lbtenCM.Visible = true;
            lbghichu.Visible = true;

            txtmaCM.Visible = true;
            txttenCM.Visible = true;
            txtghichu.Visible = true;


            txtmaCM.ToolTip = "KHÔNG ĐỂ TRỐNG MÃ, KHÔNG NHẬP TRÙNG";
            txttenCM.Text = "";
            txtghichu.Text = "";

            //2.3. Đổi nhãn nút lệnh: "Lưu thông tin KH"
            btnThem.Text = "LƯU CM MỚI";
        }
        else if (btnThem.Text == "LƯU CM MỚI")//[3] LƯU THÔNG TIN KH MỚI VỪA NHẬP
        {
            try
            { //3.1. Lưu thông tin KH mới đã nhập vào DB
                SqlDataSourceQLDMCM.Insert(); //Thêm thông tin KH mới vào DB
                this.Title = "THÊM CM MỚI: OK";//thông báo thêm KH mới OK

                //3.2. Tải KH vừa nhập mới lên 
                GridViewCM.DataBind();
            }
            catch (System.Exception ex) { this.Title = "LỖI THÊM CM MỚI = " + ex.Message; }
            //3.3. Ẩn các ô nhập thông tin KH mới 
            lbmaCM.Visible = false;
            lbtenCM.Visible = false;
            lbghichu.Visible = false;
            txtmaCM.Visible = false;
            txttenCM.Visible = false;
            txtghichu.Visible = false;
            //3.4. đổi nhãn => Chọn KH
            btnThem.Text = "Thêm chuyên môn mới";//CÓ 2 tr. h CHỌN = khi tìm thấy KH [1] hoặc khi nhập mới KH, tại đây [3]

        }
    }

    protected void btnhuythem_Click(object sender, EventArgs e)
    {
        lbmaCM.Visible = false;
        lbtenCM.Visible = false;
        lbghichu.Visible = false;
        txtmaCM.Visible = false;
        txttenCM.Visible = false;
        txtghichu.Visible = false;
        btnhuythem.Visible = false;
        //3.4. đổi nhãn => Chọn KH
        btnThem.Text = "Thêm chuyên môn mới";
    }
}