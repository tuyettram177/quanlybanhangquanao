<%@ Page Title="" Language="C#" MasterPageFile="~/DTTT28_QUANAOMaster.Master" AutoEventWireup="true" CodeFile="DTTT28_9QLKV.aspx.cs" Inherits="DTTT28_9QLKV" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#996633" Text="28DTTT: TRANG QUẢN LÝ KHU VỰC BÁN HÀNG "></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="CHÀO ĐÓN ... ĐẾN VỚI TRANG QUẢN LÝ KHU VỰC BÁN HÀNG CỦA G5.28 DTTT WEBPRO UFM 21DTH03"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbKHnew" runat="server" Text="NHẬP THÔNG TIN KHU VỰC BÁN HÀNG MỚI " Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbmaKV" runat="server" Text="Mã khu vực:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmaKV" runat="server" Visible="False" Width="93px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbtenKV" runat="server" Text="Tên khu vực:" Visible="False"></asp:Label>
                <asp:TextBox ID="txttenKV" runat="server" Visible="False" Width="206px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;<asp:Label ID="lbghichu" runat="server" Text="Ghi chú:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtghichu" runat="server" Visible="False" Width="310px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><asp:Button ID="btnThem" runat="server" OnClick="btnThem_Click" Text="Thêm khu vực mới" Width="181px" />
                <asp:Button ID="btnhuythem" runat="server" Text="Hủy thêm " Visible="False" OnClick="btnhuythem_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewKV" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="makv" DataSourceID="SqlDataSourceQLDMKV" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="makv" HeaderText="Mã khu vực " ReadOnly="True" SortExpression="makv" />
                        <asp:BoundField DataField="tenkv" HeaderText="Tên khu vực " SortExpression="tenkv" />
                        <asp:BoundField DataField="ghichu" HeaderText="Ghi chú " SortExpression="ghichu" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật " />
                        <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceQLDMKV" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" DeleteCommand="DELETE FROM KHUVUC WHERE (makv = @makv)" InsertCommand="INSERT INTO KHUVUC(makv, tenkv, ghichu) VALUES (@makv, @tenkv, @ghichu)" SelectCommand="SELECT * FROM [KHUVUC]" UpdateCommand="UPDATE KHUVUC SET tenkv = @tenkv, ghichu = @ghichu WHERE makv = @makv">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtmaKV" Name="makv" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txttenKV" Name="tenkv" PropertyName="Text" />
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

