<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false"
    CodeFile="msgTOusers.aspx.vb" Inherits="CMS_Pages_msgTOusers" %>

<%@ Register Src="../sendmsg.ascx" TagName="sendmsg" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="TITLE">
ارسال ایمیل بصورت آزاد
</div>

            <div>
            <asp:TextBox ID="txtSignleEmail" placeholder="eamil address ..." CssClass="txtEn"   runat="server"
            Width="633px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
            ControlToValidate="txtSignleEmail" ErrorMessage="*" ForeColor="Red" 
            ValidationGroup="8"></asp:RequiredFieldValidator>
            </div>
            <div>
            <asp:TextBox ID="txtSingleSubject"  placeholder="موضوع ..."  CssClass="txtFa"  runat="server" Width="399px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ControlToValidate="txtSingleSubject" ErrorMessage="*" ForeColor="Red" 
            ValidationGroup="8"></asp:RequiredFieldValidator>
            </div>
            <div>
            <asp:TextBox ID="txtSingleText"  CssClass="txtFa"  placeholder="متن ..."   runat="server" Height="121px" TextMode="MultiLine" 
            Width="633px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
            ControlToValidate="txtSingleText" ErrorMessage="*" ForeColor="Red" 
            ValidationGroup="8"></asp:RequiredFieldValidator>
            </div>
            <div>
            <asp:TextBox ID="txtSingleLink" CssClass="txtEn"   placeholder="link ..."  runat="server" Width="360px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
            ControlToValidate="txtSingleLink" ErrorMessage="*" ForeColor="Red" 
            ValidationGroup="8"></asp:RequiredFieldValidator>
            </div>
            <asp:Button ID="btnSingleSend" CssClass="tabBtn" runat="server"  Text="ارسال ایمیل" ValidationGroup="8" />


    <div class="TITLE">
        ارسال ایمیل انفرادی
    </div>
    <div>
        <asp:DropDownList CssClass="txtFa" ID="cmdEmail" runat="server" DataSourceID="SqlDataSource1" DataTextField="LastName"

            DataValueField="Email">
        </asp:DropDownList>
        <asp:Button CssClass="txtFa"  ID="btnshow" runat="server" Text="show" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT * FROM [tbl_ProfileCreator] ORDER BY [Id] DESC"></asp:SqlDataSource>
    </div>
    <div>
        <uc1:sendmsg ID="sendmsg1" runat="server" />
    </div>
    <div class="TITLE">
        ارسال ایمیل گروهی
    </div>
    <div>

        <table class="style1">
            <tr>
                <td>
                    عنوان ایمیل:</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtSubject"  CssClass="txtFa"  runat="server" Width="399px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtSubject" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="3"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    متن شما:</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtSendAll"  CssClass="txtFa"   runat="server" Height="121px" TextMode="MultiLine" 
                        Width="633px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtSendAll" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="3"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    لینک:</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtLink" CssClass="txtEn"   runat="server" Width="360px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtLink" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="3"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSendAll" CssClass="tabBtn" runat="server" 
                        Text="ارسال ایمیل به تمامی کاربرها" ValidationGroup="3" />
                </td>
            </tr>
        </table>

    </div>
</asp:Content>
