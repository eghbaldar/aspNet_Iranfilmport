<%@ Page Title="" Language="VB" MasterPageFile="~/panelclients/MasterPanel.master" AutoEventWireup="false" CodeFile="PanelSuggestedFestival.aspx.vb" Inherits="panelclients_PanelSuggestedFestival" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .blink {
            animation: blink 1s linear infinite;
        }

        @keyframes blink {
            50% {
                opacity: 0;
            }
        }

        .btn {
            font-family: Samim;
            font-size: 13px;
            padding: 1px;
            cursor: pointer;
        }

        .btnClose {
            cursor: not-allowed;
        }

        .swal2-popup .swal2-styled {
            font-family: Samim !important;
            border: 0 !important;
        }

            .swal2-popup .swal2-styled:focus {
                font-family: Samim !important;
                border: 0 !important;
            }
    </style>
    <%--JQuery--%>
    <script type="text/javascript" src="../../files/js/recordvoice/jquery.min.js"></script>
    <%--Sweet ALert--%>
    <script src="../../files/sweetalert/sweetalert2.all.min.js"></script>
    <link href="../../files/sweetalert/sweetalert2.min.css" rel="stylesheet" />
    <script src="../../files/sweetalert/sweetalert2.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hiddenUsername" runat="server" />
    <div class="TitleTitle">
        فستیوال های پیشنهاد شده (اختیاری)
    </div>
    <div style="padding-top: 10px;">
        <div class="warning">
            <ul>
                <li>توجه فرمائید که پس از تاریخ موافقت، به هیچ عنوان امکان درخواست جهت ثبت نام در فستیوال مدکور وجود نخواهد داشت.</li>
                <li>هیچ اجباری در انتخاب فستیوال ها وجود نخواهد داشت. این پیشنهادات صرفا 
                    براساس قرارداد و افزایش بیشتر شانس فیلم/فیلمنامه ارائه شده است و لازم به ذکر است که پیش از این جهت صفر شدنشان اقدام شده است.</li>
                <li>جهت درخواست، فقط از طریق دکمه «ثبت» اقدام گردد و به هیچ عنوان با دپارتمان پخش و یا مالی تماس گرفته نشود. سوالات دیگر را از طریق 
                    <a href="../../panel/tickets/<%= userID %>">تیکت</a>
                    قرارداد بدهید.
                </li>
                <li>
                    <b class="blink">توجه بسیار مهم: جهت ثبت اولیه، پرداخت 50% مبلغ از طریق کارت به کارت اجباری است، پس از آن کارشناسان شرکت با شما تماس خواهند گرفت.
                    </b>
                </li>
                <li>«آخرین تاریخ موافقت»، ارتباطی با ددلاین فستیوال نداشته و صرفا زمان و مهلت درخواست شما
                    را مشخص میکند که قاعدتا چندین روز زودتر از زمان نهایی اتمام پذیرش فستیوال است.</li>
            </ul>
        </div>
        <asp:GridView ID="DG_SuggestedFestivals" runat="server" DataSourceID="SDS_SuggestedFestivals" Width="100%" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" PageSize="30">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                <asp:BoundField DataField="festivalName" HeaderText="نام فستیوال" SortExpression="festivalName">
                    <ItemStyle HorizontalAlign="Center" Width="40%" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="مقدار ورودی" SortExpression="festivalFee">
                    <ItemTemplate>
                        <asp:Label ID="La1bel1" runat="server" Text='<%# String.Format("{0}{1}", Eval("festivalFee").ToString(), "<span style=""color:red""> دلار</span>") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="کشور" SortExpression="countryId">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Country(Eval("countryId")) %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="آخرین تاریخ موافقت" SortExpression="deadline">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetShamsi(Eval("deadline")) %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="targetUserUsername" HeaderText="targetUserUsername" SortExpression="targetUserUsername" Visible="False" />
                <asp:CheckBoxField DataField="seen" HeaderText="seen" SortExpression="seen" Visible="False" />
                <asp:TemplateField SortExpression="insertdate">
                    <ItemTemplate>
                        <asp:Button ID="Button1" Enabled='<%# Closed(Eval("deadline")) %>'
                            OnCommand="Bank"
                            CommandArgument='<%# Eval("id", "{0}") + "|" + Eval("festivalFee", "{0}" + "|" + Eval("agree")) %>'
                            runat="server" CssClass='<%# IIf(Closed(Eval("deadline")), "btn panelbtn", "btn btnClose")  %>' Width="100%" 
                            Text='<%# ClosedText(Eval("deadline"), Eval("agree")) %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                فستیوالی برای شما پیشنهاد نشده است.
            </EmptyDataTemplate>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#FB8C00" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="SDS_SuggestedFestivals" runat="server" ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>" SelectCommand="SELECT * FROM [tbFestivalSuggestion] WHERE ([targetUserUsername] = (select top 1 [username] from tbCustomers where id=@id)) ORDER BY [insertdate] DESC">
            <SelectParameters>
                <asp:ControlParameter Name="id" ControlID="hiddenUsername" PropertyName="Value" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <script>
        function RequestSent(amount, festivalId,userId) {

            var title = 'درخواست شما با موفقیت ثبت اولیه گردید';
            var msg = 'لطفا مبلغ ' + '<span style="color: red;">' + amount + ' <b>(نصف مبلغ به دلار به عنوان پیش پرداخت)</b> </span>' + ' به یکی از شماره کارت های زیر واریز و رسید خود را در محل بارگزاری رسید مالی قرار دهید.';
            msg += '<br>';
            msg += '<br>';
            msg += '<b>6037-9918-0681-9797</b>';
            msg += '<br>';
            msg += 'علیمحمد اقبالدار';
            msg += '<br>';
            msg += '<b>6037-9972-2480-8767</b>';
            msg += '<br>';
            msg += 'طاهره پیوسته دهبته';
            msg += '<br>';
            msg += '<br>';
            msg += '<span class="blink">' + 'توجه فرمائید که درخواست شما تنها زمانی تکمیل میگردد که رسید بارگزاری شود.' + '</span>';

            Swal.fire({
                title: 'توجه شماره یک!',
                text: 'این فستیوال تنها یک پیشنهاد است و هیچ اجباری در انتخاب آن و پرداخت مبلغ وجود ندارد.',
                icon: 'info',
                showCancelButton: true,
                confirmButtonColor: 'green',
                cancelButtonColor: 'red',
                confirmButtonText: 'کاملا آگاهم - مرحله بعد',
                cancelButtonText: 'علاقه ای ندارم'
            }).then((result) => {
                if (result.value) {
                    Swal.fire({
                        title: 'توجه شماره دو!',
                        text: 'قبلا برای این فستیوال مکاتبه حقوقی شده و جواب منفی بوده است بنابراین «درگاه فیلم ایران» تلاش خود را پیش از این کرده است.',
                        icon: 'info',
                        showCancelButton: true,
                        confirmButtonColor: 'green',
                        cancelButtonColor: 'red',
                        confirmButtonText: 'کاملا آگاهم - مرحله بعد',
                        cancelButtonText: 'منصرف شده ام'
                    }).then((result) => {
                        if (result.value) {
                            Swal.fire({
                                title: 'توجه شماره سه!',
                                text: 'کل مبلغ پرداختی شما به همراه کمیسیون بین المللی، عینا به حساب فستیوال واریز و هیچ سود و درصدی برای «درگاه فیلم ایران» نخواهد بود',
                                icon: 'info',
                                showCancelButton: true,
                                confirmButtonColor: 'green',
                                cancelButtonColor: 'red',
                                confirmButtonText: 'کاملا آگاهم - مرحله بعد',
                                cancelButtonText: 'منصرف شده ام'
                            }).then((result) => {
                                if (result.value) {
                                    Swal.fire({
                                        title: 'توجه شماره چهارم!',
                                        text: 'پس از پرداخت کامل ارزی توسط شرکت و موفقیت آمیز پرداخت، رسید ارزی تحویل داده خواهد شد.',
                                        icon: 'info',
                                        showCancelButton: true,
                                        confirmButtonColor: 'green',
                                        cancelButtonColor: 'red',
                                        confirmButtonText: 'کاملا آگاهم - مرحله بعد',
                                        cancelButtonText: 'منصرف شده ام'
                                    }).then((result) => {
                                        if (result.value) {
                                            Swal.fire({
                                                title: 'توجه شماره پنجم!',
                                                text: 'پس از پرداخت مبلغ پیش ثبت نام، امکان لغو فرآیند به دلایل حسابداری وجود نخواهد داشت.',
                                                icon: 'info',
                                                showCancelButton: true,
                                                confirmButtonColor: 'green',
                                                cancelButtonColor: 'red',
                                                confirmButtonText: 'با تمام شرایط موافقم - مرحله نهایی',
                                                cancelButtonText: 'منصرف شده ام'
                                            }).then((result) => {
                                                if (result.value) {
                                                    Swal.fire({
                                                        icon: "success",
                                                        title: title,
                                                        html: msg,
                                                        showCancelButton: true,
                                                        confirmButtonColor: '#000222',
                                                        cancelButtonColor: '#000222',
                                                        confirmButtonText: 'متوجه شدم',
                                                        cancelButtonText: 'منصرف شدم',
                                                        footer: '<a href="#" style="text-decoration: none;">در صورت نیاز تیکت بگذارید</a>',
                                                    }).then((result) => {
                                                        if (result.value) {
                                                            callServerSideFunction(festivalId, userId);
                                                        }
                                                    });
                                                }
                                            });
                                        }
                                    });
                                }
                            });
                        }
                    });
                }
            });
        }
        function callServerSideFunction(festivalId, userId) {

            var form = new FormData();
            form.append("festivalSuggestionId", festivalId);
            form.append("agree", "1");

            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = (e) => {
                if (xhttp.readyState !== 4) {
                    return;
                }
                if (xhttp.status === 200) {
                    let timerInterval;
                    Swal.fire({
                        title: "درخواست اولیه ثبت شد.",
                        timer: 2000,
                        timerProgressBar: true,
                        didOpen: () => {
                            Swal.showLoading();
                            const timer = Swal.getPopup().querySelector("b");
                            timerInterval = setInterval(() => {
                                timer.textContent = `${Swal.getTimerLeft()}`;
                            }, 100);
                        },
                        willClose: () => {
                            clearInterval(timerInterval);
                            window.location = "../../panel/PanelSuggestedFestival/" + userId;
                        }
                    })
                } else {
                    Swal.fire({
                        icon: "error",
                        title: "خطا",
                        html: "مشکلی پیش آمد لطفا دوباره اقدام کنید.",
                        showCancelButton: true,
                        cancelButtonColor: '#000222',
                        confirmButtonText: 'متوجه شدم',
                    });
                }
            };
            
            xhttp.open("POST", "../../../panelclients/WebServiceVersatile.asmx/UpdateFestivalSuggestionAgree", true);
            xhttp.send(form);

            <%--$.ajax({
                contentType: "application/x-www-form-urlencoded",
                dataType: "json",
                type: "POST",
                data: { 'festivalSuggestionId': festivalId, 'agree': '1' },
                url: '<%= ResolveUrl("~/panelclients/WebServiceVersatile.asmx/UpdateFestivalSuggestionAgree") %>',
                success: function (data) {
                    // Parse the responseText to extract the JSON object
                    const jsonResponse = JSON.parse(data.responseText.substring(data.responseText.indexOf('{'), data.responseText.lastIndexOf('}') + 1));
                    if (jsonResponse.issuccess == "True") {
                        swal.fire("درخواست اولیه ثبت شد.");
                    } else {
                        swal.fire("مشکلی پیش آمد لطفا دوباره اقدام کنید.");
                    }
                },
                error: function (e) {
                    // Parse the responseText to extract the JSON object
                    const jsonResponse = JSON.parse(e.responseText.substring(e.responseText.indexOf('{'), e.responseText.lastIndexOf('}') + 1));
                    if (jsonResponse.issuccess == "True") {

                        let timerInterval;
                        Swal.fire({
                            title: "درخواست اولیه ثبت شد.",
                            timer: 2000,
                            timerProgressBar: true,
                            didOpen: () => {
                                Swal.showLoading();
                                const timer = Swal.getPopup().querySelector("b");
                                timerInterval = setInterval(() => {
                                    timer.textContent = `${Swal.getTimerLeft()}`;
                                }, 100);
                            },
                            willClose: () => {
                                clearInterval(timerInterval);
                                window.location = "../../panel/PanelSuggestedFestival/" + userId;
                            }
                        })
                    } else {                       
                        Swal.fire({
                            icon: "error",
                            title: "خطا",
                            html: "مشکلی پیش آمد لطفا دوباره اقدام کنید.",
                            showCancelButton: true,
                            cancelButtonColor: '#000222',
                            confirmButtonText: 'متوجه شدم',
                        });
                    }
                },
            });--%>
        }
    </script>
</asp:Content>

