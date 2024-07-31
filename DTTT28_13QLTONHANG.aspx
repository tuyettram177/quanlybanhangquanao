<%@ Page Title="" Language="C#" MasterPageFile="~/DTTT28_QUANAOMaster.Master" AutoEventWireup="true" CodeFile="DTTT28_13QLTONHANG.aspx.cs" Inherits="DTTT28_13QLTONHANG" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            height: 31px;
        }
        .auto-style4 {
            width: 31%;
        }
        .auto-style7 {
            width: 21%;
        }
        .auto-style8 {
            width: 14%;
        }
        .auto-style9 {
            width: 356px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td colspan="4">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#996633" Text="28DTTT: TRANG QUẢN LÝ TỒN HÀNG"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="CHÀO ĐÓN ... ĐẾN VỚI TRANG QUẢN LÝ NHÂN VIÊN CỦA G5.28 DTTT WEBPRO UFM 21DTH03"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lbchonDPP" runat="server" Text="Chọn điểm phân phối: "></asp:Label>
                <asp:DropDownList ID="DDLDPP" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSourceDDLDPP" DataTextField="tendiempp" DataValueField="madiempp" OnSelectedIndexChanged="DDLDPP_SelectedIndexChanged">
                    <asp:ListItem Value="*">Tất cả</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceDDLDPP" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" SelectCommand="SELECT * FROM [DMDIEMPHANPHOI]"></asp:SqlDataSource>
            </td>
            <td class="auto-style8">
                <asp:Label ID="lbmaDPP" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:Label ID="lbchonQA" runat="server" Text="Chọn quần áo: "></asp:Label>
                <asp:DropDownList ID="DDLQA" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSourceDDLQA" DataTextField="tenquanao" DataValueField="maquanao">
                    <asp:ListItem Value="*">Tất cả</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceDDLQA" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" SelectCommand="SELECT * FROM [DMQUANAO]"></asp:SqlDataSource>
            </td>
            <td class="auto-style7">
                <asp:Label ID="lbmaQA" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="4">
                <asp:Label ID="lbNV" runat="server" Font-Bold="True" Text="[1]. DANH SÁCH TỒN HÀNG THUỘC ĐỊA ĐIỂM PHÂN PHỐI VÀ QUẦN ÁO ĐÃ CHỌN:"></asp:Label>
                </td>
        </tr>
        <tr>
            <td colspan="4">&nbsp;<asp:Label ID="lbmaDPPTH" runat="server" Text="Mã điểm phân phối:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmaDPPTH" runat="server" Visible="False" Width="93px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbmaQATH" runat="server" Text="Mã quần áo:" Visible="False"></asp:Label>
&nbsp;<asp:TextBox ID="txtmaQATH" runat="server" Visible="False" Width="93px"></asp:TextBox>
&nbsp;<asp:Label ID="lbSLT" runat="server" Text="Số lượng tồn:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtSLT" runat="server" Visible="False" Width="72px"></asp:TextBox>
&nbsp;
                &nbsp;&nbsp;<asp:Button ID="btnThem" runat="server" Text="Thêm mới " Width="185px" OnClick="btnThem_Click" />
                </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridViewTONHANG" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="madiempp,maquanao" DataSourceID="SqlDataSourceQLTONHANG">
                    <Columns>
                        <asp:CommandField SelectText="Chọn " ShowSelectButton="True" />
                        <asp:BoundField DataField="madiempp" HeaderText="Mã điểm phân phối " ReadOnly="True" SortExpression="madiempp" />
                        <asp:BoundField DataField="maquanao" HeaderText="Mã quần áo" ReadOnly="True" SortExpression="maquanao" />
                        <asp:BoundField DataField="soluongton" HeaderText="Số lượng tồn" SortExpression="soluongton" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                        <asp:CommandField DeleteText="Xóa " ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceQLTONHANG" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" DeleteCommand="DELETE FROM TONHANG WHERE (madiempp = @madiempp) AND (maquanao = @maquanao)" InsertCommand="INSERT INTO TONHANG(madiempp, maquanao, soluongton) VALUES (@madiempp, @maquanao, @soluongton)" SelectCommand="SELECT * FROM TONHANG WHERE (madiempp = @madiempp) AND (maquanao = @maquanao)" UpdateCommand="UPDATE TONHANG SET soluongton = @soluongton WHERE (madiempp = @madiempp) AND (maquanao = @maquanao)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLDPP" Name="madiempp" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DDLQA" Name="maquanao" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="4">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="lbNV0" runat="server" Font-Bold="True" Text="[1]. DANH SÁCH TỒN HÀNG THUỘC ĐỊA ĐIỂM PHÂN PHỐI VÀ QUẦN ÁO ĐÃ CHỌN:"></asp:Label>
                </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridViewDPPTH" runat="server" AutoGenerateColumns="False" DataKeyNames="madiempp" DataSourceID="SqlDataSourceDPPTH">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="madiempp" HeaderText="madiempp" ReadOnly="True" SortExpression="madiempp" />
                        <asp:BoundField DataField="tendiempp" HeaderText="tendiempp" SortExpression="tendiempp" />
                        <asp:BoundField DataField="diachi" HeaderText="diachi" SortExpression="diachi" />
                        <asp:BoundField DataField="sodt" HeaderText="sodt" SortExpression="sodt" />
                        <asp:BoundField DataField="succhua" HeaderText="succhua" SortExpression="succhua" />
                        <asp:BoundField DataField="controng" HeaderText="controng" SortExpression="controng" />
                        <asp:BoundField DataField="makv" HeaderText="makv" SortExpression="makv" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceDPPTH" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" SelectCommand="SELECT madiempp, tendiempp, diachi, sodt, succhua, controng, makv FROM DMDIEMPHANPHOI WHERE (madiempp = @madiempp)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewTONHANG" Name="madiempp" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="4">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="lbNV1" runat="server" Font-Bold="True" Text="[1]. DANH SÁCH TỒN HÀNG THUỘC ĐỊA ĐIỂM PHÂN PHỐI VÀ QUẦN ÁO ĐÃ CHỌN:"></asp:Label>
                </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="maquanao" DataSourceID="SqlDataSourceQLQATH">
                    <Columns>
                        <asp:BoundField DataField="maquanao" HeaderText="maquanao" ReadOnly="True" SortExpression="maquanao" />
                        <asp:BoundField DataField="tenquanao" HeaderText="tenquanao" SortExpression="tenquanao" />
                        <asp:BoundField DataField="mausac" HeaderText="mausac" SortExpression="mausac" />
                        <asp:BoundField DataField="kichco" HeaderText="kichco" SortExpression="kichco" />
                        <asp:BoundField DataField="gioitinh" HeaderText="gioitinh" SortExpression="gioitinh" />
                        <asp:BoundField DataField="chatlieu" HeaderText="chatlieu" SortExpression="chatlieu" />
                        <asp:BoundField DataField="gia" HeaderText="gia" SortExpression="gia" />
                        <asp:BoundField DataField="dvt" HeaderText="dvt" SortExpression="dvt" />
                        <asp:BoundField DataField="ngaynhaphang" HeaderText="ngaynhaphang" SortExpression="ngaynhaphang" />
                        <asp:BoundField DataField="mota" HeaderText="mota" SortExpression="mota" />
                        <asp:BoundField DataField="hinh" HeaderText="hinh" SortExpression="hinh" />
                        <asp:BoundField DataField="maloai" HeaderText="maloai" SortExpression="maloai" />
                        <asp:BoundField DataField="mathuonghieu" HeaderText="mathuonghieu" SortExpression="mathuonghieu" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceQLQATH" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" SelectCommand="SELECT maquanao, tenquanao, mausac, kichco, gioitinh, chatlieu, gia, dvt, ngaynhaphang, mota, hinh, maloai, mathuonghieu FROM DMQUANAO WHERE (maquanao = @maquanao)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewTONHANG" Name="maquanao" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

