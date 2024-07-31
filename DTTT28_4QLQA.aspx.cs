using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DTTT28_4QLQA : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckBoxHinh_CheckedChanged(sender, e);
        DDLLoaiQA_SelectedIndexChanged(sender, e);


    }

    protected void CheckBoxHinh_CheckedChanged(object sender, EventArgs e)
    {
        GridViewQA.Columns[11].Visible = CheckBoxHinh.Checked;
    }

    protected void DDLLoaiQA_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLLoaiQA.SelectedValue.Trim()=="*")
        {
            SqlDataSourceDMQA.SelectCommand = "SELECT * FROM [DMQUANAO]";
            btnThem.Enabled = false;
            btnThem.ToolTip = DDLLoaiQA.ToolTip = "Phải chọn nhóm cụ thể trước khi thêm mới"; //nhắc ....
        }
        else //NSD đã chọn Nhóm => thêm mới được
        {
            btnThem.Enabled = true; //Thêm mới được.
            btnThem.ToolTip = DDLLoaiQA.ToolTip = ""; //KO nhắc ....
        }

        lbmasoloai.Text = DDLLoaiQA.SelectedValue.Trim();
    }

    protected void btnThem_Click(object sender, EventArgs e)
    {
        lbmaquanao.Visible = !lbmaquanao.Visible;
        lbtenquanao.Visible  = !lbtenquanao.Visible;
        lbmausac.Visible = !lbmausac.Visible;
        lbkichco.Visible = !lbkichco.Visible;
        lbgioitinh.Visible = !lbgioitinh.Visible;
        lbchatlieu.Visible = !lbchatlieu.Visible;
        lbgia.Visible = !lbgia.Visible;
        lbdvt.Visible = !lbdvt.Visible;
        lbngaynhaphang.Visible = !lbngaynhaphang.Visible;
        lbmota.Visible = !lbmota.Visible;
        
        lbhinh.Visible = !lbhinh.Visible;
        lbthuonghieu.Visible = !lbthuonghieu.Visible;

        txtmaquanao.Visible = !txtmaquanao.Visible;
        txtmaquanao.Text = "000";
        txtmaquanao.ToolTip = "KHÔNG ĐỂ TRỐNG MÃ QUAN AO, KHÔNG NHẬP TRÙNG MA ĐÃ CÓ !";
        txttenquanao.Visible = !txttenquanao.Visible;
        txtmausac.Visible = !txtmausac.Visible;
        txtkichco.Visible = !txtkichco.Visible;
        txtgioitinh.Visible = !txtgioitinh.Visible;
        txtchatlieu.Visible = !txtchatlieu.Visible;
        txtgia.Visible = !txtgia.Visible;
        txtdvt.Visible = !txtdvt.Visible;
        txtmota.Visible = !txtmota.Visible;
        lbngaynhaphang1.Visible = !lbngaynhaphang1.Visible;
        Calendarngaynhaphang.Visible = lbngaynhaphang1.Visible;
        lbngaynhaphang1.Text = System.DateTime.Now.ToShortDateString();

        FileUploadhinh.Visible = !FileUploadhinh.Visible;
        DDLthuonghieu.Visible = !DDLthuonghieu.Visible;

        btnhuythem.Visible = !btnhuythem.Visible;

        //THÊM _ LƯU
        if (btnThem.Text.Trim() == "Thêm quần áo mới")// Chuẩn bị thêm MH mới
        {//Xóa trống tất cả các TextBox để chuẩn bị cho nsd nhập thông tin món ăn mới
            txtmaquanao.Text = ""; 
            //SV sau này phải cho mã mh này tự tăng (theo măn, quý, stt); không nên để NSD tự nhập. 
            txttenquanao.Text = "";
            txtmausac.Text = "";
            txtkichco.Text = "";
            txtgioitinh.Text = "";
            txtchatlieu.Text = "";
            txtgia.Text = "1"; txtgia.ToolTip = "giá phải >0";
            txtdvt.Text = "";
            txtmota.Text = "";
            //Đổi nhãn btnThem : Thêm => Lưu
            btnThem.Text = "Lưu quần áo mới";
        }
        else // Lưu món ăn vào DataBase 
        {
            try
            {
                //1.Đinh nghĩa các tham số parameters cho Insertcommnand : tham số cho field hinh có dạng ~\\Images\\Tên file hình được upload.filename
                SqlDataSourceDMQA.InsertParameters.Clear();
                SqlDataSourceDMQA.InsertParameters.Add("maquanao", txtmaquanao.Text.Trim());
                SqlDataSourceDMQA.InsertParameters.Add("tenquanao", txttenquanao.Text);
                SqlDataSourceDMQA.InsertParameters.Add("mausac", txtmausac.Text);
                SqlDataSourceDMQA.InsertParameters.Add("kichco", txtkichco.Text);
                SqlDataSourceDMQA.InsertParameters.Add("gioitinh", txtgioitinh.Text);
                SqlDataSourceDMQA.InsertParameters.Add("chatlieu", txtchatlieu.Text);
                SqlDataSourceDMQA.InsertParameters.Add("gia", System.Data.DbType.Double, txtgia.Text.Trim());
                SqlDataSourceDMQA.InsertParameters.Add("dvt", txtdvt.Text);
                SqlDataSourceDMQA.InsertParameters.Add("ngaynhaphang", System.Data.DbType.Date,lbngaynhaphang.Text.Trim());
                SqlDataSourceDMQA.InsertParameters.Add("mota", txtmota.Text);
                SqlDataSourceDMQA.InsertParameters.Add("hinh", "~\\Media\\" + System.IO.Path.GetFileName(FileUploadhinh.FileName)); //Add Path của file Hình vào DB
                SqlDataSourceDMQA.InsertParameters.Add("maloai", DDLLoaiQA.SelectedValue.Trim());
                SqlDataSourceDMQA.InsertParameters.Add("mathuonghieu", DDLthuonghieu.SelectedValue.Trim());
               
                //2.Chạy lệnh Insert để lưu thông tin mặt hàng mới vào DB
                SqlDataSourceDMQA.Insert();
                //3. Lưu (copy) hình vửa được nsd Upload vào thư mục ~\\Images\\ của App
                //OFFLINE
                FileUploadhinh.SaveAs("D:\\AG528DTTT_QUANAO\\Media\\" + System.IO.Path.GetFileName(FileUploadhinh.FileName).Trim());
                //Khi App này được Copy đi nơi khác => thì Update lại path này 
                //ONLINE (khi upload lên Host, VD: somee thì phải dùng path vật lý của somee - tuy nhiên: tùy thuộc vào bảo mật của Host có thể không SaveAs... được
                //FileUploadHinh.SaveAs("D:\\DZHosts\\LocalUser\\gtwovxthe\\www.drunkshopG506vxthe.somee.com\\" + FileUploadHinh.FileName.Trim());
            }
            catch (System.Exception ex) { this.Title = "CÓ LỖI THÊM QUẦN ÁO MỚI = " + ex.Message; }

            //Tải thông tin MH mới thêm lên GridView trên Web
            GridViewQA.DataBind(); 
            //Đối nhãn nút "Lưu.." -> "Thêm ..."
            btnThem.Text = "Thêm quần áo mới";
        }//else if btnThem.Text.Trim()


    }

    protected void btnhuythem_Click(object sender, EventArgs e)
    {
        //Ẩn các TextBox,...nhập thông tin món ăn mới
        lbmaquanao.Visible = false;
        lbtenquanao.Visible = false;
        lbmausac.Visible = false;
        lbkichco.Visible = false;
        lbgioitinh.Visible = false;
        lbchatlieu.Visible = false;
        lbgia.Visible = false;
        lbdvt.Visible = false;
        lbngaynhaphang.Visible = false;
        lbmota.Visible = false;
        lbthuonghieu.Visible = false;
        lbhinh.Visible = false;

        txtmaquanao.Visible = false;
        txttenquanao.Visible = false;
        txtmausac.Visible = false;
        txtkichco.Visible = false;
        txtgioitinh.Visible = false;
        txtchatlieu.Visible = false;
        txtgia.Visible = false;
        txtdvt.Visible = false;
        lbngaynhaphang1.Visible = false;
        txtmota.Visible = false;
        DDLthuonghieu.Visible = false;
        //Calendarngaynhaphang.Visible = false;
        FileUploadhinh.Visible = false;
        //Ẩn chính button Hủy
        btnhuythem.Visible = false;

        //Đổi nhã btnThem như ban đầu
        btnThem.Text = "Thêm quần áo mới";
    }

    protected void Calendarngaynhaphang_SelectionChanged(object sender, EventArgs e)
    {

        lbngaynhaphang1.Text = Calendarngaynhaphang.SelectedDate.ToShortDateString();
        Calendarngaynhaphang.Visible = false;
    }

    protected void btnXoaALLTon_Click(object sender, EventArgs e)
    {
        SqlDataSourceTon.DeleteCommand = "DELETE FROM TONHANG WHERE maquanao = @maquanao";
        SqlDataSourceTon.DeleteParameters.Clear();
        SqlDataSourceTon.DeleteParameters.Add("maquanao", GridViewQA.SelectedValue.ToString().Trim());
        SqlDataSourceTon.Delete();
    }

    protected void GridViewRBTVTonKho_SelectedIndexChanged(object sender, EventArgs e)
    {
        //btnXoaALLTon.Visible = (GridViewRBTVTonKho.Rows.Count >0?true:false);
    }

    //protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    //{
    //    GridViewQA.RowEditing(FindControl("Label1")); 
    //}
}