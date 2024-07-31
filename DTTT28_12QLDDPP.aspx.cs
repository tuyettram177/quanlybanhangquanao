using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DTTT28_12QLDDPP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DDLKV_SelectedIndexChanged(sender, e);
    }

    protected void DDLKV_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLKV.SelectedValue.Trim() == "*")
        {
            SqlDataSourceQLDMDDPP.SelectCommand = "SELECT * FROM [DMDIEMPHANPHOI]";
            btnThem.Enabled = false;
            btnThem.ToolTip = DDLKV.ToolTip = "Phải chọn nhóm cụ thể trước khi thêm mới"; //nhắc ....
        }
        else //NSD đã chọn Nhóm => thêm mới được
        {
            btnThem.Enabled = true; //Thêm mới được.
            btnThem.ToolTip = DDLKV.ToolTip = ""; //KO nhắc ....
        }

        lbmaKV.Text = DDLKV.SelectedValue.Trim();
    }

    protected void btnThem_Click(object sender, EventArgs e)
    {
        lbmaDPP.Visible = !lbmaDPP.Visible;
        lbtenDPP.Visible = !lbtenDPP.Visible;
        lbdc.Visible = !lbdc.Visible;
        lbsdt.Visible = !lbsdt.Visible;
        lbsc.Visible = !lbsc.Visible;
        lbct.Visible = !lbct.Visible;
       

        txtmaDPP.Visible = !txtmaDPP.Visible;
        txtmaDPP.Text = "000";
        txtmaDPP.ToolTip = "KHÔNG ĐỂ TRỐNG MÃ, KHÔNG NHẬP TRÙNG MA ĐÃ CÓ !";
        txttenDPP.Visible = !txttenDPP.Visible;
        txtdc.Visible = !txtdc.Visible;
        txtsdt.Visible = !txtsdt.Visible;
        txtsc.Visible = !txtsc.Visible;
        txtct.Visible = !txtct.Visible;

        //btnhuythem.Visible = !btnhuythem.Visible;

        //THÊM _ LƯU
        if (btnThem.Text.Trim() == "Thêm mới")// Chuẩn bị thêm MH mới
        {//Xóa trống tất cả các TextBox để chuẩn bị cho nsd nhập thông tin món ăn mới
            txtmaDPP.Text = "";
            //SV sau này phải cho mã mh này tự tăng (theo măn, quý, stt); không nên để NSD tự nhập. 
            txttenDPP.Text = "";
            txtdc.Text = "";
            txtsdt.Text = "";
            txtsc.Text = "";
            txtct.Text = "";
            
            //Đổi nhãn btnThem : Thêm => Lưu
            btnThem.Text = "Lưu mới";
        }
        else // Lưu món ăn vào DataBase 
        {
            try
            {
                //1.Đinh nghĩa các tham số parameters cho Insertcommnand : tham số cho field hinh có dạng ~\\Images\\Tên file hình được upload.filename
                SqlDataSourceQLDMDDPP.InsertParameters.Clear();
                SqlDataSourceQLDMDDPP.InsertParameters.Add("madiempp", txtmaDPP.Text.Trim());
                SqlDataSourceQLDMDDPP.InsertParameters.Add("tendiempp", txttenDPP.Text);
                SqlDataSourceQLDMDDPP.InsertParameters.Add("diachi", txtdc.Text);
                SqlDataSourceQLDMDDPP.InsertParameters.Add("sodt", txtsdt.Text);
                SqlDataSourceQLDMDDPP.InsertParameters.Add("succhua", System.Data.DbType.Double, txtsc.Text.Trim());
                SqlDataSourceQLDMDDPP.InsertParameters.Add("controng", System.Data.DbType.Double, txtct.Text.Trim());
                SqlDataSourceQLDMDDPP.InsertParameters.Add("makv", DDLKV.SelectedValue.Trim());



                //2.Chạy lệnh Insert để lưu thông tin mặt hàng mới vào DB
                SqlDataSourceQLDMDDPP.Insert();
              
                //Khi App này được Copy đi nơi khác => thì Update lại path này 
                //ONLINE (khi upload lên Host, VD: somee thì phải dùng path vật lý của somee - tuy nhiên: tùy thuộc vào bảo mật của Host có thể không SaveAs... được
                //FileUploadHinh.SaveAs("D:\\DZHosts\\LocalUser\\gtwovxthe\\www.drunkshopG506vxthe.somee.com\\" + FileUploadHinh.FileName.Trim());
            }
            catch (System.Exception ex) { this.Title = "CÓ LỖI THÊM MỚI = " + ex.Message; }

            //Tải thông tin MH mới thêm lên GridView trên Web
            GridViewDDPP.DataBind();
            //Đối nhãn nút "Lưu.." -> "Thêm ..."
            btnThem.Text = "Thêm mới";
        }//else if btnThem.Text.Trim()
    }
}