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


    <div class="TITLE" style="text-align: center; color: Black; font-size: 20px;">
        <h4>
            <a href="../../accolades" target="_blank" style="color: Black; font-family: Samim;">مشاهده صفحه کارنامه درگاه </a>
        </h4>
    </div>







    <div>
        <%--  https://codepen.io/havardob/pen/abBJgQo--%>
        <details>
		<summary>
			قسمت بالای پیج : افتخارات کلی
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
        <details>
		<summary>
			 ثبت موردی افتخارات
		</summary>
		<div>



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
                    
                    <asp:DropDownList CssClass="txtFa"
                        ID="cmdFilm" runat="server" DataSourceID="SqlDataSourceFilm" DataTextField="nameFa" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceFilm" runat="server"
                        ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                        SelectCommand="SELECT id,[nameFa]+ ' - ' + nameEn 'nameFa' FROM [tbl_PosterOfCustomer] order by [namefa]"></asp:SqlDataSource>
                    <br />
                    <div style="padding: 5px;">
                    <asp:LinkButton ID="btnShowAccolades" Font-Size="Small" Font-Names="Samim"  runat="server">مشاهده افتخارات این فیلم</asp:LinkButton>
                        </div>

                </div>




        <div style="direction: rtl; padding: 20px; font-family: Samim; font-size: 20px;">
            افتخار بصورت فارسی:

                         <span style="color: red;">(فقط یک خط باشد!)</span>
        </div>
        <div>
            <textarea id="txtAccolade_fa" name="content" class="ckeditor" runat="server"></textarea>
        </div>
        <div style="direction: ltr; padding: 20px; font-family: Tahoma; font-size: 20px;">
            Accolade in English:

                       <span style="color: red;">(Only One Line!)</span>
        </div>
        <div>
            <textarea id="txtAccolade_en" name="content" class="ckeditor" runat="server"></textarea>
        </div>
        <div>
            <asp:Button CssClass="tabBtn" ID="btnUpdateAccolade" runat="server" Text="بروزرسانی" />
        </div>

		</div>
	</details>
</asp:Content>
