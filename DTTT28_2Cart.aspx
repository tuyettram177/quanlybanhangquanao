<%@ Page Title="" Language="C#" MasterPageFile="~/DTTT28_QUANAOMaster.Master" AutoEventWireup="true" CodeFile="DTTT28_2Cart.aspx.cs" Inherits="DTTT28_2Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td>
                <asp:Label ID="lbTitle" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#FFCC00" Text="Label"></asp:Label>
                <asp:Button ID="btnHome" runat="server" Font-Bold="True" OnClick="btnHome_Click" Text="Mua tiếp" BackColor="#FF9966" BorderColor="White" ForeColor="Yellow" />
                <asp:Button ID="btnorder" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="#FF6600" Text="Đặt hàng" OnClick="btnorder_Click" BackColor="#FFFF99" BorderColor="White" />
                <asp:Button ID="btncancel" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="White" OnClick="btncancel_Click" Text="Hủy giỏ" BackColor="#FF9900" BorderColor="White" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewCart" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                    <Columns>
                        <asp:BoundField DataField="maquanao" HeaderText="Mã quần áo " />
                        <asp:BoundField DataField="tenquanao" HeaderText="Tên quần áo " ReadOnly="True" />
                        <asp:BoundField DataField="gia" HeaderText="Giá" ReadOnly="True" />
                        <asp:BoundField DataField="dvt" HeaderText="ĐVT" ReadOnly="True" />
                        <asp:BoundField DataField="soluong" HeaderText="Số lượng" />
                        <asp:BoundField DataField="tien" HeaderText="Thành tiền " ReadOnly="True" />
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbSUM" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#FFCC00"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

