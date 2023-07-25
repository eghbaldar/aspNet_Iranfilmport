<%@ Page Title="" Language="VB" MasterPageFile="~/panelclients/MasterPanel.master" AutoEventWireup="false" CodeFile="PanelTicketNew.aspx.vb" Inherits="PanelTicketNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--JQuery--%>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <%--Sweet ALert--%>
    <script src="../../files/sweetalert/sweetalert2.all.min.js"></script>
    <link href="../../files/sweetalert/sweetalert2.min.css" rel="stylesheet" />
    <script src="../../files/sweetalert/sweetalert2.min.js"></script>
    <%--Modal--%>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <%--Main Style--%>
    <style type="text/css">
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
    <%--Wave Style--%>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="HiddenFieldClientID" runat="server" />
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
                            <asp:TextBox ID="txtText" Font-Names="Samim" Style="padding: 10px; font-size: 15px;" runat="server" TextMode="MultiLine"
                                placeholder="متن خود را وارد کنید ..." Height="250px" Width="100%"></asp:TextBox>
                        </div>
                        <div style="padding-top: 15px;">
                            <asp:Button CssClass="cmdCss" ID="btnInsert" Font-Names="Samim" runat="server" Style="padding: 7px; cursor: pointer;" Text="ثبت" />
                        </div>
                    </asp:View>
                    <asp:View ID="View6" runat="server">


                        <button type="button" data-toggle="modal"
                            class="linkbtnMethod"
                            style="width: 100%; text-align: center;cursor:pointer;"
                            data-target=".bd-example-modal-sm">


                            <asp:Image runat="server"
                                ImageUrl="~/files/images/icons/clientmethod_record.png" CssClass="blink" Height="50" />

                        </button>

                        <!-- Small modal -->
                        <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
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
                                        <button type='button' class="btnStop" id="stop" onclick="StatusRec()">توقف و ارسال ویس</button>
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
                                cursorWidth: 2,
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

                                var form = new FormData();
                                form.append("data1", b);
                                var xhttp = new XMLHttpRequest();

                                xhttp.onreadystatechange = (e) => {
                                    if (xhttp.readyState !== 4) {
                                        return;
                                    }
                                    if (xhttp.status === 200) {
                                        //alert('Your voice was uploaded successfully!');
                                        Swal.fire({
                                            title: 'پیام!',
                                            text: 'تیکت شما از طریق «وُیس» با موفقیت ثبت شد. لطفا منتظر پاسخ کارشناس مربوطه بمانید.',
                                            icon: 'info',
                                            confirmButtonColor: '#ff9100',
                                            confirmButtonText: 'متوجه شدم'
                                        }).then((result) => {
                                            if (result.value) {
                                                location.href = '../../panel/tickets/' + document.getElementById('<%= HiddenFieldClientID.ClientID %>').value;
                                            }
                                        });
                                    } else {
                                        alert('Something went wrong!');
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



                    <asp:Panel ID="Panel1" runat="server"
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

                    </asp:Panel>

                </ItemTemplate>

            </asp:DataList>
            <asp:SqlDataSource ID="sds_responses" runat="server"
                ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                SelectCommand="SELECT * FROM [tbl_Comment_clients] WHERE (id_client=@Id or id_client=0) And (([Id] = @Id_parent) or ([Id_parent] = @Id_parent)) order by [date] desc">
                <SelectParameters>
                    <asp:RouteParameter Name="Id" RouteKey="id" Type="Int64" />
                    <asp:QueryStringParameter Name="Id_parent" QueryStringField="ticket_token" Type="Int64" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div style="margin-top: 20px;">
                <div style="font-size: 19px; padding-bottom: 15px;">
                    ارسال جوابی برای این تیکت ...
                </div>
                <div>
                    <asp:TextBox ID="txtResponse" Font-Names="Samim" Style="padding: 10px; font-size: 15px;" runat="server" TextMode="MultiLine"
                        placeholder="متن خود را وارد کنید ..." Height="250px" Width="100%"></asp:TextBox>
                </div>

                <div style="padding-top: 15px;">
                    <asp:Button CssClass="cmdCss" ID="btnResponse" Font-Names="Samim" runat="server" Style="padding: 7px; cursor: pointer;" Text="ثبت" />
                </div>
            </div>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <div class="warning">

                <img src="../../../files/images/icons/wait.png" />
                <br />
                کامنت قبلی شما پاسخ داده نشده است، تا پاسخگویی کارشناس مربوطه شکیبا باشید.
          
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>

