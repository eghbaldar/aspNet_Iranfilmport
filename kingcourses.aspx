<%@ Page Title="" Language="VB" MasterPageFile="~/KingMasterSingle.master" AutoEventWireup="false" CodeFile="kingcourses.aspx.vb" Inherits="kingcourses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .mainCourse {
            margin: 5px;
            padding: 20px;  
            background-color: #e9e9e9;
            border: 1px solid #f1f1f1;
            -moz-border-radius: 25px;
            -webkit-border-radius: 25px;
            border-radius: 25px;
        }

        .detailedCourse {
            margin-top: 10px;
            margin-bottom: 10px;
            padding: 20px;
            color: black;
            box-shadow: 0px 24px 29px -14px rgba(0,0,0,0.44);
            -webkit-box-shadow: 0px 24px 29px -14px rgba(0,0,0,0.44);
            -moz-box-shadow: 0px 24px 29px -14px rgba(0,0,0,0.44);
        }

        .c-g {
            color: green;
        }

        .c-r {
            color: red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="title-text mb-3">
        <h1>
            <asp:Literal ID="lblTopTitle" runat="server"></asp:Literal>
        </h1>
    </div>
    <div class="item-holder" style="text-align: justify;">
        <asp:Label ID="lbl" CssClass="lbl panel" runat="server"></asp:Label>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="left-side">
                <div class="item-holder" style="text-align: justify;">
                    <br />
                    <h4>میدانیم که خسته شده اید!
                    </h4>
                    <br />
                    <div>
                        بدون شک، شما هم از حجم بسیار زیاد کلاس ها، دوره ها و آموزشگاه هایی که افراد را غرق در تبلیغات بی اثر خود میکنند، کلافه شده اید و نمیدانید چه کاری باید انجام دهید؟ آیا فیلمنامه نویس هستید یا نیستید؟ آیا متن شما قابلیت تبدیل شدن به فیلم را دارد یا ندارد؟ کدام نرم افزار تدوین را جهت شروع و وارد شدن به بازار کار انتخاب کنید؟ تفاوت تدوین فیلم کوتاه با بلند و حتی سریال در چیست؟ و هزاران سوال دیگر!
                    </div>
                    <div>
                        «درگاه فیلم ایران» تصمیم گرفته است که بصورت مورد و خصوصی جلسات آنلاین فیلمسازی را بصورت پروژه محور و با هدف ورود به بازار کار و نیز ورود به فستیوال های جهانی جهت کسب افتخار و جذب سرمایه گذار و حتی ساخت اولین فیلم بلند سینمایی‌تا برگزار کند.
                    </div>
                    <br />
                    <h4>چه تفاوتی بین این دوره‌ها با دوره های دیگر آموزشگاه‌هاست؟
                    </h4>
                    <br />
                    <div>
                        این مهمترین سوالی است که باید به آن جواب روشنی دارد، چرا شما قرار است هزینه کنید و از آن مهمتر قرار است وقت و انرژی خود را بگذارید. بزرگترین تفاوت دوره های «درگاه فیلم ایران» با سایر دوره های موجود «Practical» بودن دوره هاست. به معنای دیگر، «درگاه فیلم ایران» با بیش از یک دهه فعالیت در حوزه‌ی پخش و ارسال بین المللی فیلم و فیلمنامه، به ظرافت و دقت میداند که چه ایده ای، چه روایتی و چه رویکردی مناسب نوشته شدن و در انتها ساخت است. بنابراین، ما به شما یاد خواهیم داد چه بسازی و چه نسازید.
                    </div>
                    <br />
                    <h4>هدیه بزرگ شرکت در دوره‌ها
                    </h4>
                    <br />
                    <div>
                        بزرگترین اتفاق این دوره، بغیر از آموزش کاربردی (Practical) فیلمسازی، تخفیف 50% پخش فیلمی است که قرار است در دوره‌های «درگاه فیلم ایران» روی آن کار کنید و به سرانجام برساند. به عنوان مثال، اگر در دوره ی «فیلمنامه نویسی آنلاین – فیلم کوتاه و بلند» شرکت کنید، در انتهای تولید همان فیلمنامه، 50% تخفیف پخش به تعرفه ی روز خواهید گرفت!
                    </div>
                    <br />
                    <h4>گواهینامه حضور در دوره
                    </h4>
                    <br />
                    <div>
                        «درگاه فیلم ایران» به شرکت کنندگان خود، پس از اتمام جلسات، مدرک بین المللی شرکت در دوره خواهد داد. هر چند که داشتند مدرک به خودی خود تاثیری در سطح دانش نداشته، اما با داشتن این گواهینامه، می‌توانید اثبات کنید که از شرکت پخش بین المللی که سابقه طولانی در حضورهای اسکاری و بین المللی دارد، تائیده داشته و به نوعی از آن جهت کسب اعتبار بهره ببرید.
                    </div>

                    <div class="mainCourse">
                        <h3>معرفی دوره‌ها
                        </h3>
                        <hr />
                        <asp:DataList ID="DataList1" runat="server" DataSourceID="SDS" Width="100%">
                            <ItemTemplate>
                                <div style="text-align: center; padding: 15px;">
                                    <h3>
                                        <asp:Image ID="Ima1ge3"
                                            Width="20"
                                            ImageUrl='<%# "~/files/images/courses/blinker.gif" %>'
                                            runat="server"></asp:Image>
                                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                                    </h3>
                                </div>
                                <div style="text-align: center;">
                                    <asp:Image ID="Image1"
                                        Width="100%"
                                        Style="opacity: .6; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"
                                        ImageUrl='<%# "~/files/images/courses/" + Eval("image") %>'
                                        runat="server"></asp:Image>
                                </div>
                                <br />
                                <br />
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Image ID="Image2"
                                                Width="200px"
                                                Style="-moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"
                                                ImageUrl='<%# "~/files/images/courses/" + Eval("image_teacher") %>'
                                                runat="server"></asp:Image>
                                        </td>
                                        <td>

                                            <div class="detailedCourse">
                                                مدرس دوره:
                                        <strong>
                                            <asp:Label ID="teacherLabel" runat="server" Text='<%# Eval("teacher") %>' />
                                        </strong>
                                                <br />
                                                وضعیت دوره:
                                       <strong>
                                           <asp:Label ID="statusLabel" runat="server"
                                               Text='<%# IIf(Eval("status") = True,
                                                           "باز",
                                                           "بسته") %>' />
                                       </strong>
                                                <br />
                                                زمان دوره:
                                        <strong>
                                            <asp:Label ID="timeLabel" runat="server" Text='<%# Eval("time") %>' />
                                        </strong>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <div class="alert alert-primary" role="alert" style="margin-top: 10px;">
                                    روزمه مدرس:
                                    <br />
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("resume") %>' />
                                </div>
                                <div class="alert alert-success" style="margin-top: 10px; text-align: center;" role="alert">
                                    جهت ثبت نامه در این دوره، با یکی از شماره های زیر ارتباط باشید:
                            <div style="font-weight: bold;">
                                <a href="tel:+989020763947">09020763947
                                </a>
                                <br />
                                <a href="tel:+09332300598">09332300598</a>
                                <br />
                                support@iranfilmport.com
                            </div>
                                </div>

                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>" SelectCommand="SELECT * FROM [tbl_courses] ORDER BY [ID]"></asp:SqlDataSource>

                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

