<%@ Page Title="" Language="VB" ValidateRequest="false" MasterPageFile="~/CMS/Pages/CMS.master"
    AutoEventWireup="false" CodeFile="resume.aspx.vb" Inherits="CMS_Pages_resume" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../../files/ckeditor/ckeditor.js"></script>
    <script src="../../files/ckeditor/samples/js/sample.js"></script>
    <link rel="stylesheet" href="../../files/ckeditor/samples/css/samples.css" />
    <link rel="stylesheet" href="../../files/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap');

        details div {
        }

            details div > * + * {
                margin-top: 5px;
            }

        details + details {
            font-size: 16px;
            margin-top: .5rem;
        }

        summary {
            list-style: none;
        }

            summary::-webkit-details-marker {
                display: none;
            }

        summary {
            font-size: 16px;
            border: 2px solid #000;
            padding: .75em 1em;
            cursor: pointer;
            position: relative;
            padding-left: calc(1.75rem + .75rem + .75rem);
            font-family: Samim;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }

            summary:before {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                left: .75rem;
                content: "↓";
                width: 1.75rem;
                height: 1.75rem;
                background-color: #000;
                color: #FFF;
                display: inline-flex;
                justify-content: center;
                align-items: center;
                flex-shrink: 0;
            }

        details[open] summary {
            background-color: #eee;
        }

            details[open] summary:before {
                content: "↑";
            }

        summary:hover {
            background-color: #eee;
        }

        code {
            font-family: monospace;
            font-weight: 600;
        }

        .txtfilmSearch {
                        padding: 5px;
            width: 50%;
            font-family: Samim;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            margin: 2px;
            border: 0;
            background-color: #bbbbbb;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" ></asp:ScriptManager>

    <div class="TITLE" style="text-align: center; color: Black; font-size: 20px;">
        <h4>
            <a href="../../accolades" target="_blank" style="color: Black; font-family: Samim;">مشاهده صفحه کارنامه درگاه </a>
        </h4>
    </div>







    <div>
        <%--  https://codepen.io/havardob/pen/abBJgQo--%>
        <details>
		<summary>
			<span style="color:red;">
                قسمت بالای پیج : افتخارات کلی (به این قسمت به هیچ عنوان دست نزن)
			</span>
		</summary>
		<div>
			  <asp:Button CssClass="tabBtn" ID="btnFa" runat="server" Text="فا" />
    <asp:Button CssClass="tabBtn" ID="btnEn" runat="server" Text="En" />
    <asp:MultiView ID="M_CV" runat="server" ActiveViewIndex="0">
        <asp:View ID="View_Fa" runat="server">
            <textarea id="txtCV" name="content" class="ckeditor" runat="server"></textarea>
            <asp:Button ID="btn" CssClass="tabBtn" OnClientClick="confirm('بعد از آپدیت، سریع کارنامه انگلیسیشم بروز کن! فهمیدی مهندس؟');"
                runat="server" Text="بروزرسانی" />
        </asp:View>
        <asp:View ID="View_En" runat="server">
            <textarea id="txtCVEn" name="content" class="ckeditor" runat="server"></textarea>
            <asp:Button ID="btnEnUpdate" OnClientClick="confirm('انشالله که کارنامه فارسی بروز کرده باشی قبل این؟');" runat="server" Text="Update" />
        </asp:View>
    </asp:MultiView>
		</div>
	</details>
        <details style="background-color:lightgoldenrodyellow;">
		<summary>
			 ثبت موردی افتخارات
		</summary>
		<div>


<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
        <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel2" runat="server">
<ProgressTemplate>
    <div style="text-align:center;">
    <asp:Image ID="Image1" Width="50px" ImageUrl="~/files/images/icons/loading.gif" runat="server"></asp:Image>
</div>
</ProgressTemplate>
        </asp:UpdateProgress>
                <div style="padding: 15px;">
                    <script>
                        var display, value, ddlStates;
                        window.onload = function () {
                            CopyToArrays();
                        };

                        function CopyToArrays() {
                            display = new Array();
                            value = new Array();
                            ddlStates = document.getElementById("<%=cmdFilm.ClientID %>");
                            for (var i = 0; i < ddlStates.options.length; i++) {
                                display[display.length] = ddlStates.options[i].text;
                                value[value.length] = ddlStates.options[i].value;
                            }
                        }
                        function FilterDropDownList(val) {
                            ddlStates.options.length = 0;
                            var newOption = document.createElement("option");
                            for (var i = 0; i < display.length; i++)
                                if (display[i].toLowerCase().indexOf(val) != -1) {
                                    newOption.text = display[i];
                                    newOption.value = value[i];
                                    ddlStates.options.add(newOption);
                                }

                        }

                    </script>
                    <asp:TextBox
                        CssClass="txtfilmSearch"
                        onkeyup="FilterDropDownList(this.value)"
                        placeholder="فیلم / فیلمنامه ... سرچ لحظه ای ..."
                        ID="txtSearchInDropbox" runat="server" AutoPostBack="true"></asp:TextBox>
                    
                    
                    <asp:DropDownList CssClass="txtFa" AutoPostBack="true"
                        ID="cmdFilm" runat="server" DataSourceID="SqlDataSourceFilm" DataTextField="film" DataValueField="id"
                        >
                    </asp:DropDownList>
                       <asp:SqlDataSource ID="SqlDataSourceFilm" runat="server"
                        ConnectionString="<%$ ConnectionStrings:DesktopConnectionString %>"
                        SelectCommand="SELECT id,Film FROM [tbFilms] order by [Film]">
                    </asp:SqlDataSource>


                    <br />
                    <div style="padding: 5px;">
                    <asp:LinkButton ID="btnShowAccolades" Font-Size="Small" Font-Names="Samim"  runat="server">مشاهده افتخارات این فیلم</asp:LinkButton>
                        </div>

                </div>

            </ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="btnShowAccolades" />
    </Triggers>
</asp:UpdatePanel>
		</div>

	</details>
                <details >
		<summary>
			اولویت بندی ها
		</summary>
                    <div style="text-align:center;">
                       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                           <ContentTemplate>
<asp:UpdateProgress ID="UpdateProgress21" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
<ProgressTemplate>
    <div style="text-align:center;">
    <asp:Image ID="Im1age1" Width="50px" ImageUrl="~/files/images/icons/loading.gif" runat="server"></asp:Image>
</div>
</ProgressTemplate>
</asp:UpdateProgress>                               
                               <asp:Button ID="btnUp" runat="server" Font-Size="100px"  Text="+"></asp:Button>

                                   <asp:ListBox ID="lstPriorities" Height="500px"
                                       style="text-align:center;"
                                       Width="500px"
                                       Font-Size="Medium"
                                       runat="server"
                                       DataSourceID="sqlPriorities"
                                       DataTextField="id_film"
                                       DataValueField="id">

                        </asp:ListBox>
                                <asp:SqlDataSource ID="sqlPriorities" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                                    SelectCommand="SELECT * FROM [tbl_accolades] order by [priority] asc"></asp:SqlDataSource>
                               <asp:Button ID="btnDown" runat="server" Font-Size="100px" Text="-"></asp:Button>
                           </ContentTemplate>
                       </asp:UpdatePanel>
                    </div>
                    	</details>
</asp:Content>
