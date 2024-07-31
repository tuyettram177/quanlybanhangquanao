using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DTTT28_11QLNV : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DDLKV_SelectedIndexChanged(sender, e);
        DDLCM_SelectedIndexChanged(sender, e);
    }

    protected void DDLKV_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (DDLKV.SelectedValue.Trim() == "*")
        //{
        //    SqlDataSourceQLDMNV.SelectCommand = "SELECT * FROM [DMNVGH]";
        //    btnThem.Enabled = false;
        //    btnThem.ToolTip = DDLKV.ToolTip = "Phải chọn nhóm cụ thể trước khi thêm mới"; //nhắc ....
        //}
        //else //NSD đã chọn Nhóm => thêm mới được
        //{
        //    btnThem.Enabled = true; //Thêm mới được.
        //    btnThem.ToolTip = DDLKV.ToolTip = ""; //KO nhắc ....
        //}

        //lbmaKV.Text = DDLKV.SelectedValue.Trim();
        btnThem.Enabled = true; //BẮT ĐẦU COI NHƯ THÊM NV ĐƯỢC 
        btnThem.ToolTip = DDLKV.ToolTip = DDLCM.ToolTip = "";

        //XỬ LÝ CÁC TRƯỜNG HỢP LỰA CHỌN 'TẤT CẢ' / KV OR CM
        if (DDLKV.SelectedValue.Trim() == "*" && DDLCM.SelectedValue.Trim() == "*")//Tất cả KV và CM
        {
            SqlDataSourceQLDMNV.SelectCommand = "SELECT * FROM [DMNVGH]";
            btnThem.Enabled = false;
            btnThem.ToolTip = DDLKV.ToolTip = DDLCM.ToolTip = "PHẢI CHỌN CM và KV cụ thể thì mới thêm NV mới";
        }

        if (DDLKV.SelectedValue.Trim() == "*" && DDLCM.SelectedValue.Trim() != "*")//Tất cả KV (CM cụ thể = đã chọn)
        {
            SqlDataSourceQLDMNV.SelectCommand = "SELECT * FROM DMNVGH WHERE (macm = @macm)";
            btnThem.Enabled = false;
            btnThem.ToolTip = DDLKV.ToolTip = DDLCM.ToolTip = "PHẢI CHỌN CM và KV cụ thể thì mới thêm NV mới";
        }

        if (DDLKV.SelectedValue.Trim() != "*" && DDLCM.SelectedValue.Trim() == "*")//Tất cả CM (KV cụ thể = đã chọn)
        {
            SqlDataSourceQLDMNV.SelectCommand = "SELECT * FROM DMNVGH WHERE (makv = @makv)";
            btnThem.Enabled = false;
            btnThem.ToolTip = DDLKV.ToolTip = DDLCM.ToolTip = "PHẢI CHỌN CM và KV cụ thể thì mới thêm NV mới";
        }
        //HIỂN THỊ mskv VÀ mscm Ở KẾ BÊN = CÁC DropDownList
        lbmaKV.Text = DDLKV.SelectedValue.Trim();
        lbmaCM.Text = DDLCM.SelectedValue.Trim();
        //lời dẫn cho danh sách NV
        lbNV.Text = "DANH SÁCH NHÂN VIÊN thuộc KV => " + DDLKV.SelectedItem.Text + "  => với CM => " + DDLCM.SelectedItem.Text;

    }

    protected void DDLCM_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (DDLCM.SelectedValue.Trim() == "*")
        //{
        //    SqlDataSourceQLDMNV.SelectCommand = "SELECT * FROM [DMNVGH]";
        //    btnThem.Enabled = false;
        //    btnThem.ToolTip = DDLCM.ToolTip = "Phải chọn nhóm cụ thể trước khi thêm mới"; //nhắc ....
        //}
        //else //NSD đã chọn Nhóm => thêm mới được
        //{
        //    btnThem.Enabled = true; //Thêm mới được.
        //    btnThem.ToolTip = DDLCM.ToolTip = ""; //KO nhắc ....
        //}

        //lbmaCM.Text = DDLCM.SelectedValue.Trim();
    }

    protected void btnThem_Click(object sender, EventArgs e)
    {
        lbmaNV.Visible = !lbmaNV.Visible;
        lbtenNV.Visible = !lbtenNV.Visible;
        lbGioitinh.Visible = !lbGioitinh.Visible;
        lbsdt.Visible = !lbsdt.Visible;


        txtmaNV.Visible = !txtmaNV.Visible;
        txtmaNV.Text = "000";
        txtmaNV.ToolTip = "KHÔNG ĐỂ TRỐNG MÃ QUAN AO, KHÔNG NHẬP TRÙNG MA ĐÃ CÓ !";
        txttenNV.Visible = !txttenNV.Visible;
        txtGioitinh.Visible = !txtGioitinh.Visible;
        txtsdt.Visible = !txtsdt.Visible;
        //btnhuythem.Visible = !btnhuythem.Visible;

        //THÊM _ LƯU
        if (btnThem.Text.Trim() == "Thêm mới")// Chuẩn bị thêm MH mới
        {//Xóa trống tất cả các TextBox để chuẩn bị cho nsd nhập thông tin món ăn mới
            txtmaNV.Text = "";
            //SV sau này phải cho mã mh này tự tăng (theo măn, quý, stt); không nên để NSD tự nhập. 
            txttenNV.Text = "";
            txtGioitinh.Text = "";
            txtsdt.Text = "";
            //Đổi nhãn btnThem : Thêm => Lưu
            btnThem.Text = "Lưu mới";
        }
        else // Lưu món ăn vào DataBase 
        {
            try
            {
                //1.Đinh nghĩa các tham số parameters cho Insertcommnand : tham số cho field hinh có dạng ~\\Images\\Tên file hình được upload.filename
                SqlDataSourceQLDMNV.InsertParameters.Clear();
                SqlDataSourceQLDMNV.InsertParameters.Add("manv", txtmaNV.Text.Trim());
                SqlDataSourceQLDMNV.InsertParameters.Add("hotennv", txttenNV.Text);
                SqlDataSourceQLDMNV.InsertParameters.Add("gioitinh", txtGioitinh.Text);
                SqlDataSourceQLDMNV.InsertParameters.Add("sodt", txtsdt.Text);
                SqlDataSourceQLDMNV.InsertParameters.Add("macm", DDLCM.SelectedValue.Trim());
                SqlDataSourceQLDMNV.InsertParameters.Add("makv", DDLKV.SelectedValue.Trim());
                
                //2.Chạy lệnh Insert để lưu thông tin mặt hàng mới vào DB
                SqlDataSourceQLDMNV.Insert();
                
                //ONLINE (khi upload lên Host, VD: somee thì phải dùng path vật lý của somee - tuy nhiên: tùy thuộc vào bảo mật của Host có thể không SaveAs... được
                //FileUploadHinh.SaveAs("D:\\DZHosts\\LocalUser\\gtwovxthe\\www.drunkshopG506vxthe.somee.com\\" + FileUploadHinh.FileName.Trim());
            }
            catch (System.Exception ex) { this.Title = "CÓ LỖI THÊM MỚI = " + ex.Message; }

            //Tải thông tin MH mới thêm lên GridView trên Web
            GridViewNV.DataBind();
            //Đối nhãn nút "Lưu.." -> "Thêm ..."
            btnThem.Text = "Thêm mới";
        }//else if btnThem.Text.Trim()
    }

    protected void GridViewNV_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //lbNV.Visible = true;
        //DDLQLDMNV.Visible = true;

    }
}