<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false" CodeFile="postSearch.aspx.vb" Inherits="postSearch" %>
<%@ Register Src="usercontrols/banners_right.ascx" TagName="banners_right" TagPrefix="uc1" %>
<%@ Register Src="usercontrols/RightSide.ascx" TagName="RightSide" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <asp:PlaceHolder runat="server" id="pc"></asp:PlaceHolder>
    <style>
        .TitleL
        {
            font-family: traffic;
            font-size: 20px;
            padding-right: 5px;
        }
        .TextL
        {
            font-family: traffic;
            font-size: 15px;
            color: Black;
            text-justify: inter-word;
            text-align: justify;
        }
        strong
        {
            font-family: NazaninB;
        }
        
        .gridview
        {
            background-color: #fff;
            padding: px;
            margin: 6% auto;
        }

        #TableOfSearchRight
        {
            width: 95%;
        }
        #TableOfSearchLeft
        {
            width: 5%;
        }
        #TableOfSearch
        {
            width: 100%;
        }
        #searchFest
        {
            border: 1px solid #ccc;
            padding: 2px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }
        .txtSearch
        {
            background-color: White;
            border: 4px solid #ccc;
            width: 100%;
            padding: 5px;
            padding-right: 10px;
            -moz-border-radius: 0px 5px 5px 0px;
            -webkit-border-radius: 0px 5px 5px 0px;
            border-radius: 0px 5px 5px 0px;
            font-family: Samim;
        }
        .btnSearch
        {
            background-color: #ccc;
            border: 4px solid #ccc;
            -moz-border-radius: 5px 0px 0px 5px;
            -webkit-border-radius: 5px 0px 0px 5px;
            border-radius: 5px 0px 0px 5px;
            padding: 5px;
            padding-left: 10px;
            padding-right: 10px;
            color: White;
            font-family: Samim;
            width: 100%;
        }
        .btnSearch:hover
        {
            background-color: #E5DA00;
            color: #000;
        }
    </style>
    <style>
        .GridPager {
            background-color: #d6fcff;
        }

            .GridPager a, .GridPager span {
                display: block;
                height: 30px;
                width: 30px;
                font-weight: bold;
                text-align: center;
                font-size: 20px;
                text-decoration: none;
            }

            .GridPager a {
                background-color: #f5f5f5;
                color: #969696;
                border: 1px solid #969696;
            }

            .GridPager span {
                background-color: #A1DCF2;
                color: #000;
                border: 1px solid #3AC0F2;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <section class="blog-section style-four section" style="margin-top: -50px;">
    <div class="container">
        <div class="row">
            <div class="col-md-9 col-sm-12 col-xs-12" >
                <div class="left-side">



                <div style="direction:rtl;">
            <table id="TableOfSearch" >
                <tr>
                    <td id="TableOfSearchRight">
                        <div>
                            <input runat="server" type="text" value="جستجو در مطالب درگاه فیلم ایران ..." id="txtSearch"
                                onblur="if(this.value == '') { this.value = 'جستجو در مطالب درگاه فیلم ایران ...'; }"
                                onfocus="if (this.value == 'جستجو در مطالب درگاه فیلم ایران ...') { this.value = ''; }"
                                class="txtSearch" />
                        </div>
                    </td>
                    <td id="TableOfSearchLeft">
                        <%--<input type="button" value="جستجو" class="btnSearch" onclick="ClickforSearch()" />--%>
                        <asp:Button ID="btnSearch" runat="server" class="btnSearch"  Text="جستجو" />
                    </td>
                </tr>
            </table>
        </div>


                <div class="item-holder" style="direction:rtl;box-shadow:2px 2px 8px 8px #F4F4F4;padding:8px;">
                
        <asp:GridView ID="gv_master" runat="server" AutoGenerateColumns="False" 
            AllowPaging="True" GridLines="None" ShowHeader="False">
            <Columns>
                <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ID">
                    <ItemTemplate>
                        <div style="text-align:right;padding:15px;">
<div style="text-align:right;direction:rtl;">
<h2 >
							<a style="text-decoration:none;" 
                             href='<%# ResolveUrl(getLink(Eval("id"),Eval("title")))%>' >
                            <asp:Label CssClass="TitleL" ID="Label2" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                            </a>
                            
						</h2> 	
                    <a style="text-decoration:none;color:Black;font-family:traffic;font-size:15px;
                        
                    text-align: right;" 
                     href='<%# ResolveUrl(getLink(Eval("id"),Eval("title")))%>'>
						<asp:Label ID="Label5" runat="server" CssClass="TextL"
                        Text='<%# Server.HtmlDecode(Regex.Replace(Eval("lid"), "<(.|\\n)*?>", string.Empty)) %>'></asp:Label>
                    </a>
                        
					</div>
					<div>
                    <a style="text-decoration:none;" 
                    href='<%# ResolveUrl(getLink(Eval("id"),Eval("title")))%>' >
                    					<asp:Image Width="100%" AlternateText='<%# Bind("title") %>' ID="Image1" 
                                        runat="server" ImageUrl='<%# String.Format("~\files\uploadFiles\article\{0}", Eval("photo")) %>' />
                                        </a>
									 
											 
					</div> 
					
					 

				</div>
                        <!-- end entry -->
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="#848484" />
                            <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
                            <RowStyle BackColor="White" ForeColor="#330099" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                            <SortedAscendingCellStyle BackColor="#FEFCEB" />
                            <SortedAscendingHeaderStyle BackColor="#AF0101" />
                            <SortedDescendingCellStyle BackColor="#F6F0C0" />
                            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>

     </div>
                </div>
            </div>


            <uc1:RightSide ID="RightSide1" runat="server" />
             <uc1:banners_right ID="banners_right1" runat="server" />
        </div>
    </div>
</section>
</asp:Content>

