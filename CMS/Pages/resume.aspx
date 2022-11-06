<%@ Page Title="" Language="VB" ValidateRequest="false" MasterPageFile="~/CMS/Pages/CMS.master"
    AutoEventWireup="false" CodeFile="resume.aspx.vb" Inherits="CMS_Pages_resume" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../../files/ckeditor/ckeditor.js"></script>
    <script src="../../files/ckeditor/samples/js/sample.js"></script>
    <link rel="stylesheet" href="../../files/ckeditor/samples/css/samples.css" />
    <link rel="stylesheet" href="../../files/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Button CssClass="tabBtn" ID="btnFa" runat="server" Text="فا" />
    <asp:Button CssClass="tabBtn" ID="btnEn" runat="server" Text="En" />
    <div class="TITLE" style="text-align: center; color: Black; font-size: 20px;">
        <h4>
            <a href="../../accolades" target="_blank" style="color: Black; font-family: Samim;">مشاهده صفحه کارنامه درگاه </a>
        </h4>
    </div>
    <div class="TITLE" style="color: Black; font-size: 20px;">
        <h4>
            <a href="../../accolades" target="_blank" style="color: Black; font-family: Samim;">قسمت بالای پیج : افتخارات کلی</a>
        </h4>
    </div>
    <asp:MultiView ID="M_CV" runat="server" ActiveViewIndex="0">
        <asp:View ID="View_Fa" runat="server">
            <textarea id="txtCV" name="content" class="ckeditor" runat="server"></textarea>
            <asp:Button ID="btn" CssClass="tabBtn" OnClientClick="confirm('بعد از آپدیت، سریع کارنامه انگلیسیشم بروز کن! فهمیدی مهندس؟');"
                runat="server" Text="بروزرسانی" />
        </asp:View>
        <asp:View ID="View_En" runat="server">
            <textarea id="txtCVEn" name="content" class="ckeditor" runat="server"></textarea>
            <asp:Button ID="btnEnUpdate" OnClientClick="confirm('انشالله که کارنامه فارسی بروز کرده باشی قبل این؟');" runat="server" Text="Update" />
        </asp:View>
    </asp:MultiView>
    <div class="TITLE" style="color: Black; font-size: 20px;">
        <h4>
            <a href="../../accolades" target="_blank" style="color: Black; font-family: Samim;">قسمت پایین پیج : افتخارات فیلمسازان</a>
        </h4>
    </div>


    <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>

                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">

                    <ProgressTemplate>
                        Loading...
                    </ProgressTemplate>

                </asp:UpdateProgress>

                <div>
                    <script>
                        var display, value, ddlStates;
                        window.onload = function () {
                            CopyToArrays();
                        };

                        function CopyToArrays() {
                            display = new Array();
                            value = new Array();
                            ddlStates = document.getElementById("<%=cmdFilm.ClientID %>");
                            for (var i = 0; i < ddlStates.options.length; i++) {
                                display[display.length] = ddlStates.options[i].text;
                                value[value.length] = ddlStates.options[i].value;
                            }
                        }
                        function FilterDropDownList(val) {
                            ddlStates.options.length = 0;
                            var newOption = document.createElement("option");
                            for (var i = 0; i < display.length; i++)
                                if (display[i].toLowerCase().indexOf(val) != -1) {
                                    newOption.text = display[i];
                                    newOption.value = value[i];
                                    ddlStates.options.add(newOption);
                                }

                        }

                    </script>
                    <asp:TextBox
                        onkeyup="FilterDropDownList(this.value)"
                        ID="txtSearchInDropbox" runat="server" AutoPostBack="true"></asp:TextBox>
                    <asp:DropDownList CssClass="txtFa"
                        ID="cmdFilm" runat="server" DataSourceID="SqlDataSourceFilm" DataTextField="nameFa" DataValueField="id" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceFilm" runat="server"
                        ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                        SelectCommand="SELECT id,[nameFa]+ ' - ' + nameEn 'nameFa' FROM [tbl_PosterOfCustomer] order by [namefa]"></asp:SqlDataSource>
                </div>
                <div style="direction: rtl; padding: 20px; font-family: Samim; font-size: 20px;">
                    لیست افتخارات این اثر:
                </div>
                <div>
                    <asp:GridView ID="dgAccolades" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceAccolades" ForeColor="#333333" GridLines="None" ShowHeader="False" Width="100%" DataKeyNames="id">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>

                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" Visible="false" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="id_film" HeaderText="id_film" Visible="false" SortExpression="id_film" />
                            <asp:TemplateField HeaderText="fa" SortExpression="fa">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("fa") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="en" SortExpression="en" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("en") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>

                                    <a target="_blank" 
                                        style="cursor:pointer;"
                                        onClick="window.open('<%# Eval("id", "resumeEdit/{0}") %>','pagename','resizable,height=600,width=800'); 
                                        return false;">
                                        <img src="..\..\files\images\icons\edit.png" />

                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1"
                                        OnClientClick="return confirm('Are you sure?x`');" runat="server" CausesValidation="False" CommandName="Delete">
                                <img src="..\..\files\images\icons\delete.png" />
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
                            <asp:ControlParameter ControlID="cmdFilm" Name="id_film" PropertyName="SelectedValue" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>



            </ContentTemplate>

        </asp:UpdatePanel>
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
        </div>
    </div>


</asp:Content>
