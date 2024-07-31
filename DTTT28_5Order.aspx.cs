using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DTTT28_5Order : System.Web.UI.Page
{
    static DataTable cart = new DataTable();//biến toàn cục cart = sẽ dùng để lưu giữ "giỏ hàng" static = cấp phát vùng nhớ "tĩnh" cho biến cart => giá trị trong cart khi ra khỏi 1 thủ tục KHÔNG bị mất
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    static int pos = 0;//Vị trí chọn KH
    protected void GridViewKH_SelectedIndexChanged(object sender, EventArgs e)
    {
        pos = GridViewKH.SelectedIndex;//xác định vị trí KH được chọn trong DS tìm thấy (GridviewKH)
        txtmaKH.Text = txtTim.Text = GridViewKH.Rows[pos].Cells[1].Text.Trim();//gán mã KH đã chọn vào TxtMaKH; ....
        txtTim.Enabled = true;
    }

    protected void btnTim_Click(object sender, EventArgs e)
    {
        btnTimHuy.Visible = true;//cho phép hủy tìm lại (bất kỳ lúc nào) = tìm KH khác
        if (btnTim.Text.Trim() == "Tìm KH")//[1] TÌM KHÁCH HÀNG
        {
            GridViewKH.DataBind();//tải Dữ liệu KH lên theo đk / Select...
            if (GridViewKH.Rows.Count < 1)//không tìm thấy KH như vậy (nd NSD nhập txtTimKH) =>THÊM KH MỚI
            {
                btnTim.Text = "THÊM KH MỚI";
            }
            else//tìm thấy ít nhất 1 KH (có khả năng tìm được từ 2 KH trở lên)=> CHỌN KH
            {
                btnTim.Text = "CHỌN KH"; //được chọn = xử lý ở dưới [4]
                if (GridViewKH.Rows.Count > 1)
                {
                    btnTim.Enabled = false;
                    btnTim.ToolTip = "PHẢI CHỌN 1 KH TRONG DANH SÁCH DƯỚI";
                }
                else btnTim.Enabled = true; 
            }
        }
        else if (btnTim.Text == "THÊM KH MỚI")//[2] NẾU CHƯA CÓ KH THÌ THÊM KH MỚI
        {
            //2.1. Hiển thị các ô nhập thông tin KH mới
            lbKHnew.Visible = true;
            lbmaKH.Visible = true;
            lbtenKH.Visible = true;
            lbDiachi.Visible = true;
            lbsdt.Visible = true;

            txtmaKH.Visible = true;
            txttenKH.Visible = true;
            txtDiachi.Visible = true;
            txtsdt.Visible = true;

            //2.2. Xóa trống các ô textbox để chuẩn bị nhập KH mới
            txtmaKH.Text = txtTim.Text.Trim(); //lấy thông tin nhập trong TxtTimKH không tim thấy vào đây, NSD phải kiểm tra và nhập lại => //sau này nên cho thuộc tính này tự động (không để KH nhập).
            txtmaKH.ToolTip = "KHÔNG ĐỂ TRỐNG MÃ KH, KHÔNG NHẬP TRÙNG";
            txttenKH.Text = "";
            txtDiachi.Text = "";
            txtsdt.Text = "";
           
            //2.3. Đổi nhãn nút lệnh: "Lưu thông tin KH"
            btnTim.Text = "LƯU KH MỚI";
        }
        else if (btnTim.Text == "LƯU KH MỚI")//[3] LƯU THÔNG TIN KH MỚI VỪA NHẬP
        {
            try
            { //3.1. Lưu thông tin KH mới đã nhập vào DB
                SqlDataSourceKH.Insert(); //Thêm thông tin KH mới vào DB
                this.Title = "THÊM KH MỚI: OK";//thông báo thêm KH mới OK
                txtTim.Text = txtmaKH.Text.Trim();//Gám mã số KH vừa nhập vào TxtTimKH mơi.
                                                    //3.2. Tải KH vừa nhập mới lên 
                GridViewKH.DataBind();
            }
            catch (System.Exception ex) { this.Title = "LỖI THÊM KH MỚI = " + ex.Message; }
            //3.3. Ẩn các ô nhập thông tin KH mới 
            lbKHnew.Visible = false;
            lbmaKH.Visible = false;
            lbtenKH.Visible = false;
            lbDiachi.Visible = false;
            lbsdt.Visible = false;
            
            txtmaKH.Visible = false;
            txttenKH.Visible = false;
            txtDiachi.Visible = false;
            txtsdt.Visible = false;
            
            //3.4. đổi nhãn => Chọn KH
            btnTim.Text = "CHỌN KH";//CÓ 2 tr. h CHỌN = khi tìm thấy KH [1] hoặc khi nhập mới KH, tại đây [3]
        }
        else if (btnTim.Text == "CHỌN KH")//[4]CHỌN KH TRONG GRIDVIEW TÌM THẤY (TẠI VỊ TRÍ pos ĐÃ CHỌN TRÊN GIRDVIEW)
        {
            //4.1. Gán mã KH đang chọn vào Ô TextBox tìm (THỐNG NHẤT CHỌN 1 KH)
            txtTim.Text = txtmaKH.Text.Trim();//Gán MSKH mới OR KH đã chọn vào ô textbox "Tìm KH" 
            GridViewKH.DataBind(); //tải DL KH vừa chọn = đúng 1 KH (vì theo mskh)
            //4.2. Không cho chọn lại
            btnTim.Enabled = false;
            txtTim.Enabled = false;
            //4.3. XỬ LÝ THÔNG TIN "Đơn hàng"
            //4.3.1 Hiện thị thông tin "Đơn hàng"
            lbDH.Visible = true;
            lbTTmaDH.Visible = true;
            lbmsddh.Visible = true;
            DateTime t = System.DateTime.Now; //lấy ngày giờ hiện tại (now)
                                              //msddh = SV nên cho mặc định tăng theo quy luật = năm _ quý _....(tạm thời gán như sau)
            lbmsddh.Text = txtTim.Text.Trim() + t.Year.ToString().Substring(2, 2) + t.Month.ToString().Trim() + t.Day.ToString().Trim()
           + t.Hour.ToString().Trim() + t.Minute.ToString().Trim() + t.Second.ToString().Trim(); // Cùng 1 KH đặt 2 đơn hàng phải cách nhau ít nhất 1 s
            lbTTngaylap.Visible = true;
            lbngaylap.Visible = true;
            lbngaylap.Text = t.ToShortDateString(); //gán ngày hiện tại

            // lbTTgio.Visible = true;
            // lbgio.Visible = true;
            // lbgio.Text = t.ToLongTimeString(); //lấy giờ hiện tại

            // //4.3.2 Hiện thị thông tin "Giao hàng"
            lbTTdcg.Visible = true;
            txtdcg.Visible = true;
            txtdcg.Text = "";

            lbTTnguoinhan.Visible = true;
            txtnguoinhan.Visible = true;
            txtnguoinhan.Text = "";


            lbTTsdtnhan.Visible = true;
            txtsdtnhan.Visible = true;
            txtsdtnhan.Text = "";

            lbTTghichu.Visible = true;
            txtghichu.Visible = true;
            txtghichu.Text = "";

         
            Calendarhangiao.Visible = true;
            btnxndh.Visible = true;
            // //4.3.3 Hiện thị thông tin CHI TIẾT "Đơn hàng"
            lbCTDH.Visible = true;
            // //B1: LẤY GIỎ HÀNG TỪ Session XUỐNG
            cart = Session["cart"] as DataTable;
            // //B2: GÁN GIỎ HÀNG VÀO GridViewMH : QUANG TRỌNG NHẤT
            GridViewCart.Visible = true;
            GridViewCart.DataSource = cart;
            // //B3: TẢI DỮ LIỆU TỪ tbl LÊN GridViewMH
            GridViewCart.DataBind();
            // //B4: TÍNH TOÁN: SỐ LƯỢNG MÓN + TỔNG TIỀN
            lbSUM.Visible = true;
            
            lbSUM.Text = "GIỎ HÀNG ĐANG CHỌN :" + cart.Compute("Count(maquanao)", "").ToString() +
            " MẶT HÀNG, TỔNG TIỀN = " + cart.Compute("Sum(tien)", "").ToString() + " Đồng.";
        }//btnTimKH.Text [1] [2] [3] [4]
    }//btnTimKH_Click




    protected void btnTimHuy_Click(object sender, EventArgs e)
    {
        //1. Cho "Tìm lại"
        btnTim.Enabled = true;
        txtTim.Enabled = true;
        btnTim.Text = "Tìm KH";
        //2. Ẩn các ô nhập thông tin KH mới 
        lbKHnew.Visible = false;
        lbmaKH.Visible = false;
        lbtenKH.Visible = false;
        lbDiachi.Visible = false;
        lbsdt.Visible = false;

        txtmaKH.Visible = false;
        txttenKH.Visible = false;
        txtDiachi.Visible = false;
        txtsdt.Visible = false;
        //3. Xóa trống TextBox nhập thông tin tim, để nhập lại
        txtTim.Text = "";
        //4. Nạp lại (trống) GridView ds KH, tránh trường hợp trước đã tìm có ds KH
        GridViewKH.DataBind();
        //5. Ẩn chính nút "Hủy tìm KH" nó
        btnTimHuy.Visible = false;
        //6. HỦY "ĐƠN HÀNG" 
        //6.1 Xóa và ẩn thông tin "Đơn hàng"
        lbDH.Visible = false;
        lbTTmaDH.Visible = false;
        lbmsddh.Text = ""; // Xóa msddh
        lbmsddh.Visible = false;
        lbTTngaylap.Visible = false;
        lbngaylap.Text = ""; //Xóa ngày lập
        lbngaylap.Visible = false;

        //lbTBgio.Visible = false;
        //lbgio.Text = ""; //xóa giờ
        //lbgio.Visible = false;

        //6.2 Xóa và ẩn thông tin "Giao hàng"
        lbTTdcg.Visible = false;
        txtdcg.Text = "";
        txtdcg.Visible = false;
        lbTTnguoinhan.Visible = false;
        txtnguoinhan.Text = "";
        txtnguoinhan.Visible = false;
        
        lbTTsdtnhan.Visible = false;
        txtsdtnhan.Text = "";
        txtsdtnhan.Visible = false;
        lbTTghichu.Visible = false;
        txtghichu.Text = "";
        txtghichu.Visible = false;
        
        Calendarhangiao.Visible = false;
        btnxndh.Visible = false;
        btnhuydh.Visible = false;
        //4.3.3 Hiện thị thông tin CHI TIẾT "Đơn hàng"
        lbCTDH.Visible = false;
        GridViewCart.Visible = false;
        GridViewCart.DataSource = null;
        lbSUM.Text = "";
        lbSUM.Visible = false;
    }



    protected void btnxndh_Click(object sender, EventArgs e)
    {
        //1. Khóa các ô nhập dữ liệu đơn hàng & các nút lệnh thay đổi
        btnTimHuy.Enabled = false; //không hủy tìm -> tìm KH khác (chỉ có thể Hủy DDH)
        Calendarhangiao.Enabled = false;
        txtdcg.Enabled = false; //khóa các ô nhập thông tin Đơn hàng
        txtnguoinhan.Enabled = false;
        txtsdtnhan.Enabled = false;
        txtghichu.Enabled = false;
        
        btnxndh.Enabled = false; //Không Xác nhận lại Đơn hàng (chỉ thực hiện 1 lần)
        btnhuydh.Visible = true; //có thể Hủy DDH

        CheckBoxhuygio.Visible = true; //BỔ SUNG THÊM LƯA CHỌN "HỦY LUÔN CART" KHI "HỦY ĐƠN" [True or False đi kèm theo btnHuyDDH.Visisble = ...
        btnPay.Visible = true; //Có thể thực hiện Thanh toán
                        //2. Lưu DDH vào DB
        try
        {
            SqlDataSourceDDH.Insert();
            this.Title = "THÊM DDH OK";
        }
        catch (System.Exception ex) { this.Title = "LỖI THÊM DDH = " + ex.Message; }
        //3. LƯU CTDDH 
        cart = Session["cart"] as DataTable;//LẤY GIỎ HÀNG TỪ Session XUỐNG
        try
        {
            //foreach (DataRow r in cart.Rows)
            //{
            //    SqlDataSourceCTDDH.InsertParameters.Clear();//xóa tất cả tham số của CT đạ lưu = lưu nhiểu CTDDH
            //    SqlDataSourceCTDDH.InsertParameters.Add("maddh", lbmsddh.Text.Trim());
            //    SqlDataSourceCTDDH.InsertParameters.Add("maquanao", r[0].ToString().Trim());
            //    SqlDataSourceCTDDH.InsertParameters.Add("soluong", DbType.Double, r[4].ToString());
            //    SqlDataSourceCTDDH.Insert();
            //}
            this.Title = this.Title = "THÊM DDH & CTDDH OK";
        }
        catch (System.Exception ex) { this.Title = "LỖI THÊM CTDDH = " + ex.Message; }

    }


    protected void btnhuydh_Click(object sender, EventArgs e)
    {
        //1. Mở các ô nhập dữ liệu đơn hàng & các nút lệnh thay đổi
        btnTimHuy.Enabled = true; //có thể hủy tìm -> tìm KH khác
        Calendarhangiao.Enabled = true;
        txtdcg.Enabled = true; //Mở các ô nhập thông tin Đơn hàng

        txtnguoinhan.Enabled = true;
        txtsdtnhan.Enabled = true;
        txtghichu.Enabled = true;
        
        btnxndh.Enabled = true; //cho Xác nhận lại Đơn hàng
        btnhuydh.Visible = false; //Ẩn Hủy DDH
        CheckBoxhuygio.Visible = false; //BỔ SUNG THÊM LƯA CHỌN "HỦY LUÔN CART" KHI "HỦY ĐƠN" [True or False đi kèm theo btnHuyDDH.Visisble = ...
        btnPay.Visible = false; //Ẩn Thanh toán
       
        //2. HỦY CÁC CTDDH 
        cart = Session["cart"] as DataTable;//LẤY GIỎ HÀNG TỪ Session XUỐNG
        try
        {
            foreach (DataRow r in cart.Rows)
            {
                SqlDataSourceCTDDH.DeleteParameters.Clear();//xóa tất cả tham số của CT = xóa nhiểu CTDDH
                SqlDataSourceCTDDH.DeleteParameters.Add("maddh", lbmsddh.Text.Trim());
                SqlDataSourceCTDDH.DeleteParameters.Add("maquanao", r[0].ToString().Trim());
                SqlDataSourceCTDDH.Delete();
            }
            this.Title = this.Title = "XÓA các CTDDH OK";
        }
        catch (System.Exception ex) { this.Title = "LỖI XÓA các CTDDH = " + ex.Message; }
        //3. XÓA DDH / DB
        try
        {
            SqlDataSourceDDH.Delete();
            this.Title = "XÓA các CTDDH & DDH OK";
        }
        catch (System.Exception ex) { this.Title = "LỖI XÓA DDH = " + ex.Message; }

        //4. Hủy tìm KH = tìm KH khác
        btnTimHuy_Click(sender, e);
        //LÀM THÊM VỤ CHECKBOX = XÓA LUÔN Cart
        if (CheckBoxhuygio.Checked)
        {
            Session["cart"] = null;
            Response.Redirect("~\\DTTT28_1Homepage.aspx");
        }//if checkbox hủy luon6b giò hàng
    }

    protected void btnPay_Click(object sender, EventArgs e)
    {
        Response.Redirect("~\\DTTT28_6Pay.aspx");

    }
}
