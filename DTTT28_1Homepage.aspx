<%@ Page Title="" Language="C#" MasterPageFile="~/DTTT28_QUANAOMaster.Master" AutoEventWireup="true" CodeFile="DTTT28_1Homepage.aspx.cs" Inherits="DTTT28_1Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            height: 825px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
    <tr>
        <td>
            <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#993300" Text="28DTTT: DAHP WebPro = TRANG CHỦ MỜI QUÝ VỊ CHỌN MUA QUẦN ÁO MÌNH THÍCH !"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lbSUM" runat="server" Text="Label" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
            <asp:Button ID="btncart" runat="server" Font-Bold="True" ForeColor="#CC0000" OnClick="btncart_Click" Text="Xem giỏ hàng" Width="137px" BackColor="#FFCC99" BorderColor="White" />
        </td>
    </tr>
    <tr>
        <td class="auto-style3">
            <asp:DataList ID="DataListQA" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyField="maquanao" DataSourceID="SqlDataSourceQA" GridLines="Both" RepeatColumns="3" OnItemCommand="DataListQA_ItemCommand">
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <ItemTemplate>
                    Mã quần áo:
                    <asp:Label ID="maquanaoLabel" runat="server" Text='<%# Eval("maquanao") %>' />
                    <br />
                    Tên quần áo:
                    <asp:Label ID="tenquanaoLabel" runat="server" Text='<%# Eval("tenquanao") %>' />
                    <br />
                    Màu sắc:
                    <asp:Label ID="mausacLabel" runat="server" Text='<%# Eval("mausac") %>' />
                    <br />
                    Kích cỡ:
                    <asp:Label ID="kichcoLabel" runat="server" Text='<%# Eval("kichco") %>' />
                    <br />
                    Giới tính:
                    <asp:Label ID="gioitinhLabel" runat="server" Text='<%# Eval("gioitinh") %>' />
                    <br />
                    Chất liệu:
                    <asp:Label ID="chatlieuLabel" runat="server" Text='<%# Eval("chatlieu") %>' />
                    <br />
                    Giá:
                    <asp:Label ID="giaLabel" runat="server" Text='<%# Eval("gia") %>' />
                    /<asp:Label ID="dvtLabel" runat="server" Text='<%# Eval("dvt") %>' />
                    <br />
                    Ngày nhập hàng:
                    <asp:Label ID="ngaynhaphangLabel" runat="server" Text='<%# Eval("ngaynhaphang") %>' />
                    <br />
                    Mô tả:
                    <asp:Label ID="motaLabel" runat="server" Text='<%# Eval("mota") %>' />
                    <br />
                    Tên loại:
                    <asp:Label ID="tenloaiLabel" runat="server" Text='<%# Eval("tenloai") %>' />
                    <br />
                    Tên thương hiệu:
                    <asp:Label ID="tenthuonghieuLabel" runat="server" Text='<%# Eval("tenthuonghieu") %>' />
                    <br />
                    <asp:Image ID="Imghinh" runat="server" ImageUrl='<%# Eval("hinh") %>' />
                    <br />
                    Số lượng:
                    <asp:TextBox ID="txtSL" runat="server" Width="34px">1</asp:TextBox>
                    <asp:Button ID="Button1" runat="server" CommandName="buy" Text="Bỏ vào giỏ" BackColor="#FFCC99" Font-Bold="True" ForeColor="#663300" BorderColor="White" />
                    <br />
                </ItemTemplate>
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
            &nbsp;<asp:SqlDataSource ID="SqlDataSourceQA" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" SelectCommand="SELECT * FROM [vw_DMQUANAO]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>

