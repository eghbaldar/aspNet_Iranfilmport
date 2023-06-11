<%@ Page Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false"
    CodeFile="posts.aspx.vb" Inherits="post" %>

<%@ Register Src="usercontrols/RightSide.ascx" TagName="RightSide" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <asp:PlaceHolder runat="server" ID="pc"></asp:PlaceHolder>
    <style>
        .TitleL {
            font-family: traffic;
            font-size: 20px;
        }

        .TextL {
            font-family: traffic;
            font-size: 15px;
            color: Black;
            text-justify: inter-word;
            text-align: justify;
        }

        strong {
            font-family: NazaninB;
        }

        .gridview {
            background-color: #fff;
            padding: px;
            margin: 6% auto;
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="blog-section style-four section2">
    <div class="container">
        <div class="row">
            <div class="col-md-9 col-sm-12 col-xs-12">g
                <div class="left-side">

                <div class="item-holder" style="direction:rtl;box-shadow:2px 2px 8px 8px #F4F4F4;padding:8px;">
                
        <asp:GridView ID="gv_master" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Master"
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
        <asp:SqlDataSource ID="SDS_Master" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT * FROM [tbl_articles] WHERE [visible] = 1 and [date_time] <= getdate() ORDER BY [date_time] DESC">
        </asp:SqlDataSource>
     </div>
                </div>
            </div>


            <uc1:RightSide ID="RightSide1" runat="server" />
        </div>
    </div>
</section>
</asp:Content>
