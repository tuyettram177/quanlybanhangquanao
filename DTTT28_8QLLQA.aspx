<%@ Page Title="" Language="C#" MasterPageFile="~/DTTT28_QUANAOMaster.Master" AutoEventWireup="true" CodeFile="DTTT28_8QLLQA.aspx.cs" Inherits="DTTT28_8QLLQA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            height: 41px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#996633" Text="28DTTT: TRANG QUẢN LÝ LOẠI QUẦN ÁO"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="CHÀO ĐÓN ... ĐẾN VỚI TRANG QUẢN LÝ LOẠI QUẦN ÁO CỦA G5.28 DTTT WEBPRO UFM 21DTH03"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbKHnew" runat="server" Text="NHẬP THÔNG TIN LOẠI QUẦN ÁO MỚI " Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbmaLQA" runat="server" Text="Mã loại quần áo:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmaLQA" runat="server" Visible="False" Width="93px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbtenLQA" runat="server" Text="Tên loại quần áo:" Visible="False"></asp:Label>
                <asp:TextBox ID="txttenLQA" runat="server" Visible="False" Width="206px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;<asp:Label ID="lbmota" runat="server" Text="Mô tả:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmota" runat="server" Visible="False" Width="310px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3"><asp:Button ID="btnThem" runat="server" OnClick="btnThem_Click" Text="Thêm loại quần áo mới" Width="223px" />
                <asp:Button ID="btnhuythem" runat="server" Text="Hủy thêm " Visible="False" OnClick="btnhuythem_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewLQA" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="maloai" DataSourceID="SqlDataSourceQLDMLQA" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="maloai" HeaderText="Mã loại quần áo" ReadOnly="True" SortExpression="maloai" />
                        <asp:BoundField DataField="tenloai" HeaderText="Tên loại quần áo" SortExpression="tenloai" />
                        <asp:BoundField DataField="mota" HeaderText="Mô tả" SortExpression="mota" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                        <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceQLDMLQA" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" DeleteCommand="DELETE FROM DMLOAIQUANAO WHERE (maloai = @maloai)" InsertCommand="INSERT INTO DMLOAIQUANAO(maloai, tenloai, mota) VALUES (@maloai, @tenloai, @mota)" SelectCommand="SELECT * FROM [DMLOAIQUANAO]" UpdateCommand="UPDATE DMLOAIQUANAO SET tenloai = @tenloai, mota = @mota WHERE  maloai = @maloai">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtmaLQA" Name="maloai" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txttenLQA" Name="tenloai" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtmota" Name="mota" PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

