<%@ Page Title="" Language="C#" MasterPageFile="~/DTTT28_QUANAOMaster.Master" AutoEventWireup="true" CodeFile="DTTT28_7QLTH.aspx.cs" Inherits="DTTT28_7QLTH" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            height: 56px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#996633" Text="28DTTT: TRANG QUẢN LÝ THƯƠNG HIỆU "></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="CHÀO ĐÓN ... ĐẾN VỚI TRANG QUẢN LÝ DANH MỤC THƯƠNG HIỆU CỦA G5.28 DTTT WEBPRO UFM 21DTH03"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbKHnew" runat="server" Text="NHẬP THÔNG TIN THƯƠNG HIỆU MỚI " Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbmaTH" runat="server" Text="Mã thương hiệu:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmaTH" runat="server" Visible="False" Width="93px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbtenTH" runat="server" Text="Tên thương hiệu:" Visible="False"></asp:Label>
                <asp:TextBox ID="txttenTH" runat="server" Visible="False" Width="165px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnThem" runat="server" OnClick="btnThem_Click" Text="Thêm thương hiệu mới" Width="223px" />
                <asp:Button ID="btnhuythem" runat="server" Text="Hủy thêm " Visible="False" OnClick="btnhuythem_Click" />
                </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewTH" runat="server" AutoGenerateColumns="False" DataKeyNames="mathuonghieu" DataSourceID="SqlDataSourceQLDMTH" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="mathuonghieu" HeaderText="Mã thương hiệu" ReadOnly="True" SortExpression="mathuonghieu" />
                        <asp:BoundField DataField="tenthuonghieu" HeaderText="Tên thương hiệu " SortExpression="tenthuonghieu" />
                        <asp:CommandField EditText="Sửa" ShowEditButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSourceQLDMTH" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" DeleteCommand="DELETE FROM DMTHUONGHIEU WHERE (mathuonghieu = @mathuonghieu)" InsertCommand="INSERT INTO DMTHUONGHIEU(mathuonghieu, tenthuonghieu) VALUES (@mathuonghieu, @tenthuonghieu)" SelectCommand="SELECT mathuonghieu, tenthuonghieu FROM DMTHUONGHIEU" UpdateCommand="UPDATE DMTHUONGHIEU SET tenthuonghieu = @tenthuonghieu WHERE mathuonghieu = @mathuonghieu">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtmaTH" Name="mathuonghieu" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txttenTH" Name="tenthuonghieu" PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

