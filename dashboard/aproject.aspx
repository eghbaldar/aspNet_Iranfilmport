<%@ Page Title="" Language="VB" MasterPageFile="~/dashboard/MasterDashboard.master"
    AutoEventWireup="false" CodeFile="aproject.aspx.vb" Inherits="dashboard_aproject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="direction: rtl; text-align: right;">
        <div class="row">
            <div class="col-md-12">
                <div class="content-title">
                    <h1>
                        <asp:Label ID="lblProjectName" runat="server"></asp:Label></h1>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="alert alert-success" style="font-family: Samim;">
                    هشدار: به محض تکمیل اطلاعات پروژه خود، نسبت به ارسال آن اقدام کنید تا بغیر از اخذ
                    <a target="_blank" href="/نماد-اعتماد-درگاه-فیلم-ایران">نماد اعتماد درگاه فیلم ایران
                    </a>بتوانید از خدمات آن نیز استفاده کنید.
                </div>
            </div>
        </div>
        <div class="row" style="font-family: Samim;">
            <div class="col-md-6">
                <div class="frame" runat="server" id="Panel_Photo">
                    <div class="content-title">تصاویر پروژه</div>
                    <div>
                        <asp:MultiView ID="MultiView_Photo" runat="server" ActiveViewIndex="0">
                            <asp:View ID="View1" runat="server">
                                <div>
                                    <table style="width: 100%;" class="control-marging">
                                        <tr>
                                            <td>نوع تصویر:
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="cmdType" Visible="false" CssClass="form-control" runat="server">
                                                    <asp:ListItem Value="1">پوستر</asp:ListItem>
                                                    <asp:ListItem Value="2">عکس صحنه</asp:ListItem>
                                                    <asp:ListItem Value="3">عکس پشت صحنه</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="cmdTypeScript" Visible="false" CssClass="form-control" Style="padding: 10px; width: 200px;"
                                                    runat="server">
                                                    <asp:ListItem Value="1">کاور فیلمنامه</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>انتخاب تصویر:
                                            </td>
                                            <td>
                                                <asp:FileUpload CssClass="form-control" ID="FilePhoto" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <div class="alert alert-warning" role="alert">
                                                    <ul>
                                                        <li>ابعداد پوستر فیلم یا کاور فیلمنامه حداکثر 500 در 800 با حجمی کمتر از 150 کیلوبایت<br />
                                                        </li>
                                                        <li>ابعاد تصاویر پشت صحنه و صحنه 800 در 500 با حجمی کمتر از 150 کیلوبایت
                                                        </li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                              
                                                    <asp:Label ID="lblStatus" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div>
                                    <asp:Button ID="btnInsert" CssClass="button" runat="server" Text="ارسال تصویر" ValidationGroup="1" />
                                </div>
                                <br />
                                <div class="content-title">تصاویر وارد شده</div>
                                <div style="margin-top: 5px;">
                                    <asp:DataList ID="DL_Photos" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                                        BorderWidth="1px" CellPadding="2" DataSourceID="SDS_photos" ForeColor="Black"
                                        Width="100%"
                                        RepeatColumns="5" RepeatDirection="Horizontal">
                                        <AlternatingItemStyle BackColor="PaleGoldenrod" />
                                        <FooterStyle BackColor="Tan" />
                                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                        <ItemTemplate>
                                            <div style="padding: 5px;">
                                                <table style="text-align: center;">
                                                    <tr>
                                                        <td>
                                                            <asp:Image ID="Image1" Width="95" ImageUrl='<%# String.Format("~/files/uploadFiles/ProjectPhotos/{0}", Eval("File")) %>'
                                                                runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>

                                                            <asp:Label ID="statusLabel" runat="server" Text='<%# IIF(Eval("Status")=True,
                                        "تایید شده",
                                        "تایید نشده") %>' />
                                                            <asp:LinkButton ID="LinkButton1" Style="font-size: 10px; color: Red;" OnCommand="DeletePhoto"
                                                                CommandArgument='<%# Eval("id","{0}") %>' OnClientClick="return confirm('مطمئن هستید؟');"
                                                                runat="server">(حذف)</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </ItemTemplate>
                                        <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                    </asp:DataList>
                                    <asp:SqlDataSource ID="SDS_photos" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                                        SelectCommand="SELECT * FROM [tbl_Projects_photos] WHERE ([projectid] = @ID) ORDER BY [ID] DESC">
                                        <SelectParameters>
                                            <asp:RouteParameter Name="id" RouteKey="id" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </asp:View>
                            <asp:View ID="View2" runat="server">
                                <div class="alert alert-success" style="font-family: Samim; color: Red;">
                                    پروژه تایید نشده است.
                                </div>
                            </asp:View>
                        </asp:MultiView>
                    </div>
                    <br />
                    <div class="alert alert-warning" role="alert">
                        هر فیلم یا فیلمنامه جهت نمایش در پروفایل باید دارای تصویر پوستر (برای فیلم) یا تصویر کاور (فیلمنامه) باشد.
                    </div>
                </div>
                <div class="frame" runat="server" id="Panel_Truth">
                    <div class="content-title">نماد اعتماد درگاه</div>
                    <asp:MultiView ID="MultiView_Turth" runat="server" ActiveViewIndex="0">
                        <asp:View ID="View5" runat="server">
                            <div style="text-align: center;">
                                <asp:Image ID="imgTruth" Width="150" runat="server" />
                            </div>
                            <div class="alert alert-warning" role="alert">
                                <asp:Label ID="lblTruth" runat="server"></asp:Label>
                            </div>
                        </asp:View>
                        <asp:View ID="View6" runat="server">
                            <div class="alert alert-success" style="font-family: Samim; color: Red;">
                                پروژه تایید نشده است.
                            </div>
                        </asp:View>
                    </asp:MultiView>
                </div>
                <div class="frame">
                    <div class="content-title">ارسال فیلم یا فیلمنامه</div>
                    <asp:MultiView ID="MultiView_Link" runat="server" ActiveViewIndex="0">
                        <asp:View ID="View3" runat="server">
                            <div>
                                ارسال لینک Vimeo ، Dropbox ، Youtube و سایر آپلودسنترها
                            </div>
                            <div>
                                <table style="width: 100%;" class="control-marging">
                                    <tr>
                                        <td>لینک: 
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtLink"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="200"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLink" Width="300" CssClass="form-control enDirection" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>کلمه عبور (در صورت وجود):
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPass" Width="300" CssClass="form-control enDirection" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtLink"
                                    ErrorMessage="آدرس لینک وارد شده اشتباه می باشد" Font-Size="X-Small" ForeColor="Red"
                                    ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" ValidationGroup="200"></asp:RegularExpressionValidator>
                            </div>
                            <div>
                                <asp:Button ID="btnInsertLink" CssClass="button" runat="server" Text="ارسال لینک" ValidationGroup="200" />
                            </div>
                        </asp:View>
                        <asp:View ID="View4" runat="server">
                            <div class="alert alert-success" style="font-family: Samim; color: Red;">
                                پروژه تایید نشده است.
                            </div>
                        </asp:View>
                    </asp:MultiView>
                </div>
            </div>
            <div class="col-md-6">
                <div class="frame">
                    <div class="content-title">بروزرسانی پروژه</div>
                    <div>
                        <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="-1">
                            <asp:View ID="V_Film" runat="server">
                                <div>
                                    <table style="width: 100%; font-size: 11px;" class="control-marging">
                                        <tr>
                                            <td>نام فیلم - فارسی:   
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_Film_NameF"
                                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox CssClass="form-control" ID="txt_Film_NameF" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Project English Title:
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_Film_NameEn"
                                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox CssClass="form-control enDirection" ID="txt_Film_NameEn" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>خلاصه داستان - فارسی:                                                
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_Film_summaryF"
                                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox CssClass="form-control" Width="400" ID="txt_Film_summaryF" runat="server"
                                                    TextMode="MultiLine"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Project English Summary: 
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_Film_summaryEn"
                                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox CssClass="form-control" Width="400" ID="txt_Film_summaryEn" runat="server"
                                                    TextMode="MultiLine"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>تاریخ تولید:
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="cmd_Day" CssClass="form-control" runat="server">
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
                                                <asp:DropDownList ID="cmd_Month" CssClass="form-control" runat="server">
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
                                                <asp:DropDownList ID="cmd_Year" CssClass="form-control" runat="server">
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
                                                    <asp:ListItem>2010</asp:ListItem>
                                                    <asp:ListItem>2011</asp:ListItem>
                                                    <asp:ListItem>2012</asp:ListItem>
                                                    <asp:ListItem>2013</asp:ListItem>
                                                    <asp:ListItem>2014</asp:ListItem>
                                                    <asp:ListItem>2015</asp:ListItem>
                                                    <asp:ListItem>2016</asp:ListItem>
                                                    <asp:ListItem>2017</asp:ListItem>
                                                    <asp:ListItem>2018</asp:ListItem>
                                                    <asp:ListItem>2019</asp:ListItem>
                                                    <asp:ListItem>2020</asp:ListItem>
                                                    <asp:ListItem>2021</asp:ListItem>
                                                    <asp:ListItem>2022</asp:ListItem>
                                                    <asp:ListItem>2023</asp:ListItem>
                                                    <asp:ListItem>2024</asp:ListItem>
                                                    <asp:ListItem>2025</asp:ListItem>
                                                    <asp:ListItem>2026</asp:ListItem>
                                                    <asp:ListItem>2027</asp:ListItem>
                                                    <asp:ListItem>2028</asp:ListItem>
                                                    <asp:ListItem>2029</asp:ListItem>
                                                    <asp:ListItem>2030</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>لینک مرتبط: 
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt_Film_PageLink"
                                                    ErrorMessage="بصورت http://site.site وارد شود." Font-Size="X-Small" ForeColor="Red"
                                                    ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" ValidationGroup="1"></asp:RegularExpressionValidator>
                                            </td>

                                            <td>
                                                <asp:TextBox CssClass="form-control" Width="236px" ID="txt_Film_PageLink" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>کارگردان: 
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_Film_Director"
                                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox CssClass="form-control" ID="txt_Film_Director" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>نویسنده: 
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_Film_writer"
                                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox CssClass="form-control" ID="txt_Film_writer" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>تهیه کننده: 
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txt_Film_producer"
                                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox CssClass="form-control" ID="txt_Film_producer" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>توضیحات و یا سایر عوامل:
                                            </td>
                                            <td>
                                                <asp:TextBox CssClass="form-control" Width="400" ID="txt_Film_castcrew" runat="server"
                                                    TextMode="MultiLine"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;
                                            </td>
                                            <td>
                                                <asp:Label ID="lblStatusFilms" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div>
                                    <asp:Button ID="btnUpdateFilm" CssClass="button" runat="server" Text="ویرایش پروژه"
                                        ValidationGroup="1" />
                                </div>
                            </asp:View>
                            <asp:View ID="V_Screenplay" runat="server">
                                <div>
                                    <table style="width: 100%; font-size: 11px;" class="control-marging">
                                        <tr>
                                            <td>نام فیلمنامه - فارسی:
                                            </td>
                                            <td>
                                                <asp:TextBox CssClass="form-control" ID="txt_Screenplay_NameF" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txt_Screenplay_NameF"
                                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Project English  Title: 
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txt_Screenplay_NameEn"
                                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox CssClass="form-control enDirection" ID="txt_Screenplay_NameEn" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>خلاصه فیلمنامه - فارسی:                                                
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txt_Screenplay_summaryF"
                                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox CssClass="form-control" Width="400" ID="txt_Screenplay_summaryF" runat="server"
                                                    TextMode="MultiLine"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Project English Summary:  
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txt_Screenplay_summaryEn"
                                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox CssClass="form-control" Width="400" ID="txt_Screenplay_summaryEn" runat="server"
                                                    TextMode="MultiLine"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>نویسنده:  
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txt_Screenplay_writer"
                                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox CssClass="form-control" ID="txt_Screenplay_writer" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>توضیحات:
                                            </td>
                                            <td>
                                                <asp:TextBox CssClass="form-control" Width="400" ID="txt_Screenplay_detail" runat="server"
                                                    TextMode="MultiLine"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;
                                            </td>
                                            <td>
                                                <asp:Label ID="lblStatusScreenplay" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div style="text-align: left;">
                                    <asp:Button ID="btnUpdateScreenplay" CssClass="button" runat="server" Text="ویرایش پروژه"
                                        ValidationGroup="2" />
                                </div>
                            </asp:View>
                            <asp:View ID="V_suspend" runat="server">
                                <div class="alert alert-success" style="font-family: Samim; color: Red;">
                                    پروژه تایید نشده است.
                                </div>
                            </asp:View>
                        </asp:MultiView>
                    </div>
                </div>
                <div class="alert alert-danger" role="alert">
                    <div class="content-title">حذف پروژه</div>
                    <div style="text-align: center;">
                        <asp:Button ID="btnDeleteProject"
                            CssClass="button"
                            OnClientClick="return confirm('توجه: پس از حذف پروژه تمامی قسمت های مرتبط با آن از جمله Photos ، Information و Submissions ها نیز حذف خواهد شد. این بدین معنی است که هیچ اطلاعاتی قابل دسترس نخواهد بود. آیا پاک شدن این پروژه اطمینان کامل دارید؟');"
                            runat="server" Text="مایل هستم که این پروژه حذف شود" />
                    </div>
                    <p style="font-size: 10px; color: Red;">
                        توجه: پس از حذف پروژه تمامی قسمت های مرتبط با آن از جمله Photos ، Information و
                        Submissions ها نیز حذف خواهد شد.
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
