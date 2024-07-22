<%@ Control Language="VB" AutoEventWireup="false" CodeFile="KingComments.ascx.vb" Inherits="usercontrols_KingComments" %>
<style>
    .input-validation-error {
        border: 2px solid red !important;
    }
</style>

<style>
    .modal {
        z-index: 999999999;
    }

    .button {
        font-family: IranYekan !important;
    }

    .btnInsert {
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
        font-family: IranYekan;
        font-size: 13px;
        color: #B0A800;
        font-weight: bold;
    }

    .C_Sub_Title {
        font-family: IranYekan;
        font-size: 10px;
        color: #B0A800;
        font-weight: bold;
    }

    .C_Text {
        font-family: IranYekan;
        font-size: 13px;
    }

    .C_Sub_Text {
        font-family: IranYekan;
        font-size: 10px;
    }

    .C_Date {
        font-family: IranYekan;
        font-size: 11px;
        color: #48BDC5;
    }

    .C_Sub_Date {
        font-style:italic;
        font-family: IranYekan;
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
        padding: 5px;
        padding-right: 20px;
        border-radius: 5px;
        margin-bottom: 3px;
        margin-right: 100px;
        width: 100%;
    }

    .C_Sub_Content_Yellow {
        border-right: 8px solid #ECCE01;
    }

    .C_Sub_Content_GRAY {
        border-right: 8px solid #969696;
    }

    .TXT_EN {
        background-color: #f3f3f3;
        border: 0;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        border-radius: 5px;
        text-align: left;
        direction: ltr;
        padding: 5px;
        font-family: Tahoma;
    }

    .TXT_FA {
        font-family: IranYekan;
        background-color: #f9f9f9;
        border: 0;
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
<style>
    .loading {
        position: relative;
    }

    .loading::after {
        content: "";
        position: absolute;
        top: 50%;
        left: 50%;
        width: 16px;
        height: 16px;
        border: 2px solid #ccc;
        border-top: 2px solid #000;
        border-radius: 50%;
        animation: spin 0.6s linear infinite;
        transform: translate(-50%, -50%);
    }

    @keyframes spin {
        0% {
            transform: translate(-50%, -50%) rotate(0deg);
        }
        100% {
            transform: translate(-50%, -50%) rotate(360deg);
        }
    }
</style>

<%-----------------------------------------------------%>
<%-----------------------------------------------------%>
<asp:Label ID="lblSection" runat="server" Visible="false"></asp:Label>
<asp:Label ID="lblId" runat="server" Visible="false"></asp:Label>
<asp:HiddenField ID="HiddenFieldSubCommentId" runat="server" />
<asp:UpdatePanel runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <div runat="server" visible="true" id="Div_comment">
            <div class="comments-area" style="padding-bottom: 0px;">
                <h3 class="mb-10">
                    <asp:Label ID="lblCommentCount" runat="server" Text="Label"></asp:Label></h3>
                <asp:GridView ID="dgComment" runat="server" DataSourceID="SDS_Comment" GridLines="None"
                    ShowHeader="False" AutoGenerateColumns="False" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="name" SortExpression="name">
                            <ItemTemplate>
                                <div class="comment-list">
                                    <div class="single-comment justify-content-between d-flex">
                                        <div class="user justify-content-between d-flex">
                                            <div class="thumb" style="width: 55px;">
                                                <asp:Image
                                                    Width="40"
                                                    ID="Image1" ImageUrl="~/files/images/icons/profile.png" runat="server" />

                                            </div>
                                            <div class="desc">
                                                <p class="comment">
                                                    <a href="#"><%# Eval("name").Replace("ي", "ی") %></a>
                                                    <br />
                                                    <p style="font-style: italic; font-size: small;"><%# getdate(Eval("date")) %> </p>

                                                    <div class="reply-btn" style="width: 120px; text-align: center;">
                                                        <a id='<%# String.Format("SubComment_{0}", Eval("Id")) %>'
                                                            style="cursor: pointer; background-color: #F0D617 !important;"
                                                            onclick="call('<%# Eval("Id") %>');" class="btn-reply text-uppercase">پاسخ به این نظر</a>
                                                    </div>
                                                    <br />
                                                    <asp:Label CssClass="C_Text" ID="Label1" runat="server" Text='<%# Eval("text").Replace("ي", "ی") %>'></asp:Label>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div id='<%# String.Format("DivSubComment_{0}", Eval("Id")) %>'
                                        style="display: none;">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="C_td">
                                                    <asp:TextBox ID="txtSubName" placeholder="نام کامل ..." CssClass="TXT_FA" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage=" الزامی است"
                                                        ControlToValidate="txtSubName" ForeColor="Red" ValidationGroup='<%# String.Format("RequiredFieldValidator_{0}",Eval("Id")) %>'></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="C_td">
                                                    <asp:TextBox
                                                        placeholder="Email Address ..." CssClass="TXT_EN" Width="300px"
                                                        ID="txtSubEmail" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage=" الزامی است"
                                                        ControlToValidate="txtSubEmail" ForeColor="Red" ValidationGroup='<%# String.Format("RequiredFieldValidator_{0}", Eval("Id")) %>'></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="C_td">
                                                    <asp:TextBox ID="txtSubText" placeholder="پیام شما ..." CssClass="TXT_FA" runat="server" TextMode="MultiLine" Width="100%" Height="100px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage=" الزامی است"
                                                        ControlToValidate="txtSubText" ForeColor="Red" ValidationGroup='<%# String.Format("RequiredFieldValidator_{0}", Eval("Id")) %>'></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="C_td">
                                                    <asp:Button CssClass="btnInsert" ID="btnSubCommentInsert" 
                                                         runat="server" Style="font-family: Samim;" Text="ثبت پاسخ برای این نظر"
                                                        ValidationGroup='<%# String.Format("RequiredFieldValidator_{0}", Eval("Id")) %>' />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <table style="width: 100%; margin-bottom: 0px;">
                                        <tr>
                                            <td>
                                                <div>
                                                    <asp:Label ID="ID_Parent" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                                    <asp:GridView ID="dgSubComment" runat="server" DataSourceID="SDS_SubComment" GridLines="None"
                                                        ShowHeader="False" AutoGenerateColumns="False" Width="100%">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="name" SortExpression="name">
                                                                <ItemTemplate>
                                                                    <asp:Panel ID="Panel1" runat="server" CssClass='<%# IIf(Eval("Admin") = "True", "C_Sub_Content C_Sub_Content_Yellow", "C_Sub_Content C_Sub_Content_GRAY") %>'>




                                                                        <div class="user d-flex">
                                                                            <div class="thumb" style="width: 55px;">
                                                                                <asp:Image Style="border-radius: 50%"
                                                                                    Width="50"
                                                                                    ID="Image1" ImageUrl='<%# IIf(Eval("Admin") = "True", "~/files/images/icons/iconScreen.png", "~/files/images/icons/profile.png") %>' runat="server" />

                                                                            </div>
                                                                            <div class="desc">
                                                                                <p class="comment">
                                                                                    <asp:Label CssClass="C_Sub_Title" ID="Label2" runat="server" ForeColor='<%# IIf(Eval("Admin") = "True", System.Drawing.Color.Red, System.Drawing.ColorTranslator.FromHtml("#B0A800")) %>'
                                                                                        Text='<%# IIF(Eval("Admin") = "True", "کارشناس درگاه فیلم ایران", Eval("name").Replace("ي", "ی")) %>'></asp:Label>
                                                                                    <br />
                                                                                    <asp:Label CssClass="C_Sub_Date" ID="Label3" runat="server" Text='<%# getdate(Eval("date")) %>'></asp:Label>
                                                                                    <div>
                                                                                        <asp:Label CssClass="C_Sub_Text" ID="Label1" runat="server" Text='<%# Eval("text").Replace("ي", "ی") %>'></asp:Label>
                                                                                    </div>
                                                                                </p>
                                                                            </div>
                                                                        </div>



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
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div>
                          اولین نظر را شما درج کنید.
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
            <div class="comment-form" style="margin-top: 0px; padding-top: 0px; border-top: none;">
                <h3 class="mb-30">ارسال نظرات</h3>
                <div class="form-contact comment_form" action="#" id="commentForm">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <asp:TextBox
                                    placeholder="نام کامل ..."
                                    ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <asp:TextBox
                                    placeholder="Email Address ..."
                                    Style="text-align: left !important; direction: ltr !important;"
                                    ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">

                                <asp:TextBox
                                    placeholder="پیام شما ..."
                                    ID="txtText" runat="server" CssClass="form-control w-100" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-12">
                            <div style="border: 1px solid #ccc; width: 167px; margin-bottom: 5px;">
                                <div>
                                    <asp:Image Width="165" ID="ImgCaptcha" runat="server"></asp:Image>
                                </div>
                                <div>
                                    <asp:TextBox ID="txtCaptcha" Style="background-color: #FFE600; text-align: center;"
                                        runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="text-align: left;">
                        <asp:Button ID="btnInsert" runat="server"
                            CssClass="button button-contactForm"
                            Font-Names="Samim" Text="ارسال نظر" ValidationGroup="c" OnClientClick="return validateForm(this);" />

                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="txtCaptcha" />
    </Triggers>
</asp:UpdatePanel>


<!-- Modal - SubComment -->
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="row modal-header">
                <div class="col-6">
                    <h5 class="modal-title" id="exampleModalLabel">نظر شما</h5>
                </div>
                <div class="col-6 align-items-left close"><span data-dismiss="modal" aria-hidden="true">&times;</span></div>
            </div>
            <div class="modal-body">
                <div class="form-contact comment_form" action="#" id="subcommentForm">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <asp:TextBox
                                    placeholder="نام کامل ..."
                                    ID="txtNameSubComment" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <asp:TextBox
                                    placeholder="Email Address ..."
                                    Style="text-align: left !important; direction: ltr !important;"
                                    ID="txtEmailSubComment" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">

                                <asp:TextBox
                                    placeholder="پیام شما ..."
                                    ID="txtTextSubComment" runat="server"
                                    CssClass="form-control w-100" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-12">
                            <div style="border: 1px solid #ccc; width: 167px; margin-bottom: 5px;">
                                <div>
                                    <asp:Image Width="165" ID="ImgCaptcha2" runat="server"></asp:Image>
                                </div>
                                <div>
                                    <asp:TextBox ID="txtCaptchaSubComment" Style="background-color: #FFE600; text-align: center;"
                                        runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <asp:Button ID="btnInsertSubComment" runat="server"
                    CssClass="button button-contactForm"
                    Font-Names="Samim" Text="ارسال نظر" ValidationGroup="c"
                    OnClientClick="return validateFormSubComment(this);" />

            </div>
        </div>
    </div>
</div>
    </ContentTemplate>
</asp:UpdatePanel>


<script>
    function successAlert() {
        Swal.fire({
            position: "center",
            icon: "success",
            html: 'پیام شما با موفقیت ارسال گردید و پس از تایید توسط ادمین در اسرع وقت منتشر خواهد شد.',
            showConfirmButton: false,
            timer: 4000
        });
        $('#exampleModalCenter').modal('hide'); // Ensure the modal is closed
        $('.modal-backdrop').remove();
        $('body').removeClass('modal-open'); // Remove the modal-open class from body

    }
</script>
<script>
    function call(id) {
        $('#<%= HiddenFieldSubCommentId.ClientID %>').val(id);
        $("#exampleModalCenter").modal("show");
    }

</script>

<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function () {
        var textBoxes = [
            document.getElementById('<%= txtName.ClientID %>'),
            document.getElementById('<%= txtEmail.ClientID %>'),
            document.getElementById('<%= txtText.ClientID %>'),
            document.getElementById('<%= txtCaptcha.ClientID %>'),
            // Add more TextBox IDs here as needed
        ];

        textBoxes.forEach(function (textBox) {
            textBox.addEventListener('blur', function () {
                validateTextBox(textBox);
            });
        });
    });

    function validateTextBox(textBox) {
        if (textBox.id === '<%= txtEmail.ClientID %>') {
            // Email validation
            var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (!emailPattern.test(textBox.value.trim())) {
                textBox.classList.add('input-validation-error');
                return false;
            } else {
                textBox.classList.remove('input-validation-error');
                return true;
            }
        } else {
            // General validation for other textboxes
            if (textBox.value.trim() === '') {
                textBox.classList.add('input-validation-error');
                return false;
            } else {
                textBox.classList.remove('input-validation-error');
                return true;
            }
        }
    }

    function validateForm(sender) {

        var isValid = true;
        var textBoxes = [
            document.getElementById('<%= txtName.ClientID %>'),
            document.getElementById('<%= txtEmail.ClientID %>'),
            document.getElementById('<%= txtText.ClientID %>'),
            document.getElementById('<%= txtCaptcha.ClientID %>')
            // Add more TextBox IDs here as needed
        ];

        textBoxes.forEach(function (textBox) {
            if (!validateTextBox(textBox)) {
                isValid = false;
            }
        });

        if (isValid) disableButton(sender);

        return isValid;
    }
    function validateTextBoxSubComment(textBox) {
        if (textBox.id === '<%= txtEmailSubComment.ClientID %>') {
            // Email validation
            var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (!emailPattern.test(textBox.value.trim())) {
                textBox.classList.add('input-validation-error');
                return false;
            } else {
                textBox.classList.remove('input-validation-error');
                return true;
            }
        } else {
            // General validation for other textboxes
            if (textBox.value.trim() === '') {
                textBox.classList.add('input-validation-error');
                return false;
            } else {
                textBox.classList.remove('input-validation-error');
                return true;
            }
        }
    }
    function validateFormSubComment(sender) {
        var isValid = true;
        var textBoxes = [
            document.getElementById('<%= txtNameSubComment.ClientID %>'),
            document.getElementById('<%= txtEmailSubComment.ClientID %>'),
            document.getElementById('<%= txtTextSubComment.ClientID %>'),
            document.getElementById('<%= txtCaptchaSubComment.ClientID %>')
            // Add more TextBox IDs here as needed
        ];

        textBoxes.forEach(function (textBox) {
            if (!validateTextBoxSubComment(textBox)) {
                isValid = false;
            }
        });

        if (isValid) disableButton(sender);

        return isValid;
    }
</script>


<script type="text/javascript">
    function disableButton(button) {
        // Disable the button
        button.disabled = true;

        // Add the loading class to show the spinner
        button.classList.add('loading');

        // Optionally, change the button text to "Loading..."
        button.value = 'صبر کنید ...';

        // Ensure the form is submitted
        setTimeout(function () {
            __doPostBack(button.name, '');
        }, 50);

        // Prevent the default form submission to allow __doPostBack to handle it
        //return false;
    }
</script>




