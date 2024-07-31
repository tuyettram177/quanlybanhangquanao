using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DTTT28_13QLTONHANG : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DDLDPP_SelectedIndexChanged(sender, e);
    }

    protected void DDLDPP_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnThem.Enabled = true; //BẮT ĐẦU COI NHƯ THÊM NV ĐƯỢC 
        btnThem.ToolTip = DDLDPP.ToolTip = DDLQA.ToolTip = "";

        //XỬ LÝ CÁC TRƯỜNG HỢP LỰA CHỌN 'TẤT CẢ' / KV OR CM
        if (DDLDPP.SelectedValue.Trim() == "*" && DDLQA.SelectedValue.Trim() == "*")//Tất cả KV và CM
        {
            SqlDataSourceQLTONHANG.SelectCommand = "SELECT * FROM [TONHANG]";
            btnThem.Enabled = false;
            btnThem.ToolTip = DDLDPP.ToolTip = DDLQA.ToolTip = "PHẢI CHỌN DPP và QA cụ thể thì mới thêm NV mới";
        }
        if (DDLDPP.SelectedValue.Trim() != "*" && DDLQA.SelectedValue.Trim() == "*")//Tất cả CM (KV cụ thể = đã chọn)
        {
            SqlDataSourceQLTONHANG.SelectCommand = "SELECT * FROM TONHANG WHERE (maquanao = @maquanao)";
            btnThem.Enabled = false;
            btnThem.ToolTip = DDLDPP.ToolTip = DDLQA.ToolTip = "PHẢI CHỌN DPP và QA cụ thể thì mới thêm mới";
        }
        if (DDLDPP.SelectedValue.Trim() == "*" && DDLQA.SelectedValue.Trim() != "*")//Tất cả KV (CM cụ thể = đã chọn)
        {
            SqlDataSourceQLTONHANG.SelectCommand = "SELECT * FROM TONHANG WHERE (madiempp = @madiempp)";
            btnThem.Enabled = false;
            btnThem.ToolTip = DDLDPP.ToolTip = DDLQA.ToolTip = "PHẢI CHỌN DPP và QA cụ thể thì mới thêm mới";
        }

        
        //HIỂN THỊ mskv VÀ mscm Ở KẾ BÊN = CÁC DropDownList
        lbmaDPP.Text = DDLDPP.SelectedValue.Trim();
        lbmaQA.Text = DDLQA.SelectedValue.Trim();
        //lời dẫn cho danh sách NV
        lbNV.Text = "DANH SÁCH TỒN HÀNG thuộc ĐIỂM PHÂN PHỐI => " + DDLDPP.SelectedItem.Text + "  => với QUẤN ÁO => " + DDLQA.SelectedItem.Text;

    }

    protected void btnThem_Click(object sender, EventArgs e)
    {
        lbmaDPPTH.Visible = !lbmaDPPTH.Visible;
        lbmaQATH.Visible = !lbmaQATH.Visible;
        lbSLT.Visible = !lbSLT.Visible;


        txtmaDPPTH.Visible = !txtmaDPPTH.Visible;
        txtmaDPPTH.Text = "000";
        txtmaDPPTH.ToolTip = "KHÔNG ĐỂ TRỐNG MÃ, KHÔNG NHẬP TRÙNG MÃ ĐÃ CÓ !";
        txtmaQATH.Visible = !txtmaQATH.Visible;
        txtSLT.Visible = !txtSLT.Visible;

        //btnhuythem.Visible = !btnhuythem.Visible;

        //THÊM _ LƯU
        if (btnThem.Text.Trim() == "Thêm mới")// Chuẩn bị thêm MH mới
        {//Xóa trống tất cả các TextBox để chuẩn bị cho nsd nhập thông tin món ăn mới
            txtmaDPPTH.Text = "";
            //SV sau này phải cho mã mh này tự tăng (theo măn, quý, stt); không nên để NSD tự nhập. 
            txtmaQATH.Text = "";
            txtSLT.Text = "";

            //Đổi nhãn btnThem : Thêm => Lưu
            btnThem.Text = "Lưu mới";
        }
        else // Lưu món ăn vào DataBase 
        {
            try
            {
                //1.Đinh nghĩa các tham số parameters cho Insertcommnand : tham số cho field hinh có dạng ~\\Images\\Tên file hình được upload.filename
                SqlDataSourceQLTONHANG.InsertParameters.Clear();
                SqlDataSourceQLTONHANG.InsertParameters.Add("soluongton", System.Data.DbType.Double, txtSLT.Text.Trim());
                SqlDataSourceQLTONHANG.InsertParameters.Add("madiempp", DDLDPP.SelectedValue.Trim());
                SqlDataSourceQLTONHANG.InsertParameters.Add("maquanao", DDLQA.SelectedValue.Trim());



                //2.Chạy lệnh Insert để lưu thông tin mặt hàng mới vào DB
                SqlDataSourceQLTONHANG.Insert();

                //Khi App này được Copy đi nơi khác => thì Update lại path này 
                //ONLINE (khi upload lên Host, VD: somee thì phải dùng path vật lý của somee - tuy nhiên: tùy thuộc vào bảo mật của Host có thể không SaveAs... được
                //FileUploadHinh.SaveAs("D:\\DZHosts\\LocalUser\\gtwovxthe\\www.drunkshopG506vxthe.somee.com\\" + FileUploadHinh.FileName.Trim());
            }
            catch (System.Exception ex) { this.Title = "CÓ LỖI THÊM MỚI = " + ex.Message; }

            //Tải thông tin MH mới thêm lên GridView trên Web
            GridViewTONHANG.DataBind();
            //Đối nhãn nút "Lưu.." -> "Thêm ..."
            btnThem.Text = "Thêm mới";
        }//else if btnThem.Text.Trim()
    }
}