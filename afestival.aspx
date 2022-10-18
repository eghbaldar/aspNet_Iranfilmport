<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false"
    CodeFile="aFestival.aspx.vb" Inherits="aFestival" %>

<%@ Register Src="usercontrols/banners_right.ascx" TagName="banners_right" TagPrefix="uc1" %>
<%@ Register Src="usercontrols/comment.ascx" TagName="comment" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <asp:PlaceHolder runat="server" id="pc"></asp:PlaceHolder>
    <style>
        @font-face
        {
            font-family: 'NazaninB';
            src: url(../../files/font/NAZANB.TTF);
        }
        @font-face
        {
            font-family: 'Titr';
            src: url(../../files//font/TITRBD.TTF);
        }
        @font-face
        {
            font-family: 'koodak';
            src: url(../../files//font/KoodakBold.ttf);
        }
        .IMG
        {
            width: 200px;
            -moz-border-radius: 15px;
            -webkit-border-radius: 15px;
            border-radius: 15px;
            border: 1px solid #ccc;
        }
        .btn
        {
            padding: 10px;
            border: 1px solid #ccc;
            background-color: #48BDC5;
            cursor: pointer;
            font-family: Samim;
            color: White;
            font-size: 14px;
        }
        .btn:hover
        {
            background-color: #E5DA00;
            color: Black;
        }
        .DivOpenClosed
        {
            padding: 5px;
            border: 1px solid #ccc;
            font-family: Samim;
            color: White;
            font-size: 14px;
            width: 100%;
            font-style: italic;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }
        .DivLeft
        {
            padding-top: 20px;
            width: 250px;
            font-family: irsans;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 11px;
            margin-right: 5px;
            width: 300px;
        }
        .DivLeft:hover
        {
            box-shadow: 1px 1px 15px 5px #e4e4e4;
        }
        .DivRight
        {
            padding: 5px; /*box-shadow: 1px 1px 15px 2px #e4e4e4;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;*/
            border: 1px solid #ccc;
            border-radius: 4px;
            margin: 7px;
            width: 100%;
        }
        .DivRight:hover
        {
            box-shadow: 1px 1px 15px 5px #e4e4e4;
        }
        .divGenre
        {
            color: #848484;
            padding: 7px;
            background-color: #e9e9e9;
            font-style: italic;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            font-family: tahoma;
        }
    </style>
    <style>
        .T .fr
        {
            direction: rtl;
            text-align: right;
            font-family: Samim;
        }
        .T
        {
            width: 100%;
            border-collapse: collapse;
            direction: rtl;
        }
        /* Zebra striping */
        .T tr:nth-of-type(odd)
        {
            /*background: #eee;*/
        }
        .T th
        {
            background: #333;
            color: white;
            font-weight: bold;
        }
        .T td, th
        {
            padding: 6px;
            text-align: right;
        }
        @media only screen and (max-width: 760px), (min-device-width: 768px) and (max-device-width: 1024px)
        {
            .btn
            {
                width: 100%;
            }
            .IMG
            {
                width: 100%;
            }
            .DivRight
            {
                width: 100%;
            }
            .DivLeft
            {
                width: 100%;
            }
            .txt
            {
                width: 100%;
            }
            /* Force table to not be like tables anymore */
            .T, .T thead, .T tbody, .T th, .T td, .T tr
            {
                display: block;
            }
        
            /* Hide table headers (but not display: none;, for accessibility) */
            .T thead tr
            {
                position: absolute;
                top: -9999px;
                left: -9999px;
            }
        
            .T tr
            {
                /*border: 1px solid #ccc;*/
            }
        
            .T td
            {
                /* Behave  like a "row" */
                border: none;
                position: relative;
            }
        
        }
    </style>
    <style>
        /* Style the buttons that are used to open and close the accordion panel */
        .accordion
        {
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            color: #444;
            cursor: pointer;
            padding: 18px;
            text-align: right;
            border: none;
            outline: none;
            transition: 0.4s;
            border: 1px solid #ccc;
            width: 100%; /* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#ffffff+1,f9f9f9+100 */
            background: rgb(255,255,255); /* Old browsers */
            background: -moz-linear-gradient(top, rgba(255,255,255,1) 1%, rgba(249,249,249,1) 100%); /* FF3.6-15 */
            background: -webkit-linear-gradient(top, rgba(255,255,255,1) 1%,rgba(249,249,249,1) 100%); /* Chrome10-25,Safari5.1-6 */
            background: linear-gradient(to bottom, rgba(255,255,255,1) 1%,rgba(249,249,249,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#f9f9f9',GradientType=0 ); /* IE6-9 */
        }
        
        /* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
        .active, .accordion:hover
        {
            /* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#ffffff+0,edf9ff+100 */
            background: rgb(255,255,255); /* Old browsers */
            background: -moz-linear-gradient(top, rgba(255,255,255,1) 0%, rgba(237,249,255,1) 100%); /* FF3.6-15 */
            background: -webkit-linear-gradient(top, rgba(255,255,255,1) 0%,rgba(237,249,255,1) 100%); /* Chrome10-25,Safari5.1-6 */
            background: linear-gradient(to bottom, rgba(255,255,255,1) 0%,rgba(237,249,255,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#edf9ff',GradientType=0 ); /* IE6-9 */
            color: #000;
        }
        
        /* Style the accordion panel. Note: hidden by default */
        .panel
        {
            padding: 0 18px;
            background-color: white;
            border: 1px solid #ccc;
            width: 100%;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.2s ease-out; /* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#ffffff+1,f9f9f9+100 */
            background: rgb(255,255,255); /* Old browsers */
            background: -moz-linear-gradient(top, rgba(255,255,255,1) 1%, rgba(249,249,249,1) 100%); /* FF3.6-15 */
            background: -webkit-linear-gradient(top, rgba(255,255,255,1) 1%,rgba(249,249,249,1) 100%); /* Chrome10-25,Safari5.1-6 */
            background: linear-gradient(to bottom, rgba(255,255,255,1) 1%,rgba(249,249,249,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#f9f9f9',GradientType=0 ); /* IE6-9 */
        }
        .accordion:after
        {
            content: '+'; /* Unicode character for "plus" sign (+) */
            font-size: 13px;
            color: #848484;
            float: right;
            margin-left: 5px;
        }
        
        .active:after
        {
            content: '-'; /* Unicode character for "minus" sign (-) */
            font-size: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="direction: rtl; text-align: right; padding-top: 20px;">
        <div style="padding-top: 5px; padding-bottom: 5px;">
            <div class="col-md-12 col-sm-12 col-xs-12" style="padding-bottom: 5px;">
                <asp:DataList ID="DataList1" CssClass="DLcss" runat="server" DataSourceID="SDS" Width="100%">
                    <ItemTemplate>
                        <table class="T">
                            <tr>
                                <td style="vertical-align: top;">
                                    <div class="DivRight">
                                        <div style="font-family: koodak; color: Black; text-justify: inter-word; text-align: justify;
                                            font-size: 12px; padding: 5px; margin-bottom: 5px; margin-top: 5px;">
                                            <table class="T">
                                                <tr>
                                                    <td style="vertical-align: top; text-align: center;">
                                                        <asp:Image CssClass="IMG" ID="Image1" AlternateText='<%# Eval("title_fa").Replace("ي", "ی") %>'
                                                            ImageUrl='<%# String.Format("~/files/uploadFiles/festival/{0}", Eval("logo")) %>'
                                                            runat="server" />
                                                        <div>
                                                            <span>
                                                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("counter") %>'></asp:Label></span>
                                                            <span>
                                                                <asp:Image ImageUrl="~/files/images/icons/eye.png" Style="cursor: help" ToolTip="تعداد نمایش این فستیوال"
                                                                    ID="ImasgeButton1" runat="server" /></span> <span>
                                                                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("submitted") %>'></asp:Label></span>
                                                            <span>
                                                                <asp:Image ImageUrl="~/files/images/icons/submitted.png" Style="cursor: help" ToolTip="تعداد ارسال ها به این فستیوال"
                                                                    ID="Image2" runat="server" /></span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <span style="font-family: Titr; font-weight: bold; font-size: 20px; color: black;">
                                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("title_fa").Replace("ي", "ی") %>' />
                                                        </span><span style="font-family: tahoma; font-weight: bold; font-size: 10px; color: black;">
                                                            (<asp:Label ID="Label9" runat="server" Text='<%# Eval("title_en") %>' />) </span>
                                                        <div style="font-family: Samim; font-size: 12px;">
                                                            <div>
                                                                <asp:Label ID="short_featureLabel" Style="font-family: Samim; font-size: 11px;" runat="server"
                                                                    Text='<%# getshortfeature(Eval("short_feature")) %>' /></div>
                                                            <div>
                                                                <asp:Label ID="genreLabel" runat="server" Style="font-family: Samim; font-size: 11px;"
                                                                    Text='<%# getgenre(Eval("genre")) %>' /></div>
                                                            <div style="margin-top: 3px;">
                                                                <asp:Label ID="LevelLabel" runat="server" Style="font-family: Samim; font-size: 11px;"
                                                                    Text='<%# getLevel(Eval("Level")) %>' /></div>
                                                        </div>
                                                        <div>
                                                            <a target="_blank" href='<%# ResolveUrl("پخش-و-ارسال-فیلم") %>' style="text-decoration: none;
                                                                color: Blue;">چگونه فیلم من به این فستیوال ارسال خواهد شد؟</a>
                                                        </div>
                                                        <div>
                                                            <asp:Label ID="Label1" Style="font-family: Samim; font-size: 11px; color: Gray;"
                                                                runat="server" Text='<%# getShortLink() %>'></asp:Label>
                                                        </div>
                                                        <div>
                                                            <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                                                                <ContentTemplate>
                                                                    <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                                                        OnCommand="send" CssClass="btn" Enabled='<%# iif(Eval("sign")=1,"True","False") %>'
                                                                        Text='<%# iif(Eval("sign")=1,"میخواهم فیلمم را به این فستیوال بفرستم","فستیوال بسته شده است") %>' />
                                                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel12">
                                                                        <ProgressTemplate>
                                                                            <asp:Image ID="Image3" ImageUrl="~/files/images/icons/preloader.gif" runat="server" />
                                                                        </ProgressTemplate>
                                                                    </asp:UpdateProgress>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="font-family: Titr; color: black;">
                                            توضیحات</div>
                                        <div>
                                            <asp:Label ID="detailLabel" runat="server" Text='<%# Eval("detail").Replace("ي", "ی").Replace("Tahoma","Samim").Replace("tahoma","Samim") %>' />
                                        </div>
                                        <div style="font-family: Titr; color: black;">
                                            شاخص‌های ویژه این فستیوال</div>
                                        <div style="text-align: justify; padding: 5px;">
                                            <asp:Label ID="attributeLabel" runat="server" Text='<%# Eval("attribute").Replace("ي", "ی").Replace("Tahoma","Samim").Replace("tahoma","Samim") %>' />
                                        </div>
                                        <div style="font-family: Titr; color: black;">
                                            قوانین و مقررات</div>
                                        <div style="text-align: justify; padding: 5px;">
                                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("rules").Replace("ي", "ی").Replace("Tahoma","Samim").Replace("tahoma","Samim") %>' />
                                        </div>
                                    </div>
                                </td>
                                <td style="vertical-align: top;">
                                    <div style="padding: 5px;">
                                        <span style="font-family: titr; color: Black;">تاریخ اتفاقات جشنواره</span>
                                    </div>
                                    <div class="DivLeft">
                                        <div>
                                            <asp:DataList ID="DataList2" runat="server" DataSourceID="SDS_Dead">
                                                <ItemTemplate>
                                                    <div style="width: 250px;">
                                                        <asp:Button ID="Button2" runat="server" Enabled="false" Text='<%# iif(Eval("sign")=1,"فستیوال باز است","فستیوال بسته شده است") %>'
                                                            ForeColor='<%# iif(Eval("sign")=1, Drawing.color.green, Drawing.color.red) %>'
                                                            CssClass="DivOpenClosed" />
                                                    </div>
                                                    <span>تاریخ شروع پذیرش:</span><asp:Label ID="IDLabel" Style="color: Red; font-weight: bold;"
                                                        runat="server" Text='<%# getDate(Eval("date_opening")) %>' />
                                                    <br />
                                                    <span>تاریخ اعلان نتایج:</span><asp:Label ID="Label2" Style="color: Red; font-weight: bold;"
                                                        runat="server" Text='<%# getDate(Eval("date_notification")) %>' />
                                                    <br />
                                                    <span>تاریخ شروع مراسم:</span><asp:Label ID="Label3" Style="color: Red; font-weight: bold;"
                                                        runat="server" Text='<%# getDate(Eval("date_start_takePlace")) %>' />
                                                    <br />
                                                    <span>تاریخ پایان مراسم:</span><asp:Label ID="Label4" Style="color: Red; font-weight: bold;"
                                                        runat="server" Text='<%# getDate(Eval("date_end_takePlace")) %>' />
                                                </ItemTemplate>
                                            </asp:DataList>
                                            <asp:SqlDataSource ID="SDS_Dead" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                                                SelectCommand="
                                                select
counter                                                
,date_opening 
,date_notification 
,date_start_takePlace 
,date_end_takePlace 
,(select top 1 sign(DATEDIFF(DAY, GETDATE(),deadline)) from tbl_festivalDeadline 
  where festivalID=@id
  order by deadline desc
   ) 'sign'
from dbo.tbl_festivals f
WHERE ([ID] = @id)">
                                                <SelectParameters>
                                                    <asp:RouteParameter Name="ID" RouteKey="id" Type="Int64" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div style="padding-right: 5px; padding-top: 5px;">
                                        <span style="font-family: titr; color: Black;">بخش‌ها و هزینه‌ها</span>
                                    </div>
                                    <div class="DivLeft">
                                        <asp:GridView Width="100%" ID="dgSection" runat="server" AutoGenerateColumns="False"
                                            DataSourceID="SDS_Section" GridLines="None" ShowHeader="False">
                                            <Columns>
                                                <asp:TemplateField HeaderText="deadline" InsertVisible="False" SortExpression="deadline">
                                                    <ItemTemplate>
                                                        <!-- اگر به جای تگ انچور از دایو استفاده کنی شکل تب می شود -->
                                                        <a class="accordion">
                                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("section").Replace("ي", "ی") %>'></asp:Label>
                                                        </a>
                                                        <div class="panel">
                                                            <p>
                                                                <asp:Label ID="lblIDsection" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                                                <asp:GridView ID="dgFee" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Fee"
                                                                    GridLines="None" ShowHeader="False">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="deadline" InsertVisible="False" SortExpression="deadline">
                                                                            <ItemTemplate>
                                                                                <div style="width: 100%;">
                                                                                    <div>
                                                                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("row") %>'></asp:Label></div>
                                                                                    <div>
                                                                                        تاریخ:
                                                                                        <asp:Label ID="Label1" Style="color: Red; font-weight: bold;" runat="server" Text='<%# getDate(Eval("deadline")) %>'></asp:Label></div>
                                                                                    <div>
                                                                                        مقدار ورودی:
                                                                                        <asp:Label ID="Label5" Style="color: Red; font-weight: bold;" runat="server" Text='<%# Eval("fee") %>'></asp:Label>
                                                                                        دلار</div>
                                                                                    <div>
                                                                                        <asp:Label ID="Label10" ForeColor='<%# iif(Eval("sign")=1, Drawing.color.green, Drawing.color.red) %>'
                                                                                            CssClass="divGenre" runat="server" Text='<%# Eval("DeadlineStatus") %>'></asp:Label>
                                                                                    </div>
                                                                                </div>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                                <asp:SqlDataSource ID="SDS_Fee" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                                                                    SelectCommand="
                                                    select
                                                    id
                                                    ,festivalID
                                                    ,sectionID
                                                    ,deadline 
                                                    ,'ددلاین شماره: ' + CAST(ROW_NUMBER() OVER (ORDER BY deadline) AS VARCHAR) as 'row'
                                                    ,fee
                                                    ,case
		when sign(DATEDIFF(DAY, GETDATE(),deadline)) =1 then 'باز است'
		when sign(DATEDIFF(DAY, GETDATE(),deadline)) =-1 then 'بسته شده است'
 end 'DeadlineStatus',
 sign(DATEDIFF(DAY, GETDATE(),deadline)) 'sign' 
                                                    from dbo.tbl_festivalDeadline d
                                                    WHERE ([festivalID] = @ID) and ([sectionID] =@sectionID)
                                                    order by deadline asc
                                                    ">
                                                                    <SelectParameters>
                                                                        <asp:RouteParameter Name="ID" RouteKey="ID" Type="Int64" />
                                                                        <asp:ControlParameter ControlID="lblIDsection" Name="sectionID" PropertyName="Text"
                                                                            Type="String" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </p>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SDS_Section" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                                            SelectCommand="
                                                    select
                                                    id
                                                    ,section                                                     
                                                    from dbo.tbl_festivalSections
                                                    WHERE ([festivalid] = @ID)">
                                            <SelectParameters>
                                                <asp:RouteParameter Name="ID" RouteKey="ID" Type="Int64" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                <uc2:comment ID="comment" runat="server" />
                <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                    SelectCommand="SELECT *,(select top 1 sign(DATEDIFF(DAY, GETDATE(),deadline)) from tbl_festivalDeadline where festivalID=@id order by deadline desc ) 'sign' ,(select COUNT(*) 'submitted' from dbo.tbl_invoice where (payment_code<>'' or payment_code is not null) AND festivalID=@id) as 'submitted' FROM [tbl_festivals] WHERE ([ID] = @ID)">
                    <SelectParameters>
                        <asp:RouteParameter Name="ID" RouteKey="id" Type="Int64" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <%--<uc1:banners_right ID="banners_right1" runat="server" />--%>
        </div>
    </div>
    <script>
        var acc = document.getElementsByClassName("accordion");
        var i;

        for (i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", function () {
                this.classList.toggle("active");
                var panel = this.nextElementSibling;
                if (panel.style.maxHeight) {
                    panel.style.maxHeight = null;
                } else {
                    panel.style.maxHeight = panel.scrollHeight + "px";
                }
            });
        }
    </script>
    <!-- The Modal -->
    <style>
        .modal1
        {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 999; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%;
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
        /* Modal Content/Box */
        .modal-content1
        {
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            font-family: Samim;
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
            direction: rtl;
            font-size: 14px;
        }
        .modalDistributionTitr
        {
            font-family: Titr;
            font-size: 25px;
            color: #0096bf;
        }
        .modalDistributionTitr2
        {
            font-size: 18px;
            color: #32a2a8;
        }
        .modalDistributionCell
        {
            font-size: 20px;
            color: black;
            padding: 5px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin: 4px; /* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#fefcea+0,f1da36+100;Gold+3D */
            background: rgb(254,252,234); /* Old browsers */
            background: -moz-linear-gradient(top, rgba(254,252,234,1) 0%, rgba(241,218,54,1) 100%); /* FF3.6-15 */
            background: -webkit-linear-gradient(top, rgba(254,252,234,1) 0%,rgba(241,218,54,1) 100%); /* Chrome10-25,Safari5.1-6 */
            background: linear-gradient(to bottom, rgba(254,252,234,1) 0%,rgba(241,218,54,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fefcea', endColorstr='#f1da36',GradientType=0 ); /* IE6-9 */
        }
        .modalDistributionCell:hover
        {
            /* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#fefcea+0,70b9f4+100 */
            background: rgb(254,252,234); /* Old browsers */
            background: -moz-linear-gradient(top, rgba(254,252,234,1) 0%, rgba(112,185,244,1) 100%); /* FF3.6-15 */
            background: -webkit-linear-gradient(top, rgba(254,252,234,1) 0%,rgba(112,185,244,1) 100%); /* Chrome10-25,Safari5.1-6 */
            background: linear-gradient(to bottom, rgba(254,252,234,1) 0%,rgba(112,185,244,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fefcea', endColorstr='#70b9f4',GradientType=0 ); /* IE6-9 */
        }
        .close1
        {
            font-size: 20px;
            cursor: pointer;
            color: Black;
        }
        .modalDistributionTClickCell
        {
            color: #c2c2c2;
            font-size: 14px;
        }
    </style>
    <div id="myModalDistribution" class="modal1">
        <!-- Modal content -->
        <div class="modal-content1">
            <span class="close1">&times;</span>
            <div style="text-align: center;">
                <br />
                <span class="modalDistributionTitr">تصمیم درستی گرفته‌اید!</span>
                <br />
                <br />
                <span class="modalDistributionTitr2">هم اکنون با یکی از کارشناسان زیر تماس حاصل فرمائید:</span>
                <br />
                <div class="modalDistributionTClickCell">
                    (یکی از شماره‌ها را لمس و یا کلیک کنید)</div>
                <a href="tel:09216343320">
                    <div class="modalDistributionCell">
                        0921-634-3320</div>
                </a><a href="tel:09020763947">
                    <div class="modalDistributionCell">
                        0902-076-3947</div>
                </a><a href="tel:09332300598">
                    <div class="modalDistributionCell">
                        0933-230-0598</div>
                </a>
                <div class="modalDistributionTClickCell">
                    «درگاه فیلم ایران»</div>
                <div class="modalDistributionTClickCell">
                    تخصصی‌ترین مرکز پخش و ارسال فیلم به فستیوال‌های بین‌المللی</div>
            </div>
        </div>
    </div>
    <script>
        // Get the modal
        var modal1 = document.getElementById("myModalDistribution");

        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close1")[0];

        // When the user clicks on the button, open the modal
        function loadModalDistribution() {
            modal1.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal1.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal1) {
                modal1.style.display = "none";
            }
        }
    </script>
    <!-- End of The Modal -->
</asp:Content>
