<%@ Page Title="" Language="VB" MasterPageFile="~/dashboard/MasterDashboard.master"
    AutoEventWireup="false" CodeFile="preCheckout.aspx.vb" Inherits="dashboard_preCheckout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .TXT
        {
            padding: 10px;
            font-family: irsans;
            margin: 4px;
            background-color: #e8e8e8;
            cursor: pointer;
        }
        .tb
        {
            width: 100%;
            font-family: irsans;
        }
        .tdR
        {
            width:20%;
        }
    </style>
    <script>
        function SURE(f, p, d) {
            if (confirm("این پروژه با مشخصات ددلاین جاری به این بخش از فستیوال ارسال شده است،آیا از ارسال مجدد آن مطمئن هستید؟")) {
                window.location.href = '../checkout/' + f + '/' + p + '/' + d;
            } else {
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager runat="server">
    </asp:ScriptManager>
    <div class="container" style="direction: rtl; text-align: right;">
        <div class="row">
            <div class="col-md-12">
                <h4 class="page-head-line" style="font-family: Titr;">
                    ارسال پروژه به فستیوال</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="alert alert-success" style="font-family: Samim;">
                    پروژه خود را انتخاب کنید و پس از ایجاد فاکتور و مشاهده دقیق پیش فاکتور، از طریق درگاه بانکی و یا کیف پول خود هزینه ارسال پروژه
                    را پرداخت کنید.
                </div>
            </div>
        </div>
        <asp:HiddenField ID="HiddenEmail" runat="server" />
        <div class="row">
            <div class="col-md-12">
                <asp:UpdatePanel id="UP" runat="server" UpdateMode="Conditional">
                    <contenttemplate>

                <div class="frame">
                    <table class="tb">
                        <tr>
                            <td class="tdR">
                                نام فستیوال:
                            </td>
                            <td class="tdL">
                                <asp:Label Style="font-family: irsans;" ID="lblFestival" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                انتخاب فیلم:
                            </td>
                            <td>
                                <asp:DropDownList ID="cmdFilms" CssClass="TXT" runat="server" DataSourceID="sqlFilms"
                               

                                    DataTextField="Column1" DataValueField="id" AutoPostBack="True">
                                               


                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sqlFilms" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                                    SelectCommand="SELECT id,[NameF]+' - '+[NameE] FROM [tbl_Projects] WHERE (([Email] = @Email) AND ([Status] = @Status)) ORDER BY [ID] DESC">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="HiddenEmail" Name="email" PropertyName="Value" Type="String" />
                                        <asp:Parameter DefaultValue="true" Name="Status" Type="Boolean" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:Label ID="lblTruth" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                انتخاب بخش فستیوال:
                            </td>
                            <td>
                                <asp:DropDownList ID="cmdSection" CssClass="TXT" runat="server" DataSourceID="SDS_Section"
                                    DataTextField="section" DataValueField="id" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SDS_Section" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                                    SelectCommand="

SELECT * FROM [tbl_festivalSections]
WHERE ([festivalID] = @festivalID)
AND [id] in 
(
select [sectionid] from dbo.tbl_festivalDeadline
where
festivalId=@festivalID
and 
sign(DATEDIFF(DAY, GETDATE(),[deadline]))=1
)


">
                                    <SelectParameters>
                                        <asp:RouteParameter Name="festivalID" RouteKey="festivalID" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                انتخاب ددلاین و مقدار ورودی:
                            </td>
                            <td>
                                <asp:DropDownList ID="cmdDeadline" CssClass="TXT" runat="server" DataSourceID="SDS_Deadline"
                                    DataTextField="DeadlineFee" DataValueField="id">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SDS_Deadline" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                                    SelectCommand="
SELECT *,(select dbo.MiladiTOShamsi(Convert(Date,deadline),'/'))
+' | ' + fee+'دلار ' as DeadlineFee
FROM [tbl_festivalDeadline] d WHERE (([festivalID] = @festivalID) AND ([sectionID] = @sectionID))
and 
sign(DATEDIFF(DAY, GETDATE(),[deadline]))=1
">
                                    <SelectParameters>
                                        <asp:RouteParameter Name="festivalID" RouteKey="festivalID" Type="Int64" />
                                        <asp:ControlParameter ControlID="cmdSection" Name="sectionID" PropertyName="SelectedValue"
                                            Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnSendToCheckout" CssClass="BTN" runat="server" Text="ایجاد فاکتور" />
                            </td>
                        </tr>
                        <tr>
                        <td></td>
                        <td> <asp:Label id="lblWarning" runat="server" ></asp:Label></td>
                        </tr>
                    </table>
                   
                </div>
                 
                 <asp:UpdateProgress runat="server">
             <ProgressTemplate>
             در حال بارگزاری ...</ProgressTemplate>
            </asp:UpdateProgress>

                 </contenttemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
