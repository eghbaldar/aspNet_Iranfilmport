<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false" CodeFile="advertise.aspx.vb" Inherits="advertise" %>

<%@ Register Src="usercontrols/RightSide.ascx" TagName="RightSide" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        p {
            font-size: 14px;
            color: #000;
        }

        li {
            color: #000;
        }

        @media (max-width: 767px) {
            .item-holder {
                width: 100%;
                padding: 20px;
            }
        }

        ul ul li {
            list-style-type: circle;
        }

        ul li {
            list-style-type: disc;
        }
    </style>
    <%--SweetAlert--%>
    <script src="files/sweetalert/sweetalert2.all.min.js"></script>
    <link href="files/sweetalert/sweetalert2.min.css" rel="stylesheet" />
    <script src="files/sweetalert/sweetalert2.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Page Title-->
    <section class="page-title text-center" style="background-image: url(files/images/background/MovibetaBG.jpg);">
        <div class="container">
            <div class="title-text">
                <h1>
                    <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal></h1>
            </div>
        </div>
    </section>
    <!--End Page Title-->
    <section class="blog-section style-four section2" style="margin-top: -50px;">
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-12 col-xs-12">
                    <div class="left-side">
                        <div class="item-holder" style="text-align: justify;">

                             <asp:UpdatePanel ID="UpdatePanel1" runat="server" Visible="false">
                                    <ContentTemplate>

                                           <div id="advertSHORT" style="display:none;">
