<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="modalAdvert.aspx.vb" Inherits="CMS_Pages_modalAdvert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="TITLE" style="text-align: center; color: Black; font-size: 20px;">
        <h4>مودال تبلیغاتی تمام صفحات
        </h4>
    </div>
    <div>
        <div>
            <asp:TextBox ID="txtTitle" CssClass="txtFa"  placeholder="عنوان اصلی تبلیغ" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ControlToValidate="txtTitle"
                ErrorMessage="Mandatory"></asp:RequiredFieldValidator>
        </div>
        <div>
            <asp:TextBox ID="txtBlinkText" CssClass="txtFa"  placeholder="متن چشمک زن" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                ControlToValidate="txtBlinkText"
                ErrorMessage="Mandatory"></asp:RequiredFieldValidator>
        </div>
        <div>
            <asp:TextBox ID="txtSubTitle1" CssClass="txtFa"  placeholder="زیر متن شماره یک" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                ControlToValidate="txtSubTitle1"
                ErrorMessage="Mandatory"></asp:RequiredFieldValidator>
        </div>
        <div>
            <asp:TextBox ID="txtLinkSubTitle1" CssClass="txtEn"  placeholder="لینک زیر متن شماره یک" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                ControlToValidate="txtLinkSubTitle1"
                ErrorMessage="Mandatory"></asp:RequiredFieldValidator>
        </div>
        <div>
            <asp:TextBox ID="txtSubTitle2" 
                text="جهت مشاوره تلفنی (اینجا) کلیک/تاچ کنید."
                CssClass="txtFa"  placeholder="زیر متن شماره دو" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                ControlToValidate="txtSubTitle2"
                ErrorMessage="Mandatory"></asp:RequiredFieldValidator>
        </div>
        <div>
            <asp:TextBox ID="txtLinkSubTitle2" CssClass="txtEn" 
                text="tel: 09216343320"
                placeholder="لینک زیر متن شماره دو" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                ControlToValidate="txtLinkSubTitle2"
                ErrorMessage="Mandatory"></asp:RequiredFieldValidator>
        </div>
        #<asp:TextBox ID="txtColor" CssClass="txtEn"  placeholder="رنگ باکس" Text="ffe926" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                ControlToValidate="txtColor"
                ErrorMessage="Mandatory"></asp:RequiredFieldValidator>

    </div>
    <div>
        <asp:FileUpload ID="FileUpload" runat="server" />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                ControlToValidate="FileUpload"
                ErrorMessage="Mandatory"></asp:RequiredFieldValidator>
    </div>
   <div>
       <asp:Button  CssClass="tabBtn" ID="btnAdd" runat="server" Text="اضافه شود" />
   </div>
    <hr />
    <div>
        <asp:GridView ID="GridView" runat="server" 
            AutoGenerateColumns="false" DataSourceID="SqlDataSource" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="blinkText" HeaderText="blinkText" SortExpression="blinkText" />
                <asp:BoundField DataField="subTitle1" HeaderText="subTitle1" SortExpression="subTitle1" />
                <asp:BoundField DataField="LinkSubTitle1" HeaderText="LinkSubTitle1" SortExpression="LinkSubTitle1" />
                <asp:BoundField DataField="subTitle2" HeaderText="subTitle2" SortExpression="subTitle2" />
                <asp:BoundField DataField="LinkSubTitle2" HeaderText="LinkSubTitle2" SortExpression="LinkSubTitle2" />
                <asp:BoundField DataField="Color" HeaderText="Color" SortExpression="Color" />
                <asp:TemplateField HeaderText="Photo" SortExpression="Photo">
                    <ItemTemplate>
                        <a href='<%# Eval("photo", "../../files/uploadFiles/ModaAdvertisement/{0}") %>' target="_blank">
                            SEE
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="insertDate" HeaderText="insertDate" SortExpression="insertDate" />
                <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="blinkText" SortExpression="blinkText">
                    <ItemTemplate>
                       <asp:Button  CssClass="tabBtn" 
                           ValidationGroup="Edit"
                           ID="btnEnable" 
                           CommandArgument='<%# Eval("id") %>'
                           OnCommand="EnableThis" runat="server" Text="Enable This" />
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="blinkText" SortExpression="blinkText">
                    <ItemTemplate>

                          <asp:ImageButton Width="15"
                              Visible='<%# IIf(Eval("Enable", "{0}") = True, False, True) %>'
                              OnClientClick="return confirm('آیــــــــــا مطمئن هستید؟');"
                            ImageUrl="~/files/images/icons/delete.png" CommandArgument='<%# Eval("id") %>'
                            OnCommand="DeleteModalAdvertisement" ID="Image1Button1" runat="server" />

                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT * FROM [tbl_ModalAdvertisement] ORDER BY [insertDate] DESC"></asp:SqlDataSource>
    </div>
</asp:Content>

