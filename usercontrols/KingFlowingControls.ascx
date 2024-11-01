<%@ Control Language="VB" AutoEventWireup="false" CodeFile="KingFlowingControls.ascx.vb"
    Inherits="usercontrols_FlowingControls" %>
<style>
    .floating_item {
        position: fixed;
        right: 50px;
        bottom: 50px;
        z-index: 9999;
        text-align: right;
    }

        .floating_item li {
            list-style-type: none;
        }

            .floating_item li + li {
                list-style-type: none;
            }

        .floating_item .link_item {
            display: inline-block;
            overflow: hidden;
            position: relative;
            width: 55px;
            height: 55px;
            -webkit-border-radius: 30px;
            border-radius: 30px;
            text-align: center;
            -webkit-box-shadow: 3px 4px 10px 2px rgba(0, 0, 0, .2);
            box-shadow: 3px 4px 10px 2px rgba(0, 0, 0, .2);
            background-color: #ffe600;
            -webkit-transition: .2s ease-out;
            transition: .2s ease-out;
            -webkit-transform-origin: 0 100%;
            -ms-transform-origin: 0 100%;
            transform-origin: 0 100%;
        }

            .floating_item .link_item:focus, .floating_item .link_item:hover {
                width: auto;
                background-color: #ffe600;
                -webkit-border-radius: 30px;
                border-radius: 30px;
                padding: 0 25px;
            }

                .floating_item .link_item:focus .text, .floating_item .link_item:hover .text {
                    display: inline-block;
                    opacity: 1;
                    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=100)";
                    color: Black;
                }

            .floating_item .link_item .text {
                display: none;
                margin-left: 10px;
                font-size: 15px;
                vertical-align: top;
                line-height: 60px;
                color: #fff;
                white-space: nowrap;
                opacity: 0;
                -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
            }

    @media screen and (max-width:767px) {
        .floating_item {
            right: 10px;
            bottom: 10px;
        }
    }
</style>

<ul class="floating_item _floating">
    <li><a class="link_item theme_background _btnFloating" data-cid="" href="https://wa.me/989216343320?text=" target="_blank" data-type="defaultPhone"
        data-data=""><span class="text">مشاوره تخصصی پخش فیلم</span>
        <img src='<%= ResolveUrl("~/files/images/icons/whatsapp.svg") %>' />
    </a></li>
    <li>
         <%--href='<%= ResolveUrl("~/تماس-با-درگاه-فیلم-ایران?modal=true") %>'--%>
        <a class="link_item theme_background _btnFloating" data-cid=""
       onclick="OpenModalFlowingContact();" data-type="defaultPhone"
        data-data=""><span class="text">تماس با کارشناسان شرکت</span>
        <img src='<%= ResolveUrl("~/files/images/icons/phone.svg") %>' />
    </a></li>
    <li id="TOPTOP" style="display: none;">

        <a onclick='window.scrollTo({top: 0, behavior: "smooth"});' class="link_item top_item _btnFloating">

            <img width="45" src='<%= ResolveUrl("~/files/images/icons/arrow_up.png") %>' />
        </a>

    </li>
</ul>
<!-- Modal -->
<div class="modal fade" id="ModalFlowingContact" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">مشاوره تلفنی</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                اساس شرکت «درگاه فیلم ایران» بر مشاوره و آگاهسازی قبل از قرارداد متمرکز است.
                <br/>
                روی یکی از شماره‌های زیر کلیک و یا تاچ کرده 
                و در خصوص پخش، ارسال، فروش فیلم و فیلمنامه‌تان، مشاوره رایگان بگیرد.
                <br />
                باافتخار منتظریم ...
            </div>
            <div class="modal-footer">
                <a href="tel:09216343320" class="btn btn-primary">کارشناس پخش 1</a>
                <a href="tel:09020763947" class="btn btn-primary">کارشناس پخش 2</a>
                <a href="tel:09359300460" class="btn btn-primary">کارشناس پخش 3</a>
                <a href="tel:09332300598" class="btn btn-primary">روابط عمومی</a>
            </div>
            <hr />
            <a href="/تماس-با-درگاه-فیلم-ایران" class="btn btn-gray">قرار دادن پیام نوشتاری</a>
        </div>
    </div>
</div>
<script>
    function OpenModalFlowingContact() {
        $("#ModalFlowingContact").modal("show");
    }
    window.addEventListener("scroll", (event) => {
        let scrollY = this.scrollY;
        //let scrollX = this.scrollX;
        if (scrollY == 0)
            document.getElementById("TOPTOP").style.display = 'none'
        else
            document.getElementById("TOPTOP").style.display = 'inline'
    });
    window.onload = function () {
        if (scrollY == 0)
            document.getElementById("TOPTOP").style.display = 'none'
        else
            document.getElementById("TOPTOP").style.display = 'inline'
    }
</script>
