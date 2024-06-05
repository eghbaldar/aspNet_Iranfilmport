<%@ Page Title="" Language="C#" MasterPageFile="~/panelclients/MasterPanel.master" AutoEventWireup="true" CodeFile="PanelSuggestedFestivalUploadReceipt.aspx.cs" Inherits="panelclients_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--JQuery--%>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <%--Sweet ALert--%>
    <script src="../../../files/sweetalert/sweetalert2.all.min.js"></script>
    <link href="../../../files/sweetalert/sweetalert2.min.css" rel="stylesheet" />
    <script src="../../../files/sweetalert/sweetalert2.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="TitleTitle">
        آپلود رسید مالی برای فستیوال پیشنهادی
    </div>
    <div style="padding-top: 10px;">
        <div style="border: 5px dashed #F4A460; padding: 15px;">
            <div style="padding-bottom: 10px; padding-top: 10px; color: red;">
                <b>رسید خود را انتخاب کنید:</b>
                <ul>
                    <li>حجم کمتر از 1 مگابایت</li>
                    <li>تنها پسوند JPG,JPEG,BMP,GIF,PNG قابل قابل قبول است</li>
                </ul>
            </div>
            <asp:FileUpload ID="FileUpload" runat="server" />
        </div>
        <div>
            <asp:Button ID="btnSendReceipt" CssClass="panelbtn" runat="server" Text="ارسال" OnClick="btnSendReceipt_Click" />
        </div>
    </div>
    <script>
        function MyAlert(myobject) {
            var arr = myobject.toString().split("|");
            var msg = arr[0];
            var userId = arr[1];
            var time = arr[2];
            var allowedToRedirect = arr[3];
            let timerInterval;
            Swal.fire({
                title: msg,
                timer: time,
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
                    if (allowedToRedirect == "True") window.location = "../../../panel/PanelSuggestedFestival/" + userId;
                }
            });
        }
    </script>
</asp:Content>