عبارتنداز: انتشار اخبار پیش تولید، شروع فیلمبرداری، اتمام فیلمبرداری، شروع تدوین، شروع صداگذاری، اتمام تدوین، اتمام صداگذاری و ...
    </div>
                                        <div id="advertMIDDLE" style="display:none;">
        <ul>
					<li style="text-align: justify;">
						<span style="font-family: tahoma, geneva, sans-serif;"><span style="font-size: 14px;">انتشار اخبار پیش تولید&nbsp;<span style="color: rgb(255, 0, 0);">400.000 تومان</span></span></span></li>
					<li style="text-align: justify;">
						<span style="font-family: tahoma, geneva, sans-serif;"><span style="font-size: 14px;">انتشار اخبار شروع فیلمبرداری&nbsp;<span style="color: rgb(255, 0, 0);">400.000 تومان</span></span></span></li>
					<li style="text-align: justify;">
						<span style="font-family: tahoma, geneva, sans-serif;"><span style="font-size: 14px;">انتشار اخبار اتمام فیلمبرداری<span style="color: rgb(255, 0, 0);">&nbsp;400.000 تومان</span></span></span></li>
					<li style="text-align: justify;">
						<span style="font-family: tahoma, geneva, sans-serif;"><span style="font-size: 14px;">انتشار اخبار شروع تدوین&nbsp;<span style="color: rgb(255, 0, 0);">400.000 تومان</span></span></span></li>
					<li style="text-align: justify;">
						<span style="font-family: tahoma, geneva, sans-serif;"><span style="font-size: 14px;">انتشار اخبار شروع صداگذاری<span style="color: rgb(255, 0, 0);">&nbsp;400.000 تومان</span></span></span></li>
					<li style="text-align: justify;">
						<span style="font-family: tahoma, geneva, sans-serif;"><span style="font-size: 14px;">انتشار اخبر اتمام تدوین&nbsp;<span style="color: rgb(255, 0, 0);">400.000 تومان</span></span></span></li>
					<li style="text-align: justify;">
						<span style="font-family: tahoma, geneva, sans-serif;"><span style="font-size: 14px;">انتشار اخبار اتمام صداگذاری&nbsp;<span style="color: rgb(255, 0, 0);">400.000 تومان</span></span></span></li>
					<li style="text-align: justify;">
						<span style="font-family: tahoma, geneva, sans-serif;"><span style="font-size: 14px;">انتشار اخبار موفقیت‌های فیلم و فیلمنامه در فستیوال‌ها و رویدادهای بین‌المللی</span></span>&nbsp;<span style="color:#ff0000;">600.000 </span><span style="font-family: tahoma, geneva, sans-serif; font-size: 14px; color: rgb(255, 0, 0);">تومان</span></li>
				</ul>
    </div>
                                         <div id="advertCOMMON" style="display:none;">
                                             <ul>
					<li style="text-align: justify;">
						<span style="font-family: tahoma, geneva, sans-serif;"><span style="font-size: 14px;">انتشار اخبار موفقیت‌های فیلم و فیلمنامه در فستیوال‌ها و رویدادهای بین‌المللی که «درگاه فیلم ایران» مسئولیت پخش آن را به عهده ندارد / <span style="color:#ff0000;">200.000 تومان</span></span></span></li>
					<li style="text-align: justify;">
						انتشار اخبار با عناوین خاص و خارج از چارچوب <u>تبلیغات «بدون هزینه»</u>&nbsp;/&nbsp;<span style="color:#ff0000;">120.000 تومان</span></li>
					<li style="text-align: justify;">
						<span style="font-family:Samim;"><span style="font-size:14px;">رونمایی از پوستر فیلم / <span style="color:#ff0000;">300.000 تومان</span> (در سایت و اینستاگرام (فقط پست) + <span style="color:#ff0000;">50.000 تومان </span>(استوری))</span></span></li>
					<li style="text-align: justify;">
						<span style="font-family:Samim;"><span style="font-size:14px;">رونمایی از تریلر فیلم /&nbsp;<span style="color: rgb(255, 0, 0);">350.000 تومان</span>&nbsp;(در سایت، آپارات و اینستاگرام (فقط پست))</span></span></li>
					<li style="text-align: justify;">
						<span style="font-family:Samim;"><span style="font-size:14px;">مصاحبه‌ی اختصاصی با فیلمساز و یا عوامل / <span style="color:#ff0000;">550.000 تومان </span>(بصورت متن)</span></span></li>
					<li style="text-align: justify;">
						<span style="font-family:Samim;"><span style="font-size:14px;">مصاحبه‌ی اختصاصی با فیلمساز و یا عوامل /&nbsp;<span style="color: rgb(255, 0, 0);">850.000 تومان&nbsp;</span>(بصورت ویدیویی از قبل ضبط شده)</span></span></li>
					<li style="text-align: justify;">
						<span style="font-family:Samim;"><span style="font-size:14px;">مصاحبه‌ی اختصاصی با فیلمساز و یا عوامل در iLive (آی‌لایو) /&nbsp;<span style="color:#ff0000;">500.000 تومان </span>(لایو اینستاگرام)</span></span></li>
				</ul>
                                             </div>
                                         <div id="advertPACKAGE" style="display:none;">
                                             <ul>
							<li style="text-align: justify;">
								<span style="font-family:Samim;"><span style="font-size:14px;">استوری های رایگان</span></span></li>
							<li style="text-align: justify;">
								<span style="font-family:Samim;"><span style="font-size:14px;">ساخت کلیپ بصورت PhotoClip از تصاویر پشت صحنه، صحنه و ...</span></span></li>
							<li style="text-align: justify;">
								<span style="font-family:Samim;"><span style="font-size:14px;">استوری بیوگرافی + هایلایت</span></span></li>
						</ul>
                                             </div>
                                            <div id="advertSITE" style="display:none;">
                                                نمایش پوستر و یا بنر تبلیغاتی فیلم شما در مدت یک ماه در تمامی صفحات دوم و سوم سایت

                                                </div>
                            <asp:Button ID="Button1" runat="server" Text="Button"></asp:Button>

                            <asp:DropDownList ID="cmdType" runat="server">
                                <asp:ListItem Value="0">اخبار برای فیلم‌های کوتاه</asp:ListItem>
                                <asp:ListItem Value="1">اخبار برای فیلم‌های نیمه بلند و بلند</asp:ListItem>
                                <asp:ListItem Value="2">اخبار مشترک بین فیلم‌های کوتاه، نیمه بلند و بلند</asp:ListItem>
                                <asp:ListItem Value="3">پکیج تبلیغاتی (مشترک بین فیلم‌های کوتاه، نیمه بلند و بلند)</asp:ListItem>
                                <asp:ListItem Value="4">تبلیغات در سایت</asp:ListItem>
                            </asp:DropDownList>
                            <hr />
                            <asp:Label ID="lbl" CssClass="lbl" runat="server"></asp:Label>
                                        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                            <ProgressTemplate>
                                                loading...
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </ContentTemplate>
                             </asp:UpdatePanel>

                        </div>
                    </div>
                </div>
<uc1:RightSide ID="RightSide1" runat="server" />
            </div>
        </div>
    </section>



    <script>


        function myAlert(val, Authority) {

            var text1;
            if (val == 0)
                text1 = document.getElementById("advertSHORT").innerText;
            if (val == 1)
                text1 = document.getElementById("advertMIDDLE").innerText;
            if (val == 2)
                text1 = document.getElementById("advertCOMMON").innerText;
            if (val == 3)
                text1 = document.getElementById("advertPACKAGE").innerText;
            if (val == 4)
                text1 = document.getElementById("advertSITE").innerText;

            Swal.fire({
                title: 'Register!',
                text: 'Do you want to Register this user?',
                icon: 'info',
                showCancelButton: true,
                confirmButtonColor: '#000222',
                cancelButtonColor: '#000222',
                confirmButtonText: 'Yes, Do It',
                cancelButtonText: 'No'
            }).then((result) => {
                if (result.value) {
                    window.open('https://www.zarinpal.com/pg/StartPay/' + Authority);
                }
            });


        }
    </script>
</asp:Content>

