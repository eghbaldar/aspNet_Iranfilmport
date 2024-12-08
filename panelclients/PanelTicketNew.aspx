<%@ Page Title="" Language="VB" MasterPageFile="~/panelclients/MasterPanel.master" AutoEventWireup="false" CodeFile="PanelTicketNew.aspx.vb" Inherits="PanelTicketNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--JQuery--%>
    <script type="text/javascript" src='<%= ResolveUrl("~/files/js/recordvoice/jquery.min.js") %>'></script>
    <%--Sweet ALert--%>
    <script src="../../files/sweetalert/sweetalert2.all.min.js"></script>
    <link href="../../files/sweetalert/sweetalert2.min.css" rel="stylesheet" />
    <script src="../../files/sweetalert/sweetalert2.min.js"></script>
    <%--Modal--%>
    <script src='<%= ResolveUrl("~/files/js/recordvoice/jquery-3.2.1.slim.min.js") %>' integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src='<%= ResolveUrl("~/files/js/recordvoice/popper.min.js") %>' integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src='<%= ResolveUrl("~/files/js/recordvoice/bootstrap.min.js") %>' integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <%--Main Style--%>
    <style type="text/css">
div:where(.swal2-container) div:where(.swal2-actions):not(.swal2-loading) .swal2-styled {
   font-family:Samim !important;
}
        #countup {
            direction: ltr;
        }

        .btnStop {
            display: none;
            background-color: red;
            color: white;
            border-radius: 5px;
            padding: 5px;
            font-family: Samim;
            border: 0;
            cursor: pointer;
        }

        .btn-Open-modal-voice {
            width: 100%;
            height: 20px;
            background-color: #ffc800;
            color: black;
            font-family: Samim;
            border: 1px dotted black;
            padding: 20px;
            border-radius: 10px;
            cursor: pointer;
        }

        .linkbtnMethod {
            border: 2px dotted orange;
            padding: 10px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }

        .cmdCss {
            padding: 10px;
            text-align: center;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            font-family: Samim;
        }

        .dropCss {
            text-align: left;
            padding: 4px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            direction: ltr;
        }

        .tb {
            width: 100%;
        }

            .tb td {
                padding: 10px;
            }

            .tb tr {
                background-color: #f6f6f6;
            }

        .warning {
            padding: 10px;
            background-color: #f2fff6;
            border: 1px solid #8affab;
            border-radius: 10px;
            margin-top: 10px;
            margin-bottom: 10px;
            color: #2f8f4d;
            font-size: 12px;
            text-align: center;
        }

        .MnuButtons {
            padding: 8px;
            color: black;
            background-color: lightgray;
            text-align: center;
            margin: 5px;
            font-size: 11px;
            width: 150px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }
        /*////////////////////////////*/

        input[type=text], select, textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            resize: vertical;
        }

        @media screen and (max-width: 600px) {
            .MnuButtons {
                width:100%;
            }
            .tb {
                border: 0;
            }

                .tb caption {
                    font-size: 1.3em;
                }

                .tb thead {
                    border: none;
                    clip: rect(0 0 0 0);
                    height: 1px;
                    margin: -1px;
                    overflow: hidden;
                    padding: 0;
                    position: absolute;
                    width: 1px;
                }

                .tb tr {
                    border-bottom: 3px solid #ddd;
                    display: block;
                    margin-bottom: .625em;
                }

                .tb td {
                    border-bottom: 1px solid #ddd;
                    display: block;
                    font-size: .8em;
                    text-align: right;
                }

                    .tb td::before {
                        /*
    * aria-label has no advantage, it won't be read inside a table
    content: attr(aria-label);
    */
                        content: attr(data-label);
                        float: left;
                        font-weight: bold;
                        text-transform: uppercase;
                    }

                    .tb td:last-child {
                        border-bottom: 0;
                    }
        }
        /*////////////////////////////*/
        .alert {
            background-color: #F8D7DA;
            color: #721C24;
            padding: 10px;
            font-size: 13px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }
    </style>
    <%--Blinking--%>
    <style>
        .blink {
            animation: blinker 1s linear infinite;
        }

        @keyframes blinker {
            50% {
                opacity: 0;
            }
        }
    </style>
    <%--Wave Style, show when recoding--%>
    <style>
        .waveUl {
            padding: 0;
            list-style-type: none;
        }

            .waveUl li {
                list-style: none;
                width: 5px;
                height: 15px;
                background: #262626;
                margin: 0 2px;
                border-radius: 5px;
                animation: animate .7s infinite alternate
            }

        @keyframes animate {
            0% {
                transform: scaleY(1);
            }

            25% {
                transform: scaleY(1);
            }

            50% {
                transform: scaleY(1);
            }

            75% {
                transform: scaleY(1);
            }

            100% {
                transform: scaleY(3);
            }
        }

        .waveUl li:nth-child(1) {
            animation-delay: .1s;
        }

        .waveUl li:nth-child(2) {
            animation-delay: .2s;
        }

        .waveUl li:nth-child(3) {
            animation-delay: .3s;
        }

        .waveUl li:nth-child(4) {
            animation-delay: .4s;
        }

        .waveUl li:nth-child(5) {
            animation-delay: .5s;
        }

        .waveUl li:nth-child(6) {
            animation-delay: .6s;
        }
    </style>
    <%--Wave Style, show when playing--%>
    <style>
        .container {
            display: flex;
            flex-direction: column;
            > *

        {
            margin: 8px;
        }

        }

        button {
            max-width: 300px;
        }

        .playpause {
            background-color: red;
            color: white;
            padding: 4px;
            width: 50px;
            font-size: 9px;
            text-align: center;
            cursor: pointer;
        }
    </style>
    <style>
        {
            "container": "body", "height": 96, "splitChannels": false, "normalize": true, "waveColor": "#ffdd00", "progressColor": "#8f8f8f", "cursorColor": "#ddd5e9", "cursorWidth": 5, "barWidth": 5, "barGap": 2, "barRadius": 30, "barHeight": 0.5, "barAlign": "", "minPxPerSec": 1, "fillParent": true, "url": "/wavesurfer-code/examples/audio/audio.wav", "media":

        {
        }

        ,
        "autoplay": false,
        "interact": true,
        "hideScrollbar": false,
        "audioRate": 1,
        "autoScroll": true,
        "autoCenter": true,
        "sampleRate": 8000
        }
    </style>
    <%--Conversation--%>
    <style>
        .CssTicketSysAdmin {
            width: 55%;
            float: left;
            padding: 15px;
            color: white;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            color: black;
        }

        .CssTicketClient {
            width: 55%;
            float: right;
            padding: 15px;
            color: white;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            color: black;
        }

        .CssTicketContextTitle {
            padding: 5px;
            background-color: #545454;
            color: white;
            font-style: italic;
            font-size: 12px;
            width: 150px;
            margin-bottom: 10px;
            border: 2px dotted gray;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
        }

        .CssTicket {
            padding: 15px;
            border: 2px dotted gray;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            margin: 5px;
        }

        .CssTicketSysAdminBubble {
            width: 100px;
            align-items: flex-start;
            background: #ff9029;
            padding: 20px;
            font-weight: 900;
            font-size: 10px;
            color: #fff;
            text-align: left;
            font-family: Samim;
            position: relative;
        }

        .admin:before {
            content: "";
            width: 0px;
            height: 0px;
            position: absolute;
            border-left: 10px solid transparent;
            border-right: 10px solid #ff9029;
            border-top: 10px solid #ff9029;
            border-bottom: 10px solid transparent;
            left: -19px;
            top: 6px;
        }

        .CssTicketClientBubble {
            font-size: 9px;
            width: 110px;
            margin: 5px 35px 0px 5px;
            background: gray;
            padding: 20px;
            text-align: right;
            font-weight: 900;
            color: #fff;
            font-family: Samim;
            position: relative;
        }

        .client:before {
            content: "";
            width: 0px;
            height: 0px;
            position: absolute;
            border-left: 10px solid gray;
            border-right: 10px solid transparent;
            border-top: 10px solid gray;
            border-bottom: 10px solid transparent;
            right: -20px;
            top: 6px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="HiddenFieldNewOrResponse" Value="0" runat="server" />
    <asp:HiddenField ID="HiddenFieldToken" Value="0" runat="server" />
    <asp:HiddenField ID="HiddenFieldClientID" runat="server" />
    <asp:HiddenField ID="HiddenFieldResponseSections" runat="server" />
    <asp:HiddenField ID="HiddenFieldResponseIdSubmission" runat="server" />
    <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">



            <div class="TitleTitle">
                ایجاد تیکت جدید
            </div>
            <div style="padding-top: 10px;">
                <table class="tb">
                    <tr>
                        <td>بخش مورد نظر:</td>
                        <td>
                            <asp:DropDownList CssClass="cmdCss" Style="text-align: right;" ID="cmdSections" runat="server" AutoPostBack="True">
                                <asp:ListItem Value="0">امور فستیوال‌ها و سوالاتی در خصوص پخش و مسائل فنی</asp:ListItem>
                                <asp:ListItem Value="1">امور مالی</asp:ListItem>
                                <asp:ListItem Value="2">روابط عمومی</asp:ListItem>
                                <asp:ListItem Value="3">امور فنی سایت</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>فیلم:</td>
                        <td>
                            <asp:DropDownList ID="cmdFilm" runat="server" CssClass="dropCss" DataSourceID="sds_film"
                                DataTextField="Film" DataValueField="ID" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sds_film" runat="server"
                                ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>"
                                SelectCommand="select [id],[film] from [dbo].[tbFilms] where customerId = @customerId">
                                <SelectParameters>
                                    <asp:RouteParameter Name="customerId" RouteKey="id" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div>
                                <strong style="color: red; font-size: 12px;">اگر درخواست‌تان در مورد یکی از فیلم‌هایتان، لطفا آن را انتخاب کنید.
                                </strong>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>فستیوال مورد نظر:</td>
                        <td>
                            <div>
                                <asp:DropDownList ID="cmdFestival" runat="server" CssClass="dropCss"
                                    DataSourceID="sds_submission" DataTextField="festival" DataValueField="id">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sds_submission" runat="server" ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>" SelectCommand="SELECT * FROM [tbSubmission] WHERE ([id_film] = @id_film) ORDER BY [date_of_entryData] DESC">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="cmdFilm" Name="id_film" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div>
                                <strong style="color: red; font-size: 12px;">اگر درخواست‌تان در مورد فستیوال خاصی است که قبلا برای شما ارسال شده است، لطفا آن را انتخاب کنید.
                                </strong>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <asp:MultiView ID="MultiViewMethod" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View4" runat="server">
                        <div style="text-align: center; align-content: center; padding: 20px;">
                            <div style="font-size: 25px; text-align: right;">
                                روش ایجاد تیکت را انتخاب کنید:
                            </div>
                            <br />

                            <asp:LinkButton runat="server" Height="60" ForeColor="#606060"
                                ID="btnMethodText"
                                CssClass="linkbtnMethod"
                                Style="padding: 10px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;">
    
    <asp:Label runat="server" Text="ارسال متن" style="margin:20px 0px 50px 5px; float:left;"/>
                                    <asp:Image runat="server"
                                        ImageUrl="~/files/images/icons/clientmethod_text.png" Height="50" style="float:left;"/>
                            </asp:LinkButton>

                          






















                           

                           <asp:LinkButton runat="server" Height="60" ForeColor="#606060"
                                ID="btnMethodRecord"
                                CssClass="linkbtnMethod"
                                Style="padding: 10px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;">
    
    <asp:Label runat="server" Text="ارسال ویس (امکان جدید)" style="margin:20px 0px 50px 5px; float:left;"/>
                                    <asp:Image runat="server" ImageUrl="~/files/images/icons/clientmethod_record.png" Height="50" style="float:left;"/>
                            </asp:LinkButton>
                              
















                        </div>
                    </asp:View>
                    <asp:View ID="View5" runat="server">


                        <div>
                            <asp:TextBox ID="txtText" Font-Names="Samim"
                                CssClass="col-75"
                                runat="server" TextMode="MultiLine"
                                placeholder="متن خود را وارد کنید ..." Height="250px" Width="100%"></asp:TextBox>
                        </div>
                        <div style="padding-top: 15px;">
                            <asp:Button  CssClass="panelbtn" ID="btnInsert" Font-Names="Samim" runat="server" Style="padding: 7px; cursor: pointer;" Text="ثبت" />
                        </div>
                    </asp:View>
                    <asp:View ID="View6" runat="server">
                        <div style="background-color:#ffdede;padding:20px;">
                         <div style="padding-bottom:10px; width:100%;text-align:center;font-size:20px;color:red;" class="blink">جهت رکورد ویس خود روی شکل زیر کلیک/تاچ کنید:</div>
                        <div style="  
                         display: flex;
   flex-direction: row;
   flex-wrap: wrap;
   justify-content: center;
   align-items: center;">

                        
                        <button type="button" data-toggle="modal"
                            class="linkbtnMethod"
                            style="text-align: center; cursor: pointer;"
                            data-target=".bd-example-modal-sm"
                           >


                            <asp:Image runat="server"
                                ImageUrl="~/files/images/icons/clientmethod_record.png" CssClass="blink" Height="50" />

                        </button>
                        </div>
                            </div>

                    </asp:View>
                </asp:MultiView>
            </div>

        </asp:View>
        <asp:View ID="View2" runat="server">
            <div class="warning">

                <img src="../../../files/images/icons/tick.png" />
                <br />
                تیکت و یا کامنت جدید شما با موفقیت به ثبت رسید. لطفا منتظر پاسخ کارشناس مربوطه بمانید.
                <br />
                پاسخ را از پنل خود و قسمت تیکت ها پیگیری نمایید.
                <br />
                همچنین در صورت فعال بودن اس ام اس انبوه خود، فرآیند پاسخگویی را از طریق اس ام اس دریافت خواهید کرد.
            </div>
        </asp:View>
        <asp:View ID="ViewResponse" runat="server">
            <div style="padding-bottom: 20px; padding-top: 5px;">
                <a class="MnuButtons">
                    <span>وضعیت تیکت: </span>
                    <asp:Label ID="lblStatus" runat="server" Text="Label"></asp:Label></a>
                <a class="MnuButtons" href="#reply" style="text-decoration: none;">پاسخ به این تیکت </a>
            </div>
            <div style="background-color: #f6f6f6;">
                <asp:DataList ID="DataListResponses" runat="server"
                    Width="100%"
                    DataSourceID="sds_responses">

                    <ItemTemplate>


                        <asp:Panel ID="Panel_Voice" runat="server"
                            BackColor='<%# GetAdminClientBackground(Eval("id_client")) %>'
                            Visible='<%# IIf(Eval("textvoice") = True, True, False) %>'
                            CssClass='<%# IIf(Val(Eval("id_client")) = 0, "CssTicketSysAdmin", "CssTicketClient") %>'>
                            <asp:Panel ID="PanelTicketTitle" runat="server"
                                CssClass='<%# IIf(Val(Eval("id_client")) = 0, "CssTicketSysAdminBubble admin", "CssTicketClientBubble client") %>'>
                                <asp:Label ID="Label2" runat="server" Text='<%# GetWhich(Eval("Id_client")) %>' />
                            </asp:Panel>
                            <div class="CssTicket">
                                <div id='<%# String.Format("div_{0}", Eval("id")) %>' style="background-color: dimgrey;">
                                </div>
                                <div id='<%# String.Format("divPlayPause_{0}", Eval("id")) %>' class="playpause">
                                    بازپخش
                                </div>
                                <div>
                                    در صورت عدم پخش فایل صوتی، <a href='<%# "../../panel/ticket/voice/" & Eval("voicefile").Replace(".mp3", "") %>' target="_blank">(اینجا) </a>کلیک کنید.
                                </div>
                                <script type="module">

                                    import WaveSurfer from '/files/js/recordvoice/wavesurfer.esm.js'

                                    var file = '../../files/clientsStaff/ticketVoices/' + '<%#String.Format("{0}", Eval("voicefile")) %>';

                                    const wavesurfer = WaveSurfer.create({
                                        container: '<%# String.Format("#div_{0}", Eval("id")) %>',
                                        "height": 96,
                                        "splitChannels": false,
                                        "normalize": true,
                                        "waveColor": "#ffdd00",
                                        "progressColor": "#8f8f8f",
                                        "cursorColor": "#ddd5e9",
                                        "cursorWidth": 5,
                                        "barWidth": 5,
                                        "barGap": 2,
                                        "barRadius": 30,
                                        "barHeight": 0.5,
                                        "barAlign": "",
                                        "minPxPerSec": 1,
                                        "fillParent": true,
                                        url: file,
                                    })

                                    wavesurfer.on('interaction', () => {
                                        wavesurfer.play()
                                    })

                                    // Play/pause button
                                    const button = document.getElementById('<%# String.Format("divPlayPause_{0}", Eval("id")) %>')
                                    wavesurfer.once('ready', () => {
                                        button.onclick = () => {
                                            wavesurfer.playPause()
                                        }
                                    })
                                    wavesurfer.on('play', () => {
                                        button.textContent = 'توقف پخش'
                                    })
                                    wavesurfer.on('pause', () => {
                                        button.textContent = 'بازپخش'
                                    })
                                </script>
                            </div>
                            <br />
                            <asp:Label Style="font-size: 12px; color: #a3a3a3;" ID="Label1" runat="server" Text='<%# "تاریخ ثبت: " & GetDate(Eval("date")) %>' />

                        </asp:Panel>

                        <asp:Panel ID="Panel_Text" runat="server"
                            Visible='<%#IIf(Eval("textvoice") = False, True, False) %>'
                            BackColor='<%# GetAdminClientBackground(Eval("id_client")) %>'
                            CssClass='<%# IIf(Val(Eval("id_client")) = 0, "CssTicketSysAdmin", "CssTicketClient") %>'>
                            <asp:Panel ID="Panel1" runat="server"
                                CssClass='<%# IIf(Val(Eval("id_client")) = 0, "CssTicketSysAdminBubble admin", "CssTicketClientBubble client") %>'>
                                <asp:Label ID="Id_clientLabel" runat="server" Text='<%# GetWhich(Eval("Id_client")) %>' />
                            </asp:Panel>
                            <div class="CssTicket">
                                <div style="padding-right: 15px;">
                                    <asp:Label ID="textLabel" runat="server" Text='<%# Eval("text") %>' />
                                </div>
                            </div>
                            <br />

                            <asp:Label Style="font-size: 12px; color: #a3a3a3;" ID="dateLabel" runat="server" Text='<%# "تاریخ ثبت: " & GetDate(Eval("date")) %>' />

                        </asp:Panel>

                    </ItemTemplate>

                </asp:DataList>
            </div>
            <asp:SqlDataSource ID="sds_responses" runat="server"
                ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                SelectCommand="SELECT * FROM [tbl_Comment_clients] WHERE (id_client=@Id or id_client=0) 
                And (([Id] = @Id_parent) or ([Id_parent] = @Id_parent)) order by [date] asc">
                <SelectParameters>
                    <asp:RouteParameter Name="Id" RouteKey="id" Type="Int64" />
                    <asp:QueryStringParameter Name="Id_parent" QueryStringField="ticket_token" Type="Int64" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div style="margin-top: 20px;" id="reply">

                <asp:MultiView ID="MultiViewAnswer" runat="server" ActiveViewIndex="1">
                    <asp:View ID="View" runat="server">
                        <div class="alert" role="alert">
                            تا پاسخگویی کارشناس مربوطه، امکان ارسال جواب وجود نخواهد داشت.
                            <br />
                            لطفا صبور باشید.
                        </div>
                    </asp:View>
                    <asp:View ID="View8" runat="server">
                        <div style="font-size: 19px; padding-bottom: 15px;">
                            ارسال جوابی برای این تیکت ...
                        </div>
                        <div style="text-align: center; align-content: center; padding: 20px;">
                            <asp:LinkButton runat="server" Height="60" ForeColor="#606060"
                                ID="btnEnableResponseText"
                                CssClass="linkbtnMethod"
                                Style="padding: 10px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;">
    
<asp:Label runat="server" Text="ارسال متن" style="margin:20px 0px 50px 5px; float:left;"/>
                            <asp:Image runat="server"
                                ImageUrl="~/files/images/icons/clientmethod_text.png" Height="50" style="float:left;"/>
                            </asp:LinkButton><asp:LinkButton runat="server" Height="60" ForeColor="#606060"
                                ID="btnEnableResponseVoice"
                                CssClass="linkbtnMethod"
                                Style="padding: 10px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;">
    
<asp:Label runat="server" Text="ارسال ویس (امکان جدید)" style="margin:20px 0px 50px 5px; float:left;"/>
                            <asp:Image runat="server" ImageUrl="~/files/images/icons/clientmethod_record.png" Height="50" style="float:left;"/>
                            </asp:LinkButton>
                        </div>
                    </asp:View>
                    <asp:View ID="View7" runat="server">

                        <div>
                            <asp:TextBox ID="txtResponse" Font-Names="Samim" Style="padding: 10px; font-size: 15px;" runat="server" TextMode="MultiLine"
                                placeholder="متن خود را وارد کنید ..." Height="250px" Width="100%"></asp:TextBox>
                        </div>
                        <div style="padding-top: 15px;">
                            <asp:Button CssClass="cmdCss" ID="btnResponse" Font-Names="Samim" runat="server" Style="padding: 7px; cursor: pointer;" Text="ثبت" />
                        </div>
                    </asp:View>
                    <asp:View ID="View3" runat="server">


                        <button type="button" data-toggle="modal"
                            class="linkbtnMethod"
                            style="width: 100%; text-align: center; cursor: pointer;"
                            data-target=".bd-example-modal-sm">


                            <asp:Image runat="server"
                                ImageUrl="~/files/images/icons/clientmethod_record.png" CssClass="blink" Height="50" />

                        </button>


                    </asp:View>
                </asp:MultiView>
            </div>
        </asp:View>


    </asp:MultiView>

    <!-- Small modal -->
    <div id="myModal" class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content"
                style=" display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;width:200px;
    -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius:5px;">
                <span>
                        
                </span>
                <div style="text-align: center; display: grid; place-items: center;">
                    <audio id="recorder" muted hidden></audio>
                    <img src="../../files/images/icons/ic_record.png"
                        style="cursor: pointer;" onclick="StatusRec()" width="70" id="start" />
                    <ul class='waveUl' style="display: none;">
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                    <hr />
                    <button type='button' class="btnStop" id="stop" onclick="StatusRec()">توقف و ارسال ویس</button><hr />
                    <span id="lblRecord" style="font-family: Samim; display: none; color: gray;">صدای شما در حال ضبط می‌باشد ... </span>
                    <hr />
                    <div id="countup">
                        <span id="minutes"></span>
                        <span id="seconds"></span>
                    </div>
                    <div style="padding:2px;border:1px solid #d0d0d0;background-color:#ebebeb;text-align:center;font-family:Samim;font-size:10px;color:gray;
-moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius:5px;">
                        <span>
                            پس از توقف و ارسال ویس، تا آپلود کامل صبر کرده و صفحه را رفرش نکنید.
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // All wavesurfer options in one place: https://wavesurfer-js.org/examples/#all-options.js 
        //import WaveSurfer from 'https://unpkg.com/wavesurfer.js@7/dist/wavesurfer.esm.js'
        import WaveSurfer from 'https://iranfilmport.com/files/js/recordvoice/wavesurfer.esm.js'

        const audio = new Audio()
        audio.controls = true
        audio.style.width = '100%'
        document.body.appendChild(audio)

        const options = {
            /** HTML element or CSS selector (required) */
            container: 'body',
            /** The height of the waveform in pixels */
            height: 128,
            /** Render each audio channel as a separate waveform */
            splitChannels: false,
            /** Stretch the waveform to the full height */
            normalize: false,
            /** The color of the waveform */
            waveColor: '#ff4e00',
            /** The color of the progress mask */
            progressColor: '#dd5e98',
            /** The color of the playpack cursor */
            cursorColor: '#ddd5e9',
            /** The cursor width */
            cursorWidth: 5,
            /** Render the waveform with bars like this: ▁ ▂ ▇ ▃ ▅ ▂ */
            barWidth: NaN,
            /** Spacing between bars in pixels */
            barGap: NaN,
            /** Rounded borders for bars */
            barRadius: NaN,
            /** A vertical scaling factor for the waveform */
            barHeight: NaN,
            /** Vertical bar alignment **/
            barAlign: '',
            /** Minimum pixels per second of audio (i.e. zoom level) */
            minPxPerSec: 1,
            /** Stretch the waveform to fill the container, true by default */
            fillParent: true,
            /** Audio URL */
            //url: file,*/
            /** Pre-computed audio data */
            peaks: undefined,
            /** Pre-computed duration */
            duration: undefined,
            /** Use an existing media element instead of creating one */
            media: audio,
            /** Play the audio on load */
            autoplay: false,
            /** Pass false to disable clicks on the waveform */
            interact: true,
            /** Hide the scrollbar */
            hideScrollbar: false,
            /** Audio rate */
            audioRate: 1,
            /** Automatically scroll the container to keep the current position in viewport */
            autoScroll: true,
            /** If autoScroll is enabled, keep the cursor in the center of the waveform during playback */
            autoCenter: true,
            /** Decoding sample rate. Doesn't affect the playback. Defaults to 8000 */
            sampleRate: 8000,
        }

        const wavesurfer = WaveSurfer.create(options)

        wavesurfer.on('ready', () => {
            wavesurfer.setTime(10)
        })

        // Generate a form input for each option
        const schema = {
            height: {
                value: 128,
                min: 10,
                max: 512,
                step: 1,
            },
            cursorWidth: {
                value: 1,
                min: 0,
                max: 10,
                step: 1,
            },
            minPxPerSec: {
                value: 1,
                min: 1,
                max: 1000,
                step: 1,
            },
            barWidth: {
                value: 0,
                min: 1,
                max: 30,
                step: 1,
            },
            barHeight: {
                value: 1,
                min: 0.1,
                max: 4,
                step: 0.1,
            },
            barGap: {
                value: 0,
                min: 1,
                max: 30,
                step: 1,
            },
            barRadius: {
                value: 0,
                min: 1,
                max: 30,
                step: 1,
            },
            peaks: {
                type: 'json',
            },
            audioRate: {
                value: 1,
                min: 0.1,
                max: 4,
                step: 0.1,
            },
            sampleRate: {
                value: 8000,
                min: 8000,
                max: 48000,
                step: 1000,
            },
        }

        const form = document.createElement('form')
        Object.assign(form.style, {
            display: 'flex',
            flexDirection: 'column',
            gap: '1rem',
            padding: '1rem',
        })
        document.body.appendChild(form)

        for (const key in options) {
            if (options[key] === undefined) continue
            const isColor = key.includes('Color')

            const label = document.createElement('label')
            Object.assign(label.style, {
                display: 'flex',
                alignItems: 'center',
            })

            const span = document.createElement('span')
            Object.assign(span.style, {
                textTransform: 'capitalize',
                width: '7em',
            })
            span.textContent = `${key.replace(/[a-z0-9](?=[A-Z])/g, '$& ')}: `
            label.appendChild(span)

            const input = document.createElement('input')
            const type = typeof options[key]
            Object.assign(input, {
                type: isColor ? 'color' : type === 'number' ? 'range' : type === 'boolean' ? 'checkbox' : 'text',
                name: key,
                value: options[key],
                checked: options[key] === true,
            })
            if (input.type === 'text') input.style.flex = 1
            if (options[key] instanceof HTMLElement) input.disabled = true

            if (schema[key]) {
                Object.assign(input, schema[key])
            }

            label.appendChild(input)
            form.appendChild(label)

            input.oninput = () => {
                if (type === 'number') {
                    options[key] = input.valueAsNumber
                } else if (type === 'boolean') {
                    options[key] = input.checked
                } else if (schema[key] && schema[key].type === 'json') {
                    options[key] = JSON.parse(input.value)
                } else {
                    options[key] = input.value
                }
                wavesurfer.setOptions(options)
                textarea.value = JSON.stringify(options, null, 2)
            }
        }

        const textarea = document.createElement('textarea')
        Object.assign(textarea.style, {
            width: '100%',
            height: Object.keys(options).length + 1 + 'rem',
        })
        textarea.value = JSON.stringify(options, null, 2)
        textarea.readOnly = true
        form.appendChild(textarea)

    </script>

            <script type="text/javascript">
                function checkMicrophoneAccess() {
                    return new Promise((resolve, reject) => {
                        navigator.mediaDevices.getUserMedia({ audio: true })
                            .then((stream) => {
                                // If access is granted, stop the stream immediately
                                stream.getTracks().forEach(track => track.stop());

                                console.log("Microphone access granted. Recording is enabled.");
                                resolve(true); // Access is granted
                            })
                            .catch((error) => {
                                console.error("Microphone access denied:", error);
                                resolve(false); // Access is denied
                            });
                    });
                }
    </script>


    <script type="text/javascript">
        class VoiceRecorder {
            constructor() {
                if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
                    console.log("getUserMedia supported")
                } else {
                    console.log("getUserMedia is not supported on your browser!")
                }
                this.mediaRecorder
                this.stream
                this.chunks = []
                this.isRecording = false
                this.recorderRef = document.querySelector("#recorder")
                this.startRef = document.querySelector("#start")
                this.stopRef = document.querySelector("#stop")
                this.startRef.onclick = this.startRecording.bind(this)
                this.stopRef.onclick = this.stopRecording.bind(this)
                this.constraints = {
                    audio: true,
                    video: false
                }

            }

            handleSuccess(stream) {
                this.stream = stream
                this.stream.oninactive = () => {
                    console.log("Stream ended!")
                };
                this.recorderRef.srcObject = this.stream
                this.mediaRecorder = new MediaRecorder(this.stream)
                console.log(this.mediaRecorder)

                this.mediaRecorder.ondataavailable = this.onMediaRecorderDataAvailable.bind(this)

                this.mediaRecorder.onstop = this.onMediaRecorderStop.bind(this)
                this.recorderRef.play()
                this.mediaRecorder.start()

            }

            handleError(error) {
                console.log("navigator.getUserMedia error: ", error)
            }

            onMediaRecorderDataAvailable(e) {
                this.chunks.push(e.data)
                //object blob : e.data
                fun(e.data)

            }

            onMediaRecorderStop(e) {
                const blob = new Blob(this.chunks, { 'type': 'audio/ogg; codecs=opus' })
                const audioURL = window.URL.createObjectURL(blob)
                this.chunks = []
                this.stream.getAudioTracks().forEach(track => track.stop())
                this.stream = null
                StatusRec('OK')
            }

            startRecording() {

                checkMicrophoneAccess().then(isEnabled => {
                    if (!isEnabled) {
                        Swal.fire({
                            title: 'هشدار',
                            icon: 'warning',
                            text: 'اجازه ضبط صدا را به مرورگر خود بدهید',
                            showCancelButton: false,
                            showConfirmButton: false
                        })
                    }
                });

                if (this.isRecording) return
                this.isRecording = true
                this.startRef.innerHTML = 'Recording...'
                navigator.mediaDevices
                    .getUserMedia(this.constraints)
                    .then(this.handleSuccess.bind(this))
                    .catch(this.handleError.bind(this))
                StatusRec()
            }

            stopRecording() {
                if (!this.isRecording) return
                this.isRecording = false
                this.startRef.innerHTML = 'Record'
                this.recorderRef.pause()
                this.mediaRecorder.stop()
            }
        }

        window.voiceRecorder = new VoiceRecorder();
    </script>

    <script>
        function fun(b) {

            $('#myModal').modal('hide');
            $('*').css('cursor', 'wait') // change cursor to waiting mode
            $('#clickElement').off('click'); // not allowed to click evenet!
            ///////////////////////////////////////////
            var NewOrResponse = document.getElementById('<%= HiddenFieldNewOrResponse.ClientID %>').value;
            var Token = document.getElementById('<%= HiddenFieldToken.ClientID %>').value;
            var Id_Client = document.getElementById('<%= HiddenFieldClientID.ClientID %>').value;
            var Sections = document.getElementById('<%= HiddenFieldResponseSections.ClientID %>').value;
            var Id_Submission = document.getElementById('<%= HiddenFieldResponseIdSubmission.ClientID %>').value;

            var form = new FormData();
            form.append("voice", b);
            form.append("ClientOrAdmin", "1");
            form.append("NewOrResponse", NewOrResponse);
            form.append("Token", Token);
            form.append("Id_Client", Id_Client);
            form.append("Sections", Sections);
            form.append("Id_Submission", Id_Submission);
            var xhttp = new XMLHttpRequest();

            Swal.fire({
                title: 'در حال بارگزاری ویس',
                icon: 'info',
                html: "<img src='../../../files/images/icons/loading.svg'><br/> لطفا تا نمایش پیام موفقیت ارسال ویس، صبر کرده و به هیچ عنوان صفحه را نبندید و یا صفحه را رفرش نکنید",
                showCancelButton: false,
                showConfirmButton: false
            })

            xhttp.onreadystatechange = (e) => {
                if (xhttp.readyState !== 4) {
                    return;
                }
                if (xhttp.status === 200) {
                    Swal.fire({
                        title: 'پیام!',
                        text: 'تیکت شما از طریق «وُیس» با موفقیت ثبت شد. لطفا منتظر پاسخ کارشناس مربوطه بمانید.',
                        icon: 'success',
                        confirmButtonColor: '#ff9100',
                        confirmButtonText: 'متوجه شدم'
                    }).then((result) => {
                        if (result.value) {
                            if (NewOrResponse == 0) //new ticket
                                location.href = '../../panel/tickets/' + Id_Client;
                            if (NewOrResponse == 1) //response ticket
                                location.href = '../../panel/newtickets/' + Id_Client + '?newpost=off&ticket_token=' + Token + '&Status=2&sections=' + Sections + '&id_submission=' + Id_Submission;
                        }
                    });
                } else {
                    Swal.fire({
                        title: 'خطا!',
                        text: 'خطایی در ارسال وُیس‌تان پیش آمده است، در صورت آپلود ناقص وُیس، آن را پاک کرده و دوباره اقدام بفرمائید.',
                        icon: 'error',
                        confirmButtonColor: '#ff9100',
                        confirmButtonText: 'متوجه شدم'
                    });
                    location.href = '../../panel/tickets/' + Id_Client;
                }
            };

            xhttp.open("POST", "../../../panelclients/WebServiceRecordVoice.asmx/RecordVoice", true);
            xhttp.send(form);
        }
        function StatusRec() {

            var start = document.getElementById("start");
            var stop = document.getElementsByClassName("waveUl")[0];
            var btnStop = document.getElementById("stop");
            var lblRecord = document.getElementById("lblRecord");


            if (start.style.display === "none") {
                start.style.display = "block";
            } else {
                start.style.display = "none";
                startTime();
            }
            if (stop.style.display === "none") {
                stop.style.display = "flex";
                btnStop.style.display = "block";
                lblRecord.style.display = "block";
            } else {
                stop.style.display = "none";
                btnStop.style.display = "none";
                lblRecord.style.display = "none";
                stopTime();
            }

        }

        var count;
        var second = 0;

        function startTime() {
            var second = 0;
            function upTimer(count) { return count > 9 ? count : "0" + count; }
            count = setInterval(function () {
                $("#seconds").html(':' + upTimer(++second % 60));
                $("#minutes").html(upTimer(parseInt(second / 30, 10)));
            }, 1000);
        }
        function stopTime() {
            clearInterval(count);
        }
    </script>
</asp:Content>

