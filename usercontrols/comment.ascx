<%@ Control Language="VB" AutoEventWireup="false" CodeFile="comment.ascx.vb" Inherits="usercontrols_comment" %>
<style>
    .C_div
    {
        /* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#ffffff+0,e5e5e5+100 */
        background: rgb(255,255,255); /* Old browsers */
        background: -moz-linear-gradient(left, rgba(255,255,255,1) 0%, rgba(229,229,229,1) 100%); /* FF3.6-15 */
        background: -webkit-linear-gradient(left, rgba(255,255,255,1) 0%,rgba(229,229,229,1) 100%); /* Chrome10-25,Safari5.1-6 */
        background: linear-gradient(to right, rgba(255,255,255,1) 0%,rgba(229,229,229,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#e5e5e5',GradientType=1 ); /* IE6-9 */
        padding: 5px;
    }
    .C_td
    {
        padding: 5px;
        width: 85%;
    }
    .C_Title
    {
        font-family: irsans;
        font-size: 13px;
        color: #B0A800;
        font-weight: bold;
    }
    .C_Sub_Title
    {
        font-family: irsans;
        font-size: 10px;
        color: #B0A800;
        font-weight: bold;
    }
    .C_Text
    {
        font-family: Samim;
        font-size: 13px;
    }
    .C_Sub_Text
    {
        font-family: Samim;
        font-size: 10px;
    }
    .C_Date
    {
        font-family: irsans;
        font-size: 11px;
        color: #48BDC5;
    }
    .C_Sub_Date
    {
        font-family: irsans;
        font-size: 9px;
        color: #000;
    }
    .C_Content
    {
        padding: 5px;
        border: 1px solid #ccc;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        border-radius: 5px;
        margin: 5px;
        width: 100%;
    }
    .C_Sub_Content
    {
        padding: 5px;
        border-radius: 5px;
        margin-bottom: 3px;
        width: 100%;
    }
    .TXT_EN
    {
        border: 1px solid #ccc;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        border-radius: 5px;
        text-align: lefet;
        direction: ltr;
        padding: 5px;
    }
    .TXT_FA
    {
        border: 1px solid #ccc;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        border-radius: 5px;
        text-align: right;
        direction: rtl;
        padding: 5px;
    }
    @media (max-width: 767px)
    {
        .TXT_EN
        {
            width: 100%;
        }
        .TXT_FA
        {
            width: 100%;
        }
    }
</style>
<script>
    function call(sender) {

        var str = sender.id;
        var res = str.split("_");
        if (document.getElementById('DivSubComment_' + res[1]).style.display == 'none') {
            document.getElementById('DivSubComment_' + res[1]).style.display = 'inline';
        }
        else {
            document.getElementById('DivSubComment_' + res[1]).style.display = 'none';
        }

    }

</script>
<%-----------------------------------------------------%>
<%-----------------------------------------------------%>
<asp:Label ID="lblSection" runat="server" Visible="false"></asp:Label>
<asp:Label ID="lblId" runat="server" Visible="false"></asp:Label>
<asp:UpdatePanel runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <div runat="server" visible="false" id="Div_success" style="direction: rtl; background-color: #AAC967;
            color: Green; padding: 10px; -moz-border-radius: 5px; -webkit-border-radius: 5px;
            border-radius: 5px; font-family: Samim; margin-top: 60px;">
            پیام شما با موفقیت ارسال گردید و پس از تایید توسط ادمین در اسرع وقت منتشر خواهد
            شد.
        </div>
        <div runat="server" visible="true" id="Div_comment">
            <div style="direction: rtl; padding: 10px; margin-top: 40px;">
                <div class="C_div" style="font-family: Samim;">
                    نظرات شما</div>
                <asp:GridView ID="dgComment" runat="server" DataSourceID="SDS_Comment" GridLines="None"
                    ShowHeader="False" AutoGenerateColumns="False" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="name" SortExpression="name">
                            <ItemTemplate>
                                <div class="C_Content">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="C_Title" ID="Label2" runat="server" Text='<%# Eval("name").Replace("ي", "ی") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="C_Text" ID="Label1" runat="server" Text='<%# Eval("text").Replace("ي", "ی") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="C_Date" ID="Label3" runat="server" Text='<%# getdate(Eval("date")) %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div>
                                                    <asp:Label ID="ID_Parent" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                                    <asp:GridView ID="dgSubComment" runat="server" DataSourceID="SDS_SubComment" GridLines="None"
                                                        ShowHeader="False" AutoGenerateColumns="False" Width="100%">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="name" SortExpression="name">
                                                                <ItemTemplate>
                                                                    <asp:Panel ID="Panel1" runat="server" CssClass="C_Sub_Content" BackColor='<%# IIF(Eval("Admin")="True",System.Drawing.ColorTranslator.FromHtml("#F9DF80"),System.Drawing.ColorTranslator.FromHtml("#DDE8EE")) %>'>
                                                                        <table style="width: 100%;">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label CssClass="C_Sub_Title" ID="Label2" runat="server" ForeColor='<%# IIF(Eval("Admin")="True",System.Drawing.Color.Red,System.Drawing.ColorTranslator.FromHtml("#B0A800")) %>'
                                                                                        Text='<%# IIF(Eval("Admin")="True","کارشناس پشتیبانی",Eval("name").Replace("ي", "ی")) %>'></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label CssClass="C_Sub_Text" ID="Label1" runat="server" Text='<%# Eval("text").Replace("ي", "ی") %>'></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label CssClass="C_Sub_Date" ID="Label3" runat="server" Text='<%# getdate(Eval("date")) %>'></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                    <asp:SqlDataSource ID="SDS_SubComment" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                                                        SelectCommand="SELECT * FROM [tbl_Comment] WHERE (([Id_parent] = @Id_parent) AND 
                                         ([Id_post] = @id) AND ([flag] = @flag)) ORDER BY [date] DESC">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ID_Parent" Name="Id_parent" PropertyName="Text"
                                                                Type="Int64" />
                                                            <asp:ControlParameter Name="id" ControlID="lblId" Type="String" />
                                                            <asp:Parameter DefaultValue="true" Name="flag" Type="Boolean" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                                <div id='<%# String.Format("SubComment_{0}",Eval("Id")) %>' style="font-size: 10px;
                                                    color: Blue; cursor: pointer;" onclick="call(this);">
                                                    [ پاسخ به این نظر ]</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div id='<%# String.Format("DivSubComment_{0}",Eval("Id")) %>' style="display: none;">
                                                    <table style="width: 100%;">
                                                        <tr>
                                                            <td>
                                                                نام:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" الزامی است"
                                                                    ControlToValidate="txtSubName" ForeColor="Red" ValidationGroup='<%# String.Format("RequiredFieldValidator_{0}",Eval("Id")) %>'></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="C_td">
                                                                <asp:TextBox ID="txtSubName" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                ایمیل:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" الزامی است"
                                                                    ControlToValidate="txtSubEmail" ForeColor="Red" ValidationGroup='<%# String.Format("RequiredFieldValidator_{0}",Eval("Id")) %>'></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="C_td">
                                                                <asp:TextBox ID="txtSubEmail" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                نظر شما:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage=" الزامی است"
                                                                    ControlToValidate="txtSubText" ForeColor="Red" ValidationGroup='<%# String.Format("RequiredFieldValidator_{0}",Eval("Id")) %>'></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="C_td">
                                                                <asp:TextBox ID="txtSubText" runat="server" TextMode="MultiLine" Width="100%" Height="100px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                            </td>
                                                            <td class="C_td">
                                                                <asp:Button ID="btnSubCommentInsert" CommandArgument='<%# String.Format("{0}",Eval("Id")) %>'
                                                                    OnCommand="InsertSubComment" runat="server" Style="font-family: Samim;" Text="ثبت پاسخ برای این نظر"
                                                                    ValidationGroup='<%# String.Format("RequiredFieldValidator_{0}",Eval("Id")) %>' />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div style="font-family: Samim;">
                            نظری درج نشده است.
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:SqlDataSource ID="SDS_Comment" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                    SelectCommand="SELECT * FROM tbl_comment
         where flag=1 and id_post=@id and id_parent=0 and sections=@sections order by [date] desc">
                    <SelectParameters>
                        <asp:ControlParameter Name="sections" ControlID="lblSection" Type="String" />
                        <asp:ControlParameter Name="id" ControlID="lblId" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <div style="direction: rtl; padding: 10px;">
                <table style="width: 100%; font-family: Samim;">
                    <tr>
                        <td>
                            <div class="C_div">
                                درج نظر شما</div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width: 100%;">
                                <tr>
                                    <td class="C_td">
                                        <span>نام</span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" الزامی است"
                                            ControlToValidate="txtName" ForeColor="Red" ValidationGroup="c"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:TextBox ID="txtName" CssClass="TXT_FA" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="C_td">
                                        <span>ایمیل </span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" الزامی است"
                                            ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="c"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:TextBox ID="txtEmail" CssClass="TXT_EN" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="C_td">
                                        <span>نظر شما </span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage=" الزامی است"
                                            ControlToValidate="txtText" ForeColor="Red" ValidationGroup="c"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:TextBox ID="txtText" runat="server" CssClass="TXT_FA" TextMode="MultiLine" Width="100%"
                                            Height="100px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="C_td">
                                        <div style="border: 1px solid #ccc; width: 167px; margin-bottom: 5px;">
                                            <div>
                                                <asp:Image Width="165" ID="ImgCaptcha" runat="server"></asp:Image>
                                            </div>
                                            <div>
                                                <asp:TextBox ID="txtCaptcha" Style="border: 1px solid #ccc; text-align: center;"
                                                    runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <asp:Button ID="btnInsert" runat="server" Font-Names="Samim" Text="ثبت نظر" ValidationGroup="c" />
                                        <asp:RequiredFieldValidator ID="rfvCaptcha" ErrorMessage="آیا ربات هستید؟" ControlToValidate="txtCaptcha"
                                            runat="server" ForeColor="Red" Display="Dynamic" ValidationGroup="c" />
                                        <asp:Label ID="lblWrongCapthca" runat="server" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="txtCaptcha" />
    </Triggers>
</asp:UpdatePanel>
