<%@ Page Title="" Language="C#" MasterPageFile="~/DTTT28_QUANAOMaster.Master" AutoEventWireup="true" CodeFile="DTTT28_4QLQA.aspx.cs" Inherits="DTTT28_4QLQA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 563px;
        }
        .auto-style4 {
            width: 301px;
        }
        .auto-style5 {
            height: 318px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td colspan="4">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#996633" Text="28DTTT: TRANG QUẢN LÝ QUẦN ÁO "></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="CHÀO ĐÓN  ĐẾN VỚI TRANG QUẢN LÝ DANH MỤC QUẦN ÁO CỦA G5.28 DTTT WEBPRO UFM 21DTH03" ForeColor="#FF6600"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lbchon" runat="server" Text="Chọn loại quần áo: "></asp:Label>
                <asp:DropDownList ID="DDLLoaiQA" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceLoaiQA" DataTextField="tenloai" DataValueField="maloai" AppendDataBoundItems="True" OnSelectedIndexChanged="DDLLoaiQA_SelectedIndexChanged">
                    <asp:ListItem Value="*">Tất cả</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceLoaiQA" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" SelectCommand="SELECT * FROM [DMLOAIQUANAO]"></asp:SqlDataSource>
            </td>
            <td class="auto-style4" colspan="2">
                <asp:Label ID="lbmaloai" runat="server" Text="Mã loại quần áo: "></asp:Label>
                <asp:Label ID="lbmasoloai" runat="server" Font-Bold="True" ForeColor="#FF0066"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="lbQA" runat="server" Font-Bold="True" Text="DANH SÁCH QUẦN ÁO THUỘC LOẠI:" ForeColor="#FF6600"></asp:Label>
                <asp:CheckBox ID="CheckBoxHinh" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBoxHinh_CheckedChanged" Text="Xem hình mẫu" />
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Button ID="btnThem" runat="server" OnClick="btnThem_Click" Text="Thêm quần áo mới " Width="185px" BackColor="#FFCCCC" />
                <asp:Label ID="lbmaquanao" runat="server" Text="Mã quần áo:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmaquanao" runat="server" Visible="False" Width="93px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbtenquanao" runat="server" Text="Tên quần áo:" Visible="False"></asp:Label>
                <asp:TextBox ID="txttenquanao" runat="server" Visible="False" Width="165px"></asp:TextBox>
&nbsp;<asp:Label ID="lbmausac" runat="server" Text="Màu sắc: " Visible="False"></asp:Label>
                <asp:TextBox ID="txtmausac" runat="server" Visible="False" Width="93px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbkichco" runat="server" Text="Kích cỡ: " Visible="False"></asp:Label>
                <asp:TextBox ID="txtkichco" runat="server" Visible="False" Width="93px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbgioitinh" runat="server" Text="Giới tính: " Visible="False"></asp:Label>
                <asp:TextBox ID="txtgioitinh" runat="server" Visible="False" Width="93px"></asp:TextBox>
&nbsp;<asp:Label ID="lbchatlieu" runat="server" Text="Chất liệu:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtchatlieu" runat="server" Visible="False" Width="93px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbgia" runat="server" Text="Giá:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtgia" runat="server" Visible="False" Width="93px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbdvt" runat="server" Text="/" Visible="False"></asp:Label>
                <asp:TextBox ID="txtdvt" runat="server" Visible="False" Width="93px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbngaynhaphang" runat="server" Text="Ngày nhập hàng: " Visible="False"></asp:Label>
                <asp:Calendar ID="Calendarngaynhaphang" runat="server" Visible="False" OnSelectionChanged="Calendarngaynhaphang_SelectionChanged"></asp:Calendar>
                <asp:Label ID="lbngaynhaphang1" runat="server" Visible="False" Font-Bold="True"></asp:Label>
&nbsp;<asp:Label ID="lbmota" runat="server" Text="Mô tả: " Visible="False"></asp:Label>
                <asp:TextBox ID="txtmota" runat="server" Visible="False" Width="193px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbhinh" runat="server" Text="Chọn hình mẫu:" Visible="False"></asp:Label>
                <asp:FileUpload ID="FileUploadhinh" runat="server" Visible="False" />
&nbsp;<asp:Label ID="lbthuonghieu" runat="server" Text="Thương hiệu: " Visible="False"></asp:Label>
                <asp:DropDownList ID="DDLthuonghieu" runat="server" DataSourceID="SqlDataSourceTH" DataTextField="tenthuonghieu" DataValueField="mathuonghieu" Visible="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceTH" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" SelectCommand="SELECT * FROM [DMTHUONGHIEU]"></asp:SqlDataSource>
&nbsp;&nbsp;
                <asp:Button ID="btnhuythem" runat="server" Text="Hủy thêm " Visible="False" OnClick="btnhuythem_Click" BackColor="#FFCC66" />
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridViewQA" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="maquanao" DataSourceID="SqlDataSourceDMQA">
                    <Columns>
                        <asp:CommandField SelectText="RBTV?" ShowSelectButton="True" />
                        <asp:BoundField DataField="maquanao" HeaderText="Mã quần áo" ReadOnly="True" SortExpression="maquanao" />
                        <asp:BoundField DataField="tenquanao" HeaderText="Tên quần áo" SortExpression="tenquanao" />
                        <asp:BoundField DataField="mausac" HeaderText="Màu sắc" SortExpression="mausac" />
                        <asp:BoundField DataField="kichco" HeaderText="Kích cỡ" SortExpression="kichco" />
                        <asp:BoundField DataField="gioitinh" HeaderText="Giới tính" SortExpression="gioitinh" />
                        <asp:BoundField DataField="chatlieu" HeaderText="Chất liệu" SortExpression="chatlieu" />
                        <asp:BoundField DataField="gia" HeaderText="Giá" SortExpression="gia" />
                        <asp:BoundField DataField="dvt" HeaderText="Đơn vị tính " SortExpression="dvt" />
                        <asp:TemplateField HeaderText="Ngày nhập hàng" SortExpression="ngaynhaphang">
                            <EditItemTemplate>
                                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ngaynhaphang") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="mota" HeaderText="Mô tả" SortExpression="mota" />
                        <asp:TemplateField HeaderText="Hình mẫu" SortExpression="hinh">
                            <EditItemTemplate>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("hinh") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Mã thương hiệu " SortExpression="mathuonghieu">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceETH" DataTextField="tenthuonghieu" DataValueField="mathuonghieu" SelectedValue='<%# Bind("mathuonghieu") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceETH" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" SelectCommand="SELECT * FROM [DMTHUONGHIEU]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("mathuonghieu") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                        <asp:CommandField DeleteText="Dừng kinh doanh" ShowDeleteButton="True" />
                    </Columns>
                    <EmptyDataTemplate>
                        Mã quần áo
                    </EmptyDataTemplate>
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
                <asp:SqlDataSource ID="SqlDataSourceDMQA" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" SelectCommand="SELECT * FROM [DMQUANAO] WHERE ([maloai] = @maloai)" DeleteCommand="DELETE FROM DMQUANAO WHERE (maquanao = @maquanao)" UpdateCommand="UPDATE DMQUANAO SET tenquanao = @tenquanao, mausac = @mausac, kichco = @kichco, gioitinh = @gioitinh, chatlieu = @chatlieu, gia = @gia, dvt = @dvt, ngaynhaphang = @ngaynhaphang, mota = @mota, hinh = @hinh, mathuonghieu = @mathuonghieu WHERE (maquanao = @maquanao)" InsertCommand="INSERT INTO DMQUANAO(maquanao, tenquanao, mausac, kichco, gioitinh, chatlieu, gia, dvt, ngaynhaphang, mota, hinh, maloai, mathuonghieu) VALUES (@maquanao, @tenquanao, @mausac, @kichco, @gioitinh, @chatlieu, @gia, @dvt, @ngaynhaphang, @mota, @hinh, @maloai, @mathuonghieu)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewQA" Name="maquanao" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLLoaiQA" Name="maloai" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridViewQA" Name="tenquanao" PropertyName="SelectedValue[2]" />
                        <asp:ControlParameter ControlID="GridViewQA" Name="mausac" PropertyName="SelectedValue[3]" />
                        <asp:ControlParameter ControlID="GridViewQA" Name="kichco" PropertyName="SelectedValue[4]" />
                        <asp:ControlParameter ControlID="GridViewQA" Name="gioitinh" PropertyName="SelectedValue[5]" />
                        <asp:ControlParameter ControlID="GridViewQA" Name="chatlieu" PropertyName="SelectedValue[6]" />
                        <asp:ControlParameter ControlID="GridViewQA" DbType="Double" Name="gia" PropertyName="SelectedValue[7]" />
                        <asp:ControlParameter ControlID="GridViewQA" Name="dvt" PropertyName="SelectedValue[8]" />
                        <asp:ControlParameter ControlID="GridViewQA" DbType="Date" Name="ngaynhaphang" PropertyName="SelectedValue[9]" />
                        <asp:ControlParameter ControlID="GridViewQA" Name="mota" PropertyName="SelectedValue[10]" />
                        <asp:ControlParameter ControlID="GridViewQA" Name="hinh" PropertyName="SelectedValue[11]" />
                        <asp:ControlParameter ControlID="GridViewQA" Name="mathuonghieu" PropertyName="SelectedValue[12]" />
                        <asp:ControlParameter ControlID="GridViewQA" Name="maquanao" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style5">
                <asp:GridView ID="GridViewRBTVTonKho" runat="server" AutoGenerateColumns="False" Caption="Mặt hàng cần xóa đang còn &quot;Tồn&quot; tại các &quot;Điểm phân phối&quot; sau" CellPadding="4" DataKeyNames="madiempp,maquanao" DataSourceID="SqlDataSourceTon" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewRBTVTonKho_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="madiempp" HeaderText="Mã điểm phân phối " SortExpression="madiempp" />
                        <asp:BoundField DataField="maquanao" HeaderText="Mã quần áo " ReadOnly="True" SortExpression="maquanao" />
                        <asp:BoundField DataField="soluongton" HeaderText="Số tồn " SortExpression="soluongton" />
                        <asp:CommandField DeleteText="Thanh lý" ShowDeleteButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSourceTon" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" DeleteCommand="DELETE FROM TONHANG WHERE (madiempp = @madiempp) AND (maquanao = @maquanao)" SelectCommand="SELECT * FROM [TONHANG] WHERE ([maquanao] = @maquanao)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewRBTVTonKho" Name="madiempp" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="GridViewRBTVTonKho" Name="maquanao" PropertyName="SelectedValue[2]" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewQA" Name="maquanao" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td colspan="2" class="auto-style5">
                <asp:Button ID="btnXoaALLTon" runat="server" OnClick="btnXoaALLTon_Click" Text="Thanh lý All tồn " BackColor="#CCFF99" />
            </td>
        </tr>
        <tr>
            <td colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridViewRBTVCTDDH" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" Caption="Mặt hàng cần xóa đang chưa xử lý &quot;CTDDH&quot; trên các &quot;Đơn hàng&quot; sau" CellPadding="3" DataKeyNames="maddh,maquanao" DataSourceID="SqlDataSourceCTDDH" GridLines="Horizontal">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="maddh" HeaderText="Mã đơn" ReadOnly="True" SortExpression="maddh" />
                        <asp:BoundField DataField="maquanao" HeaderText="Mã quần áo " SortExpression="maquanao" />
                        <asp:BoundField DataField="soluong" HeaderText="Số lượng " SortExpression="soluong" />
                        <asp:CommandField DeleteText="Hủy đặt hàng" ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceCTDDH" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" DeleteCommand="DELETE FROM CTDDH WHERE (maddh = @maddh) AND (maquanao = @maquanao)" SelectCommand="SELECT * FROM [CTDDH] WHERE ([maquanao] = @maquanao)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewRBTVCTDDH" Name="maddh" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="GridViewRBTVCTDDH" Name="maquanao" PropertyName="SelectedValue[2]" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewQA" Name="maquanao" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

