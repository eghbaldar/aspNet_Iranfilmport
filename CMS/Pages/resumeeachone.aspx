<%@ Page Language="VB"  ValidateRequest="false"  AutoEventWireup="false" CodeFile="resumeeachone.aspx.vb" Inherits="CMS_Pages_resumeeachone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        @font-face{font-family:Samim;src: url(../../../files/font/Samim-FD.ttf);}
        body{
            direction:rtl;
            font-family:Samim;
        }
        .tabBtn
{
    border:1px solid #ccc;
    width:150px;
    padding:5px;
/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#f2f6f8+0,d8e1e7+50,b5c6d0+51,e0eff9+100;Grey+Gloss+%232 */
background: #f2f6f8; /* Old browsers */
background: -moz-linear-gradient(top, #f2f6f8 0%, #d8e1e7 50%, #b5c6d0 51%, #e0eff9 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, #f2f6f8 0%,#d8e1e7 50%,#b5c6d0 51%,#e0eff9 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, #f2f6f8 0%,#d8e1e7 50%,#b5c6d0 51%,#e0eff9 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f2f6f8', endColorstr='#e0eff9',GradientType=0 ); /* IE6-9 */
    font-family:koodak;
}
.tabBtn:hover
{
cursor:pointer;
    /* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#6db3f2+0,54a3ee+50,3690f0+51,1e69de+100;Blue+Gloss+%233 */
background: #6db3f2; /* Old browsers */
background: -moz-linear-gradient(top, #6db3f2 0%, #54a3ee 50%, #3690f0 51%, #1e69de 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, #6db3f2 0%,#54a3ee 50%,#3690f0 51%,#1e69de 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, #6db3f2 0%,#54a3ee 50%,#3690f0 51%,#1e69de 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#6db3f2', endColorstr='#1e69de',GradientType=0 ); /* IE6-9 */
}
    </style>
        
    <script src="../../../files/ckeditor/ckeditor.js"></script>
    <script src="../../../files/ckeditor/samples/js/sample.js"></script>
    <link rel="stylesheet" href="../../files/ckeditor/samples/css/samples.css" />
    <link rel="stylesheet" href="../../files/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="direction: rtl; padding: 20px; font-family: Samim; font-size: 20px;">
                    <asp:Label ID="lblTitle" runat="server" Text=" لیست افتخارات این اثر:"></asp:Label>
                </div>
            <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                <asp:View ID="ViewList" runat="server">

                
                <div>
                    <asp:GridView ID="dgAccolades" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceAccolades" ForeColor="#333333" GridLines="None" ShowHeader="False" Width="100%" DataKeyNames="id">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>

                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" Visible="false" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="id_film" HeaderText="id_film" Visible="false" SortExpression="id_film" />
                            <asp:TemplateField HeaderText="fa" SortExpression="fa">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Font-Size="Small" Text='<%# Bind("fa") %>'></asp:Label>
                                    <hr />
                                   <div style="direction:ltr;font-size:13px;">
                                         <asp:Label ID="Label2" runat="server" Text='<%# Bind("en") %>'></asp:Label>
                                   </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>


                                     <asp:ImageButton ID="Lin11kButton1"
                                      runat="server" 
                                         CommandArgument='<%# Eval("id", "{0}") %>'
                                         OnCommand="ShowEdit"
                                         ImageUrl="~/files\images\icons\edit.png"
                                      >
                                    </asp:ImageButton>

                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkBu5tton1"
                                        OnClientClick="return confirm('Are you sure?');" runat="server" CausesValidation="False" CommandName="Delete">
                                <img src="..\..\..\files\images\icons\delete.png" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <EmptyDataTemplate>
                            <div style="text-align: center; font-family: Samim; color: blue; font-size: 25px;">
                                افتخاری برای این اثر هنوز ثبت نشده است.
                            </div>
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceAccolades" runat="server"
                        ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>" 
                        SelectCommand="SELECT * FROM [tbl_accolades] WHERE ([id_film] = @id_film)" DeleteCommand="delete from [tbl_accolades] where id=@id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" />
                        </DeleteParameters>
                           <SelectParameters>
                                    <asp:RouteParameter Name="id_film" RouteKey="id_film" Type="Int64" />
                                </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                    </asp:View>
                <asp:View ID="ViewEdit" runat="server">
                    
                    <div>
                                <div style="direction: rtl; padding: 20px; font-family: Samim; font-size: 20px;">
            افتخار بصورت فارسی:

                         <span style="color: red;">(فقط یک خط باشد!)</span>
        </div>
        <div>
            <textarea id="txtAccolade_fa" name="content" class="ckeditor" runat="server"></textarea>
        </div>
        <div style="direction: ltr; padding: 20px; font-family: Tahoma; font-size: 20px;">
            Accolade in English:

                       <span style="color: red;">(Only One Line!)</span>
        </div>
        <div>
            <textarea id="txtAccolade_en" name="content" class="ckeditor" runat="server"></textarea>
        </div>
        <div>
            <asp:Button CssClass="tabBtn" ID="btnUpdateAccolade" runat="server" Text="بروزرسانی" />
            <asp:Label ID="lblIdEdit" ForeColor="White" runat="server"></asp:Label>
        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </form>
</body>
</html>
