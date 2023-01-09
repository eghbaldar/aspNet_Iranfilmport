<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPanel.master" AutoEventWireup="false" CodeFile="PanelTicketNew.aspx.vb" Inherits="PanelTicketNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

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
                <asp:TextBox ID="txtText" Font-Names="Samim" Style="padding: 10px; font-size: 15px;" runat="server" TextMode="MultiLine"
                    placeholder="متن خود را وارد کنید ..." Height="250px" Width="100%"></asp:TextBox>
            </div>
            <div style="padding-top: 15px;">
                <asp:Button CssClass="cmdCss" ID="btnInsert" Font-Names="Samim" runat="server" Style="padding: 7px; cursor: pointer;" Text="ثبت" />
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
            <div style="padding:8px;color:white;background-color:darkblue;margin:5px;font-size:11px;width:150px;            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;	
            border-radius:5px;	  
	  ">
                <span>
                    وضعیت تیکت:
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
           <div style="margin-top:20px;">
               <div style="font-size:19px;padding-bottom:15px;">
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

