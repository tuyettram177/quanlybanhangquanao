using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DTTT28_9QLKV : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnThem_Click(object sender, EventArgs e)
    {
        btnhuythem.Visible = !btnhuythem.Visible;

        if (btnThem.Text == "Thêm khu vực mới")//[2] NẾU CHƯA CÓ KH THÌ THÊM KH MỚI
        {
            //2.1. Hiển thị các ô nhập thông tin KH mới
            lbKHnew.Visible = true;
            lbmaKV.Visible = true;
            lbtenKV.Visible = true;
            lbghichu.Visible = true;

            txtmaKV.Visible = true;
            txttenKV.Visible = true;
            txtghichu.Visible = true;


            txtmaKV.ToolTip = "KHÔNG ĐỂ TRỐNG MÃ, KHÔNG NHẬP TRÙNG";
            txttenKV.Text = "";
            txtghichu.Text = "";

            //2.3. Đổi nhãn nút lệnh: "Lưu thông tin KH"
            btnThem.Text = "LƯU KHU VỰC MỚI";
        }
        else if (btnThem.Text == "LƯU KHU VỰC MỚI")//[3] LƯU THÔNG TIN KH MỚI VỪA NHẬP
        {
            try
            { //3.1. Lưu thông tin KH mới đã nhập vào DB
                SqlDataSourceQLDMKV.Insert(); //Thêm thông tin KH mới vào DB
                this.Title = "THÊM KHU VỰC MỚI: OK";//thông báo thêm KH mới OK

                //3.2. Tải KH vừa nhập mới lên 
                GridViewKV.DataBind();
            }
            catch (System.Exception ex) { this.Title = "LỖI THÊM KHU VỰC MỚI = " + ex.Message; }
            //3.3. Ẩn các ô nhập thông tin KH mới 
            lbmaKV.Visible = false;
            lbtenKV.Visible = false;
            lbghichu.Visible = false;
            txtmaKV.Visible = false;
            txttenKV.Visible = false;
            txtghichu.Visible = false;
            //3.4. đổi nhãn => Chọn KH
            btnThem.Text = "Thêm khu vực mới";//CÓ 2 tr. h CHỌN = khi tìm thấy KH [1] hoặc khi nhập mới KH, tại đây [3]

        }
    }

    protected void btnhuythem_Click(object sender, EventArgs e)
    {
        
        lbmaKV.Visible = false;
        lbtenKV.Visible = false;
        lbghichu.Visible = false;
        txtmaKV.Visible = false;
        txttenKV.Visible = false;
        txtghichu.Visible = false;
        btnhuythem.Visible = false;
        //3.4. đổi nhãn => Chọn KH
        btnThem.Text = "Thêm khu vực mới";
       
    }
}