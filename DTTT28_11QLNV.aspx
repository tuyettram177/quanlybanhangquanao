<%@ Page Title="" Language="C#" MasterPageFile="~/DTTT28_QUANAOMaster.Master" AutoEventWireup="true" CodeFile="DTTT28_11QLNV.aspx.cs" Inherits="DTTT28_11QLNV" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 128px;
            height: 82px;
        }
        .auto-style5 {
            width: 413px;
            height: 82px;
        }
        .auto-style6 {
            width: 493px;
            height: 82px;
        }
        .auto-style7 {
            height: 82px;
        }
        .auto-style8 {
            height: 265px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td colspan="4">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#996633" Text="28DTTT: TRANG QUẢN LÝ NHÂN VIÊN"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="CHÀO ĐÓN ... ĐẾN VỚI TRANG QUẢN LÝ NHÂN VIÊN CỦA G5.28 DTTT WEBPRO UFM 21DTH03" ForeColor="#FF9900"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="lbchon" runat="server" Text="Chọn khu vực làm việc của NV: "></asp:Label>
                <asp:DropDownList ID="DDLKV" runat="server" DataSourceID="SqlDataSourceKV" DataTextField="tenkv" DataValueField="makv" OnSelectedIndexChanged="DDLKV_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True">
                    <asp:ListItem Value="*">Tất cả</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceKV" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" SelectCommand="SELECT * FROM [KHUVUC]"></asp:SqlDataSource>
            </td>
            <td class="auto-style4">
                <asp:Label ID="lbmaKV" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:Label ID="lbchon0" runat="server" Text="Chọn chuyên môn của NV: "></asp:Label>
                <asp:DropDownList ID="DDLCM" runat="server" DataSourceID="SqlDataSourceCM" DataTextField="tencm" DataValueField="macm" OnSelectedIndexChanged="DDLCM_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True">
                    <asp:ListItem Value="*">Tất cả</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceCM" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" SelectCommand="SELECT * FROM [CHUYENMON]"></asp:SqlDataSource>
            </td>
            <td class="auto-style7">
                <asp:Label ID="lbmaCM" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="lbNV" runat="server" Font-Bold="True" Text="[1]. DANH SÁCH NHÂN VIÊN THUỘC KHU VỰC VÀ CHUYÊN MÔN ĐÃ CHỌN:" ForeColor="#FF6600"></asp:Label>
                </td>
        </tr>
        <tr>
            <td colspan="4">
                &nbsp;<asp:Label ID="lbmaNV" runat="server" Text="Mã NV:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmaNV" runat="server" Visible="False" Width="93px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbtenNV" runat="server" Text="Tên NV:" Visible="False"></asp:Label>
                <asp:TextBox ID="txttenNV" runat="server" Visible="False" Width="165px"></asp:TextBox>
&nbsp;<asp:Label ID="lbGioitinh" runat="server" Text="Giới tính:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtGioitinh" runat="server" Visible="False" Width="134px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbsdt" runat="server" Text="SDT:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtsdt" runat="server" Visible="False" Width="217px"></asp:TextBox>
&nbsp;&nbsp;<asp:Button ID="btnThem" runat="server" Text="Thêm mới " Width="185px" OnClick="btnThem_Click" BackColor="#FFCC99" />
                </td>
        </tr>
        <tr>
            <td colspan="4" class="auto-style8">
                <asp:GridView ID="GridViewNV" runat="server" AutoGenerateColumns="False" DataKeyNames="manv" DataSourceID="SqlDataSourceQLDMNV" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" OnRowEditing="GridViewNV_RowEditing">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="manv" HeaderText="Mã nhân viên" ReadOnly="True" SortExpression="manv" />
                        <asp:BoundField DataField="hotennv" HeaderText="Họ tên nhân viên" SortExpression="hotennv" />
                        <asp:CheckBoxField DataField="gioitinh" HeaderText="Giới tính" SortExpression="gioitinh" />
                        <asp:BoundField DataField="sodt" HeaderText="Số điện thoại " SortExpression="sodt" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                        <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSourceQLDMNV" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" SelectCommand="SELECT * FROM DMNVGH WHERE (macm = @macm) AND (makv = @makv)" DeleteCommand="DELETE FROM DMNVGH WHERE (manv = @manv)" InsertCommand="INSERT INTO DMNVGH(manv, hotennv, gioitinh, sodt, macm, makv) VALUES (@manv, @hotennv, @gioitinh, @sodt, @macm, @makv)" UpdateCommand="UPDATE DMNVGH SET hotennv = @hotennv, gioitinh = @gioitinh, sodt = @sodt WHERE (manv = @manv)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewNV" Name="manv" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLCM" Name="macm" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DDLKV" Name="makv" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="txttenNV" Name="hotennv" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtGioitinh" Name="gioitinh" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtsdt" Name="sodt" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtmaNV" Name="manv" PropertyName="Text" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="4">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="lbQA0" runat="server" Font-Bold="True" Text="[2]. DANH SÁCH CÁC ĐƠN HÀNG ĐANG PHÂN CÔNG CHO NV ĐANG CHỌN TRONG DANH SÁCH TRÊN:" ForeColor="#FF6600"></asp:Label>
                </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridViewNVDDH" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="maddh" DataSourceID="SqlDataSourceNVDDH" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="maddh" HeaderText="Mã đơn đặt hàng" ReadOnly="True" SortExpression="maddh" />
                        <asp:BoundField DataField="ngaylap" HeaderText="Ngày lập" SortExpression="ngaylap" />
                        <asp:BoundField DataField="diachigiao" HeaderText="Địa chỉ giao" SortExpression="diachigiao" />
                        <asp:BoundField DataField="nguoinhan" HeaderText="Người nhận" SortExpression="nguoinhan" />
                        <asp:BoundField DataField="sodtnhan" HeaderText="Số điện thoại nhận" SortExpression="sodtnhan" />
                        <asp:BoundField DataField="thoihan" HeaderText="Thời hạn " SortExpression="thoihan" />
                        <asp:BoundField DataField="tinhtrang" HeaderText="Tình trạng" SortExpression="tinhtrang" />
                        <asp:BoundField DataField="ghichu" HeaderText="Ghi chú " SortExpression="ghichu" />
                        <asp:BoundField DataField="makh" HeaderText="Mã KH" SortExpression="makh" />
                        <asp:BoundField DataField="manv" HeaderText="Mã NV" SortExpression="manv" />
                        <asp:BoundField DataField="makv" HeaderText="Mã KV" SortExpression="makv" />
                        <asp:BoundField DataField="macm" HeaderText="Mã CM" SortExpression="macm" />
                        <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceNVDDH" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" DeleteCommand="DELETE FROM DONDATHANG WHERE (maddh = @maddh)" SelectCommand="SELECT maddh, ngaylap, diachigiao, nguoinhan, sodtnhan, thoihan, tinhtrang, ghichu, makh, manv, makv, macm FROM DONDATHANG WHERE (manv = @manv)" UpdateCommand="UPDATE DONDATHANG SET ngaylap = @ngaylap, diachigiao = @diachigiao, nguoinhan = @nguoinhan, sodtnhan = @sodtnhan, thoihan = @thoihan, tinhtrang = @tinhtrang, ghichu = @ghichu, makh = @ghichu, manv = @manv, makv = @makv, macm = @macm WHERE (maddh = @maddh)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewNVDDH" Name="maddh" PropertyName="SelectedValue[1]" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewNV" Name="manv" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="4">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

