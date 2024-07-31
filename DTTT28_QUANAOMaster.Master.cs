using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AG528DTTT_QUANAO
{
    public partial class DTTT28_QUANAOMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoginNV.Visible = false;
        }


        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            if (e.Item.Value == "ql")
            {
                LoginNV.Visible = true;//hiển LoginNV để thực hiện đăng nhập
            }
            else//NSD (NV) chọn các mục chọn khác trong thực đơn
            {
                LoginNV.Visible = false;
            }


        }

        /// <summary>
        /// THỦ TỤC KIỂM TRA ĐĂNG NHẬP CỦA LoginNV
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e">e = xác thực đăng nhập thành công hay không </param>


        protected void LoginNV_Authenticate(object sender, AuthenticateEventArgs e)
        {
            if ((LoginNV.UserName == "Admin" && LoginNV.Password == "admin@vn") ||
             (LoginNV.UserName == "Guest" && LoginNV.Password == "guest@vn")
            )
            {
                e.Authenticated = true;// Đăng nhập thành công, tự động chuyển đến trang trong LoginNV.DestinationPageURL đã gán(tức là trang Quản lý FrManagement.aspx)

                Session["dn"] = LoginNV.UserName as string;
                //Gửi tên Account đã đăng nhập thành công sang các trang quản lý
                //usname.Text = LoginNV.UserName;
                //usname.Visible = true;
            }
            else
            {
                e.Authenticated = false;// Đăng nhập ko thành công
                //usname.Text = "";
                //usname.Visible = false;
            }

        }
    }
}