﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false"
    CodeFile="categories.aspx.vb" Inherits="post" %>

<%@ Register Src="usercontrols/RightSide.ascx" TagName="RightSide" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
            .gridview{
    background-color:#fff;
   
   padding: px;
   margin:6% auto;
   
   
}
    </style>
    <style>
        .GridPager {
            background-color: #d6fcff;
        }

            .GridPager a, .GridPager span {
                font-family:Samim;
                display: block;
                height: 30px;
                width: 30px;
                font-weight: bold;
                text-align: center;
                font-size: 15px;
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
    <%--<section class="page-title text-center"  style="background-image: url('<%= getPostImage() %>');">
    <div class="container" style="direction:rtl;">
        <div class="title-text">
            <h1>
            <asp:Label style="font-family:Titr;" ID="lblGetPostTitle" runat="server" ></asp:Label>
            <asp:Image ID="Image1" runat="server"></asp:Image>
            </h1>            
            <ul class="title-menu clearfix">
                <li>
                    
                </li>
            </ul>
        </div>
    </div>
</section>--%>
    <section class="blog-section style-four section2" style="margin-top: -30px;">
    <div class="container">
        <div class="row">
            <div class="col-md-9 col-sm-12 col-xs-12" >
                <div class="left-side">
                <div class="item-holder" style="direction:rtl;box-shadow:2px 2px 8px 8px #F4F4F4;padding:8px;">
                
        <asp:GridView ID="gv_master" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Master"
            AllowPaging="True" GridLines="None" ShowHeader="False" Width="100%">
            <Columns>
                <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ID">
                    <ItemTemplate>
                        <div style="text-align:right;padding:15px;">
<div style="text-align:right;direction:rtl;">
<h2 >
							<a style="text-decoration:none;" 
                             href='<%# ResolveUrl(getLink(Eval("id"),Eval("title")))%>' >
                            <asp:Label CssClass="TitleL" ID="Label2" runat="server" Text='<%# Eval("title").Replace("ي", "ی") %>'></asp:Label>
                            </a>
                            
						</h2> 	
                    <a style="text-decoration:none;color:Black;font-family:traffic;font-size:15px;
                        
                    text-align: right;" 
                     href='<%# ResolveUrl(getLink(Eval("id"),Eval("title")))%>'>
						<asp:Label ID="Label5" runat="server" CssClass="TextL"
                        Text='<%# Server.HtmlDecode(Regex.Replace(Eval("lid"), "<(.|\\n)*?>", string.Empty)).Replace("ي", "ی") %>'></asp:Label>
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
            SelectCommand="SELECT * FROM [tbl_articles] WHERE ([visible] = @visible) and (CateCode=@id) and [date_time] <= getdate() ORDER BY [date_time] DESC">
            <SelectParameters>
                <asp:RouteParameter Name="id" RouteKey="id" />
                <asp:Parameter DefaultValue="true" Name="visible" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
     </div>
                </div>
            </div>


            <uc1:RightSide ID="RightSide1" runat="server" />
        </div>
    </div>
</section>
</asp:Content>
