using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;//khai báo NameSpace để tránh phải sd nhiều lần trong các code bên dưới, khi dùng các class của nó
using System.Activities.Expressions;

public partial class DTTT28_1Homepage : System.Web.UI.Page
{
    static DataTable cart = new DataTable();
    //biến toàn cục cart = sẽ dùng để lưu giữ "giỏ hàng":static = cấp phát vùng nhớ "tĩnh" cho biến cart  => giá trị trong cart khi ra khỏi 1 thủ tục KHÔNG bị mất
    /// <summary>
    ///THỦ TỤC TỰ ĐỘNG CHẠY MỖI KHI PAGE NÀY ĐƯỢC TẢI LÊN TRÌNH DUYỆT 
    ///= KHỞI TẠO "GIỎ HÀNG" = NẾU ĐÃ CÓ GIỎ HÀNG TRONG Session THÌ LẤY XUỐNG, NÊU CHƯA THÌ KHỞI TẠO MỚI GH 
    ///BỔ SUNG: Code: thiết lập (định nghĩa) biến “giỏ hàng” mới/HomePage = cart: để chuẩn bị bỏ hàng vào giỏ/ 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)//CHỈ thiết lập "giỏ hàng" mới khi HomePage được Load lần đầu, các lần PostBack sau đó không thiết lập lại, tránh mất “giỏ hàng” đã chọn = CHÚ Ý! <=> NOT
        {
            //if (Session["cart"] != null) cart = (DataTable)Session ["cart"]; //Đã có giỏ hàng 
            if (Session["cart"] != null)//Đã có giỏ hàng
            {
                cart = Session["cart"] as DataTable;//lấy "giỏ hàng" từ Seesion xuống lưu vào biến cart để dùng
                                                    //cart = (DataTable)Session["cart"];
            }
            else//CHƯA "Giỏ hàng" => khởi tạo "giỏ hàng" mới 
            {
                cart.Rows.Clear(); //Xóa tất cả các dòng "rác" nếu có trong biến cart lưu "giỏ hàng"
                cart.Columns.Clear(); // Xóa tất cả các cột "rác" nếu có trong biến cart lưu "giỏ hàng"

                //ĐỊNH CÁC CỘT DỮ LIỆU CẦN QUẢN LÝ TRONG "GIỎ HÀNG"
                cart.Columns.Add("maquanao", typeof(string));//Mã quần áo 
                cart.Columns.Add("tenquanao", typeof(string));//Tên quần áo 
                cart.Columns.Add("mausac", typeof(string));//Màu sắc
                cart.Columns.Add("kichco", typeof(string));//kích cỡ
                cart.Columns.Add("gioitinh", typeof(string));//giới tính
                cart.Columns.Add("chatlieu", typeof(string));//chất liệu
                cart.Columns.Add("gia", typeof(float));//giá bán
                cart.Columns.Add("dvt", typeof(string));//đvt
                cart.Columns.Add("tenloai", typeof(string));//tenloai
                cart.Columns.Add("tenthuonghieu", typeof(string));//tenthuonghieu
                cart.Columns.Add("soluong", typeof(int));//Số lượng KH (dự định) mua 
                cart.Columns.Add("hinh", typeof(string));//hình
                cart.Columns.Add("tien", typeof(float), "gia*soluong");//thành tiền = số lượng * đơn giá bán = DataTable TỰ ĐỘNG TÍNH THEO CÔNG THỨC [sl * giaban]

            }//if(Session["cart"]..) else ...

        }
    }

    /// <summary>
    ///THỦ TỤC = BỎ HÀNG VÀO GIỎ = Khi Khách hàng online chọn vào nút lệnh "Bỏ vào giỏ" trên một MH (Item) / DataList 
    ///THỦ TỤC KH CHỌN MUA MẶT HÀNG (ORDER) --tùy đề tài-> BOOK CHỖ = GỬI PHIẾU (TURN IN = SUBMIT) = ĐĂNG KÝ (REGISTRY)
    ///THỦ TỤC = BỎ HÀNG VÀO GIỎ = Khi Khách hàng online chọn vào nút lệnh "Bỏ vào giỏ" trên một MH (Item) / DataList
    /// </summary>
    /// <param name="source"></param>
    /// <param name="e">là tham số hệ thống nhận diện các thông tin liên quan đến thao tác mà KH (NSD) đẵ thực hiện trên Item của DataList</param>

    protected void DataListQA_ItemCommand(object source, DataListCommandEventArgs e)//tham số e = lưu giữ các thông tin cơ bản về Item mà KH đang chọn
    {

            if (e.CommandName == "buy")//NSD (KH) bấm nút "Bỏ vào giỏ"= nút này có thuộc tính CommandName là buy 
            {
                //B1: LẤY CÁC THÔNG TIN CỦA MÓN HÀNG [ITEM] MÀ KH ĐANG CHỌN MUA 
                //string maquanao = ((Label)e.Item.FindControl("maquanaoLabel")).Text;
                string maquanao = DataListQA.DataKeys[e.Item.ItemIndex].ToString();//chỉ dùng cho khóa chính 
                string tenquanao = ((Label)e.Item.FindControl("tenquanaoLabel")).Text;
                string mausac = ((Label)e.Item.FindControl("mausacLabel")).Text;
                string kichco = ((Label)e.Item.FindControl("kichcoLabel")).Text;
                string gioitinh = ((Label)e.Item.FindControl("gioitinhLabel")).Text;
                string chatlieu = ((Label)e.Item.FindControl("chatlieuLabel")).Text;
                float gia = float.Parse(((Label)e.Item.FindControl("giaLabel")).Text.Trim());
                string dvt = ((Label)e.Item.FindControl("dvtLabel")).Text;
                string tenloai = ((Label)e.Item.FindControl("tenloaiLabel")).Text;
                string tenthuonghieu = ((Label)e.Item.FindControl("tenthuonghieuLabel")).Text;
                int soluong = int.Parse(((TextBox)e.Item.FindControl("txtSL")).Text.Trim());
                string hinh = ((Image)e.Item.FindControl("Imghinh")).ImageUrl;


                // B2: KIỂM TRA XEM ITEM (MÓN HÀNG MÀ KH VỪA CHỌN ĐÃ CÓ TRONG "GIỎ " CHƯA: NÊU ĐÃ CÓ THÌ CHỈ TĂNG SỐ LƯỢNG
                //nếu hết foreach(..) mà if(...) KHÔNG được thực hiện lần nào => MH mà KH đang chọn mua CHƯA có trong "giỏ "
                foreach (DataRow r in cart.Rows)//lấy từng dòng (row) hàng trong Giỏ hàng (cart)
                {
                    if ((string)r["maquanao"] == maquanao)//MH mà KH đang chọn {khchonmuaMaMH} đã có sẵn trong "giỏ" {r["msmh"]}
                    {
                        r["soluong"] = (int)r["soluong"] + soluong;//Tăng số lượng của MH mà KH vừa chọn
                        goto kt;
                        //dừng foreach(...) vì đã có mh trong "giỏ" và đã tăng sl; nhảy đến vị trí B4 = gửi cart lên Session (không tìm nữa)
                    }//if((string)r["msmh"]..
                }//foreach(DataRow r in cart.Rows)
                 //nếu hết foreach(..) mà if(...) KHÔNG được thực hiện lần nào => MH mà KH đang chọn mua CHƯA có trong "giỏ "
                 //mota/*,tenloai,tenthuonghieu*/

                //B3: THÊM MH MỚI VÀO "GIỎ" VÌ MH MÀ KH ĐANG CHỌN MUA CHƯA CÓ TRONG "GIỎ"
                cart.Rows.Add(maquanao, tenquanao, mausac, kichco, gioitinh, chatlieu, gia, dvt, tenloai, tenthuonghieu, soluong, hinh);
            kt:

                //B4:GỬI GIỎ HÀNG cart LÊN Session ĐỂ CHUYỂN SANG CÁC TRANG KHÁC SỬ DỤNG (SAU KHI ĐÃ THÊM HÀNG VÀO "GIỎ")
                Session["cart"] = cart;

                //B5:THÔNG BÁO KẾT QUẢ CHỌN MUA CỦA KH LÊN TRÊN TRANG NÀY = TRƯNG BÀY HH = HOMEPAGE: Tổng số Món đã chọn + Tổng số tiền hiện tại trong Giỏ hàng
                lbSUM.Text = "GIỎ HÀNG của Quý vị hiện có : " + cart.Compute("Count(maquanao)", "").ToString() + " MÓN HÀNG, TỔNG SỐ TIỀN = " + cart.Compute("Sum(tien)", "").ToString() + " đồng";

            }
        }
    /// <summary>
    ///XEM GIO HANG
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void btncart_Click(object sender, EventArgs e)
    {
        Response.Redirect("~\\DTTT28_2Cart.aspx");

    }
}