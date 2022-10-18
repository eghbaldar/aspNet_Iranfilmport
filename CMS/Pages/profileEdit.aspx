<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false"
    CodeFile="profileEdit.aspx.vb" Inherits="CMS_Pages_profileEdit" %>

<%@ Register Src="../sendmsg.ascx" TagName="sendmsg" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .frame
        {
            padding: 10px;
            background-color: #ccc;
            margin-bottom: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="MultiView_Main" runat="server" ActiveViewIndex="0">
        <asp:View ID="Normal" runat="server">
            <asp:Panel ID="Pnl_Status" runat="server" Style="padding: 5px; text-align: center;">
                <asp:Button ID="btnConfirm" runat="server" Text="تایید پروفایل" Style="background-color: Green;
                    color: White; width: 200px; padding: 10px;font-family:Samim;" />
                <asp:Button ID="btnNotConfirm" runat="server" Text="پروفایل تائید نشده ولی باز است" Style="background-color: Orange;
                    color: White; width: 200px; padding: 10px;font-family:Samim;" />
                <asp:Button ID="btnDeny" runat="server" Text="رد پروفایل" Style="background-color: red;
                    color: White; width: 200px; padding: 10px;font-family:Samim;" />
                <asp:Button ID="btnForbiden" runat="server" Text="محروم کردن" Style="background-color: gray;
                    color: White; width: 200px; padding: 10px;font-family:Samim;" />
                     <asp:Button ID="btnNamad" runat="server" Text="نماد بگیر" Style="background-color: yellow;
                    color: black; width: 200px; padding: 10px;font-family:Samim;" />
                <div>
                <asp:CheckBox ID="chkEmail" Text="با انتخاب این گزینه یک ایمیل حاوی اطلاع از تغییر وضعیت ارسال خواهد شد" runat="server" />
                </div>
            </asp:Panel>
            <div class="row" style="font-family: Tahoma;">
                <div class="col-md-6">
                    <div class="frame">
                        <p style="font-family: Titr; font-size: 17px;">
                            تصویر پروفایل و هِدر پروفایل</p>
                        <div>
                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                        <asp:FileUpload CssClass="TXT_En" ID="File_Pic_Profile" runat="server" />
                                    </td>
                                    <td>
                                        <asp:FileUpload CssClass="TXT_En" ID="File_Pic_Header" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        بروزرسانی تصویر پروفایل
                                    </td>
                                    <td>
                                        بروزرسانی تصویر هِدر
                                    </td>
                                </tr>
                                <tr style="text-align: center;">
                                    <td>
                                        <asp:Image ID="img_Pic_Profile" runat="server" Width="150" />
                                    </td>
                                    <td>
                                        <asp:Image ID="img_Pic_Header" runat="server" Width="250" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <p style="font-size: 11px; color: Gray;">
                            این دو تصویر برای عموم قابل نمایش خواهند بود.</p>
                        <p style="font-size: 11px; color: red;">
                            پس از ارسال تصاویر پروفایل شما تا تائید کارشناسان معلق خواهد شد.</p>
                        <br />
                        <div style="text-align: left;">
                            <asp:Button ID="btnUpdatePicProfileHeader" OnClientClick="return confirm('پس از بروزرسانی تصاویر، پروفایل شما تا تائید کارشناسان معلق خواهد شد، آیا مطمئن هستید؟');"
                                CssClass="BTN" runat="server" Text="بروزرسانی" />
                        </div>
                    </div>
                    <div class="frame">
                        <p style="font-family: Titr; font-size: 17px;">
                            شماره همراه</p>
                        <div>
                            <asp:TextBox CssClass="TXT_En" ID="txtMobile" runat="server"></asp:TextBox>
                        </div>
                        <p style="font-size: 11px; color: Gray;">
                            شماره همراه خود به فرمت 0911111111 وارد کنید.</p>
                        <br />
                        <div style="text-align: left;">
                            <asp:Button ID="btnUpdateMobile" CssClass="BTN" runat="server" Text="بروزرسانی" />
                        </div>
                    </div>
                    <div class="frame">
                        <p style="font-family: Titr; font-size: 17px;">
                            مدارک شناسایی</p>
                        <div>
                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                        <asp:FileUpload CssClass="TXT_En" ID="File_Meli" runat="server" />
                                    </td>
                                    <td>
                                        <asp:FileUpload CssClass="TXT_En" ID="File_ShSh" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        تصویر کارت ملی
                                    </td>
                                    <td>
                                        تصویر شناسنامه
                                    </td>
                                </tr>
                                <tr style="text-align: center;">
                                    <td>
                                        <asp:Image ID="img_Meli" runat="server" Width="200" />
                                    </td>
                                    <td>
                                        <asp:Image ID="img_shsh" runat="server" Width="200" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <p style="font-size: 11px; color: Gray;">
                            با ارسال مدارک شناسایی خود، درگاه نماد اعتماد کاربر به شما اهدا خواهد کرد.</p>
                        <p style="font-size: 11px; color: red;">
                            پس از ارسال تصاویر پروفایل شما تا تائید کارشناسان معلق خواهد شد.</p>
                        <br />
                        <div style="text-align: left;">
                            <asp:Button ID="btnUpdateMeliShSh" CssClass="BTN" runat="server" Text="بروزرسانی" />
                        </div>
                    </div>
                    <div class="frame">
                        <p style="font-family: Titr; font-size: 17px;">
                            نام کاربری و کلمه عبور</p>
                        <div>
                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:CheckBox ID="chkAllowUser" runat="server" Font-Bold="False" Font-Names="tahoma" Font-Size="X-Small" Text="تغییر نام کاربری" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>نام کاربری: </td>
                                    <td>
                                        <asp:TextBox ID="txtUsername" runat="server" CssClass="TXT_En"></asp:TextBox>
                                        <asp:Label ID="lblCurrentUsername" runat="server" Font-Size="X-Small"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chkAllowPass" runat="server" Font-Bold="False" Font-Names="tahoma"
                                            Font-Size="X-Small" Text="تغییر کلمه عبور" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        کلمه عبور جدید:
                                    </td>
                                    <td>
                                        <asp:TextBox CssClass="TXT_En" ID="txtPass1" runat="server" TextMode="Password"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        تکرار کلمه عبور جدید:
                                    </td>
                                    <td>
                                        <asp:TextBox CssClass="TXT_En" ID="txtPass2" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass1"
                                            ControlToValidate="txtPass2" ErrorMessage="کلمه عبور یکسان نیست" Font-Size="X-Small"
                                            ForeColor="Red" ValidationGroup="30"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:Label ID="lblUserPassStatus" runat="server" Font-Size="X-Small" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <span>شما از طریق آدرس http://iranfilmport.com/username به صفحه اختصاصی خود در درگاه
                            فیلم ایران دسترسی خواهید داشت.</span>
                        <br />
                        <div style="text-align: left;">
                            <asp:Button ID="btnUsernamePassword" CssClass="BTN" runat="server" Text="بروزرسانی"
                                ValidationGroup="30" />
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="frame">
                        <div>
                            <p style="font-family: Titr; font-size: 17px;">
                                مشخصات اصلی</p>
                            <asp:Panel ID="P_Attribute" runat="server">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            نام:
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="TXT_Fa" ID="txtName" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            نام خانوادگی:
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="TXT_Fa" ID="txtLastname" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Name:
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="TXT_En" ID="txtNameEN" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Lastname:
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="TXT_En" ID="txtLastnameEN" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            سمت:
                                        </td>
                                        <td>
                                            <asp:DropDownList CssClass="TXT_Fa" ID="cmdType" runat="server" Style="padding: 6px;
                                                width: 160px;">
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
                                            بیوگرافی:
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="TXT_Fa" ID="txtBIO" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Biography:
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="TXT_En" ID="txtBioEN" runat="server" TextMode="MultiLine"
                                                Width="100%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            تاریخ تولد:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="cmd_Day" CssClass="TXT_En" runat="server">
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4</asp:ListItem>
                                                <asp:ListItem>5</asp:ListItem>
                                                <asp:ListItem>6</asp:ListItem>
                                                <asp:ListItem>7</asp:ListItem>
                                                <asp:ListItem>9</asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>11</asp:ListItem>
                                                <asp:ListItem>12</asp:ListItem>
                                                <asp:ListItem>13</asp:ListItem>
                                                <asp:ListItem>14</asp:ListItem>
                                                <asp:ListItem>15</asp:ListItem>
                                                <asp:ListItem>16</asp:ListItem>
                                                <asp:ListItem>17</asp:ListItem>
                                                <asp:ListItem>18</asp:ListItem>
                                                <asp:ListItem>19</asp:ListItem>
                                                <asp:ListItem>20</asp:ListItem>
                                                <asp:ListItem>21</asp:ListItem>
                                                <asp:ListItem>22</asp:ListItem>
                                                <asp:ListItem>23</asp:ListItem>
                                                <asp:ListItem>24</asp:ListItem>
                                                <asp:ListItem>25</asp:ListItem>
                                                <asp:ListItem>26</asp:ListItem>
                                                <asp:ListItem>27</asp:ListItem>
                                                <asp:ListItem>28</asp:ListItem>
                                                <asp:ListItem>29</asp:ListItem>
                                                <asp:ListItem>30</asp:ListItem>
                                                <asp:ListItem>31</asp:ListItem>
                                                <asp:ListItem></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="cmd_Month" CssClass="TXT_Fa" runat="server">
                                                <asp:ListItem Value="1">Jan</asp:ListItem>
                                                <asp:ListItem Value="2">Feb</asp:ListItem>
                                                <asp:ListItem Value="3">Mar</asp:ListItem>
                                                <asp:ListItem Value="4">Apr</asp:ListItem>
                                                <asp:ListItem Value="5">May</asp:ListItem>
                                                <asp:ListItem Value="6">Jun</asp:ListItem>
                                                <asp:ListItem Value="7">Jul</asp:ListItem>
                                                <asp:ListItem Value="8">Aug</asp:ListItem>
                                                <asp:ListItem Value="9">Sep</asp:ListItem>
                                                <asp:ListItem Value="10">Oct</asp:ListItem>
                                                <asp:ListItem Value="11">Nov</asp:ListItem>
                                                <asp:ListItem Value="12">Dec</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="cmd_Year" CssClass="TXT_Fa" runat="server">
                                                <asp:ListItem>1970</asp:ListItem>
                                                <asp:ListItem>1971</asp:ListItem>
                                                <asp:ListItem>1972</asp:ListItem>
                                                <asp:ListItem>1973</asp:ListItem>
                                                <asp:ListItem>1974</asp:ListItem>
                                                <asp:ListItem>1975</asp:ListItem>
                                                <asp:ListItem>1976</asp:ListItem>
                                                <asp:ListItem>1977</asp:ListItem>
                                                <asp:ListItem>1978</asp:ListItem>
                                                <asp:ListItem>1979</asp:ListItem>
                                                <asp:ListItem>1980</asp:ListItem>
                                                <asp:ListItem>1981</asp:ListItem>
                                                <asp:ListItem>1982</asp:ListItem>
                                                <asp:ListItem>1983</asp:ListItem>
                                                <asp:ListItem>1984</asp:ListItem>
                                                <asp:ListItem>1985</asp:ListItem>
                                                <asp:ListItem>1986</asp:ListItem>
                                                <asp:ListItem>1987</asp:ListItem>
                                                <asp:ListItem>1988</asp:ListItem>
                                                <asp:ListItem>1989</asp:ListItem>
                                                <asp:ListItem>1990</asp:ListItem>
                                                <asp:ListItem>1991</asp:ListItem>
                                                <asp:ListItem>1992</asp:ListItem>
                                                <asp:ListItem>1993</asp:ListItem>
                                                <asp:ListItem>1994</asp:ListItem>
                                                <asp:ListItem>1995</asp:ListItem>
                                                <asp:ListItem>1996</asp:ListItem>
                                                <asp:ListItem>1997</asp:ListItem>
                                                <asp:ListItem>1998</asp:ListItem>
                                                <asp:ListItem>1999</asp:ListItem>
                                                <asp:ListItem>2000</asp:ListItem>
                                                <asp:ListItem>2001</asp:ListItem>
                                                <asp:ListItem>2002</asp:ListItem>
                                                <asp:ListItem>2003</asp:ListItem>
                                                <asp:ListItem>2004</asp:ListItem>
                                                <asp:ListItem>2005</asp:ListItem>
                                                <asp:ListItem>2006</asp:ListItem>
                                                <asp:ListItem>2007</asp:ListItem>
                                                <asp:ListItem>2008</asp:ListItem>
                                                <asp:ListItem>2009</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            کشور:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="cmd_country" runat="server" CssClass="TXT_En" Style="padding: 6px;
                                                width: 160px;" DataSourceID="SDS_Country" DataTextField="name_en" DataValueField="ID">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SDS_Country" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                                                SelectCommand="SELECT * FROM [tbl_country] ORDER BY [name_en]"></asp:SqlDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            استان:
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="TXT_Fa" ID="txtState" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            شهر:
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="TXT_Fa" ID="txtCity" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            آدرس:
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="TXT_Fa" ID="txtAdress" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            نمایش شماره همراه:
                                        </td>
                                        <td>
                                            <asp:RadioButtonList ID="rbShowMobile" runat="server" Style="font-size: 12px;" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="1">نمایش داده شود</asp:ListItem>
                                                <asp:ListItem Value="0">نمایش داده نشود</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            نمایش ایمیل:
                                        </td>
                                        <td>
                                            <asp:RadioButtonList ID="rbShowEmail" runat="server" Style="font-size: 12px; font-weight: lighter;"
                                                RepeatDirection="Horizontal">
                                                <asp:ListItem Value="1">نمایش داده شود</asp:ListItem>
                                                <asp:ListItem Value="0">نمایش داده نشود</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            شماره ثابت:
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="TXT_En" ID="txtTell" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            مقطع تحصیلی:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="cmdDegree" runat="server" CssClass="TXT_Fa" Style="padding: 6px;
                                                width: 160px;">
                                                <asp:ListItem Value="0">زیر دیپلم</asp:ListItem>
                                                <asp:ListItem Value="1">دیپلم</asp:ListItem>
                                                <asp:ListItem Value="2">فوق دیپلم</asp:ListItem>
                                                <asp:ListItem Value="3">لیسانس</asp:ListItem>
                                                <asp:ListItem Value="4">فوق لیسانس</asp:ListItem>
                                                <asp:ListItem Value="5">دکتری</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            رشته تحصیلی:
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="TXT_Fa" ID="txtField" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Twitter ID:
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="TXT_En" ID="txtTW" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Instagram ID:
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="TXT_En" ID="txtInsta" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Facebok Link:
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="TXT_En" ID="txtFB" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            IMDb Link:
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="TXT_En" ID="txtIMDb" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            G+ Link:
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="TXT_En" ID="txtGPlus" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            وب سایت:
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="TXT_En" ID="txtWeb" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="بصورت http://site.site وارد شود."
                                                ControlToValidate="txtWeb" ForeColor="Red" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"
                                                ValidationGroup="1"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </div>
                        <p style="font-size: 11px; color: red;">
                            پس از بروزرسانی مشخصات، پروفایل شما تا تائید کارشناسان معلق خواهد شد.</p>
                        <br />
                        <div style="text-align: left;">
                            <asp:Button ID="btnUpdateAttributes" CssClass="BTN" 
                            OnClientClick="return confirm('پس از بروزرسانی مشخصات، پروفایل را فعال کنید');"
                                runat="server" Text="بروزرسانی" ValidationGroup="1" />
                        </div>
                    </div>
                </div>
            </div>
        </asp:View>
        <asp:View ID="MSG" runat="server">
            <uc1:sendmsg ID="sendmsg1" runat="server" />
            <asp:Button ID="btnBack" runat="server" Text="برگشت به فرم ها" />
        </asp:View>
    </asp:MultiView>
</asp:Content>
