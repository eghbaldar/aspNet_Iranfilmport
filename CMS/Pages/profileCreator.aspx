<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false"
    CodeFile="profileCreator.aspx.vb" Inherits="CMS_Pages_profileCreator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="HiddenFieldEmail" runat="server" />
    <asp:HiddenField ID="HiddenFieldR" runat="server" />
    <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <div style="padding:20px;direction:ltr;">
            <div>
                <asp:TextBox ID="txtEmailReg" style="direction:ltr;" runat="server" placeholder="Email..."></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtEmailReg" ID="RequiredFieldValidator7" runat="server"
                ValidationGroup="1"
                
                 ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:Button 
                ValidationGroup="1"
                ID="btnRegister" runat="server" Text="Finish step 1" />
            </div>
            <div>
                <asp:Label ID="lblNotify" runat="server"></asp:Label>
            </div>
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <div style="text-justify: inter-word; text-align: justify; text-align: right; direction: rtl;">
                <asp:Label ID="Label2" runat="server" Text="لینک کد فعالسازی صحیح می باشد." ForeColor="Green"></asp:Label>
                <table style="width: 100%;">
                    <tr>
                        <td>
                            ایمیل وارد شده:
                        </td>
                        <td>
                            <asp:Label ID="lblEmail" runat="server" Font-Italic="True" ForeColor="Black"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            نام:
                        </td>
                        <td>
                            <asp:TextBox CssClass="TXT" ID="txtName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtName"
                                ErrorMessage="*" ForeColor="Red" ValidationGroup="12"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            نام خانوادگی:
                        </td>
                        <td>
                            <asp:TextBox CssClass="TXT" ID="txtLastName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtLastName"
                                ErrorMessage="*" ForeColor="Red" ValidationGroup="12"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            سمت:
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
                        <td>
                            نام کاربری:
                        </td>
                        <td>
                            <asp:TextBox CssClass="TXT" Style="direction: ltr; text-align: left;" ID="txtUsername"
                                runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUsername"
                                ErrorMessage="*" ForeColor="Red" ValidationGroup="12"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            شماره موبایل:
                        </td>
                        <td>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="TXT" Style="direction: ltr; text-align: left;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPhone"
                                ErrorMessage="*" ForeColor="Red" ValidationGroup="12"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            کلمه عبور:
                        </td>
                        <td>
                            <asp:TextBox CssClass="TXT" Style="direction: ltr; text-align: left;" ID="txtPass1"
                                runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass1"
                                ErrorMessage="*" ForeColor="Red" ValidationGroup="12"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            تکرار کلمه عبور:
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
                                ValidationExpression="09(0[0-9]|1[0-9]|2[0-9]|3[0-9]|4[0-9]|5[0-9]|6[0-9]|7[0-9]|8[0-9]|9[0-9]|2[1-9])-?[0-9]{3}-?[0-9]{4}" ValidationGroup="12"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass1"
                                ControlToValidate="txtPass2" ErrorMessage="کلمه عبور یکسان نیست." Font-Names="tahoma"
                                Font-Size="11px" ForeColor="Red" ValidationGroup="12"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
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
        </asp:View>
    </asp:MultiView>
</asp:Content>
