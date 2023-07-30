<%@ Page Title="" Language="VB" MasterPageFile="~/CMS/Pages/CMS.master" AutoEventWireup="false" CodeFile="commentClients.aspx.vb" Inherits="CMS_Pages_commentClients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--JQuery--%>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <%--Sweet ALert--%>
    <script src="../../../files/sweetalert/sweetalert2.all.min.js"></script>
    <link href="../../../files/sweetalert/sweetalert2.min.css" rel="stylesheet" />
    <script src="../../../files/sweetalert/sweetalert2.min.js"></script>
    <%--Modal--%>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
            direction: rtl;
            font-size: 14px;
        }

        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            .close:hover, .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="HiddenFieldToken" Value="0" runat="server" />
    <asp:HiddenField ID="HiddenFieldClientID" runat="server" />
    <div class="TITLE">
        <h4>تیکت های مشتریان
        </h4>
    </div>
    <div>
        <div style="padding-top: 10px;">
            <asp:MultiView ID="MultiView1" ActiveViewIndex="0" runat="server">
                <asp:View ID="View1" runat="server">

                    <asp:GridView ID="dgComments" runat="server"
                        Font-Size="13px"
                        AutoGenerateColumns="False" DataSourceID="SDS_Comments" AllowPaging="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" PageSize="20" Width="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="شماره تیکت" InsertVisible="False" SortExpression="Id">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="آی دی مشتری" InsertVisible="False" SortExpression="Id">
                                <ItemTemplate>
                                    <asp:Label ID="Lab11el3" runat="server" Text='<%# Bind("Id_client") %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="L1111abel1" runat="server" Text='<%# GetNameClient(Eval("Id_client")) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="بخش" SortExpression="Sections">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label ID="La1b1el4" runat="server" Text='<%# GetSection(Eval("Sections")) %>'></asp:Label>
                                    </div>
                                    <div runat="server" visible='<%#IIf(Eval("Sections") = 0, True, False) %>'
                                        style="direction: ltr; color: gray;">
                                        <asp:Label ID="L1ab3el2" runat="server" Text='<%# GetFilmFestival(Eval("id_submission")) %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="وضعیت" SortExpression="read">
                                <ItemTemplate>

                                    <asp:Panel
                                        Style="padding: 10px; color: white; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"
                                        ID="Panel1" runat="server" BackColor='<%# GetFlagBackground(Eval("flag")) %>'>
                                        <asp:Label ID="Label4" runat="server" Text='<%# GetFlag(Eval("flag")) %>'></asp:Label>
                                    </asp:Panel>

                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="تاریخ درج تیکت" SortExpression="date">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label ID="Lab1el4" runat="server" Text='<%# GetDate(Eval("date")) %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="" SortExpression="date">
                                <ItemTemplate>
                                    <div>
                                        <asp:ImageButton ID="ImageButton1"
                                            ImageUrl="~\files\images\icons\delete.png"
                                            CommandArgument='<%# Eval("Id") %>' OnCommand="DeleteComment"
                                            OnClientClick="return confirm('sure?');"
                                            runat="server" />
                                    </div>
                                    <div>
                                        <asp:Button ID="Button1"
                                            CommandArgument='<%# Eval("Id") & "|" & Eval("flag") & "|" & Eval("Id_client") %>'
                                            OnCommand="Ticket"
                                            CssClass="btn" BorderColor="Green" Font-Names="Samim" runat="server" Text="مشاهده" Width="100%" />
                                    </div>
                                    <hr />
                                    <div>
                                        <asp:Panel runat="server" BackColor='<%# GetReadBackground(Eval("read")) %>' Style="padding: 2px;">
                                            <asp:Button ID="Button2" CommandArgument='<%# Eval("Id") & "|1|1" %>' OnCommand="UpdateReadFlag" runat="server" BackColor="Red" Text="Read" />
                                            <asp:Button ID="Button3" CommandArgument='<%# Eval("Id") & "|1|0" %>' OnCommand="UpdateReadFlag" runat="server" BackColor="Green" Text="unRead" />
                                        </asp:Panel>
                                    </div>
                                    <hr />
                                    <div>
                                        <asp:Button ID="Button4" CommandArgument='<%# Eval("Id") & "|0|1" %>' OnCommand="UpdateReadFlag" runat="server" BackColor="Yellow" Text="Under Consideration" />
                                        <asp:Button ID="Button5" CommandArgument='<%# Eval("Id") & "|0|2" %>' OnCommand="UpdateReadFlag" runat="server" BackColor="Green" Text="Responsed" />
                                        <asp:Button ID="Button6" CommandArgument='<%# Eval("Id") & "|0|3" %>' OnCommand="UpdateReadFlag" runat="server" BackColor="LightGray" Text="Closed" />
                                    </div>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:TemplateField>

                        </Columns>
                        <EmptyDataTemplate>
                            <div style="padding: 10px;">
                                تیکتی به ثبت نرسیده است.
                            </div>
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SDS_Comments" runat="server"
                        ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                        SelectCommand="SELECT * FROM [tbl_Comment_clients] WHERE id_client<>0 and id_parent=0 ORDER BY flag asc,[date] DESC"></asp:SqlDataSource>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <div id="PnlWarning" class="warning" runat="server" visible="false" style="text-align: center;">
                        <asp:Label ID="lblResult" runat="server" Font-Size="20px"></asp:Label>
                    </div>
                    <hr />
                    <asp:Button ID="btnBacktoTickets" CssClass="tabBtn" runat="server" Text="بازگشت به تیکت ها" />
                    <hr />
                    <div style="padding: 8px; color: white; background-color: darkblue; margin: 5px; font-size: 11px; width: 150px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;">
                        <span>وضعیت تیکت:
                        </span>
                        <asp:Label ID="lblStatus" runat="server" Text="Label"></asp:Label>
                    </div>
                    <hr />
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
                                    <script type="module">

                                        import WaveSurfer from 'https://unpkg.com/wavesurfer.js@7/dist/wavesurfer.esm.js'

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

                            <%--<asp:Panel ID="Panel1" runat="server"
                                BackColor='<%# GetAdminClientBackground(Eval("id_client")) %>'
                                Style="padding: 10px; color: white; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; color: black;">

                                <div style="padding: 15px; border: 2px dotted gray; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;">
                                    <div style="padding: 5px; background-color: #545454; color: white; font-style: italic; font-size: 12px; width: 150px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; margin-bottom: 10px;">

                                        <asp:Label ID="Id_clientLabel" runat="server" Text='<%# GetWhich(Eval("Id_client")) %>' />

                                    </div>
                                    <div style="padding-right: 15px;">
                                        <asp:Label ID="textLabel" runat="server" Text='<%# Eval("text") %>' />
                                    </div>
                                </div>
                                <br />

                                <asp:Label Style="font-size: 12px; color: #a3a3a3;" ID="dateLabel" runat="server" Text='<%# "تاریخ ثبت: " & GetDate(Eval("date")) %>' />


                                <br />
                                <br />

                                <div>
                                    <asp:ImageButton ID="ImageButt2on1"
                                        ImageUrl="~\files\images\icons\delete.png"
                                        CommandArgument='<%# Eval("Id") %>' OnCommand="DeleteCommentEach"
                                        OnClientClick="return confirm('sure?');"
                                        runat="server" />
                                </div>
                            </asp:Panel>--%>
                        </ItemTemplate>

                    </asp:DataList>
                    <asp:SqlDataSource ID="sds_responses" runat="server"
                        ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                        SelectCommand="SELECT * FROM [tbl_Comment_clients] WHERE [Id] = @Id_parent or [Id_parent] = @Id_parent order by [date] asc">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Id_parent" QueryStringField="id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div style="margin-top: 20px;">
                        <div style="font-size: 19px; padding-bottom: 15px;">
                            ارسال کامنت جدید ...
                        </div>
                        <div>
                            <asp:TextBox ID="txtResponse" Font-Names="Samim" Style="padding: 10px; font-size: 15px;" runat="server" TextMode="MultiLine"
                                placeholder="متن خود را وارد کنید ..." Height="250px" Width="100%"></asp:TextBox>
                        </div>
                        <div style="padding-top: 15px;">
                            <asp:Button CssClass="cmdCss" ID="btnResponse" Font-Names="Samim" runat="server" Style="padding: 7px; cursor: pointer;" Text="ثبت" />
                            <asp:Button CssClass="cmdCss" ID="btnSendSmsAgain" Font-Names="Samim" runat="server" Style="padding: 7px; cursor: pointer;" Text="تکرار ارسال اس ام اس برای این کاربر" />
                            <button type="button" data-toggle="modal"
                                class="linkbtnMethod"
                                style="width: 100%; text-align: center; cursor: pointer;"
                                data-target=".bd-example-modal-sm">


                                <asp:Image runat="server"
                                    ImageUrl="~/files/images/icons/clientmethod_record.png" CssClass="blink" Height="50" />

                            </button>
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
    <!-- Small modal -->
    <div id="myModal" class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog"
        aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div style="text-align: center; display: grid; place-items: center;">
                    <audio id="recorder" muted hidden></audio>
                    <img src="../../files/images/icons/ic_record.png"
                        style="cursor: pointer;" onclick="StatusRec()" width="100" id="start" />
                    <ul class='waveUl' style="display: none;">
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                    <hr />
                    <button type='button' class="btnStop" id="stop" onclick="StatusRec()" style="display: none;">توقف و ارسال ویس</button>
                    <hr />
                    <span id="lblRecord" style="font-family: Samim; display: none; color: gray;">صدای شما در حال ضبط می‌باشد ...
                    </span>
                    <hr />
                    <div id="countup">
                        <span id="minutes"></span>
                        <span id="seconds"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // All wavesurfer options in one place: https://wavesurfer-js.org/examples/#all-options.js 
        import WaveSurfer from 'https://unpkg.com/wavesurfer.js@7/dist/wavesurfer.esm.js'

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
            var Token = document.getElementById('<%= HiddenFieldToken.ClientID %>').value;
            var Id_Client = document.getElementById('<%= HiddenFieldClientID.ClientID %>').value;

            var form = new FormData();
            form.append("voice", b);
            form.append("ClientOrAdmin", "0");
            form.append("NewOrResponse", "1");
            form.append("Token", Token);
            form.append("Id_Client", Id_Client); //Id_Client=0:Admin | Id_Client<>0:Clients
            form.append("Sections", "0");
            form.append("Id_Submission", "0");
            var xhttp = new XMLHttpRequest();

            xhttp.onreadystatechange = (e) => {
                if (xhttp.readyState !== 4) {
                    return;
                }
                if (xhttp.status === 200) {                    
                    Swal.fire({
                        title: 'پیام!',
                        text: 'پیام شما از طریق «وُیس» با موفقیت ثبت شد. لطفا منتظر پاسخ کارشناس مربوطه بمانید.',
                        icon: 'info',
                        confirmButtonColor: '#ff9100',
                        confirmButtonText: 'متوجه شدم'
                    }).then((result) => {
                        if (result.value) {
                            location.href = '../../../cms/pages/commentClients?id=' + Token + '&Status=' + '1' + '&id_client=' + Id_Client;
                        }
                    });
                } else {
                    Swal.fire({
                        title: 'خطا!',
                        text: 'خطایی در ارسال وُیس‌تان پیش آمده است، در صورت آپلود ناقص وُیس، آن را پاک کرده و دوباره اقدام بفرمائید.',
                        icon: 'error',
                        confirmButtonColor: '#ff9100',
                        confirmButtonText: 'متوجه شدم'
                    })
                }
            };

            xhttp.open("POST", "../../../panelclients/WebServiceRecordVoice.asmx/RecordVoice", true);
            xhttp.send(form);
            //////////////////////////////////////
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

