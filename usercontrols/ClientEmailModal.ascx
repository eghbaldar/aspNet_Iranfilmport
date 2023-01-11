<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ClientEmailModal.ascx.vb" Inherits="usercontrols_ClientEmailModal" %>


<style>
    /* https://www.w3schools.com/howto/howto_css_modal_images.asp */
    #myImg {
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        border-radius: 5px;
        cursor: pointer;
        transition: 0.3s;
    }

        #myImg:hover {
            opacity: 1;
        }

    #img01 {
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        border-radius: 5px;
    }
    /* The Modal (background) */
    .modalaDs {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        padding-top: 100px; /* Location of the box */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content (Image) */
    .modalaDs-content {
        margin: auto;
        display: block;
        width: 80%;
        max-width: 700px;
    }

    /* Caption of Modal Image (Image Text) - Same Width as the Image */
    #caption {
        margin: auto;
        display: block;
        width: 80%;
        max-width: 700px;
        text-align: center;
        color: #ccc;
        padding: 10px;
        direction: rtl;
        font-family: Samim;
        font-size: large;
        background-color: #ccc;
        color: black;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        border-radius: 5px;
        background: linear-gradient(rgba(255,235,0,.8), rgba(255,193,3,.8)), url("/files/images/background/backEmail.jpg");
        background-repeat: no-repeat;
        background-size: contain, cover;
        -webkit-box-shadow: 0px 0px 54px 7px rgba(0,0,0,0.89);
        -moz-box-shadow: 0px 0px 54px 7px rgba(0,0,0,0.89);
        box-shadow: 0px 0px 54px 7px rgba(0,0,0,0.89);
    }

    /* Add Animation - Zoom in the Modal */
    .modalaDs-content, #caption {
        animation-name: zoom;
        animation-duration: 0.6s;
    }

    @keyframes zoom {
        from {
            transform: scale(0)
        }

        to {
            transform: scale(1)
        }
    }

    /* The Close Button */
    .closeADV {
        position: absolute;
        top: 15px;
        right: 35px;
        color: white;
        font-size: 60px;
        font-weight: bold;
        transition: 0.3s;
    }

        .closeADV:hover,
        .closeADV:focus {
            color: #bbb;
            text-decoration: none;
            cursor: pointer;
        }

    .blink {
        color: red;
        font-family: 'Titr';
        animation: blink-animation 1s steps(5, start) infinite;
        -webkit-animation: blink-animation 1s steps(5, start) infinite;
    }

    @keyframes blink-animation {
        to {
            visibility: hidden;
        }
    }

    @-webkit-keyframes blink-animation {
        to {
            visibility: hidden;
        }
    }
    /* 100% Image Width on Smaller Screens 
    @media only screen and (max-width: 700px) {
        .modalaDs-content {
          width: 100%;  
        }
    }*/
    .txtEmail {
        padding: 10px;
        text-align: center;
        font-size: 14px;
        width: 90%;
        direction:ltr;
    }

    .btnUpdateEmail {
        padding: 10px;
        font-family: Samim;
        width: 50%;
        cursor: pointer;
        margin: 5px;
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        border-radius: 10px;
        border: 0;
        box-shadow: 2px 2px;
    }

    .img-email {
        position: absolute;
        opacity: 0.6;
        width: 100%;
        height: auto;
        left: 0;
        top: 0;
    }
</style>

<!-- Trigger the Modal 
<img id="myImg" src="files/images/logos/logo_movibeta.png" alt="Snow" style="width:100%;max-width:300px">
-->
<!-- The Modal -->
<div id="myModaladv" class="modalaDs">

    <!-- The Close Button -->
    <span class="closeADV">&times;</span>

    <!-- Modal Content (The Image)

        <img class="modalaDs-content" id="img01">
                background:url('/files/images/background/backEmail.jpg');
        background-size: cover;
       -->

    <br />

    <!-- Modal Caption (Image Text) -->
    <div id="caption">
        <%--<img class="img-email" src="/files/images/background/backEmail.jpg" />--%>
        <asp:Label ID="Label1" runat="server" Text="ایمیل شما در سیستم وارد نشده است.</br><span class='blink'>**<br/> لطفا ایمیل خود به دقت در کادر زیر وارد کنید. با بروزرسانی قسمت های جدید پرتال اختصاصی شما، نیاز به ایمیل آدرس شما بیشتر خواهد شد. <br/>**</span>"></asp:Label>
        <br />
        <asp:TextBox ID="txtEmail" placeholder="Sample: yourEmail@gmail.com" CssClass="txtEmail" runat="server"></asp:TextBox>
        

        <asp:Button ID="btnUpdateEmail" runat="server" 
             ValidationGroup="email"
            CssClass="btnUpdateEmail" Text="ثبت ایمیل" />
                <div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                ControlToValidate="txtEmail"
                ValidationGroup="email"
                runat="server" ErrorMessage="فیلد اجباری است"></asp:RequiredFieldValidator>
           
        </div>
        <div>
             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
            ControlToValidate="txtEmail"
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
            ValidationGroup="email"
            ErrorMessage="فرمت ایمیل اشتباه می باشد"></asp:RegularExpressionValidator>
        </div>
    </div>

</div>

<script>
    // Get the modal
    var myModaladv = document.getElementById("myModaladv");

    // Get the image and insert it inside the modal - use its "alt" text as a caption
    var img = document.getElementById("myImg");
    var modalImg = document.getElementById("img01");
    var captionText = document.getElementById("caption");


    myModaladv.style.display = "block";
    //modalImg.src = "<%= ResolveUrl("~/files/images/background/festivalcannes.jpg") %>";
    //captionText.innerHTML = "ایمیل شما در سیستم وارد نشده است." + "</br>" + "<span class='blink'>" +
    //    "** لطفا ایمیل خود به دقت در کادر زیر وارد کنید. با بروزرسانی قسمت های جدید پرتال اختصاصی شما، نیاز به ایمیل آدرس شما بیشتر خواهد شد. **" + "</span>";


    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("closeADV")[0];

    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {
        myModaladv.style.display = "none";
    }
    //document.onclick = function (e) {
    //    myModaladv.style.display = "none";
    //}
</script>
