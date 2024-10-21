<%@ Page Title="" Language="VB" MasterPageFile="~/dashboard/MasterDashboard.master"
    AutoEventWireup="false" CodeFile="projects.aspx.vb" Inherits="dashboard_projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .ddd
        {
            direction: rtl;
            text-align: center;
            font-weight: normal;
            font-size: 11px;
            width: 70px;
            font-family: irsans;
            font-weight: bold;
        }
        table
        {
            width: 100%;
        }
        .tdd{width:30%;}
        @media (max-width: 767px)
        {
            .Header{display:none;}
            .form-control
            {
                width: 100%;
            }
            .form-control
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
        <asp:HiddenField ID="HiddenEmail" runat="server" />
        <div class="row">
            <div class="col-md-12">
                <div class="content-title">ایجاد صفحه فیلم و فیلمنامه</div>
            </div>
        </div>
        <div class="row" style="font-family: Samim;">

            <div class="col-md-12">
                <div class="frame">
                    <div class="content-title">ایجاد پروژه</div>
                    <div>
                        <table class="ProfileHeaderTable">
                            <tr>
                                <td>
                                    نوع پروژه:
                                </td>
                                <td style="width:90%;">
                                    <asp:DropDownList ID="cmd_type" CssClass="form-control" Style="width: 100%;"
                                        runat="server" AutoPostBack="True">
                                        <asp:ListItem Value="0">- نوع پروژه را انتخاب کنید - </asp:ListItem>
                                        <asp:ListItem Value="1">فیلم و ویدیو</asp:ListItem>
                                        <asp:ListItem Value="2">فیلمنامه</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br/>
                    <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="-1">
                        <asp:View ID="V_Film" runat="server">
                            <div>
                                <table class="ProfileHeaderTable control-marging">
                                    <tr>
                                        <td class="tdd">
                                            نام فیلم - فارسی: <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_Film_NameF"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="form-control" ID="txt_Film_NameF" runat="server"></asp:TextBox>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                          Film English Title: <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_Film_NameEn"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="form-control enDirection" ID="txt_Film_NameEn" runat="server"></asp:TextBox>                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            خلاصه داستان - فارسی: <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_Film_summaryF"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="form-control" Width="100%" ID="txt_Film_summaryF" runat="server"
                                                TextMode="MultiLine"></asp:TextBox>                                           
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                           Film English Summary:                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_Film_summaryEn"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="form-control enDirection" Width="100%" ID="txt_Film_summaryEn" runat="server"
                                                TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            تاریخ تولید:
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
                                        <td>
                                            لینک مرتبط:   <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt_Film_PageLink"
                                                ErrorMessage="بصورت http://site.site وارد شود." Font-Size="X-Small" ForeColor="Red"
                                                ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" ValidationGroup="1"></asp:RegularExpressionValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="form-control" Width="214px" ID="txt_Film_PageLink" runat="server"></asp:TextBox>
                                          
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            کارگردان: <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_Film_Director"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="form-control" ID="txt_Film_Director" runat="server"></asp:TextBox>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            نویسنده:  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_Film_writer"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="form-control" ID="txt_Film_writer" runat="server"></asp:TextBox>
                                           
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            تهیه کننده: <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txt_Film_producer"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="form-control" ID="txt_Film_producer" runat="server"></asp:TextBox>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            توضیحات و یا سایر عوامل:
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="form-control" Width="100%" ID="txt_Film_castcrew" runat="server"
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
                            <div>
                                <asp:Button ID="btnInsertFilm" CssClass="button" runat="server" Text="ایجاد پروژه" ValidationGroup="1" />
                            </div>
                        </asp:View>
                        <asp:View ID="V_Screenplay" runat="server">
                            <div>
                                <table class="ProfileHeaderTable control-marging">
                                    <tr>
                                        <td class="tdd">
                                            نام فیلمنامه - فارسی:  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txt_Screenplay_NameF"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="form-control" ID="txt_Screenplay_NameF" runat="server"></asp:TextBox>
                                           
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                           Script English Title: <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txt_Screenplay_NameEn"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="form-control enDirection" ID="txt_Screenplay_NameEn"  runat="server"></asp:TextBox>                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            خلاصه فیلمنامه - فارسی: <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txt_Screenplay_summaryF"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="form-control" Width="100%" ID="txt_Screenplay_summaryF" runat="server"
                                                TextMode="MultiLine"></asp:TextBox>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        Script English Summary: <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txt_Screenplay_summaryEn"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="form-control enDirection" Width="100%" ID="txt_Screenplay_summaryEn" runat="server"
                                                TextMode="MultiLine"></asp:TextBox>                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            نویسنده:   <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txt_Screenplay_writer"
                                                ErrorMessage="*" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="form-control"  ID="txt_Screenplay_writer" runat="server"></asp:TextBox>
                                          
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            توضیحات:
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="form-control" Width="100%" ID="txt_Screenplay_detail" runat="server"
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
                            <div>
                                <asp:Button ID="btnInsertScreenplay" CssClass="button" runat="server" Text="ایجاد پروژه"
                                    ValidationGroup="2" />
                            </div>
                        </asp:View>
                    </asp:MultiView>
                </div>
            </div>
                        <div class="col-md-12">
                <div class="frame">
                    <p style="font-family: Titr; font-size: 17px;">
                        لیست پروژه‌ها</p>
                    <div>
                        <asp:GridView ID="GV" runat="server" BackColor="White" HeaderStyle-CssClass="Header" BorderColor="#DEDFDE" BorderWidth="1px"
                            CellPadding="4" ForeColor="Black" GridLines="None" Style="direction: rtl; text-align: right;"
                            AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SDS_show" Font-Size="Small"
                            BorderStyle="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="کد پروژه" InsertVisible="False" HeaderStyle-CssClass="ddd"
                                    ReadOnly="True" SortExpression="ID" HeaderStyle-Width="50">
                                    <HeaderStyle CssClass="ddd"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="type" HeaderText="نوع پروژه" ReadOnly="True" 
                                    HeaderStyle-CssClass="ddd"
                                    SortExpression="type" HeaderStyle-HorizontalAlign="right">
                                    <HeaderStyle HorizontalAlign="Right" CssClass="ddd"></HeaderStyle>
                                    <ItemStyle Width="80px" HorizontalAlign="center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="NameF" HeaderText="نام پروژه" SortExpression="NameF" HeaderStyle-CssClass="ddd">
                                    <HeaderStyle CssClass="ddd"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="center" Width="100" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="وضعیت" SortExpression="Status" HeaderStyle-CssClass="ddd">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" ImageUrl='<%# IIF(Eval("Status")=True,
                                        "~/dashboard/assets/img/tick.png",
                                        "~/dashboard/assets/img/suspend.png") %>' Width="35" runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="ddd"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="نماد" SortExpression="Truth" HeaderStyle-CssClass="ddd">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" ImageUrl='<%# IIF(Eval("Truth")=True,
                                        "~/dashboard/assets/img/tick.png",
                                        "~/dashboard/assets/img/suspend.png") %>' Width="35" runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="ddd"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="جزییات" SortExpression="Truth" HeaderStyle-CssClass="ddd">
                                    <ItemTemplate>
                                        <a href='<%# ResolveUrl(String.Format("user/me/aproject/{0}", Eval("id"))) %>'>تصاویر فیلم و فیلمنامه
                                        </a>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="ddd"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="center"  Width="120"/>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                پروژه ای وجود ندارد.
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#ECCE01" Font-Bold="True" ForeColor="Black" HorizontalAlign="Right"
                                VerticalAlign="Middle" Font-Names="irsans" Wrap="True" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" />
                            <SelectedRowStyle BackColor="#CE5D5A" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FBFBF2" />
                            <SortedAscendingHeaderStyle BackColor="#848384" />
                            <SortedDescendingCellStyle BackColor="#EAEAD3" />
                            <SortedDescendingHeaderStyle BackColor="#575357" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SDS_show" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                            SelectCommand="exec sp_dash_ShowProjects @email">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="HiddenEmail" Name="email" PropertyName="Value" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
