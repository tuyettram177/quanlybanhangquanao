<%@ Page Title="" Language="C#" MasterPageFile="~/DTTT28_QUANAOMaster.Master" AutoEventWireup="true" CodeFile="DTTT28_12QLDDPP.aspx.cs" Inherits="DTTT28_12QLDDPP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 303px;
        }
        .auto-style4 {
            height: 31px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td colspan="2">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#996633" Text="28DTTT: TRANG QUẢN LÝ ĐỊA ĐIỂM PHÂN PHỐI"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lbchon" runat="server" Text="Chọn khu vực: "></asp:Label>
                <asp:DropDownList ID="DDLKV" runat="server" DataSourceID="SqlDataSourceKV" DataTextField="tenkv" DataValueField="makv" OnSelectedIndexChanged="DDLKV_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True">
                    <asp:ListItem Value="*">Tất cả</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceKV" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" SelectCommand="SELECT * FROM [KHUVUC]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Label ID="lbmaKV" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lbNV" runat="server" Font-Bold="True" Text="DANH SÁCH ĐỊA ĐIỂM PHÂN PHỐI THUỘC KHU VỰC ĐÃ CHỌN:"></asp:Label>
                </td>
        </tr>
        <tr>
            <td colspan="2"><asp:Label ID="lbmaDPP" runat="server" Text="Mã DPP:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmaDPP" runat="server" Visible="False" Width="93px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbtenDPP" runat="server" Text="Tên DPP:" Visible="False"></asp:Label>
                <asp:TextBox ID="txttenDPP" runat="server" Visible="False" Width="232px"></asp:TextBox>
&nbsp;<asp:Label ID="lbdc" runat="server" Text="Địa chỉ:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtdc" runat="server" Visible="False" Width="215px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbsdt" runat="server" Text="SDT:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtsdt" runat="server" Visible="False" Width="217px"></asp:TextBox>
&nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style4"><asp:Label ID="lbsc" runat="server" Text="Sức chứa:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtsc" runat="server" Visible="False" Width="82px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbct" runat="server" Text="Còn trống:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtct" runat="server" Visible="False" Width="94px"></asp:TextBox>
&nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2"><asp:Button ID="btnThem" runat="server" Text="Thêm mới " Width="185px" OnClick="btnThem_Click" />
                </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewDDPP" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="madiempp" DataSourceID="SqlDataSourceQLDMDDPP" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="madiempp" HeaderText="madiempp" ReadOnly="True" SortExpression="madiempp" />
                        <asp:BoundField DataField="tendiempp" HeaderText="tendiempp" SortExpression="tendiempp" />
                        <asp:BoundField DataField="diachi" HeaderText="diachi" SortExpression="diachi" />
                        <asp:BoundField DataField="sodt" HeaderText="sodt" SortExpression="sodt" />
                        <asp:BoundField DataField="succhua" HeaderText="succhua" SortExpression="succhua" />
                        <asp:BoundField DataField="controng" HeaderText="controng" SortExpression="controng" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
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
                <asp:SqlDataSource ID="SqlDataSourceQLDMDDPP" runat="server" ConnectionString="<%$ ConnectionStrings:AG528DTTT_QUANAOConnectionString %>" DeleteCommand="DELETE FROM DMDIEMPHANPHOI WHERE (madiempp = @madiempp)" SelectCommand="SELECT * FROM DMDIEMPHANPHOI WHERE (makv = @makv)" UpdateCommand="UPDATE DMDIEMPHANPHOI SET tendiempp =@tendiempp, diachi =@diachi , sodt =@sodt, succhua =@succhua, controng =@controng WHERE (madiempp = @madiempp)" InsertCommand="INSERT INTO DMDIEMPHANPHOI(madiempp, tendiempp, diachi, sodt, succhua, controng, makv) VALUES (@madiempp, @tendiempp, @diachi, @sodt, @succhua, @controng, @makv)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewDDPP" Name="madiempp" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLKV" Name="makv" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridViewDDPP" Name="tendiempp" PropertyName="SelectedValue[2]" />
                        <asp:ControlParameter ControlID="GridViewDDPP" Name="diachi" PropertyName="SelectedValue[3]" />
                        <asp:ControlParameter ControlID="GridViewDDPP" Name="sodt" PropertyName="SelectedValue[4]" />
                        <asp:ControlParameter ControlID="GridViewDDPP" ConvertEmptyStringToNull="False" DbType="Double" Name="succhua" PropertyName="SelectedValue[5]" />
                        <asp:ControlParameter ControlID="GridViewDDPP" DbType="Double" Name="controng" PropertyName="SelectedValue[6]" />
                        <asp:ControlParameter ControlID="GridViewDDPP" Name="madiempp" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

