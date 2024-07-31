<%@ Page Title="" Language="C#" MasterPageFile="~/DTTT28_QUANAOMaster.Master" AutoEventWireup="true" CodeFile="DTTT28_10QLCM.aspx.cs" Inherits="DTTT28_10QLCM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            height: 31px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#996633" Text="28DTTT: TRANG QUẢN LÝ CHUYÊN MÔN "></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="CHÀO ĐÓN ... ĐẾN VỚI TRANG QUẢN LÝ CHUYÊN MÔN CỦA G5.28 DTTT WEBPRO UFM 21DTH03"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbKHnew" runat="server" Text="NHẬP THÔNG TIN CHUYÊN MÔN MỚI " Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbmaCM" runat="server" Text="Mã chuyên môn:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmaCM" runat="server" Visible="False" Width="93px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbtenCM" runat="server" Text="Tên chuyên môn:" Visible="False"></asp:Label>
                <asp:TextBox ID="txttenCM" runat="server" Visible="False" Width="206px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;<asp:Label ID="lbghichu" runat="server" Text="Ghi chú:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtghichu" runat="server" Visible="False" Width="310px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><asp:Button ID="btnThem" runat="server" OnClick="btnThem_Click" Text="Thêm chuyên môn mới" Width="222px" />
                <asp:Button ID="btnhuythem" runat="server" Text="Hủy thêm " Visible="False" OnClick="btnhuythem_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:GridView ID="GridViewCM" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="macm" DataSourceID="SqlDataSourceQLDMCM" ForeColor="Black" GridLines="None">
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="macm" HeaderText="Mã chuyên môn" ReadOnly="True" SortExpression="macm" />
                        <asp:BoundField DataField="tencm" HeaderText="Tên chuyên môn " SortExpression="tencm" />
                        <asp:BoundField DataField="ghichu" HeaderText="Ghi chú" SortExpression="ghichu" />
                        <asp:CommandField DeleteText="Xóa" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                        <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <SortedAscendingCellStyle BackColor="#FAFAE7" />
                    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                    <SortedDescendingCellStyle BackColor="#E1DB9C" />
                    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceQLDMCM" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" DeleteCommand="DELETE FROM CHUYENMON WHERE (macm = @macm)" InsertCommand="INSERT INTO CHUYENMON(macm, tencm, ghichu) VALUES (@macm, @tencm, @ghichu)" SelectCommand="SELECT * FROM [CHUYENMON]" UpdateCommand="UPDATE CHUYENMON SET tencm = @tencm, ghichu = @ghichu WHERE (macm = @macm)">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtmaCM" Name="macm" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txttenCM" Name="tencm" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtghichu" Name="ghichu" PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

