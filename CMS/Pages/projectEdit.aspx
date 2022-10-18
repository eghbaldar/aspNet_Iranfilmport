<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false"
    CodeFile="projectEdit.aspx.vb" Inherits="CMS_Pages_projectEdit" %>

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
    <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="Normal" runat="server">
            <asp:Panel ID="pnl_status" runat="server" Style="text-align: center; padding: 10px;">
                <asp:Button ID="btnStatusProjectOK" runat="server" Text="تائید پروژه" Style="background-color: Green;
                    color: White; width: 300px; padding: 10px;"></asp:Button>
                <asp:Button ID="btnStatusProjectNok" runat="server" Text="رد پروژه" Style="background-color: red;
                    color: White; width: 300px; padding: 10px;"></asp:Button>
            </asp:Panel>
            <div class="row" style="font-family: Tahoma;">
                <div class="col-md-6">
                    <div class="frame">
                        <p style="font-family: Titr; font-size: 17px; padding: 10px;">
                            تصاویر پروژه</p>
                        <div>
                            <div style="margin-top: 5px;">
                                <asp:DataList ID="DL_Photos" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                                    BorderWidth="1px" CellPadding="2" DataSourceID="SDSphoto" ForeColor="Black" RepeatColumns="6"
                                    RepeatDirection="Horizontal">
                                    <AlternatingItemStyle BackColor="PaleGoldenrod" />
                                    <FooterStyle BackColor="Tan" />
                                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                    <ItemTemplate>
                                        <asp:Panel ID="Panel1" runat="server" Style="padding: 5px;" BackColor='<%# IIF(Eval("Status")=True,
                                        Drawing.color.green,
                                        Drawing.color.red) %>'>
                                            <table style="text-align: center;">
                                                <tr>
                                                    <td>
                                                        <a href='<%# Page.ResolveUrl(String.Format("~/files/uploadFiles/ProjectPhotos/{0}", Eval("File"))) %>'
                                                            target="_blank">
                                                            <asp:Image ID="Image1" Width="95" ImageUrl='<%# String.Format("~/files/uploadFiles/ProjectPhotos/{0}", Eval("File")) %>'
                                                                runat="server" />
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="statusLabel" runat="server" Text='<%# IIF(Eval("Status")=True,
                                        "تائید شده",
                                        "تائید نشده") %>' />
                                                        <asp:LinkButton ID="LinkButton1" Style="font-size: 10px; color: white;" OnCommand="DeletePhoto"
                                                            CommandArgument='<%# Eval("id","{0}") %>' OnClientClick="return confirm('مطمئن هستید؟');"
                                                            runat="server">(حذف)</asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="Button1" OnCommand="btnStatusOk" CommandArgument='<%# Eval("id","{0}") %>'
                                                            runat="server" Text="OK" Style="background-color: Green; color: White; width: 50px;
                                                            padding: 10px;" />
                                                        <asp:Button ID="Button2" OnCommand="btnStatusNOk" CommandArgument='<%# Eval("id","{0}") %>'
                                                            runat="server" Text="Nok" Style="background-color: red; color: White; width: 50px;
                                                            padding: 10px;" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </ItemTemplate>
                                    <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                </asp:DataList>
                                <asp:Button ID="btnSendConfirmationPhotos" runat="server" Text="ارسال تائیده برای کاربر به منظور تائید کلیه تصاویر" />
                                <asp:SqlDataSource ID="SDSphoto" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                                    SelectCommand="SELECT * FROM [tbl_Projects_photos] WHERE ([projectid] = @ID) ORDER BY [ID] DESC">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="ID" QueryStringField="id" Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                    <div class="frame">
                        <p style="font-family: Titr; font-size: 17px;">
                            نماد اعتماد درگاه
                        </p>
                        <div style="text-align: center;">
                            <asp:Image ID="imgTruth" Width="150" runat="server" />
                        </div>
                        <div style="text-align: center; font-size: 12px;">
                            <span>
                                <asp:Label ID="lblTruth" runat="server"></asp:Label></span>
                        </div>
                        <div>
                            <asp:Button ID="btnTruthOK" runat="server" Text="میدم" Style="background-color: Green;
                                color: White; width: 50px; padding: 10px;"></asp:Button>
                            <asp:Button ID="btnTruthNok" runat="server" Text="نمیدم" Style="background-color: red;
                                color: White; width: 50px; padding: 10px;"></asp:Button>
                        </div>
                    </div>
                    <div class="frame">
                        <p style="font-family: Titr; font-size: 17px;">
                            لینک فیلم</p>
                        <div>
                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                        لینک معتبر:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtLink" Width="300" Style="text-align: left" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        کلمه عبور (در صورت وجود):
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPass" Width="300" Style="text-align: left" CssClass="TXT_En"
                                            runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="frame">
                        <p style="font-family: Titr; font-size: 17px;">
                            بروزرسانی پروژه:</p>
                        <div>
                            <asp:MultiView ID="MultiView_FilmOrScript" runat="server" ActiveViewIndex="-1">
                                <asp:View ID="V_Film" runat="server">
                                    <div>
                                        <table style="width: 100%; font-size: 11px;">
                                            <tr>
                                                <td>
                                                    نام فیلم - فارسی:
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="TXT_Fa" ID="txt_Film_NameF" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_Film_NameF"
                                                        ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    نام فیلم - انگلیسی:
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="TXT_En" ID="txt_Film_NameEn" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_Film_NameEn"
                                                        ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    خلاصه داستان - فارسی:
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="TXT_Fa" Width="400" ID="txt_Film_summaryF" runat="server"
                                                        TextMode="MultiLine"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_Film_summaryF"
                                                        ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    خلاصه داستان - انگلیسی:
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="TXT_En" Width="400" ID="txt_Film_summaryEn" runat="server"
                                                        TextMode="MultiLine"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_Film_summaryEn"
                                                        ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    تاریخ تولید:
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
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    لینک مرتبط:
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="TXT_En" Width="400" ID="txt_Film_PageLink" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    کارگردان:
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="TXT_Fa" ID="txt_Film_Director" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_Film_Director"
                                                        ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    نویسنده:
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="TXT_Fa" ID="txt_Film_writer" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_Film_writer"
                                                        ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    تهیه کننده:
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="TXT_Fa" ID="txt_Film_producer" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txt_Film_producer"
                                                        ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    توضیحات و یا سایر عوامل:
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="TXT_Fa" Width="400" ID="txt_Film_castcrew" runat="server"
                                                        TextMode="MultiLine"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblStatusFilms" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div style="text-align: left;">
                                        <asp:Button ID="btnInsertFilm" CssClass="BTN" runat="server" Text="ایجاد پروژه" ValidationGroup="1" />
                                    </div>
                                </asp:View>
                                <asp:View ID="V_Screenplay" runat="server">
                                    <div>
                                        <table style="width: 100%; font-size: 11px;">
                                            <tr>
                                                <td>
                                                    نام فیلمنامه - فارسی:
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="TXT_Fa" ID="txt_Screenplay_NameF" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txt_Screenplay_NameF"
                                                        ErrorMessage="*" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    نام فیلمنامه - انگلیسی:
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="TXT_En" ID="txt_Screenplay_NameEn" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txt_Screenplay_NameEn"
                                                        ErrorMessage="*" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    خلاصه فیلمنامه - فارسی:
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="TXT_Fa" Width="400" ID="txt_Screenplay_summaryF" runat="server"
                                                        TextMode="MultiLine"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txt_Screenplay_summaryF"
                                                        ErrorMessage="*" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    خلاصه فیلمنامه - انگلیسی:
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="TXT_En" Width="400" ID="txt_Screenplay_summaryEn" runat="server"
                                                        TextMode="MultiLine"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txt_Screenplay_summaryEn"
                                                        ErrorMessage="*" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    نویسنده:
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="TXT_Fa" ID="txt_Screenplay_writer" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txt_Screenplay_writer"
                                                        ErrorMessage="*" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    توضیحات:
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="TXT_Fa" Width="400" ID="txt_Screenplay_detail" runat="server"
                                                        TextMode="MultiLine"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblStatusScreenplay" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div style="text-align: left;">
                                    </div>
                                </asp:View>
                            </asp:MultiView>
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
