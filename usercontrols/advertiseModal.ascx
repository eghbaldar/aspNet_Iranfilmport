<%@ Control Language="VB" AutoEventWireup="false" CodeFile="advertiseModal.ascx.vb" Inherits="usercontrols_advertiseModal" %>


<style>
    /* https://www.w3schools.com/howto/howto_css_modal_images.asp */
    #myImg {
        -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius:5px;
        cursor: pointer;
        transition: 0.3s;
        
    }
        #myImg:hover {
            opacity: 1;
        }
        #img01{
            -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius:5px;
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
        background-color: #ffe926;
        color: black;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        border-radius: 5px;
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

</style>

<!-- Trigger the Modal 
<img id="myImg" src="files/images/logos/logo_movibeta.png" alt="Snow" style="width:100%;max-width:300px">
-->
<!-- The Modal -->
<div id="myModaladv" class="modalaDs">

    <!-- The Close Button -->
    <span class="closeADV">&times;</span>

    <!-- Modal Content (The Image) -->

        <img class="modalaDs-content" id="img01">

    <br />

    <!-- Modal Caption (Image Text) -->
    <div id="caption">
        فستیوال «کن 2023» باز شد.
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
    modalImg.src = "<%= ResolveUrl("~/files/images/background/nowroz1402.jpg") %>";
    captionText.innerHTML = "تخفیف عیدانه فیلمسازها شروع شد" + "</br>" + "<span class='blink'>" +
        "** هم اکنون اقدام کنید **" + "</span>" + "</br>"
        + "<a href='tel: 09216343320'>" + "جهت مشاوره و ارسال (اینجا) کلیک/تاچ کنید." + "</a>";


    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("closeADV")[0];

    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {
        myModaladv.style.display = "none";
    }
    document.onclick = function (e) {
        myModaladv.style.display = "none";
    }
</script>
