<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false"
    CodeFile="profiles.aspx.vb" Inherits="CMS_Pages_profiles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--Copy in Clipboard--%>
    <script>
        function myFunction() {
            /* Get the text field */
            var copyText = document.getElementById("myInput");

            /* Select the text field */
            copyText.select();
            copyText.setSelectionRange(0, 999999999); /* For mobile devices */

            /* Copy the text inside the text field */
            document.execCommand("copy");

            /* Alert the copied text */
            alert("Copied the text: " + copyText.value);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="TITLE">
        آمار کلی
    </div>
    <div>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SDSStatistical"
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
            CellPadding="3">
            <Columns>
                <asp:BoundField DataField="کل فیلمسازان" HeaderText="کل فیلمسازان" ReadOnly="True"
                    SortExpression="کل فیلمسازان" />
                <asp:BoundField DataField="ثبت نام کنندگان امروز" HeaderText="ثبت نام کنندگان امروز"
                    ReadOnly="True" SortExpression="ثبت نام کنندگان امروز" />
                <asp:BoundField DataField="تائیده شده" HeaderText="تائیده شده" SortExpression="تائیده شده"
                    ReadOnly="True" />
                <asp:BoundField DataField="تائید نشده" HeaderText="تائید نشده" ReadOnly="True" SortExpression="تائید نشده" />
                <asp:BoundField DataField="محروم شده" HeaderText="محروم شده" ReadOnly="True" SortExpression="محروم شده" />
                <asp:BoundField DataField="نماد گرفته" HeaderText="نماد گرفته" ReadOnly="True" SortExpression="نماد گرفته" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDSStatistical" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="select * from vw_statisticalProfileStatus"></asp:SqlDataSource>
    </div>

        <div class="TITLE">
        جستجو براساس نام انگلیسی، فارسی و ایمیل</div>
    <div>


            <div>
            <asp:TextBox ID="txtSearchUsers" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="جستجو ..." />
                <asp:HiddenField ID="HiddenFieldSearchUsers" runat="server" />
        </div>



    <asp:GridView ID="DgSearch" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" DataSourceID="SDS_Search" ForeColor="#333333" GridLines="None" PageSize="5">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True"
                    SortExpression="Id" Visible="False" />
                <asp:TemplateField HeaderText="عکس پروفایل" SortExpression="Personalphoto">
                    <ItemTemplate>
                        <asp:Image ID="Label1" runat="server" ImageUrl='<%# getphoto(Eval("Personalphoto")) %>'
                            Width="50"></asp:Image>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="1">
                    <ItemTemplate>
                        <asp:Label ID="L1ab11el2" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                        <br />
                        <asp:Label ID="L1abel5" runat="server" Text='<%# Eval("mobile") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="نام کامل">
                    <ItemTemplate>
                        <asp:Label ID="L1abel2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        <br />
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="Username" HeaderText="نام کاربری" SortExpression="Username" />
                <asp:TemplateField HeaderText="کلمه عبور" SortExpression="Password">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# getPass(eval("Password")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="تاریخ ثبت نام" SortExpression="RegisterDate">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# getDate(Eval("RegisterDate")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="وضعیت" SortExpression="StatusUser">
                    <ItemTemplate>
                        <asp:Panel ID="Panel1" runat="server" Style="padding: 5px; color: White;" BackColor='<%# getBackStatus(eval("statususer")) %>'>
                            <asp:Label ID="Label4" runat="server" Text='<%# getStatus(eval("statususer")) %>'></asp:Label>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <a target="_blank" href='<%# ResolveUrl("~/filmmaker/"+Eval("username")) %>'>SEE
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div style="padding: 5px; background-color: Black; color: White;">
                            <a target="_blank" style="color: White;" href='<%# String.Format("profileEdit.aspx?id={0}&email={1}",Eval("id"),Eval("email")) %>'>
                                ویرایش </a>
                        </div>
                        <div style="padding: 5px; background-color: Lime; color: Black;">
                            <a target="_blank" style="color: Black;" href='<%# String.Format("ProfileInvoice.aspx?email={0}",Eval("email")) %>'>
                                صورتحساب و کیف پول</a>
                        </div>
                        <div style="padding: 5px; background-color: Yellow; color: Black;">
                            <a target="_blank" style="color: Black;" href='<%# String.Format("ProfileProject.aspx?email={0}",Eval("email")) %>'>
                                پروژه‌ها</a>
                        </div>
                                                <div style="padding: 5px; background-color: Pink; color: Black;">
                            <asp:LinkButton ID="btnSendInformationOfLogin"
                            OnCommand="SendInformationOfLogin"
                            CommandArgument='<%# Eval("email","{0}") + "|" + Eval("mobile","{0}") + "|" + Eval("username","{0}") + "|" + getPass(Eval("password","{0}")) %>'
                            runat="server">ارسال کد</asp:LinkButton>
                        </div>

                         <div style="padding: 5px; background-color: Red; color: white;">
                            <asp:LinkButton ID="LinkButton1"
                            ForeColor="White"
                            OnCommand="Login"
                            CommandArgument='<%# Eval("email","{0}") %>'
                            runat="server">Login ...</asp:LinkButton>
                         </div>


                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton OnCommand="delete" CommandArgument='<%# Eval("email","{0}") %>'
                            ImageUrl="~/files/images/icons/delete.png" OnClientClick="return confirm('sure?')"
                            ID="ImageButton1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="Green" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
            <asp:SqlDataSource ID="SDS_Search" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT id,email,name,username,statususer,RegisterDate,Password,Personalphoto,lastname,mobile FROM [tbl_ProfileCreator] where email like N'%' + @SearchUser + '%' UNION SELECT id,email,name,username,statususer,RegisterDate,Password,Personalphoto,lastname,mobile FROM [tbl_ProfileCreator] where name like N'%' + @SearchUser + '%' UNION SELECT id,email,name,username,statususer,RegisterDate,Password,Personalphoto,lastname,mobile FROM [tbl_ProfileCreator] where lastname like N'%' + @SearchUser + '%' UNION SELECT id,email,name,username,statususer,RegisterDate,Password,Personalphoto,lastname,mobile FROM [tbl_ProfileCreator] where username like N'%' + @SearchUser + '%'"
            >
                                                <SelectParameters>
                            <asp:ControlParameter ControlID="HiddenFieldSearchUsers" Type="String" Name="SearchUser" />
                        </SelectParameters> 

            </asp:SqlDataSource>










    </div>

    <div class="TITLE">
        ایجاد فیلمساز</div>
    <div>
        <asp:Button ID="btnProfileCreator" runat="server" Text="ایجاد" Width="100%" Font-Names="Samim" style="cursor:pointer;" />
    </div>
    <div class="TITLE">
        تمامی فیلمسازان</div>
    <div>
        <asp:GridView ID="GV_All" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" DataSourceID="SDS_All" ForeColor="#333333" GridLines="None" PageSize="5">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True"
                    SortExpression="Id" Visible="False" />
                <asp:TemplateField HeaderText="عکس پروفایل" SortExpression="Personalphoto">
                    <ItemTemplate>
                        <asp:Image ID="Label1" runat="server" ImageUrl='<%# getphoto(Eval("Personalphoto")) %>'
                            Width="50"></asp:Image>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="1">
                    <ItemTemplate>
                        <asp:Label ID="L1ab11el2" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                        <br />
                        <asp:Label ID="L1abel5" runat="server" Text='<%# Eval("mobile") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="نام کامل">
                    <ItemTemplate>
                        <asp:Label ID="L1abel2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        <br />
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="Username" HeaderText="نام کاربری" SortExpression="Username" />
                <asp:TemplateField HeaderText="کلمه عبور" SortExpression="Password">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# getPass(eval("Password")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="تاریخ ثبت نام" SortExpression="RegisterDate">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# getDate(Eval("RegisterDate")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="وضعیت" SortExpression="StatusUser">
                    <ItemTemplate>
                        <asp:Panel ID="Panel1" runat="server" Style="padding: 5px; color: White;" BackColor='<%# getBackStatus(eval("statususer")) %>'>
                            <asp:Label ID="Label4" runat="server" Text='<%# getStatus(eval("statususer")) %>'></asp:Label>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <a target="_blank" href='<%# ResolveUrl("~/filmmaker/"+Eval("username")) %>'>SEE
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div style="padding: 5px; background-color: Black; color: White;">
                            <a target="_blank" style="color: White;" href='<%# String.Format("profileEdit.aspx?id={0}&email={1}",Eval("id"),Eval("email")) %>'>
                                ویرایش </a>
                        </div>
                        <div style="padding: 5px; background-color: Lime; color: Black;">
                            <a target="_blank" style="color: Black;" href='<%# String.Format("ProfileInvoice.aspx?email={0}",Eval("email")) %>'>
                                صورتحساب و کیف پول</a>
                        </div>
                        <div style="padding: 5px; background-color: Yellow; color: Black;">
                            <a target="_blank" style="color: Black;" href='<%# String.Format("ProfileProject.aspx?email={0}",Eval("email")) %>'>
                                پروژه‌ها</a>
                        </div>

                        <div style="padding: 5px; background-color: Pink; color: Black;">
                            <asp:LinkButton ID="btnSendInformationOfLogin"
                            OnCommand="SendInformationOfLogin"
                            CommandArgument='<%# Eval("email","{0}") + "|" + Eval("mobile","{0}") + "|" + Eval("username","{0}") + "|" + getPass(Eval("password","{0}")) %>'
                            runat="server">ارسال کد</asp:LinkButton>
                        </div>

                         <div style="padding: 5px; background-color: Red; color: white;">
                            <asp:LinkButton ID="LinkButton1"
                            ForeColor="White"
                            OnCommand="Login"
                            CommandArgument='<%# Eval("email","{0}") %>'
                            runat="server">Login ...</asp:LinkButton>
                         </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton OnCommand="delete" CommandArgument='<%# Eval("email","{0}") %>'
                            ImageUrl="~/files/images/icons/delete.png" OnClientClick="return confirm('sure?')"
                            ID="ImageButton1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="Green" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS_All" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT * FROM [tbl_ProfileCreator] ORDER BY [Id] DESC"></asp:SqlDataSource>
    </div>
    <div class="TITLE">
        تائید نشده ها</div>
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2"
            DataSourceID="SDSNot" ForeColor="Black" GridLines="None" PageSize="5">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True"
                    SortExpression="Id" Visible="False" />
                <asp:TemplateField HeaderText="عکس پروفایل" SortExpression="Personalphoto">
                    <ItemTemplate>
                        <asp:Image ID="Label1" runat="server" ImageUrl='<%# getphoto(Eval("Personalphoto")) %>'
                            Width="50"></asp:Image>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Email" HeaderText="ایمیل" SortExpression="Email" />
                <asp:BoundField DataField="Name" HeaderText="نام" SortExpression="Name" />
                <asp:BoundField DataField="LastName" HeaderText="نام خانوادگی" SortExpression="LastName" />
                <asp:BoundField DataField="Username" HeaderText="نام کاربری" SortExpression="Username" />
                <asp:TemplateField HeaderText="کلمه عبور" SortExpression="Password">
                    <ItemTemplate>
                        <asp:Label ID="Lab12el2" runat="server" Text='<%# getPass(eval("Password")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="تاریخ ثبت نام" SortExpression="RegisterDate">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# getDate(Eval("RegisterDate")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="وضعیت" SortExpression="StatusUser">
                    <ItemTemplate>
                        <asp:Panel ID="Panel1" runat="server" Style="padding: 5px; color: White;" BackColor='<%# getBackStatus(eval("StatusUser")) %>'>
                            <asp:Label ID="Label4" runat="server" Text='<%# getStatus(eval("StatusUser")) %>'></asp:Label>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <a target="_blank" href='<%# ResolveUrl("~/filmmaker/"+Eval("username")) %>'>SEE
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div style="padding: 5px; background-color: Black; color: White;">
                            <a target="_blank" style="color: White;" href='<%# String.Format("profileEdit.aspx?id={0}&email={1}",Eval("id"),Eval("email")) %>'>
                                ویرایش </a>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Red" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDSNot" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT * FROM [tbl_ProfileCreator] where statususer=0 ORDER BY [Id] DESC">
        </asp:SqlDataSource>
    </div>
    <div class="TITLE">
        محروم شدگان
    </div>
<div>
        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" DataSourceID="SDS_Band" ForeColor="#333333" GridLines="None" PageSize="5">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True"
                    SortExpression="Id" Visible="False" />
                <asp:TemplateField HeaderText="عکس پروفایل" SortExpression="Personalphoto">
                    <ItemTemplate>
                        <asp:Image ID="Label1" runat="server" ImageUrl='<%# getphoto(Eval("Personalphoto")) %>'
                            Width="50"></asp:Image>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Email" HeaderText="ایمیل" SortExpression="Email" />
                <asp:BoundField DataField="Name" HeaderText="نام" SortExpression="Name" />
                <asp:BoundField DataField="LastName" HeaderText="نام خانوادگی" SortExpression="LastName" />
                <asp:BoundField DataField="Username" HeaderText="نام کاربری" SortExpression="Username" />
                <asp:TemplateField HeaderText="کلمه عبور" SortExpression="Password">
                    <ItemTemplate>
                        <asp:Label ID="La1bel2" runat="server" Text='<%# getPass(eval("Password")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="تاریخ ثبت نام" SortExpression="RegisterDate">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# getDate(Eval("RegisterDate")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="وضعیت" SortExpression="StatusUser">
                    <ItemTemplate>
                        <asp:Panel ID="Panel1" runat="server" Style="padding: 5px; color: White;" BackColor='<%# getBackStatus(eval("statususer")) %>'>
                            <asp:Label ID="Label4" runat="server" Text='<%# getStatus(eval("statususer")) %>'></asp:Label>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <a target="_blank" href='<%# ResolveUrl("~/filmmaker/"+Eval("username")) %>'>SEE
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div style="padding: 5px; background-color: Black; color: White;">
                            <a target="_blank" style="color: White;" href='<%# String.Format("profileEdit.aspx?id={0}&email={1}",Eval("id"),Eval("email")) %>'>
                                ویرایش </a>
                        </div>
                        <div style="padding: 5px; background-color: Lime; color: Black;">
                            <a target="_blank" style="color: Black;" href='<%# String.Format("ProfileInvoice.aspx?email={0}",Eval("email")) %>'>
                                صورتحساب و کیف پول</a>
                        </div>
                        <div style="padding: 5px; background-color: Yellow; color: Black;">
                            <a target="_blank" style="color: Black;" href='<%# String.Format("ProfileProject.aspx?email={0}",Eval("email")) %>'>
                                پروژه‌ها</a>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton OnCommand="delete" CommandArgument='<%# Eval("email","{0}") %>'
                            ImageUrl="~/files/images/icons/delete.png" OnClientClick="return confirm('sure?')"
                            ID="ImageButton1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="Green" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS_Band" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT * FROM [tbl_ProfileCreator] where StatusUser=2 ORDER BY [Id] DESC"></asp:SqlDataSource>
    </div>
        <div>
        <button onclick="myFunction()" style="font-family: Tahoma;">
            کپی متن</button>
        <br />
        <textarea name="w3review" id="myInput" rows="4" cols="50">
فیلمساز / فیلمنامه نویس عزیز، سلام
این پیام بصورت سیستمی از «درگاه فیلم ایران» برای شما ارسال شده است.

جهت افزایش سطح حرفه‌ای‌گری در پخش آثار و اهمیت رسانه سازی فیلمساز و فیلمنامه نویس، درگاه فیلم ایران، با استفاده از تجارب چنیدن ساله در امر رسانه و خبررسانی و نیز صرف هزینه ی بسیار بالا، سامانه اختصاصی مشتریان، که قبلا به اطلاع‌تان رسیده و مشخصات نام کاربری و کلمه عبور ارسال شده، را طراحی کرده و حال با راه اندازی صفحه اینترنتی اختصاصی شما، رسانه سازی را تکمیل کرده است. در این صفحه اختصاصی، همگان از طریق جستجوی گوگل با مشخصات فردی و آثار شما آشنا خواهند شد و به مرور و با تکمیل بانک اطلاعاتی فیلمسازان/فیلمنامه‌نویسان، این صفحات به عنوان بانک اطلاعاتی مرجع فیلمسازان/فیلمنامه‌نویسان در خواهد آمد. نمونه ی جهانی و معروف این سامانه سایت آمریکایی آی‌ام‌دی‌بی است.

جهت ورود به سامانه اینترنتی و اختصاصی‌تان، با مشخصات زیر و لینک درج شده در انتهای پیام اقدام کنید. در صورت بروز هرگونه مشکل، کارشناسان ما پاسخگوی شما خواهند بود.

با تشکر
واحد فنی درگاه فیلم ایران

</textarea>
    </div>
</asp:Content>
