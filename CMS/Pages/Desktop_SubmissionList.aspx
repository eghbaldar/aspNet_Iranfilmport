<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="Desktop_SubmissionList.aspx.vb" Inherits="CMS_Pages_Desktop_SubmissionList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="TITLE">
        <h4>
            انتخاب پروژه
        </h4>
    </div>
    <div>
         <asp:DropDownList  CssClass="txtEn" ID="cmdProjects" runat="server" DataSourceID="SDS_Projects" 
             DataTextField="Film" DataValueField="ID" AutoPostBack="True">
         </asp:DropDownList>
         <asp:SqlDataSource ID="SDS_Projects" runat="server" 
             ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>" 
             SelectCommand="SELECT * FROM [tbFilms]"></asp:SqlDataSource>
         
    </div>
    <div class="TITLE">
        <h4>
            لیست تمام ثبت نامی ها
        </h4>
    </div>
    <div>

        <asp:GridView ID="DG_Submission" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataSourceID="SDS_Submission" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" Visible="False" />
                <asp:BoundField DataField="id_film" HeaderText="id_film" 
                    SortExpression="id_film" Visible="False" />
                <asp:BoundField DataField="recordnumber" HeaderText="recordnumber" 
                    SortExpression="recordnumber" />
                <asp:BoundField DataField="festival" HeaderText="festival" 
                    SortExpression="festival" />
                <asp:BoundField DataField="accept" HeaderText="accept" 
                    SortExpression="accept" />
                <asp:BoundField DataField="platforms" HeaderText="platforms" 
                    SortExpression="platforms" />
                <asp:BoundField DataField="notification" HeaderText="notification" 
                    SortExpression="notification" />
                <asp:BoundField DataField="Fee" HeaderText="Fee" SortExpression="Fee" />
                <asp:TemplateField HeaderText="website" SortExpression="website">
                    <ItemTemplate>
                    <a href='<%# "http:\\" & Eval("website") %>' target="_blank">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("website") %>'></asp:Label>
                    </a>                        
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="country" HeaderText="country" 
                    SortExpression="country" />
                <asp:BoundField DataField="date_of_entryData" HeaderText="date_of_entryData" 
                    SortExpression="date_of_entryData" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <EmptyDataTemplate>
                ثبت نامی برای این پروژه وجود ندارد.
            </EmptyDataTemplate>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS_Submission" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>" 
            SelectCommand="SELECT * FROM [tbSubmission] WHERE ([id_film] = @id_film) ORDER BY [id] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="cmdProjects" Name="id_film" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
        <div class="TITLE">
        <h4>
            لیست قبول شده ها
        </h4>
    </div>
    <div>

        <asp:GridView ID="DG_" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SDS_Accepted" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="recordnumber" HeaderText="recordnumber" 
                    SortExpression="recordnumber" />
                <asp:BoundField DataField="festival" HeaderText="festival" 
                    SortExpression="festival" />
                <asp:BoundField DataField="platforms" HeaderText="platforms" 
                    SortExpression="platforms" />
                <asp:TemplateField HeaderText="website" SortExpression="website">
                    <ItemTemplate>
                    <a href='<%# "http:\\" & Eval("website") %>' target="_blank">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("website") %>'></asp:Label>
                    </a>                        
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="country" HeaderText="country" 
                    SortExpression="country" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS_Accepted" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>" 
            SelectCommand="SELECT * FROM [tbSubmission] WHERE (([accept] = @accept) AND ([id_film] = @id_film))">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="accept" Type="Byte" />
                <asp:ControlParameter ControlID="cmdProjects" Name="id_film" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>

