<%@ Page Title="" Language="VB" MasterPageFile="~/dashboard/MasterDashboard.master"
    AutoEventWireup="false" ValidateRequest="false" CodeFile="Default.aspx.vb" Inherits="dashboard_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .ProfileHeaderTable
        {
            width: 100%;
        }
        @media (max-width: 767px)
        {
            cmd .TXT_En
            {
                width: 100%;
            }
            .TXT_Fa
            {
                width: 100%;
            }
            .ProfileHeaderTable .fr
            {
                text-align: right;
                font-family: Samim;
                direction: rtl;
                color: Black;
            }
            .ProfileHeaderTable
            {
                width: 100%;
            }
            /* Zebra striping */
            .ProfileHeaderTable tr:nth-of-type(odd)
            {
                background: #eee;
                color: Black;
            }
            .ProfileHeaderTable th
            {
                background: #333;
                color: white;
                font-weight: bold;
            }
            .ProfileHeaderTable td, th
            {
                padding: 6px;
                border: 1px solid #ccc;
                text-align: right;
                font-family: irsans;
            }
            .ProfileHeaderTable td
            {
                text-align: right;
                direction: rtl;
            }
        }
        @media only screen and (max-width: 760px), (min-device-width: 768px) and (max-device-width: 1024px)
        {
            /* Force table to not be like tables anymore */
            .ProfileHeaderTable, thead, tbody, th, td, tr
            {
                display: block;
            }
        
            /* Hide table headers (but not display: none;, for accessibility) */
            .ProfileHeaderTable thead tr
            {
                position: absolute;
                top: -9999px;
                left: -9999px;
            }
        
            .ProfileHeaderTable tr
            {
                border: 1px solid #ccc;
            }
        
            .ProfileHeaderTable td
            {
                /* Behave  like a "row" */
                border: none;
                border-bottom: 1px solid #eee;
                position: relative;
                font-family: irsans;
            }
        
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="direction: rtl; text-align: right;">
        <div class="row">
            <div class="col-md-12">
                <h4 class="page-head-line" style="font-family: Titr;">
                    اطلاعات حقیقی/حقوقی</h4>
            </div>
        </div>
        <%--<div class="row">
            <div class="col-md-12">
                <div class="alert alert-success" style="font-family: Samim;">
                    اطلاعات شخصی و حقوقی خود را به درستی پر کنید.
                </div>
            </div>
        </div>--%>
        <div class="row" style="font-family: Samim;">
            <div class="col-md-6">
                <div class="frame" style="text-align: center;">
                    <div>
                        <asp:Image ID="imgNamad" runat="server" /></div>
                    <div>
                        <asp:Label ID="lblNamad" runat="server" Text="Label"></asp:Label></div>
                    <div style="font-size: 11px;">
                        نماد اعتماد به معنای تائید هویت حقیقی یا حقوقی صاحب پروفایل می باشد. شما میتوانید
                        از طریق ارسال مدارک شناسایی خود در پایین صفحه اقدام به اخذ آن کنید.
                    </div>
                </div>
                <div class="frame">
                    <p style="font-family: Titr; font-size: 17px;">
                        تصویر پروفایل</p>
                    <div>
                        <table class="ProfileHeaderTable">
                            <tr>
                                <td>
                                </td>
                                <%--<td>
                                    <asp:FileUpload CssClass="TXT_En" ID="File_Pic_Header" runat="server" />
                                </td>--%>
                            </tr>
                            <tr>
                                <td style="font-size: 12px; text-align: center;">
                                    <asp:FileUpload ID="File_Pic_Profile" runat="server" />
                                    <span style="color: Red; font-size: 8px;">ابعداد تصویر حداکثر 250 در 250 پیکسل و حجم
                                        زیر 50 کلیوبایت باشد</span>
                                    <br />
                                    <asp:Button ID="btnUpdatePicProfile" OnClientClick="return confirm('پس از بروزرسانی این قسمت، پروفایل شما به حالت تعلیق در آمده و تا تائید پشتیبان درگاه فیلم ایران در دسترس نخواهد بود. آیا مطمئن هستید؟');"
                                        CssClass="BTN" runat="server" Text="بروزرسانی پروفایل" />
                                </td>
                                <%--  <td style="font-size: 12px; text-align: center;">
                                    بروزرسانی تصویر هِدر
                                    <br />
                                    <span style="color: Red; font-size: 8px;">ابعداد تصویر حداکثر 190 در 1050 پیکسل و حجم
                                        زیر 150 کلیوبایت باشد</span>
                                </td>--%>
                            </tr>
                            <tr style="text-align: center;">
                                <td>
                                    <br />
                                    <asp:Image ID="img_Pic_Profile" runat="server" Width="150" Style="border-radius: 50%;
                                        padding: 10px; border: 1px dotted #ccc;" />
                                </td>
                                <%--  <td>
                                    <asp:Image ID="img_Pic_Header" runat="server" Width="150px" />
                                </td>--%>
                            </tr>
                            <tr style="text-align: center;">
                                <td>
                                </td>
                                <%--<td>
                        <asp:Button ID="btnUpdatePicProfileHeader" CssClass="BTN" runat="server" 
                                        Text="بروزرسانی هِدِر" />
                                </td>--%>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div style="background-color: #ffd1d1; color: Red; font-size: 11px; padding: 5px;
                        text-align: center; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
                        border: 1px solid red;">
                        پس از ارسال تصاویر پروفایل شما تا تایید کارشناسان معلق خواهد شد.
                    </div>
                    <asp:Label ID="lblWarningSize" runat="server"></asp:Label>
                </div>
                <div class="frame" style="text-align: center;">
                    <p style="font-family: Titr; font-size: 17px; text-align: right;">
                        شماره همراه</p>
                    <div style="text-align: center;">
                        <asp:TextBox CssClass="TXT_En" Style="text-align: center;" ID="txtMobile" runat="server"></asp:TextBox>
                    </div>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtMobile"
                        ErrorMessage="فرمت صحیح: 09111111111" Font-Names="Samim" Font-Size="10px" ForeColor="Red"
                        ValidationExpression="09(0[0-9]|1[0-9]|3[0-9]|2[1-9])-?[0-9]{3}-?[0-9]{4}" ValidationGroup="400"></asp:RegularExpressionValidator>
                    <br />
                    <div style="text-align: center;">
                        <asp:Button ID="btnUpdateMobile" CssClass="BTN" runat="server" Text="بروزرسانی" ValidationGroup="400" />
                    </div>
                </div>
                <div class="frame" runat="server" id="PaneMadrak">
                    <p style="font-family: Titr; font-size: 17px;">
                        مدارک شناسایی</p>
                    <div>
                        <table style="width: 100%;">
                            <tr style="text-align: center;">
                                <td>
                                    تصویر کارت ملی<br />
                                    <span style="color: Red; font-size: 8px;">ابعداد تصویر حداکثر 250 در 250 پیکسل و حجم
                                        زیر 150 کلیوبایت باشد</span>
                                </td>
                                <td>
                                    تصویر شناسنامه<br />
                                    <span style="color: Red; font-size: 8px;">ابعداد تصویر حداکثر 250 در 1050 پیکسل و حجم
                                        زیر 150 کلیوبایت باشد</span>
                                </td>
                            </tr>
                            <tr style="text-align: center;">
                                <td>
                                    <asp:Image ID="img_Meli" runat="server" Width="70%" />
                                </td>
                                <td>
                                    <asp:Image ID="img_shsh" runat="server" Width="70%" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <asp:FileUpload CssClass="TXT_En" ID="File_Meli" runat="server" />
                                </td>
                                <td>
                                    <br />
                                    <asp:FileUpload CssClass="TXT_En" ID="File_ShSh" runat="server" />
                                </td>
                            </tr>
                            <tr style="text-align: center;">
                                <td>
                                    <asp:Button ID="btnUpdateMeli" CssClass="BTN" runat="server" Text="بروزرسانی" />
                                </td>
                                <td>
                                    <asp:Button ID="btnUpdateShSh" CssClass="BTN" runat="server" Text="بروزرسانی" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div style="background-color: #fffaaa; color: #898000; font-size: 11px; padding: 5px;
                        text-align: center; margin-bottom: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px;
                        border-radius: 5px; border: 1px solid #d3c500;">
                        جهت اخذ نماد اعتماد پروفایل، ارسال مدارک شناسایی الزامی است.
                    </div>
                    <div style="background-color: #ffd1d1; color: Red; font-size: 11px; padding: 5px;
                        text-align: center; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
                        border: 1px solid red;">
                        پس از ارسال تصاویر، پروفایل شما تا تایید کارشناسان معلق خواهد شد.
                    </div>
                    <asp:Label ID="lblwarningMeli" runat="server"></asp:Label>
                    <br />
                    <div style="text-align: center;">
                    </div>
                </div>
                <div class="frame" style="text-align: center;" runat="server" id="PaneLTruth">
                    <p style="font-family: Titr; font-size: 17px;">
                        نماد اعتماد درگاه
                    </p>
                    <div style="text-align: center; font-size: 12px; color: Green;">
                        <span>مدارک شما جهت اخذ نماد اعتماد در حال بررسی می باشد.</span>
                    </div>
                </div>
                <div class="frame">
                    <p style="font-family: Titr; font-size: 17px;">
                        نام کاربری و کلمه عبور</p>
                    <div>
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    نام کاربری:
                                </td>
                                <td>
                                    <asp:TextBox CssClass="TXT_En" ID="txtUsername" runat="server"></asp:TextBox>
                                    <asp:Label ID="lblCurrentUsername" runat="server" Font-Size="X-Small"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    کلمه عبور فعلی:
                                </td>
                                <td>
                                    <asp:TextBox CssClass="TXT_En" ID="txtCurrentPass" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCurrentPass"
                                        ErrorMessage="*" ForeColor="Red" ValidationGroup="30"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkAllowPass" runat="server" Font-Bold="False" Font-Names="Samim"
                                        Font-Size="X-Small" Text="فقط تغییر کلمه عبور" />
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
                    <span style="font-size: 12px;">
                        <asp:Label ID="lblProfileLink" runat="server"></asp:Label></span>
                    <br />
                    <div style="text-align: center;">
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
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    ایمیل وارد شده:
                                </td>
                                <td>
                                    <asp:TextBox CssClass="TXT_En" Enabled="false" ID="txtEmail" runat="server"></asp:TextBox>
                                </td>
                            </tr>
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
                                        <asp:ListItem Value="6">بازیگر</asp:ListItem>
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
                                        <asp:ListItem>1940</asp:ListItem>
                                        <asp:ListItem>1941</asp:ListItem>
                                        <asp:ListItem>1942</asp:ListItem>
                                        <asp:ListItem>1943</asp:ListItem>
                                        <asp:ListItem>1944</asp:ListItem>
                                        <asp:ListItem>1945</asp:ListItem>
                                        <asp:ListItem>1946</asp:ListItem>
                                        <asp:ListItem>1947</asp:ListItem>
                                        <asp:ListItem>1948</asp:ListItem>
                                        <asp:ListItem>1949</asp:ListItem>
                                        <asp:ListItem>1950</asp:ListItem>
                                        <asp:ListItem>1951</asp:ListItem>
                                        <asp:ListItem>1952</asp:ListItem>
                                        <asp:ListItem>1953</asp:ListItem>
                                        <asp:ListItem>1954</asp:ListItem>
                                        <asp:ListItem>1955</asp:ListItem>
                                        <asp:ListItem>1956</asp:ListItem>
                                        <asp:ListItem>1957</asp:ListItem>
                                        <asp:ListItem>1958</asp:ListItem>
                                        <asp:ListItem>1959</asp:ListItem>
                                        <asp:ListItem>1960</asp:ListItem>
                                        <asp:ListItem>1961</asp:ListItem>
                                        <asp:ListItem>1962</asp:ListItem>
                                        <asp:ListItem>1963</asp:ListItem>
                                        <asp:ListItem>1964</asp:ListItem>
                                        <asp:ListItem>1965</asp:ListItem>
                                        <asp:ListItem>1966</asp:ListItem>
                                        <asp:ListItem>1967</asp:ListItem>
                                        <asp:ListItem>1968</asp:ListItem>
                                        <asp:ListItem>1969</asp:ListItem>
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
                                    Facebok ID:
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
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="بصورت http://site.site وارد شود."
                                        ControlToValidate="txtIMDb" ForeColor="Red" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"
                                        ValidationGroup="1" Font-Size="X-Small"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    G+ Link:
                                </td>
                                <td>
                                    <asp:TextBox CssClass="TXT_En" ID="txtGPlus" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="بصورت http://site.site وارد شود."
                                        ControlToValidate="txtGPlus" ForeColor="Red" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"
                                        ValidationGroup="1" Font-Size="X-Small"></asp:RegularExpressionValidator>
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
                                        ValidationGroup="1" Font-Size="X-Small"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div style="text-align: center;">
                        <asp:Button ID="btnUpdateAttributes" CssClass="BTN" runat="server" Text="بروزرسانی"
                            OnClientClick="return confirm('پس از بروزرسانی این قسمت، پروفایل شما به حالت تعلیق در آمده و تا تائید پشتیبان درگاه فیلم ایران در دسترس نخواهد بود. آیا مطمئن هستید؟');"
                            ValidationGroup="1" />
                        <%--OnClientClick="return confirm('پس از بروزرسانی مشخصات، پروفایل شما تا تایید کارشناسان معلق خواهد شد، آیا مطمئن هستید؟');"--%>
                    </div>
                    <br />
                    <div style="background-color: #ffd1d1; color: Red; font-size: 11px; padding: 5px;
                        text-align: center; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
                        border: 1px solid red;">
                        پس از بروزرسانی مشخصات، پروفایل شما تا تایید کارشناسان معلق خواهد شد.
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
