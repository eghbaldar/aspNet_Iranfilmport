<%@ Control Language="VB" AutoEventWireup="false" CodeFile="FlowingControls.ascx.vb"
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
    <li><a class="link_item theme_background _btnFloating" data-cid=""
        href='<%= ResolveUrl("~/تماس-با-درگاه-فیلم-ایران?modal=true") %>' target="_blank" data-type="defaultPhone"
        data-data=""><span class="text">تماس با کارشناسان شرکت</span>
        <img src='<%= ResolveUrl("~/files/images/icons/phone.svg") %>' />
    </a></li>
    <%--    <li><a href="https://apivff.modoo.at/?link=bmtbmrvu#" class="link_item theme_background _btnFloating"
        data-cid="9033mxso" data-type="address" data-data="" data-name="오시는길"><span class="icon icon5">
        </span><span class="text">Taha</span> </a></li>--%>
    <li id="TOPTOP" style="display: none;">

        <a onclick='window.scrollTo({top: 0, behavior: "smooth"});' class="link_item top_item _btnFloating">

            <img width="45" src='<%= ResolveUrl("~/files/images/icons/arrow_up.png") %>' />
        </a>

    </li>
</ul>
<script>
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
