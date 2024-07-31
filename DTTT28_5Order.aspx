<%@ Page Title="" Language="C#" MasterPageFile="~/DTTT28_QUANAOMaster.Master" AutoEventWireup="true" CodeFile="DTTT28_5Order.aspx.cs" Inherits="DTTT28_5Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            height: 31px;
        }
        .auto-style4 {
            height: 191px;
        }
        .auto-style5 {
            height: 33px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td>
                <asp:Label ID="lbTittle" runat="server" Font-Bold="True" Text="ĐÂY LÀ TRANG THÔNG TIN ĐẶT HÀNG" ForeColor="#FF6600"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbKH" runat="server" Text="[1]THÔNG TIN KHÁCH HÀNG" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbTim" runat="server" Text="Nhập mã KH || Họ tên || SDT:" Font-Bold="False" ForeColor="Black"></asp:Label>
                <asp:TextBox ID="txtTim" runat="server"></asp:TextBox>
                <asp:Button ID="btnTim" runat="server" Text="Tìm KH" OnClick="btnTim_Click" BackColor="#FFFF99" BorderColor="White" Font-Bold="True" ForeColor="#FF9900" />
                <asp:Button ID="btnTimHuy" runat="server" Text="Hủy" Visible="False" OnClick="btnTimHuy_Click" BackColor="#FF6600" Font-Bold="True" ForeColor="White" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewKH" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" Caption="CHỌN KHÁCH HÀNG" CellPadding="3" CellSpacing="2" DataKeyNames="makh" DataSourceID="SqlDataSourceKH" OnSelectedIndexChanged="GridViewKH_SelectedIndexChanged" Font-Bold="True" ForeColor="#CC3300">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="makh" HeaderText="Mã KH" ReadOnly="True" SortExpression="makh" />
                        <asp:BoundField DataField="hotenkh" HeaderText="Họ tên KH" SortExpression="hotenkh" />
                        <asp:BoundField DataField="diachikh" HeaderText="Địa chỉ" SortExpression="diachikh" />
                        <asp:BoundField DataField="sodtkh" HeaderText="Số điện thoại" SortExpression="sodtkh" />
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
                <asp:SqlDataSource ID="SqlDataSourceKH" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" SelectCommand="SELECT makh, hotenkh, diachikh, sodtkh FROM DMKH WHERE (makh = @makh) OR (hotenkh = @hotenkh) OR (diachikh = @diachikh) OR (sodtkh = @sodtkh)" InsertCommand="INSERT INTO DMKH(makh, hotenkh, diachikh, sodtkh, diem) VALUES (@makh, @hotenkh, @diachikh, @sodtkh, @diem)">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtmaKH" Name="makh" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txttenKH" Name="hotenkh" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtDiachi" Name="diachikh" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtsdt" Name="sodtkh" PropertyName="Text" />
                        <asp:Parameter DefaultValue="0" Name="diem" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtTim" Name="makh" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtTim" Name="hotenkh" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTim" Name="diachikh" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTim" Name="sodtkh" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbKHnew" runat="server" Text="NHẬP THÔNG TIN KHÁCH HÀNG MỚI " Visible="False" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbmaKH" runat="server" Text="Mã KH:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmaKH" runat="server" Visible="False" Width="93px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbtenKH" runat="server" Text="Tên KH:" Visible="False"></asp:Label>
                <asp:TextBox ID="txttenKH" runat="server" Visible="False" Width="165px"></asp:TextBox>
&nbsp;<asp:Label ID="lbDiachi" runat="server" Text="Địa chỉ:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtDiachi" runat="server" Visible="False" Width="324px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbsdt" runat="server" Text="SDT:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtsdt" runat="server" Visible="False" Width="217px"></asp:TextBox>
&nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbDH" runat="server" Text="[2]THÔNG TIN ĐƠN HÀNG" Visible="False" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSourceDDH" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" DeleteCommand="DELETE FROM DONDATHANG WHERE (maddh = @maddh)" InsertCommand="INSERT INTO DONDATHANG(maddh, ngaylap, diachigiao, nguoinhan, sodtnhan, thoihan, tinhtrang, ghichu, makh) VALUES (@maddh, @ngaylap, @diachigiao, @nguoinhan, @sodtnhan, @thoihan, @tinhtrang, @ghichu, @makh)" SelectCommand="SELECT * FROM [DONDATHANG]">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="lbmsddh" Name="maddh" PropertyName="Text" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="lbmsddh" Name="maddh" PropertyName="Text" />
                        <asp:ControlParameter ControlID="lbngaylap" DbType="Date" Name="ngaylap" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtdcg" Name="diachigiao" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtnguoinhan" Name="nguoinhan" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtsdtnhan" Name="sodtnhan" PropertyName="Text" />
                        <asp:ControlParameter ControlID="Calendarhangiao" DbType="Date" Name="thoihan" PropertyName="SelectedDate" />
                        <asp:Parameter DefaultValue="0" Name="tinhtrang" DbType="Int16" />
                        <asp:ControlParameter ControlID="txtghichu" DefaultValue="" Name="ghichu" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTim" Name="makh" PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbTTmaDH" runat="server" Text="Mã đơn:" Visible="False"></asp:Label>
                <asp:Label ID="lbmsddh" runat="server" Font-Bold="True" ForeColor="#FF0066" Visible="False"></asp:Label>
            &nbsp;&nbsp;
                <asp:Label ID="lbTTngaylap" runat="server" Text="Ngày lập:" Visible="False"></asp:Label>
                <asp:Label ID="lbngaylap" runat="server" Font-Bold="True" ForeColor="#FF0066" Visible="False"></asp:Label>
            &nbsp;&nbsp;
                <asp:Label ID="lbTTdcg" runat="server" Text="Địa chỉ giao:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtdcg" runat="server" Visible="False" Width="232px"></asp:TextBox>
&nbsp;
                <asp:Calendar ID="Calendarhangiao" runat="server" Visible="False"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td>&nbsp;<asp:Label ID="lbTTnguoinhan" runat="server" Text="Người nhận:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtnguoinhan" runat="server" Visible="False" Width="165px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbTTsdtnhan" runat="server" Text="SDT:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtsdtnhan" runat="server" Visible="False" Width="217px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbTTghichu" runat="server" Text="Ghi chú: " Visible="False"></asp:Label>
                <asp:TextBox ID="txtghichu" runat="server" Visible="False" Width="232px"></asp:TextBox>
&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnxndh" runat="server" Text="XÁC NHẬN THÔNG TIN ĐƠN HÀNG" OnClick="btnxndh_Click" Visible="False" Width="348px" BackColor="#FFFF99" BorderColor="White" Font-Bold="True" ForeColor="#FF6600" />
                &nbsp;
                <asp:Button ID="btnhuydh" runat="server" Text="HỦY THÔNG TIN ĐƠN HÀNG" OnClick="btnhuydh_Click" Visible="False" Width="336px" BackColor="#FF9933" BorderColor="White" Font-Bold="True" ForeColor="White" />
                <asp:CheckBox ID="CheckBoxhuygio" runat="server" Text="Hủy giỏ hàng" Visible="False" Font-Bold="True" ForeColor="#FF6600" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbCTDH" runat="server" Text="[3]THÔNG TIN GIỎ HÀNG" Visible="False" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSourceCTDDH" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" InsertCommand="INSERT INTO CTDDH(maddh, maquanao, soluong) VALUES (@maddh, @maquanao, @soluong)" SelectCommand="SELECT * FROM [CTDDH]" DeleteCommand="DELETE FROM CTDDH WHERE (maddh = @maddh) AND (maquanao = @maquanao)"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:GridView ID="GridViewCart" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <Columns>
                        <asp:BoundField DataField="maquanao" HeaderText="Mã quần áo " />
                        <asp:BoundField DataField="tenquanao" HeaderText="Tên quần áo " ReadOnly="True" />
                        <asp:BoundField DataField="gia" HeaderText="Giá" ReadOnly="True" />
                        <asp:BoundField DataField="dvt" HeaderText="ĐVT" ReadOnly="True" />
                        <asp:BoundField DataField="soluong" HeaderText="Số lượng" />
                        <asp:BoundField DataField="tien" HeaderText="Thành tiền " ReadOnly="True" />
                    </Columns>
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <PagerStyle ForeColor="DarkSlateBlue" HorizontalAlign="Center" BackColor="PaleGoldenrod" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <SortedAscendingCellStyle BackColor="#FAFAE7" />
                    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                    <SortedDescendingCellStyle BackColor="#E1DB9C" />
                    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lbSUM" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#FFCC00"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnPay" runat="server" Font-Bold="True" Text="Thanh toán " OnClick="btnPay_Click" BackColor="#FF9966" BorderColor="White" ForeColor="#FFFF66" Width="147px" />
            </td>
        </tr>
    </table>
</asp:Content>

