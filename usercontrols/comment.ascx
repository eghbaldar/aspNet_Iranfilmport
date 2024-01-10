<%@ Control Language="VB" AutoEventWireup="false" CodeFile="comment.ascx.vb" Inherits="usercontrols_comment" %>
<style>
    .btnInsert{
        display: inline-block;
                    outline: none;
                    cursor: pointer;
                    font-weight: 600;
                    border-radius: 3px;
                    padding: 12px 24px;
                    border: 0;
                    color: #3a4149;
                    background: #e7ebee;
                    line-height: 1.15;
                    font-size: 16px;
    }
                        .btnInsert:hover {
                        transition: all .1s ease;
                        box-shadow: 0 0 0 0 #fff, 0 0 0 3px #1de9b6;
                    }
    .C_div {
        /* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#ffffff+0,e5e5e5+100 */
        background: rgb(255,255,255); /* Old browsers */
        background: -moz-linear-gradient(left, rgba(255,255,255,1) 0%, rgba(229,229,229,1) 100%); /* FF3.6-15 */
        background: -webkit-linear-gradient(left, rgba(255,255,255,1) 0%,rgba(229,229,229,1) 100%); /* Chrome10-25,Safari5.1-6 */
        background: linear-gradient(to right, rgba(255,255,255,1) 0%,rgba(229,229,229,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#e5e5e5',GradientType=1 ); /* IE6-9 */
        padding: 5px;
    }

    .C_td {
        padding: 5px;
        width: 85%;
    }

    .C_Title {
        font-family: irsans;
        font-size: 13px;
        color: #B0A800;
        font-weight: bold;
    }

    .C_Sub_Title {
        font-family: irsans;
        font-size: 10px;
        color: #B0A800;
        font-weight: bold;
    }

    .C_Text {
        font-family: Samim;
        font-size: 13px;
    }

    .C_Sub_Text {
        font-family: Samim;
        font-size: 10px;
    }

    .C_Date {
        font-family: irsans;
        font-size: 11px;
        color: #48BDC5;
    }

    .C_Sub_Date {
        font-family: irsans;
        font-size: 9px;
        color: #000;
    }

    .C_Content {
        padding: 5px;
        border: 1px solid #ccc;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        border-radius: 5px;
        margin: 5px;
        width: 100%;
    }

    .C_Sub_Content {
        padding: 15px;
        border-radius: 5px;
        margin-bottom: 3px;
        width: 100%;
    }

    .TXT_EN {
        background-color:#f3f3f3;
        border:0;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        border-radius: 5px;
        text-align: lefet;
        direction: ltr;
        padding: 5px;
        font-family:Tahoma;
    }

    .TXT_FA {
        font-family:Samim;
               background-color:#f9f9f9;
        border:0;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        border-radius: 5px;
        text-align: right;
        direction: rtl;
        padding: 5px;
    }

    @media (max-width: 767px) {
        .TXT_EN {
            width: 100%;
        }

        .TXT_FA {
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
        <div runat="server" visible="true" id="Div_comment">
            <div style="direction: rtl; padding: 10px; margin-top: 40px;">
                <div class="C_div" style="font-family: Samim;">
                    نظرات شما
                </div>
                <asp:GridView ID="dgComment" runat="server" DataSourceID="SDS_Comment" GridLines="None"
                    ShowHeader="False" AutoGenerateColumns="False" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="name" SortExpression="name">
                            <ItemTemplate>
                                <div class="C_Content">

                                    <div style="display: flex;">
                                        <div>
                                            <asp:Image Style="border-radius: 50%"
                                                Width="50"
                                                ID="Image1" ImageUrl="~/files/images/icons/profile.png" runat="server" />
                                        </div>
                                        <div style="line-height: 50px; height: 50px; justify-content: center;padding-right:5px;">
                                            <asp:Label CssClass="C_Title" ID="Label2" runat="server" Text='<%# Eval("name").Replace("ي", "ی") %>'></asp:Label>
                                            [<asp:Label CssClass="C_Date" ID="Label3" runat="server" Text='<%# getdate(Eval("date")) %>'></asp:Label>]
                                        </div>
                                    </div>
                                    <div style="padding:10px;">
                                        <asp:Label CssClass="C_Text" ID="Label1" runat="server" Text='<%# Eval("text").Replace("ي", "ی") %>'></asp:Label>
                                    </div>
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                                <div style="padding-right: 40px;">
                                                    <asp:Label ID="ID_Parent" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                                    <asp:GridView ID="dgSubComment" runat="server" DataSourceID="SDS_SubComment" GridLines="None"
                                                        ShowHeader="False" AutoGenerateColumns="False" Width="100%">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="name" SortExpression="name">
                                                                <ItemTemplate>
                                                                    <asp:Panel ID="Panel1" runat="server" CssClass="C_Sub_Content" BackColor='<%# IIf(Eval("Admin") = "True", System.Drawing.ColorTranslator.FromHtml("#f1f1f1"), System.Drawing.ColorTranslator.FromHtml("#DDE8EE")) %>'>
                                                                        <div style="display: flex;">
                                                                            <div>
                                                                                <asp:Image Style="border-radius: 50%"
                                                                                    Width="50"
                                                                                    ID="Image1" ImageUrl='<%# IIf(Eval("Admin") = "True", "~/files/images/icons/iconScreen.png", "~/files/images/icons/profile.png") %>' runat="server" />
                                                                            </div>
                                                                        </div>
                                                                        <table style="width: 100%; line-height: 20px;">
                                                                            <tr>
                                                                                <td></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <div style="padding: 10px;">
                                                                                        <asp:Label CssClass="C_Sub_Text" ID="Label1" runat="server" Text='<%# Eval("text").Replace("ي", "ی") %>'></asp:Label>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                       <asp:Label CssClass="C_Sub_Title" ID="Label2" runat="server" ForeColor='<%# IIF(Eval("Admin")="True",System.Drawing.Color.Red,System.Drawing.ColorTranslator.FromHtml("#B0A800")) %>'
                                                                                    Text='<%# IIF(Eval("Admin") = "True", "", Eval("name").Replace("ي", "ی")) %>'></asp:Label>
                                                                                    </br>
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
                                         ([Id_post] = @id) AND ([flag] = @flag)) ORDER BY [date] asc">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="ID_Parent" Name="Id_parent" PropertyName="Text"
                                                                Type="Int64" />
                                                            <asp:ControlParameter Name="id" ControlID="lblId" Type="String" />
                                                            <asp:Parameter DefaultValue="true" Name="flag" Type="Boolean" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                                <div id='<%# String.Format("SubComment_{0}",Eval("Id")) %>'
                                                    style="padding-right: 40px;font-size: 12px; color: gray; cursor: pointer;font-family:Samim;"
                                                    onclick="call(this);">
                                                    [ پاسخ به این نظر ]
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div id='<%# String.Format("DivSubComment_{0}",Eval("Id")) %>'
                                                     style="display: none;">
                                                    <table style="width: 100%;">
                                                        <tr>
                                                            <td class="C_td">
                                                                <asp:TextBox ID="txtSubName"  placeholder="نام کامل ..."  CssClass="TXT_FA" runat="server"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" الزامی است"
                                                                ControlToValidate="txtSubName" ForeColor="Red" ValidationGroup='<%# String.Format("RequiredFieldValidator_{0}",Eval("Id")) %>'></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>                                                            
                                                            <td class="C_td">
                                                                <asp:TextBox 
                                                                    placeholder="Email Address ..."  CssClass="TXT_EN"  Width="300px" 
                                                                    ID="txtSubEmail" runat="server"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" الزامی است"
                                                                ControlToValidate="txtSubEmail" ForeColor="Red" ValidationGroup='<%# String.Format("RequiredFieldValidator_{0}", Eval("Id")) %>'></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="C_td">
                                                                <asp:TextBox ID="txtSubText"  placeholder="پیام شما ..."  CssClass="TXT_FA" runat="server" TextMode="MultiLine" Width="100%" Height="100px"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage=" الزامی است"
                                                                ControlToValidate="txtSubText" ForeColor="Red" ValidationGroup='<%# String.Format("RequiredFieldValidator_{0}", Eval("Id")) %>'></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="C_td">
                                                                <asp:Button CssClass="btnInsert" ID="btnSubCommentInsert" CommandArgument='<%# String.Format("{0}", Eval("Id")) %>'
                                                                    OnCommand="InsertSubComment" runat="server" Style="font-family: Samim;" Text="ثبت پاسخ برای این نظر"
                                                                    ValidationGroup='<%# String.Format("RequiredFieldValidator_{0}", Eval("Id")) %>' />
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
                                درج نظر شما
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="padding:10px;
box-shadow: 1px 2px 24px 6px rgba(0,0,0,0.24);
-webkit-box-shadow: 1px 2px 24px 6px rgba(0,0,0,0.24);
-moz-box-shadow: 1px 2px 24px 6px rgba(0,0,0,0.24);">
                            <table style="width: 100%;">
                                <tr>
                                    <td class="C_td">               
                                        <asp:TextBox 
                                            placeholder="نام کامل ..."
                                            ID="txtName" CssClass="TXT_FA" Width="300px" runat="server"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" الزامی است"
                                            ControlToValidate="txtName" ForeColor="Red" ValidationGroup="c"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="C_td">                                      
                                        <asp:TextBox
                                            placeholder="Email Address ..."
                                            ID="txtEmail" CssClass="TXT_EN" Width="300px" runat="server"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" الزامی است"
                                            ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="c"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="C_td">
                                        <asp:TextBox
                                            placeholder="پیام شما ..."
                                            ID="txtText" runat="server" CssClass="TXT_FA" TextMode="MultiLine" Width="100%"
                                            Height="100px"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage=" الزامی است"
                                            ControlToValidate="txtText" ForeColor="Red" ValidationGroup="c"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="C_td">
                                        <div style="border: 1px solid #ccc; width: 167px; margin-bottom: 5px;">
                                            <div>
                                                <asp:Image Width="165" ID="ImgCaptcha" runat="server"></asp:Image>
                                            </div>
                                            <div>
                                                <asp:TextBox ID="txtCaptcha" Style="background-color:#FFE600; text-align: center;"
                                                    runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <asp:Button ID="btnInsert" runat="server"
                                            CssClass="btnInsert"
                                            Font-Names="Samim" Text="ثبت نظر" ValidationGroup="c" />
                                        <asp:RequiredFieldValidator ID="rfvCaptcha" ErrorMessage="آیا ربات هستید؟" ControlToValidate="txtCaptcha"
                                            runat="server" ForeColor="Red" Display="Dynamic" ValidationGroup="c" />
                                        <asp:Label ID="lblWrongCapthca" runat="server" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                                </div>
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
          <script>
              function successAlert() {
                  Swal.fire({
                      position: "center",
                      icon: "success",
                      html: 'پیام شما با موفقیت ارسال گردید و پس از تایید توسط ادمین در اسرع وقت منتشر خواهد شد.',
                      showConfirmButton: false,
                      timer: 5000
                  });
              }
          </script>