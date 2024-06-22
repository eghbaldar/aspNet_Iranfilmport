<%@ Control Language="VB" AutoEventWireup="false" CodeFile="KingLoginModal.ascx.vb" Inherits="usercontrols_KingLoginModal" %>
<div class="modal fade" style="z-index: 99999;" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="row modal-header">
                <div class="col-6">
                    <h5 class="modal-title" id="exampleModalLabel">پنل‌های ورودی</h5>
                </div>
                <div class="col-6 align-items-left close"><span data-dismiss="modal" aria-hidden="true">&times;</span></div>
            </div>
            <div class="modal-body">
                <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                    <asp:View ID="Login" runat="server">
                        <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="login-form-content">
                                    <div class="login-form-header">
                                        <div class="logo mb-3">
                                            <a href="../">
                                                <img alt="درگاه فیلم ایران Iran Film Port" src='<%= Page.ResolveUrl("~/files/KingMaterials/imgs/logos/iranfilmport_movibeta_2.png") %>'
                                                    width="300" />
                                            </a>
                                        </div>
                                    </div>
                                    <asp:MultiView ID="MultiView_Logins" runat="server" ActiveViewIndex="0">
                                        <asp:View ID="ChoiceMenu" runat="server">
                                            <table style="width: 100%; text-align: center;">
                                                <tr>
                                                    <td>
                                                        <div class="btnChoicePanel">
                                                            <a href="http://iranfilmport.com/panel" target="_blank">
                                                                <asp:Image ID="ImageButton1" Width="110px" ImageUrl="~/files/images/icons/SpecialUsers.png"
                                                                    runat="server" CausesValidation="false" />
                                                            </a>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="btnChoicePanel">
                                                            <asp:ImageButton ID="btnSpecialUsers" Width="110px" ImageUrl="~/files/images/icons/RegularUsers.png"
                                                                runat="server" CausesValidation="false" />
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:View>
                                        <asp:View ID="SpecialUsers" runat="server">
                                            <form method="post" action="" class="login-form">
                                                <asp:Panel ID="P_Login" runat="server" Style="direction: ltr;">


                                                    <div class="input-group mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                                                        </div>
                                                        <asp:TextBox ID="txtEmail" Width="300" CssClass="form-control kingTextEn" placeholder="Email" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="input-group mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text"><i class="fa fa-lock"></i></span>
                                                        </div>
                                                        <asp:TextBox ID="txtPass" Width="300" CssClass="form-control kingTextEn" type="password" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                    </div>


                                                    <div style="direction: rtl; text-align: center;">
                                                        <p>
                                                            <asp:Label ID="lblLogin" runat="server" ForeColor="Red" Font-Size="12px"></asp:Label>
                                                        </p>
                                                        <p>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="فرمت ایمیل صحیح نمی باشد."
                                                                ControlToValidate="txtEmail" Font-Names="IranYekan" Font-Size="11px" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                                ForeColor="Red" ValidationGroup="20"></asp:RegularExpressionValidator>
                                                        </p>
                                                    </div>
                                                    
                                                    <div style="text-align:center;">
                                                        <asp:Button ID="btnLogin" runat="server" CssClass="button" Text="ورود" ValidationGroup="20"></asp:Button>
                                                    <br />
                                                    <asp:LinkButton ID="LinkForgotPassword" CssClass="forgot-password" Style="font-size: 11px;"
                                                        runat="server">
                کلمه عبور را فراموش کرده‌اید؟</asp:LinkButton>
                                                    </div>
                                                    
                                                    <hr />
                                                    <div runat="server" id="StatusOfRegister" style="direction: rtl; text-align: justify; color: Red; font-size: 10px;">
                                                        به دلیل تکمیل ظرفیت، تا اطلاع ثانوی ثبت نام مقدور نیست.
                                        <br />
                                                        لطفا با شماره <span style="color: Blue; font-size: 13px;">09216343320</span> تماس
                                        گرفته و در خصوص ارسال و پخش فیلم مشاوره بگیرید. همچنین میتوانید اطلاعات خود به ایمیل
                                        <a style="color: Blue; font-size: 12px;" href="mailto:support@iranfilmport.com">support@iranfilmport.com</a>
                                                        جهت بررسی ارسال کنید.
                                                    </div>
                                                    <asp:LinkButton ID="btnRegister" CssClass="register" runat="server">ثبت نام</asp:LinkButton>
                                                    </a>
                                                </asp:Panel>
                                                <asp:Panel ID="P_Register" runat="server" Visible="false" Style="direction: ltr;">
                                                    <div class="input-container">
                                                        <i class="fa fa-envelope"></i>
                                                        <asp:TextBox ID="txtEmailReg" Width="300" CssClass="input" placeholder="Email" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div style="direction: rtl; text-align: right; text-justify: inter-word; text-align: justify; font-size: 12px;">
                                                        <asp:Label ID="lblNotify" runat="server"></asp:Label>
                                                    </div>
                                                    <p style="text-align: right; direction: rtl;">
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="فرمت ایمیل صحیح نمی باشد."
                                                            ControlToValidate="txtEmailReg" Font-Names="tahoma" Font-Size="11px" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                            ForeColor="Red" ValidationGroup="22"></asp:RegularExpressionValidator>
                                                    </p>
                                                    <p style="text-align: right; direction: rtl;">
                                                        <asp:Label ID="lblRegister" runat="server" ForeColor="red" Font-Size="11px"></asp:Label>
                                                    </p>
                                                    <div runat="server" id="DivbtnSendMail">
                                                        <asp:Button ID="btnSendMail" runat="server" CssClass="button" Text="ارسال لینک کد ثبت نام"
                                                            ValidationGroup="22"></asp:Button>
                                                    </div>
                                                    <div runat="server" visible="false" id="DivbtnSendMailAgain">
                                                        <asp:Button ID="btnSendMailAgain" CssClass="button" runat="server" Text="ارسال دوباره لینک کد ثبت نام"></asp:Button>
                                                    </div>
                                                    <div>
                                                        <asp:LinkButton ID="btnBackToLoginPanel" CssClass="register" runat="server">بازگشت به صحفه ورود</asp:LinkButton>
                                                    </div>
                                                </asp:Panel>
                                                <asp:Panel ID="P_password" runat="server" Visible="false" Style="direction: ltr;">
                                                    <div class="input-container">
                                                        <i class="fa fa-envelope"></i>
                                                        <asp:TextBox ID="txtForgotPasword" Width="300" Style="text-align: left;" CssClass="input"
                                                            placeholder="Email" runat="server"></asp:TextBox>
                                                        <div style="direction: rtl; text-align: right; text-justify: inter-word; text-align: justify; font-size: 12px;">
                                                            <asp:Label ID="lblForgotPasword" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <asp:Button ID="btnSendPassToMail" runat="server" CssClass="button" Text="ارسال پسورد به ایمیل"
                                                            ValidationGroup="20"></asp:Button>
                                                    </div>
                                                    <div>
                                                        <asp:LinkButton ID="btnBacktoLogin2" CssClass="register" runat="server">بازگشت به صحفه ورود</asp:LinkButton>
                                                    </div>
                                                </asp:Panel>
                                            </form>
                                        </asp:View>
                                    </asp:MultiView>
                                    <asp:UpdateProgress runat="server">
                                        <ProgressTemplate>
                                            loading...
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </div>
                                <triggers>
                                <asp:PostBackTrigger  ControlID="btnSendMailAgain" EventName="Click"/>
                            </triggers>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:View>
                    <asp:View ID="Veri" runat="server">
                        <form method="post" action="" class="login-form">
                            <div class="login-form-content">
                                <div class="login-form-header">
                                    <div class="logo">
                                        <a href="../">
                                            <img alt="درگاه فیلم ایران Iran Film Port" src='<%= Page.ResolveUrl("~/files/images/logos/logo_3.png") %>'
                                                width="200" />
                                        </a>
                                    </div>
                                    <div>
                                        <h7>تایید لینک کد ارسال</h7>
                                    </div>
                                </div>
                                <asp:Panel ID="Pnl_Veri_not" runat="server" Visible="false">
                                    <div style="text-justify: inter-word; text-align: justify; direction: rtl;">
                                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="لینک کد فعالسازی شما صحیح نمی باشد. در صورت بررسی دوباره و عدم فعالسازی موضوع را با بخش پشتیبانی فنی درگاه در میان بگذارید."></asp:Label>
                                        <br />
                                        <a style="font-family: Samim;" href='<%= Page.ResolveUrl("~/تماس-با-درگاه-فیلم-ایران") %>'>تماس با واحدهای پشتیبانی</a>
                                </asp:Panel>
                                <asp:Panel ID="Pnl_Veri_ok" runat="server" Visible="false">
                                    <div style="text-justify: inter-word; text-align: justify; text-align: right; direction: rtl;">
                                        <asp:Label ID="Label2" runat="server" Text="لینک کد فعالسازی صحیح می باشد." ForeColor="Green"></asp:Label>
                                        <table style="width: 100%;">
                                            <tr>
                                                <td>ایمیل وارد شده:
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblEmail" runat="server" Font-Italic="True" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>نام:
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="TXT" ID="txtName" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtName"
                                                        ErrorMessage="*" ForeColor="Red" ValidationGroup="12"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>نام خانوادگی:
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="TXT" ID="txtLastName" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtLastName"
                                                        ErrorMessage="*" ForeColor="Red" ValidationGroup="12"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>سمت:
                                                </td>
                                                <td>
                                                    <asp:DropDownList CssClass="TXT" ID="cmdType" runat="server">
                                                        <asp:ListItem Value="1">کارگردان</asp:ListItem>
                                                        <asp:ListItem Value="2">تهیه کننده</asp:ListItem>
                                                        <asp:ListItem Value="3">پخش کننده</asp:ListItem>
                                                        <asp:ListItem Value="4">نماینده فیلم</asp:ListItem>
                                                        <asp:ListItem Value="5">شرکت مجری طرح</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>نام کاربری:
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="TXT" Style="direction: ltr; text-align: left;" ID="txtUsername"
                                                        runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUsername"
                                                        ErrorMessage="*" ForeColor="Red" ValidationGroup="12"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>شماره موبایل:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="TXT" Style="direction: ltr; text-align: left;"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPhone"
                                                        ErrorMessage="*" ForeColor="Red" ValidationGroup="12"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>کلمه عبور:
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="TXT" Style="direction: ltr; text-align: left;" ID="txtPass1"
                                                        runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass1"
                                                        ErrorMessage="*" ForeColor="Red" ValidationGroup="12"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>تکرار کلمه عبور:
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="TXT" Style="direction: ltr; text-align: left;" ID="txtPass2"
                                                        runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPass2"
                                                        ErrorMessage="*" ForeColor="Red" ValidationGroup="12"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPhone"
                                                        ErrorMessage="فرمت: 09111111111" Font-Names="tahoma" Font-Size="10px" ForeColor="Red"
                                                        ValidationExpression="09(0[0-9]|1[0-9]|2[0-9]|3[0-9]|4[0-9]|5[0-9]|6[0-9]|7[0-9]|8[0-9]|9[0-9]|2[1-9])-?[0-9]{3}-?[0-9]{4}"
                                                        ValidationGroup="12"></asp:RegularExpressionValidator>
                                                </td>
                                                <td>
                                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass1"
                                                        ControlToValidate="txtPass2" ErrorMessage="کلمه عبور یکسان نیست." Font-Names="tahoma"
                                                        Font-Size="11px" ForeColor="Red" ValidationGroup="12"></asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblStatus" runat="server" Font-Names="tahoma" Font-Size="Small" ForeColor="Red"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div>
                                        <asp:Button ID="btnUpdateVerification" runat="server" CssClass="button" Text="OK | ثبت"
                                            ValidationGroup="12"></asp:Button>
                                    </div>
                                </asp:Panel>
                            </div>
                    </asp:View>
                    <asp:View ID="YouAreLogon" runat="server">
                        <form method="post" action="" class="login-form">
                            <div class="login-form-content">
                                <div style="direction: rtl; text-align: right;">
                                    <p>
                                        شما قبلا وارد شده اید، از لینک زیر وارد حساب کاربری خود شوید.
                                    </p>
                                    <p>
                                        <a href="<%= ResolveUrl("~/dashboard") %>" style="text-decoration: none;">ورود به حساب
                            کاربری</a>
                                    </p>
                                    <p>
                                        <asp:LinkButton Style="font-family: IranYekan; font-size: 12px; font-weight: bold; color: Red;"
                                            ID="btnSignOut" runat="server">خروج از حساب کاربری</asp:LinkButton>
                                    </p>
                                </div>
                            </div>
                        </form>
                    </asp:View>
                </asp:MultiView>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">پنل اختصاصی</button>
                <button type="button" class="btn btn-primary">پنل کاربران عادی</button>
            </div>
        </div>
    </div>
</div>
