<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false"
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
.gridview a{
  margin:auto 6%;
    border-radius:50%;
      background-color:#C0B700;
      padding:5px 10px 5px 10px;
      color:#fff;
      text-decoration:none;
      -o-box-shadow:1px 1px 1px #111;
      -moz-box-shadow:1px 1px 1px #111;
      -webkit-box-shadow:1px 1px 1px #111;
      box-shadow:1px 1px 1px #111;
     
}
.gridview a:hover{
    background-color:#E9DC01;
    color:#fff;
}

.gridview span{
    background-color:#E9DC01;
    color:#fff;
     -o-box-shadow:1px 1px 1px #111;
      -moz-box-shadow:1px 1px 1px #111;
      -webkit-box-shadow:1px 1px 1px #111;
      box-shadow:1px 1px 1px #111;

    border-radius:50%;
    padding:5px 10px 5px 10px;
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
            AllowPaging="True" GridLines="None" ShowHeader="False">
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
            <pagerstyle cssclass="gridview">

</pagerstyle>
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
