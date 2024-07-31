<%@ Page Title="" Language="C#" MasterPageFile="~/DTTT28_QUANAOMaster.Master" AutoEventWireup="true" CodeFile="DTTT28_3FrManagements.aspx.cs" Inherits="DTTT28_3FrManagements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            height: 31px;
        }
        .auto-style4 {
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lbTittle" runat="server" Font-Bold="True" ForeColor="#FFCC00" Text="ĐÂY LÀ TRANG QUẢN LÝ: CÁC CHỨC NĂNG QUẢN LÝ "></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="I. CÁC CHỨC NĂNG QUẢN LÝ BÊN BÁN " ForeColor="#FF6600"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnQLQA" runat="server" OnClick="btnQLQA_Click" Text="Quản lý quần áo" Width="196px" BackColor="#FFCC99" />
                <asp:Button ID="btnQLLQA" runat="server" Text="Quản lý loại quần áo" Width="223px" OnClick="btnQLLQA_Click" BackColor="#FFCC99" />
                <asp:Button ID="btnQLTonHang" runat="server" Text="Quản lý tồn hàng " Width="186px" OnClick="btnQLTonHang_Click" BackColor="#FFCC99" />
                <asp:Button ID="btnQLNV" runat="server" Text="Quản lý nhân viên " Width="188px" OnClick="btnQLNV_Click" BackColor="#FFCC99" />
                <asp:Button ID="btnQLKV" runat="server" Text="Quản lý khu vực " Width="159px" OnClick="btnQLKV_Click" BackColor="#FFCC99" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnQLDDPP" runat="server" Text="Quản lý địa điểm phân phối " Width="268px" OnClick="btnQLDDPP_Click" BackColor="#FFCC99" />
                <asp:Button ID="btnQLCM" runat="server" Text="Quản lý chuyên môn " Width="204px" OnClick="btnQLCM_Click" BackColor="#FFCC99" />
                <asp:Button ID="btnQLTH" runat="server" Text="Quản lý thương hiệu " OnClick="btnQLTH_Click" Width="204px" BackColor="#FFCC99" />
                <asp:Button ID="btnQLPCGH" runat="server" Text="Quản lý phân công giao hàng " OnClick="btnQLTH_Click" Width="262px" BackColor="#FFCC99" />
                <asp:Button ID="btnQLGH" runat="server" Text="Quản lý giao hàng" OnClick="btnQLTH_Click" Width="170px" BackColor="#FFCC99" />
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="II. CÁC CHỨC NĂNG QUẢN LÝ BÊN MUA" ForeColor="#FF6600"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnQLKH" runat="server" OnClick="btnQLQA_Click" Text="Quản lý khách hàng " Width="196px" BackColor="#FFFF99" />
                <asp:Button ID="btnQLDDH" runat="server" OnClick="btnQLQA_Click" Text="Quản lý đơn đặt hàng" Width="196px" BackColor="#FFFF99" />
                <asp:Button ID="btnQLCTDDH" runat="server" OnClick="btnQLQA_Click" Text="Quản lý chi tiết đơn đặt hàng" Width="271px" BackColor="#FFFF99" />
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="III. CÁC CHỨC NĂNG THỐNG KÊ, TỔNG HỢP, BÁO CÁO  " ForeColor="#FF6600"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="1. Báo cáo " ForeColor="#FF9966"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Button ID="btnQLKH0" runat="server" OnClick="btnQLQA_Click" Text="Báo cáo doanh số " Width="196px" BackColor="#FFCCCC" />
                <asp:Button ID="btnQLKH1" runat="server" OnClick="btnQLQA_Click" Text="Báo cáo doanh thu" Width="196px" BackColor="#FFCCCC" />
                <asp:Button ID="btnQLKH2" runat="server" OnClick="btnQLQA_Click" Text="Báo cáo lãi || lỗ" Width="196px" BackColor="#FFCCCC" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="2. Tra cứu, tìm kiếm " ForeColor="#FF9966"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnQLKH3" runat="server" OnClick="btnQLQA_Click" Text="Tra cứu - tìm kiếm: Bên bán " Width="269px" BackColor="#FFCCCC" />
                <asp:Button ID="btnQLKH4" runat="server" OnClick="btnQLQA_Click" Text="Tra cứu - tìm kiếm: Bên mua " Width="269px" BackColor="#FFCCCC" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="3. Khai phá dữ liệu " ForeColor="#FF9966"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnQLKH5" runat="server" OnClick="btnQLQA_Click" Text="Hoạch định phân bổ hàng nhập " Width="288px" BackColor="#FFCCCC" />
                <asp:Button ID="btnQLKH6" runat="server" OnClick="btnQLQA_Click" Text="Hoạch định bố trí nhân lực " Width="269px" BackColor="#FFCCCC" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="4. Kế toán hàng hóa " ForeColor="#FF9966"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnQLKH7" runat="server" OnClick="btnQLQA_Click" Text="Quản lý công nợ " Width="200px" BackColor="#FFCCCC" />
                <asp:Button ID="btnQLKH8" runat="server" OnClick="btnQLQA_Click" Text="Quản lý thanh toán " Width="199px" BackColor="#FFCCCC" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="IV. CÁC CHỨC NĂNG GIAO HÀNG" ForeColor="#FF6600"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnQLKH9" runat="server" OnClick="btnQLQA_Click" Text="Cập nhật thông tin giao hàng " Width="288px" BackColor="#CCFFCC" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="V. CÁC CHỨC NĂNG HỆ THỐNG " ForeColor="#FF6600"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnTrangchu" runat="server" OnClick="btnQLQA_Click" Text="Về trang chủ " Width="147px" BackColor="#FFCCFF" />
                <asp:Button ID="btnDangxuat" runat="server" OnClick="btnQLQA_Click" Text="Đăng xuất " Width="139px" BackColor="#FFCCFF" />
            </td>
        </tr>
    </table>
</asp:Content>

