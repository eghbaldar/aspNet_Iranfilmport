<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="statistical.aspx.vb" Inherits="CMS_Pages_statistical" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="TITLE">
        <h4>
            آمار صفحات
        </h4>
    </div>
    <div>
    <table>
    <tr>
    <td>
        <asp:TextBox ID="txtKeypoint" runat="server"></asp:TextBox>
        </td>
    <td><asp:Button ID="btnSearch" runat="server" Text="Search" /></td>
    </tr>
    </table>
    </div>
    <div>
              <asp:GridView ID="DGpages" runat="server" AutoGenerateColumns="False" 
                  BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                  CellPadding="3" GridLines="Vertical" 
                  AllowPaging="True" AllowSorting="True" PageSize="20">
                  <AlternatingRowStyle BackColor="#DCDCDC" />
                  <Columns>
                      <asp:BoundField DataField="count" HeaderText="count" SortExpression="count" >
                      <ItemStyle HorizontalAlign="Left" />
                      </asp:BoundField>
                      
                      
                <asp:TemplateField HeaderText="URL">
                    <ItemTemplate>
                        <div style="direction:ltr;width:400px;padding:5px;">
                        <a href='<%# "http://iranfilmport.com/" & Eval("url") %>' target="_blank">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("url") %>'></asp:Label>
                        </a>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>

                  </Columns>
                  <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                  <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                  <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                  <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                  <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                  <SortedAscendingCellStyle BackColor="#F1F1F1" />
                  <SortedAscendingHeaderStyle BackColor="#0000A9" />
                  <SortedDescendingCellStyle BackColor="#CAC9C9" />
                  <SortedDescendingHeaderStyle BackColor="#000065" />
              </asp:GridView>
    </div>
</asp:Content>

