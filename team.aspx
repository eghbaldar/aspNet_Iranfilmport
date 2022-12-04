<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false"
    CodeFile="team.aspx.vb" Inherits="team" %>

<%@ Register Src="usercontrols/banners_right.ascx" TagName="banners_right" TagPrefix="uc1" %>
<%@ Register Src="usercontrols/last_articles.ascx" TagName="last_articles" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        @font-face {
            font-family: 'koodak';
            src: url(../../files/font/KoodakBold.ttf);
        }

        @font-face {
            font-family: 'Caveat';
            src: url(../../files/font/Caveat-Regular.ttf);
        }

        .Person {
            text-align: left;
        }

        .trPerson {
            background-color: #e9e9e9;
        }

        .T td:not(:first-child) {
            padding: 20px;
            border-top-left-radius: 50px;
            border-bottom-left-radius: 50px;
        }

        .trPerson:hover {
            background-color: #fff658;
            cursor: pointer;
        }

        @media only screen and (max-width: 760px), (min-device-width: 768px) and (max-device-width: 1024px) {
            .Person {
                text-align: center;
            }

            .txt {
                width: 100%;
            }
            /* Force table to not be like tables anymore */
            .T, thead, .T tbody, .T th, .T td, .T tr {
                display: block;
                border: none;
            }

                /* Hide table headers (but not display: none;, for accessibility) */
                .T thead tr {
                    position: absolute;
                    top: -9999px;
                    left: -9999px;
                }

                .T tr {
                    border: none;
                }

                .T td {
                    /* Behave  like a "row" */
                    border: none;
                    position: relative;
                    font-family: irsans;
                }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Page Title-->
    <section class="page-title text-center" style="background-image: url(files/images/background/MovibetaBG.jpg);">
        <div class="container">
            <div class="title-text">
                <h1 style="font-family: Titr;">
                    تیم درگاه فیلم ایران</h1>
            </div>
        </div>
    </section>
    <!--End Page Title-->
    <section class="blog-section style-four section2" style="margin-top: -50px;">
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-12 col-xs-12">
                    <div class="left-side" style="direction: rtl; padding: 10px;">
                        <div class="item-holder">
                            <div id="CEO">
                                <table class="T">
                                    <tr>
                                        <td style="vertical-align: top; text-align: center;">
                                            <img src="files/images/team/AlimohammadEghbaldar.JPG" style="border-radius: 40%;" width="250px" />
                                        </td>
                                        <td style="padding: 10px;">
                                            <div style="text-align: right;">
                                                <span style="font-family: Samim; font-weight: bolder; direction: rtl; font-size: 20px;
                                                    color: #e3cc00;">علیمحمد اقبالدار</span> <span style="font-family: Samim; direction: rtl;
                                                        font-size: 15px;">مدیرعامل و نماینده بین المللی فیلم و فیلمنامه </span>
                                            </div>
                                            <div style="font-family: Samim; text-align: justify; font-size: 14px;">
                                                «علیمحمد اقبالدار»، فیلمساز و پخش کننده ایرانی، از سال 1392 مدیریت «درگاه فیلم ایران»
                                                را برعهده دارد. وی فیلمسازی را از 1391 و از انجمن سینمای جوانان ایران آغاز و فیلم
                                                های کوتاه زیادی را کارگردانی کرده است. وی تجربه داوری های بین المللی را در جشنواره
                                                های زیر برعهده داشته است:
                                            </div>
                                            <div style="font-family: Samim; font-size: 14px;">
                                                <ul>
                                                    <li style="font-size: 20px;">فیلمسازی</li>
                                                    <li>
                                                        <ul>
                                                            <li style="font-weight: bolder;">1. فیلم کوتاه «خود» </li>
                                                            <li style="font-weight: bolder;">2. فیلم کوتاه «قلعه زندگی» </li>
                                                            <li style="font-weight: bolder;">3. فیلم کوتاه «ایمان کات» </li>
                                                            <li style="font-weight: bolder;">4. فیلم کوتاه «وارونه ی همیشه آرام» </li>
                                                            <li style="font-weight: bolder;">5. فیلم کوتاه «انتخاب» </li>
                                                            <li style="font-weight: bolder;">6. فیلم کوتاه «حس گمشده» </li>
                                                            <li style="font-weight: bolder;">7. فیلم کوتاه «من در آینه» </li>
                                                            <li style="font-weight: bolder;">8. فیلم کوتاه «یاد آن مرد» </li>
                                                            <li style="font-weight: bolder;">9. فیلم کوتاه «جذام» </li>
                                                            <li style="font-weight: bolder;">10. فیلم کوتاه «اتوپیا» </li>
                                                            <li style="font-weight: bolder;">11. فیلم کوتاه «یک اتفاق معمولی» </li>
                                                            <li style="font-weight: bolder;">12. فیلم کوتاه «نمایش 54» </li>
                                                            <li style="font-weight: bolder;">13. فیلم کوتاه «آخرین ورژن عشق» </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div style="font-family: Samim; font-size: 14px;">
                                                <ul>
                                                    <li style="font-size: 20px;">تجربه‌ی داوری بین‌المللی</li>
                                                    <li>
                                                        <ul>
                                                            <li style="font-weight: bolder;">1. جشنواره بین المللی Muslim Film Festival استرالیا
                                                                2020</li>
                                                            <li style="font-weight: bolder;">2. جشنواره بین المللی Short Counter یونان 2021</li>
                                                            <li style="font-weight: bolder;">3. جشنواره بین المللی Zilant Film روسیه 2021</li>
                                                            <li style="font-weight: bolder;">4. جشنواره بین المللی Aravali International Film هند
                                                                2021</li>
                                                            <li style="font-weight: bolder;">5. جشنواره بین المللی Willlachen Comedy & Satire Filmprize
                                                                اتریش 2021</li>
                                                            <li style="font-weight: bolder;">5. جشنواره بین المللی Jammu Film
                                                                هند 2021</li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </div>
                                            <br />
                                            <div style="text-align:center;">
                                                <a href="http://www.iranfilmport.com/files/images/team/eghbaldar/alimohammadeghbaldar(1).jpg" target="_blank">
                                                    <asp:Image ID="Image1" ImageUrl="~/files/images/team/eghbaldar/alimohammadeghbaldar(1)-small.jpg" Width="100" runat="server"></asp:Image>
                                                </a>
                                                <a href="http://www.iranfilmport.com/files/images/team/eghbaldar/alimohammadeghbaldar(2).jpeg" target="_blank">
                                                    <asp:Image ID="Image2" ImageUrl="~/files/images/team/eghbaldar/alimohammadeghbaldar(2)-small.jpeg" Width="100" runat="server"></asp:Image>
                                                </a>
                                                <a href="http://www.iranfilmport.com/files/images/team/eghbaldar/alimohammadeghbaldar(3).jpg" target="_blank">
                                                    <asp:Image ID="Image3" ImageUrl="~/files/images/team/eghbaldar/alimohammadeghbaldar(3)-small.jpg" Width="100" runat="server"></asp:Image>
                                                </a>
                                                <a href="http://www.iranfilmport.com/files/images/team/eghbaldar/alimohammadeghbaldar(4).jpg" target="_blank">
                                                    <asp:Image ID="Image4" ImageUrl="~/files/images/team/eghbaldar/alimohammadeghbaldar(4)-small.jpg" Width="100" runat="server"></asp:Image>   
                                                </a>

                                                
                                                
                                                
                                                
                                            </div>
                                            <br />
                                            <div style="text-align: left;">
                                                <span style="color: #e3cc00; font-family: Tahoma; font-size: 30px; font-weight: bolder;">
                                                    ALIMOHAMMAD EGHBALDAR </span><span style="line-height: 40px; font-family: Tahoma;
                                                        font-weight: bolder; font-size: 20px;">
                                                        <br />CEO & Founder of IRAN FILM PORT
                                            </div>
                                            <div style="text-align: justify; direction: ltr; line-height: 18px; font-family: Tahoma;
                                                font-size: 14px;">
                                                Alimohammad Eghbaldar was born in 1989 in Iran. He graduated with Computer in BA
                                                and Political Science in MA. He trained for directing course at the Iranian Youth
                                                Society Cinema (IYSC). An interest in cinema led Ali.M.Eghbaldar to begin filmmaking
                                                after graduated. He is also the CEO and founder of Iran Film Port (Under Gravity
                                                Films company license) in 2002. Activities of Iran Film Port include international
                                                distributing and marketing films and scripts. His films are selected and won in
                                                many of the international film festivals, plus he has been chosen for judging in
                                                the several film festival too.
                                            </div>
                                            <div style="direction: ltr;">
                                                <ul>
                                                    <li style="font-family: Caveat; font-size: 22px;">Experience of Festival's Judging</li>
                                                    <li>
                                                        <ul>
                                                            <li style="font-weight: bolder;">Muslim Film Festival - Australia - 2020</li>
                                                            <li style="font-weight: bolder;">Short Encounter - Greece - 2021</li>
                                                            <li style="font-weight: bolder;">Zilant Film Festival - Russia - 2021</li>
                                                            <li style="font-weight: bolder;">Aravali Film Festival - India - 2021</li>
                                                            <li style="font-weight: bolder;">Willlachen Comedy & Satire Filmprize - Austria - 2021</li>
                                                            <li style="font-weight: bolder;">Jammu Film Festival - India - 2021</li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div style="direction: ltr;">
                                                <a href="mailto:manager@iranfilmport.com">manager@iranfilmport.com </a>
                                                <br />
                                                <a href="mailto:info@eghbaldar.ir">info@eghbaldar.ir</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="trPerson">
                                        <td style="vertical-align: top; text-align: center;">
                                            <img src="files/images/team/peyvasteh.png" style="-moz-border-radius: 5px; -webkit-border-radius: 5px;
                                                border-radius: 5px;" width="200px" />
                                        </td>
                                        <td>
                                            <div class="Person">
                                                <div>
                                                    <span style="color: #e3cc00; font-family: Tahoma; font-size: 30px; font-weight: bolder;">
                                                        TAHERE PEYVASTE </span><span style="line-height: 40px; font-family: Tahoma; font-weight: bolder;
                                                            font-size: 20px;">
                                                            <br />
                                                            Manager of Distributing & Marketing
                                                            <br />
                                                        </span>
                                                </div>
                                                <div style="direction: ltr;">
                                                    <a href="mailto:support@iranfilmport.com">support@iranfilmport.com </a>
                                                    <br />
                                                    <a href="mailto:iranfilmportdistributor@gmail.com">iranfilmportdistributor@gmail.com
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr><tr><td></td><td></td></tr>
                                     <tr class="trPerson">
                                        <td style="vertical-align: top; text-align: center;">
                                            <img src="files/images/team/staffMan.png" style="-moz-border-radius: 5px; -webkit-border-radius: 5px;
                                                border-radius: 5px;" width="100px" />
                                        </td>
                                        <td>
                                            <div class="Person">
                                                <div>
                                                    <span style="color: #e3cc00; font-family: Tahoma; font-size: 30px; font-weight: bolder;">
                                                        BENYAMIN ARMANTALAB </span><span style="line-height: 40px; font-family: Tahoma; font-weight: bolder;
                                                            font-size: 20px;">
                                                            <br />
                                                            Administrator of IRAN FILM PORT
                                                            <br />
                                                        </span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr><td></td><td></td></tr>


                                                                          <tr class="trPerson">
                                        <td style="vertical-align: top; text-align: center;">
                                            <img src="files/images/team/toroghi.png" style="-moz-border-radius: 5px; -webkit-border-radius: 5px;
                                                border-radius: 5px;" width="200px" />
                                        </td>
                                        <td>
                                            <div class="Person">
                                                <div>
                                                    <span style="color: #e3cc00; font-family: Tahoma; font-size: 30px; font-weight: bolder;">
                                                        MohammadAmin Toroghi </span><span style="line-height: 40px; font-family: Tahoma; font-weight: bolder;
                                                            font-size: 20px;">
                                                            <br />
                                                           Responsible for the Tehran Office
                                                            <br />
                                                        </span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr><td></td><td></td></tr>

                                     <tr class="trPerson">
                                        <td style="vertical-align: top; text-align: center;">
                                            <img src="files/images/team/staffWoman.png" style="-moz-border-radius: 5px; -webkit-border-radius: 5px;
                                                border-radius: 5px;" width="100px" />
                                        </td>
                                        <td>
                                            <div class="Person">
                                                <div>
                                                    <span style="color: #e3cc00; font-family: Tahoma; font-size: 30px; font-weight: bolder;">
                                                        GHAZAL SARRAF </span><span style="line-height: 40px; font-family: Tahoma; font-weight: bolder;
                                                            font-size: 20px;">
                                                            <br />
                                                            Director of Public Relations
                                                            <br />
                                                        </span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr><tr><td></td><td></td></tr>
                                      <tr class="trPerson">
                                        <td style="vertical-align: top; text-align: center;">
                                            <img src="files/images/team/staffWoman.png" style="-moz-border-radius: 5px; -webkit-border-radius: 5px;
                                                border-radius: 5px;" width="100px" />
                                        </td>
                                        <td>
                                            <div class="Person">
                                                <div>
                                                    <span style="color: #e3cc00; font-family: Tahoma; font-size: 30px; font-weight: bolder;">
                                                        MARYAM FADAEI </span><span style="line-height: 40px; font-family: Tahoma; font-weight: bolder;
                                                            font-size: 20px;">
                                                            <br />
                                                            Financial Affairs
                                                            <br />
                                                        </span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr><tr><td></td><td></td></tr>
                                      <tr class="trPerson">
                                        <td style="vertical-align: top; text-align: center;">
                                            <img src="files/images/team/staffMan.png" style="-moz-border-radius: 5px; -webkit-border-radius: 5px;
                                                border-radius: 5px;" width="100px" />
                                        </td>
                                        <td>
                                            <div class="Person">
                                                <div>
                                                    <span style="color: #e3cc00; font-family: Tahoma; font-size: 30px; font-weight: bolder;">
                                                        MEHRDAD GHAFFARI </span><span style="line-height: 40px; font-family: Tahoma; font-weight: bolder;
                                                            font-size: 20px;">
                                                            <br />
                                                            Senior of Public Relations
                                                            <br />
                                                        </span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr><td></td><td></td></tr>
                                                                          <tr class="trPerson">
                                        <td style="vertical-align: top; text-align: center;">
                                            <img src="files/images/team/nedahasanzadeh.png" style="-moz-border-radius: 5px; -webkit-border-radius: 5px;
                                                border-radius: 5px;" width="200px" />
                                        </td>
                                        <td>
                                            <div class="Person">
                                                <div>
                                                    <span style="color: #e3cc00; font-family: Tahoma; font-size: 30px; font-weight: bolder;">
                                                        NEDA HASANZADEH </span><span style="line-height: 40px; font-family: Tahoma; font-weight: bolder;
                                                            font-size: 20px;">
                                                            <br />
                                                            Translator
                                                            <br />
                                                        </span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr><td></td><td></td></tr>
                                      <tr class="trPerson">
                                        <td style="vertical-align: top; text-align: center;">
                                            <img src="files/images/team/mb.png" style="-moz-border-radius: 5px; -webkit-border-radius: 5px;
                                                border-radius: 5px;" width="200px" />
                                        </td>
                                        <td>
                                            <div class="Person">
                                                <div>
                                                    <span style="color: #e3cc00; font-family: Tahoma; font-size: 30px; font-weight: bolder;">
                                                        MORTEZA BORHANI </span><span style="line-height: 40px; font-family: Tahoma; font-weight: bolder;
                                                            font-size: 20px;">
                                                            <br />
                                                            Translator
                                                            <br />
                                                        </span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr><td></td><td></td></tr>
                                      <tr class="trPerson">
                                        <td style="vertical-align: top; text-align: center;">
                                            <img src="files/images/team/ae.png" style="-moz-border-radius: 5px; -webkit-border-radius: 5px;
                                                border-radius: 5px;" width="200px" />
                                        </td>
                                        <td>
                                            <div class="Person">
                                                <div>
                                                    <span style="color: #e3cc00; font-family: Tahoma; font-size: 30px; font-weight: bolder;">
                                                        ASAL EGHBALDAR </span><span style="line-height: 40px; font-family: Tahoma; font-weight: bolder;
                                                            font-size: 20px;">
                                                            <br />
                                                            Graphic Affairs
                                                            <br />
                                                        </span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr><td></td><td></td></tr>
                                      <tr class="trPerson">
                                        <td style="vertical-align: top; text-align: center;">
                                            <img src="files/images/team/baharRava.png" style="-moz-border-radius: 5px; -webkit-border-radius: 5px;
                                                border-radius: 5px;" width="200px" />
                                        </td>
                                        <td>
                                            <div class="Person">
                                                <div>
                                                    <span style="color: #e3cc00; font-family: Tahoma; font-size: 30px; font-weight: bolder;">
                                                        Bahar Rava </span><span style="line-height: 40px; font-family: Tahoma; font-weight: bolder;
                                                            font-size: 20px;">
                                                            <br />
                                                            Public Relations Affair
                                                            <br />
                                                        </span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr><td></td><td></td></tr>
                                      <tr class="trPerson">
                                        <td style="vertical-align: top; text-align: center;">
                                            <img src="files/images/team/staffWoman.png" style="-moz-border-radius: 5px; -webkit-border-radius: 5px;
                                                border-radius: 5px;" width="100px" />
                                        </td>
                                        <td>
                                            <div class="Person">
                                                <div>
                                                    <span style="color: #e3cc00; font-family: Tahoma; font-size: 30px; font-weight: bolder;">
                                                        ATEFEH ALIDOOST </span><span style="line-height: 40px; font-family: Tahoma; font-weight: bolder;
                                                            font-size: 20px;">
                                                            <br />
                                                            Graphic Affairs & Editor
                                                            <br />
                                                        </span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <uc1:banners_right ID="banners_right1" runat="server" />
                <%--<uc2:last_articles ID="last_articles1" runat="server" />--%>
            </div>
        </div>
    </section>
</asp:Content>
