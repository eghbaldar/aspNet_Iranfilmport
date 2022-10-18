<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="<%= ResolveUrl("~/files/css/default.css")%>" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--===   Page Slider   =========-->
    <div class="hero-slider">
        <!-- Slider Item -->
        <asp:Repeater ID="R_Slider" runat="server" DataSourceID="SDS_Slider">
            <ItemTemplate>
                <asp:Panel ID="Panel1" runat="server" CssClass="slider-item" BackImageUrl='<%# String.Format("~\files\uploadFiles\sliders\{0}",Eval("photo")) %>'>
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <!-- Slide Content Start -->
                                <%--Style="color: white; font-size: 35px; font-family: Titr;"--%>
                                <div class="content style text-center" style="direction: rtl;">
                                    <a href='<%# String.Format("{0}",Eval("link")) %>' target="_blank">
                                        <h1 class="SliderUp">
                                            <asp:Label Visible='<%# EnFa("FA") %>' ID="Label4" runat="server" CssClass="SliderUp"
                                                Text='<%# Eval("text").Replace("ي", "ی") %>'></asp:Label>
                                            <asp:Label Visible='<%# EnFa("EN") %>' ID="Label12" runat="server" CssClass="SliderUpEn"
                                                Text='<%# Eval("textEn")%>'></asp:Label>
                                        </h1>
                                    </a><a href='<%# String.Format("{0}",Eval("link")) %>' target="_blank">
                                        <p class="tag-text mb-5" style="font-family: Koodak; margin-top: 5px;">
                                            <asp:Label ID="Label1" Visible='<%# EnFa("FA") %>' CssClass="SliderDown" runat="server"
                                                Text='<%# Eval("subtext").Replace("ي", "ی") %>'></asp:Label>
                                        </p>
                                    </a>
                                    <%--<a href='<%# String.Format("{0}",Eval("link")) %>' class="btn btn-main btn-white">...بیشتر
                                        بدانید</a>--%>
                                </div>
                                <!-- Slide Content End -->
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SDS_Slider" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
            SelectCommand="SELECT * FROM [tbl_slider] WHERE ([visible] = @visible) ORDER BY [ID] DESC">
            <SelectParameters>
                <asp:Parameter DefaultValue="true" Name="visible" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%--            <div class="slider-item" style="background-image: url(files/images/slider/slider-bg-1.jpg)">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <!-- Slide Content Start -->
                            <div class="content style text-center">
                                <h2 class="text-white text-bold mb-2">
                                    Opening of IranFilmPort (IFP)</h2>
                                <p class="tag-text mb-5"  style="font-family:Titr;">
                                    بزرگترین و حرفه‌ای‌ترین درگاه ارسال فیلم به فستیوال‌های بین المللی افتتاح
                                    شد
                                    <br>
                                    </p>
                                <a href="#" class="btn btn-main btn-white">...بیشتر بدانید</a>
                            </div>
                            <!-- Slide Content End -->
                        </div>
                    </div>
                </div>
            </div>--%>
    </div>
    <!--====  End of Page Slider  ====-->
    <%--    <section class="cta">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="cta-block">
                    <div class="emmergency item" >
                        <i class="fa fa-phone1"></i>
                        <h1 style="color:White;text-align:center;">Advice on Distribution</h1>
                        <div class="top-doctor item"
                        style="background-color:transparent;direction:rtl;font-family:NazaninB;text-align:center;">
                        <h2 style="font-family:Titr;color:White;">مشاوره در پخش</h2>
                        <div style="color:White;">
                        مهترین و اولین قدم به منظور داشتن یک پخش صحیح و کارآمد داشتن اطلاعات کافی و گرفتن مشاوره های متناسب با موقعیت و محتوای فیلم می‌باشد. فرصت و پول خود را از دست ندهید.
                        </div>                         
                        <a href="http://iranfilmport.com/2/%D9%85%D9%88%D9%81%D9%82%D9%8A%D8%AA-%D8%AF%D8%B1-%D9%81%D8%B3%D8%AA%D9%8A%D9%88%D8%A7%D9%84-%D9%87%D8%A7%D9%8A-%D9%81%D9%8A%D9%84%D9%85-%D9%88-%D8%A7%D8%B1%D8%B3%D8%A7%D9%84-%D9%85%D9%88%D9%81%D9%82" class="btn btn-main" style="font-size:11px;color:black;">بیشتر بدانید</a>
                        </div>
                    </div>
                    <div class="working-time item">

                       <i class="fa fa-phone1" style="color:White;"></i>
                        <h1 style="color:White;text-align:center;">Select of Festivals</h1>
                        <div class="top-doctor item"
                        style="background-color:transparent;direction:rtl;font-family:NazaninB;color:Black;
                            text-align:center;">
                        <h2 style="font-family:Titr;color:White;">انتخاب جشنواره‌ها</h2>
                        <div style="color:White;">
                        پس از مشاوره صحیح در خصوص جایگاه فیلم شما و میزان موفقیت آن در فستیوال‌های بین المللی، گروه فنی پخش درگاه فیلم ایران به چند روش متفاوت و متنوع فستیوال‌های مورد نظر را به شما معرفی خواهد کرد.
                        </div>                         
                        <a href="http://iranfilmport.com/2/%D9%85%D9%88%D9%81%D9%82%D9%8A%D8%AA-%D8%AF%D8%B1-%D9%81%D8%B3%D8%AA%D9%8A%D9%88%D8%A7%D9%84-%D9%87%D8%A7%D9%8A-%D9%81%D9%8A%D9%84%D9%85-%D9%88-%D8%A7%D8%B1%D8%B3%D8%A7%D9%84-%D9%85%D9%88%D9%81%D9%82" class="btn btn-main" style="font-size:11px;color:black;">بیشتر بدانید</a>
                        </div>

                    </div>
                    <div class="top-doctor2 item">
                        
                         <i class="fa fa-phone1"></i>
                        <h1 style="color:White;text-align:center;">Success in festivals</h1>
                        <div class="top-doctor item"
                        style="background-color:transparent;direction:rtl;font-family:NazaninB;text-align:center;color:White;">
                        <h2 style="font-family:Titr;color:White;">موفقیت در جشنواره‌ها</h2>
                        <div>
                        موفقیت در جشنواره‌ها متغیرهای وابسته و غیروابسته زیادی دارد که از جمله مهمترین آنها، انتخاب و در اختیار گرفتن پخش کننده ایست که تجربه ی لازم را در این زمینه داشته باشد. لطفا در انتخاب خود دفت کنید.
                        </div>                         
                        <a href="http://iranfilmport.com/2/%D9%85%D9%88%D9%81%D9%82%D9%8A%D8%AA-%D8%AF%D8%B1-%D9%81%D8%B3%D8%AA%D9%8A%D9%88%D8%A7%D9%84-%D9%87%D8%A7%D9%8A-%D9%81%D9%8A%D9%84%D9%85-%D9%88-%D8%A7%D8%B1%D8%B3%D8%A7%D9%84-%D9%85%D9%88%D9%81%D9%82" class="btn btn-main" style="font-size:11px;color:black;">بیشتر بدانید</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>--%>
    <section class="containerMother">
        <div class="container">
            <div class="row">
                <div id="divLastFestival" class="col-md-6 col-sm-12 col-xs-12">
                    <div class="divPost">
                        <span><a style="color: #848484;" href="../جشنواره-های-فیلم-کوتاه-بلند">
                            <asp:Label ID="lblTitleFestivals" runat="server"></asp:Label>
                        </a></span>
                        <asp:GridView ID="dgLastDeadlineFestival" runat="server" AutoGenerateColumns="False"
                            DataSourceID="SDS_Last" GridLines="None" ShowHeader="False" AllowPaging="True"
                            PageSize="50">
                            <Columns>
                                <asp:TemplateField HeaderText="rules" SortExpression="rules">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <a href='<%# String.Format("festival/{0}/{1}/{2}", Eval("id"),Eval("title_en").Replace(" ","-"),getLinkFest(Eval("title_fa")).Replace(" ","-").Replace("ي", "ی")) %>'>
                                                    <asp:Image CssClass="IMG" ID="Image1" ImageUrl='<%# String.Format("~/files/uploadFiles/festival/{0}", Eval("logo")) %>'
                                                        runat="server" />
                                                </a>
                                            </td>
                                            <td style="padding: 5px;">
                                                <div>
                                                    <a href='<%# String.Format("festival/{0}/{1}/{2}", Eval("id"),Eval("title_en").Replace(" ","-"),getLinkFest(Eval("title_fa")).Replace(" ","-").Replace("ي", "ی")) %>'>
                                                        <asp:Label Visible='<%# EnFa("FA") %>' ID="Label2" runat="server" Style="font-size: 12px;"
                                                            Text='<%# Eval("title_fa").Replace("ي", "ی") %>'></asp:Label>
                                                        <asp:Label Visible='<%# EnFa("EN") %>' Style="font-size: 12px;" ID="Label1" runat="server"
                                                            Text='<%# Bind("title_en") %>'></asp:Label>
                                                    </a>
                                                </div>
                                                <div>
                                                    <asp:Label ToolTip="تعداد روز باقی ماننده به آخرین ددلاین" ID="Label3" Style="font-family: Samim;
                                                        font-size: 10px;" runat="server" Text='<%# getDeadlineStatus(Eval("sign"),Eval("RemainDays")) %>'></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle CssClass="gridview"></PagerStyle>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SDS_Last" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                            SelectCommand="
select top 4 *,
DATEDIFF(DAY, GETDATE(),(select top 1 [deadline] from dbo.tbl_festivalDeadline where festivalID =f.id order by deadline desc)) as 'RemainDays',
sign(DATEDIFF(DAY, GETDATE(),(select top 1 [deadline] from dbo.tbl_festivalDeadline where festivalID =f.id order by deadline desc))) 'sign'	
from dbo.tbl_festivals f
where
f.flag=1
and
sign(DATEDIFF(DAY, GETDATE(),(select top 1 [deadline] from dbo.tbl_festivalDeadline where festivalID =f.id order by deadline desc))) is not null
and
sign(DATEDIFF(DAY, GETDATE(),(select top 1 [deadline] from dbo.tbl_festivalDeadline where festivalID =f.id order by deadline desc)))=1
ORDER BY newid()"></asp:SqlDataSource>
                    </div>
                </div>
                <div id="divLastNews" class="col-md-6 col-sm-12 col-xs-12">
                    <div>
                        <div class="divPost">
                            <span><a style="color: #848484;" href="../نقد-تحلیل-اخبار-فیلم-کوتاه">
                                <asp:Label ID="lblTitleNews" runat="server"></asp:Label>
                            </a></span>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_LastNews"
                                AllowPaging="True" GridLines="None" ShowHeader="False">
                                <Columns>
                                    <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ID">
                                        <ItemTemplate>
                                            <h2>
                                                <a style="text-decoration: none;" href='<%# ResolveUrl(getLink(Eval("id"),Eval("title")))%>'>
                                                    <asp:Label Visible='<%# EnFa("FA") %>' ID="La1bel11" runat="server" CssClass="TitleNews"
                                                        Text='<%# Eval("title").Replace("ي", "ی") %>'></asp:Label>
                                                    <asp:Label Visible='<%# EnFa("EN") %>' ID="Label1" Style="font-size: 14px;" runat="server"
                                                        Text='<%# Bind("titleEn") %>'></asp:Label>
                                                </a>
                                            </h2>
                                            <!-- end entry -->
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle CssClass="gridview"></PagerStyle>
                            </asp:GridView>
                        </div>
                        <asp:SqlDataSource ID="SDS_LastNews" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                            SelectCommand="SELECT top 10 * FROM [tbl_articles] WHERE [visible] = 1 and [date_time] <= getdate() ORDER BY [date_time] DESC">
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section style="padding: 15px;">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-xs-12">
                    <div class="image-content">
                        <div class="row">
                            <asp:Repeater ID="gv_master" runat="server" DataSourceID="SDS_Master">
                                <ItemTemplate>
                                    <div class="col-sm-3" style="direction: rtl; text-align: center;">
                                        <div class="divPost">
                                            <a style="text-decoration: none; color: Black;" href='<%# ResolveUrl(getLink(Eval("id"),Eval("title")))%>'>
                                                <div>
                                                    <figure>
                                                        <asp:Image AlternateText='<%# Eval("title").Replace("ي", "ی") %>' Width="100%" Style="-moz-border-radius: 5px;
                                                            -webkit-border-radius: 5px; border-radius: 5px;" ID="Image1" runat="server" ImageUrl='<%# "~\convertToUnscale\?photo=" + String.Format("files\uploadFiles\article\{0}", Eval("photo")) + "&w=400&h=236" %>' />
                                                    </figure>
                                                </div>
                                                <div class="DivNewsLidBox">
                                                    <h6 style="font-size: 12px;">
                                                        <asp:Label Visible='<%# EnFa("FA") %>' ID="La1bel11" runat="server" CssClass="TitleNews"
                                                            Text='<%# Eval("title").Replace("ي", "ی") %>'></asp:Label>
                                                        <asp:Label Visible='<%# EnFa("EN") %>' ID="Label1" Style="font-size: 14px;" runat="server"
                                                            Text='<%# Bind("titleEn") %>'></asp:Label>
                                                    </h6>
                                                    <h6 style="text-align: center;">
                                                        <asp:Label Style="font-family: traffic; font-size: 13px; color: Gray;" ID="Label3"
                                                            runat="server" Text='<%# Server.HtmlDecode(Regex.Replace(Eval("lid"), "<(.|\\n)*?>", string.Empty)) %>'>
                                                        </asp:Label>
                                                    </h6>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SDS_Master" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                                SelectCommand="SELECT top 4 * FROM [tbl_articles] WHERE [visible] = 1 and  [date_time] <= getdate() and id in (SELECT top 20 [id] FROM [tbl_articles] order by [date_time] desc) order by date_time desc">
                                <%--With Random--%>
                                <%--SELECT top 4 * FROM [tbl_articles] WHERE id in (
            SELECT top 20 [id] FROM [tbl_articles] order by id desc
            ) AND [visible] = 1 ORDER BY newid()--%>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div id="divFeature">
        <a target="_blank" href='<%= Page.ResolveUrl("~/ویژگی-های-پخش-فیلم-درگاه-فیلم-ایران") %>'
            style="color: Blue; font-size: 9px;" target="_blank">
            <img src="files/images/background/bestFeature.jpg" alt="برتری های درگاه فیلم ایران"
                style="width: 100%; height: auto;" />
        </a>
    </div>
    <!--about section-->
    <%--    <section class="feature-section section bg-gray" style="background-color: #eeeeee;">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-xs-12">
				<div class="image-content">
					<div class="section-title text-center">
						<h3>Best Features
							<span>of Our Port</span>
						</h3>
                        <h4>
						<span style="color:Black;font-family:traffic;">گروه‌ها و افراد زیادی بصورت حقیقی و حقوقی با دانش و بی دانش اقدام به پخش فیلم‌ها می‌کنند. آیا شما تفاوت آنها را می دانید؟</span>
                        </h4>
                        <h4>
                        <span style="color:blue;font-family:traffic;">درگاه فیلم ایران با دارا بودن شاخص های منحصربفرد زیر فاصله ای زیاد با رقیبان خود گرفته است</span>
                        </h4>
					</div>
					<div class="row">
						<div class="col-sm-6" style="direction:rtl;text-align:center;">
							<div class="item">
								<div class="icon-box">
									<figure>
										<a href='<%= Page.ResolveUrl("~/ویژگی-های-پخش-فیلم-درگاه-فیلم-ایران") %>'>
											<img alt="ویژگی های اختصاصی درگاه فیلم ایران" src='<%= Page.ResolveUrl("files/images/resource/1.png")%>' alt="">
										</a>
									</figure>
								</div>
								<h3 style="font-family:traffic;"><span style="font-family:Tahoma;">Contract</span> | قرارداد کاری</h3>
								<p>درگاه فیلم ایران به دلیل برخورد حرفه‌ای و با دارا بودن ساختار مدون و از پیش تعریف شده برای هر پخش، با نماینده رسمی فیلم قرارداد کاری را منعقد خواهد کرد.</p>
                                <p><a href='<%= Page.ResolveUrl("~/ویژگی-های-پخش-فیلم-درگاه-فیلم-ایران") %>' style="color:Blue;font-size:9px;" target="_blank">با تفاوت های ما بیشتر آشنا شوید...</a></p>
							</div>
						</div>
						<div class="col-sm-6" style="direction:rtl;text-align:center;">
							<div class="item">
								<div class="icon-box">
									<figure>
										<a target="_blank" href='<%= Page.ResolveUrl("~/ویژگی-های-پخش-فیلم-درگاه-فیلم-ایران") %>'>
											<img alt="ویژگی های اختصاصی درگاه فیلم ایران" src='<%= Page.ResolveUrl("files/images/resource/2.png") %>' alt="">
										</a>
									</figure>
								</div>
                                <h3 style="font-family:traffic;"><span style="font-family:Tahoma;">Media-Making</span> | رسانه سازی</h3>
								<p style="color:red;">درگاه فیلم ایران برای اولین بار در ایران به پشتوانه ی متخصصین بخش رسانه ای خود، تمامی اقدامات لازم جهت معرفی فیلم ، فیلمساز و عوامل به دنیای عظیم و تاثیرگذار رسانه (MEDIA) را انجام خواهد داد. امکانی که در یک پخش موفق بسیار تاثیرگذار است. </p>
                                <p><a target="_blank" href='<%= Page.ResolveUrl("~/ویژگی-های-پخش-فیلم-درگاه-فیلم-ایران") %>' style="color:Blue;font-size:9px;" target="_blank">با تفاوت های ما بیشتر آشنا شوید...</a></p>
							</div>
						</div>
						<div class="col-sm-6" style="direction:rtl;text-align:center;">
							<div class="item">
								<div class="icon-box">
									<figure>
										<a target="_blank" href='<%= Page.ResolveUrl("~/ویژگی-های-پخش-فیلم-درگاه-فیلم-ایران") %>'>
											<img alt="ویژگی های اختصاصی درگاه فیلم ایران" src='<%= Page.ResolveUrl("files/images/resource/3.png") %>' alt="">
										</a>
									</figure>
								</div>
                                <h3 style="font-family:traffic;"><span style="font-family:Tahoma;">Categorization</span> | طبقه بندی</h3>
								<p>و باز هم برای اولین بار در ایران و شاید جهان! درگاه فیلم ایران در تلاش است که فستیوال‌های بین المللی را در چهار دسته اصلی A+ A B C جای دهد.</p>
                                <p><a target="_blank" href='<%= Page.ResolveUrl("~/ویژگی-های-پخش-فیلم-درگاه-فیلم-ایران") %>' style="color:Blue;font-size:9px;" target="_blank">با تفاوت های ما بیشتر آشنا شوید...</a></p>
							</div>
						</div>
						<div class="col-sm-6" style="direction:rtl;text-align:center;">
							<div class="item">
								<div class="icon-box">
									<figure>
										<a target="_blank" href='<%= Page.ResolveUrl("~/ویژگی-های-پخش-فیلم-درگاه-فیلم-ایران") %>'>
											<img alt="ویژگی های اختصاصی درگاه فیلم ایران" src='<%= Page.ResolveUrl("files/images/resource/4.png") %>' alt="">
										</a>
									</figure>
								</div>
                                <h3 style="font-family:traffic;"><span style="font-family:Tahoma;">Identity</span> | هویت سنجی</h3>
								<p>سازوکار پرتال درگاه فیلم ایران به گونه ایست که افراد بعنوان فیلمساز، تهیه کننده و یا نماینده رسمی هر فیلم دارای صفحه ی شخصی مخصوص به خود و فیلمشان هستند. از اینرو هر فیلمی که به درگاه معرفی بشود دارای اعتباری است که درگاه پس از تصدیق محتوا بر آن می بخشد. این تصدیق، نماد اعتماد درگاه فیلم ایران نامیده می شود.</p>
                                <p><a target="_blank" href='<%= Page.ResolveUrl("~/ویژگی-های-پخش-فیلم-درگاه-فیلم-ایران") %>' style="color:Blue;font-size:9px;" target="_blank">با تفاوت های ما بیشتر آشنا شوید...</a></p>
							</div>
						</div>
                        <div class="col-sm-6" style="direction:rtl;text-align:center;">
							<div class="item">
								<div class="icon-box">
									<figure>
										<a target="_blank" href='<%= Page.ResolveUrl("~/ویژگی-های-پخش-فیلم-درگاه-فیلم-ایران") %>'>
											<img alt="ویژگی های اختصاصی درگاه فیلم ایران" src='<%= Page.ResolveUrl("files/images/resource/5.png") %>' alt="">
										</a>
									</figure>
								</div>
                                <h3 style="font-family:traffic;"><span style="font-family:Tahoma;">Own Page</span> | صفحه اختصاصی</h3>
								<p>یکی از قابلیت های منحصربفرد این پرتال معرفی فیلم و فیلمساز از طریق صفحه اختصاصی است. این قابلیت نظیر امکانیست که سایت های بزرگی چون IMDb به فیلمسازان ارائه می‌دهند.</p>
                                <p><a target="_blank" href='<%= Page.ResolveUrl("~/ویژگی-های-پخش-فیلم-درگاه-فیلم-ایران") %>' style="color:Blue;font-size:9px;" target="_blank">با تفاوت های ما بیشتر آشنا شوید...</a></p>
							</div>
						</div>
                        <div class="col-sm-6" style="direction:rtl;text-align:center;">
							<div class="item">
								<div class="icon-box">
									<figure>
										<a target="_blank" href='<%= Page.ResolveUrl("~/ویژگی-های-پخش-فیلم-درگاه-فیلم-ایران") %>'>
											<img alt="ویژگی های اختصاصی درگاه فیلم ایران" src='<%= Page.ResolveUrl("files/images/resource/6.png") %>' alt="">
										</a>
									</figure>
								</div>
                                <h3 style="font-family:traffic;"><span style="font-family:Tahoma;">Dedicated Email</span> | ایمیل اختصاصی</h3>
								<p>و باز هم امکانی منحصربفرد!، درگاه فیلم ایران برای تمامی کاربران خود یک پست الکترونیکی با نام و مشخصات شخصی‌شان در نظر گرفته تا بتوانند از آن در تبادلات مجازی خود استفاده کنند.</p>
                                <p><a target="_blank" href='<%= Page.ResolveUrl("~/ویژگی-های-پخش-فیلم-درگاه-فیلم-ایران") %>' style="color:Blue;font-size:9px;" target="_blank">با تفاوت های ما بیشتر آشنا شوید...</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>--%>
    <!--End about section-->
    <!--Start about us area-->
    <section class="team-section section">
        <div class="container">
            <div class="section-title text-center">
                <h4 style="font-family: Samim;">
                    برخی از فیلم‌هایی که توسط درگاه پخش می‌شوند</h4>
                <hr />
            </div>
            <div class="row">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SDS_profilesubdomain">
                    <ItemTemplate>
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="team-member">
                                <%--<a href="http://leprosy.iranfilmport.com" target="_blank">--%>
                                <asp:Image ID="Image2" CssClass="img-responsive" AlternateText='<%# Eval("nameFa") %>'
                                    ImageUrl='<%# String.Format("~\convertToUnscale.aspx?photo=files\uploadFiles\PosterOfCustomers\{0}&w=452&h=640",Eval("photo")) %>'
                                    runat="server" />
                                <%-- </a>--%>
                                <div class="contents text-center">
                                    <p>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("nameEn") %>'></asp:Label></p>
                                    <p>
                                        <strong style="font-size: 20px;">
                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("nameFa") %>'></asp:Label></p>
                                    </strong>
                                    <p>
                                        <asp:Label ID="Label9" runat="server" Font-Size="12px" Text='<%# IIF(Eval("type")=0 OR Eval("type")=1,"DIRECTED BY:","WRITTEN BY:") %>'></asp:Label>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("directorEn") %>'></asp:Label></p>
                                    <p>
                                        <asp:Label ID="Label10" runat="server" Font-Size="12px" Text='<%# IIF(Eval("type")=0 OR Eval("type")=1,"کارگردان:","نویسنده:") %>'></asp:Label>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("directorFa") %>'></asp:Label></p>
                                    <%--<p><a  target="_blank" href="http://leprosy.iranfilmport.com">دیدن مشخصات فیلم</a></p>--%>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SDS_profilesubdomain" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                    SelectCommand="SELECT top 12 * FROM [tbl_PosterOfCustomer] order by datetime desc">
                </asp:SqlDataSource>
            </div>
        </div>
    </section>
    <!--End about us area-->
    <!--Service Section-->
    <%--<section class="testimonial-section" style="background: url(images/testimonials/1.jpg);">
    <div class="container">
        <div class="section-title text-center">
            <h3>What Our
                <span>Patients Says</span>
            </h3>
        </div>
        <div class="testimonial-carousel">
            <!--Slide Item-->
            <div class="slide-item">
                <div class="inner-box text-center">
                    <div class="image-box">
                        <figure>
                            <img src="images/testimonials/1.png" alt="">
                        </figure>
                    </div>
                    <h6>Adam Rose</h6>
                    <p>Neque porro quisquam est, qui dolorem ipsum quia consectetur, dolor sit amet, consectetur, numquam Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, at?</p>
                </div>
            </div>
            <!--Slide Item-->
            <div class="slide-item">
                <div class="inner-box text-center">
                    <div class="image-box">
                        <figure>
                            <img src="images/testimonials/2.png" alt="">
                        </figure>
                    </div>
                    <h6>David Warner</h6>
                    <p>Neque porro quisquam est, qui dolorem ipsum quia consectetur, dolor sit amet, consectetur, numquam Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, at?</p>
                </div>
            </div>
            <!--Slide Item-->
            <div class="slide-item">
                <div class="inner-box text-center">
                    <div class="image-box">
                        <figure>
                            <img src="images/testimonials/3.png" alt="">
                        </figure>
                    </div>
                    <h6>Amy Adams</h6>
                    <p>Neque porro quisquam est, qui dolorem ipsum quia consectetur, dolor sit amet, consectetur, numquam Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, at?</p>
                </div>
            </div>
            <!--Slide Item-->
            <div class="slide-item">
                <div class="inner-box text-center">
                    <div class="image-box">
                        <figure>
                            <img src="images/testimonials/1.png" alt="">
                        </figure>
                    </div>
                    <h6>Adam Rose</h6>
                    <p>Neque porro quisquam est, qui dolorem ipsum quia consectetur, dolor sit amet, consectetur, numquam Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, at?</p>
                </div>
            </div>
            <!--Slide Item-->
            <div class="slide-item">
                <div class="inner-box text-center">
                    <div class="image-box">
                        <figure>
                            <img src="images/testimonials/2.png" alt="">
                        </figure>
                    </div>
                    <h6>David Warner</h6>
                    <p>Neque porro quisquam est, qui dolorem ipsum quia consectetur, dolor sit amet, consectetur, numquam Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, at?</p>
                </div>
            </div>
            <!--Slide Item-->
            <div class="slide-item">
                <div class="inner-box text-center">
                    <div class="image-box">
                        <figure>
                            <img src="images/testimonials/3.png" alt="">
                        </figure>
                    </div>
                    <h6>Amy Adams</h6>
                    <p>Neque porro quisquam est, qui dolorem ipsum quia consectetur, dolor sit amet, consectetur, numquam Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, at?</p>
                </div>
            </div>
            <!--Slide Item-->
            <div class="slide-item">
                <div class="inner-box text-center">
                    <div class="image-box">
                        <figure>
                            <img src="images/testimonials/1.png" alt="">
                        </figure>
                    </div>
                    <h6>Adam Rose</h6>
                    <p>Neque porro quisquam est, qui dolorem ipsum quia consectetur, dolor sit amet, consectetur, numquam Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, at?</p>
                </div>
            </div>
            <!--Slide Item-->
            <div class="slide-item">
                <div class="inner-box text-center">
                    <div class="image-box">
                        <figure>
                            <img src="images/testimonials/2.png" alt="">
                        </figure>
                    </div>
                    <h6>David Warner</h6>
                    <p>Neque porro quisquam est, qui dolorem ipsum quia consectetur, dolor sit amet, consectetur, numquam Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, at?</p>
                </div>
            </div>
            <!--Slide Item-->
            <div class="slide-item">
                <div class="inner-box text-center">
                    <div class="image-box">
                        <figure>
                            <img src="images/testimonials/3.png" alt="">
                        </figure>
                    </div>
                    <h6>Amy Adams</h6>
                    <p>Neque porro quisquam est, qui dolorem ipsum quia consectetur, dolor sit amet, consectetur, numquam Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, at?</p>
                </div>
            </div>
        </div>
    </div>
</section>--%>
    <!--End Service Section-->
    <!--team section-->
    <%--    <section class="appoinment-section section">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="accordion-section">
    <div class="section-title">
        <h3>FAQ</h3>
    </div>
    <div class="accordion-holder">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            Why Should I choose Medical Health
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute,
                        non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
                        sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh
                        helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
                        vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't
                        heard of them accusamus labore sustainable VHS.
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false"
                            aria-controls="collapseTwo">
                            What are the Centre’s visiting hours?
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute,
                        non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
                        sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh
                        helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
                        vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't
                        heard of them accusamus labore sustainable VHS.
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingThree">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false"
                            aria-controls="collapseThree">
                            How many visitors are allowed?
                        </a>
                    </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                    <div class="panel-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute,
                        non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
                        sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh
                        helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
                        vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't
                        heard of them accusamus labore sustainable VHS.
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
            </div>
            <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="contact-area">
    <div class="section-title">
        <h3>Request
            <span>Appointment</span>
        </h3>
    </div>
    <form name="contact_form" class="default-form contact-form" action="sendmail.php" method="post">
        <div class="row">
            <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="form-group">
                    <input type="text" name="Name" placeholder="Name" required="">
                </div>
                <div class="form-group">
                    <input type="email" name="Email" placeholder="Email" required="">
                </div>
                <div class="form-group">
                    <select name="subject">
                        <option>Departments</option>
                        <option>Diagnostic</option>
                        <option>Psychological</option>
                    </select>
                </div>
            </div>
            <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="form-group">
                    <input type="text" name="Phone" placeholder="Phone" required="">
                </div>
                <div class="form-group">
                    <input type="text" name="Date" placeholder="Date" required="" id="datepicker">
                    <i class="fa fa-calendar" aria-hidden="true"></i>
                </div>
                <div class="form-group">
                    <select name="subject">
                        <option>Doctor</option>
                        <option>Diagnostic</option>
                        <option>Psychological</option>
                    </select>
                </div>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="form-group">
                    <textarea name="form_message" placeholder="Your Message" required=""></textarea>
                </div>
                <div class="form-group text-center">
                    <button type="submit" class="btn-style-one">submit now</button>
                </div>
            </div>
        </div>
    </form>
</div>                        
            </div>
        </div>                    
    </div>
</section>--%>
    <!--End team section-->
    <!--testimonial-section-->
    <%--<section class="testimonial-section" style="background: url(images/testimonials/1.jpg);">
    <div class="container">
        <div class="section-title text-center">
            <h3>What Our
                <span>Patients Says</span>
            </h3>
        </div>
        <div class="testimonial-carousel">
            <!--Slide Item-->
            <div class="slide-item">
                <div class="inner-box text-center">
                    <div class="image-box">
                        <figure>
                            <img src="images/testimonials/1.png" alt="">
                        </figure>
                    </div>
                    <h6>Adam Rose</h6>
                    <p>Neque porro quisquam est, qui dolorem ipsum quia consectetur, dolor sit amet, consectetur, numquam Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, at?</p>
                </div>
            </div>
            <!--Slide Item-->
            <div class="slide-item">
                <div class="inner-box text-center">
                    <div class="image-box">
                        <figure>
                            <img src="images/testimonials/2.png" alt="">
                        </figure>
                    </div>
                    <h6>David Warner</h6>
                    <p>Neque porro quisquam est, qui dolorem ipsum quia consectetur, dolor sit amet, consectetur, numquam Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, at?</p>
                </div>
            </div>
            <!--Slide Item-->
            <div class="slide-item">
                <div class="inner-box text-center">
                    <div class="image-box">
                        <figure>
                            <img src="images/testimonials/3.png" alt="">
                        </figure>
                    </div>
                    <h6>Amy Adams</h6>
                    <p>Neque porro quisquam est, qui dolorem ipsum quia consectetur, dolor sit amet, consectetur, numquam Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, at?</p>
                </div>
            </div>
            <!--Slide Item-->
            <div class="slide-item">
                <div class="inner-box text-center">
                    <div class="image-box">
                        <figure>
                            <img src="images/testimonials/1.png" alt="">
                        </figure>
                    </div>
                    <h6>Adam Rose</h6>
                    <p>Neque porro quisquam est, qui dolorem ipsum quia consectetur, dolor sit amet, consectetur, numquam Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, at?</p>
                </div>
            </div>
            <!--Slide Item-->
            <div class="slide-item">
                <div class="inner-box text-center">
                    <div class="image-box">
                        <figure>
                            <img src="images/testimonials/2.png" alt="">
                        </figure>
                    </div>
                    <h6>David Warner</h6>
                    <p>Neque porro quisquam est, qui dolorem ipsum quia consectetur, dolor sit amet, consectetur, numquam Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, at?</p>
                </div>
            </div>
            <!--Slide Item-->
            <div class="slide-item">
                <div class="inner-box text-center">
                    <div class="image-box">
                        <figure>
                            <img src="images/testimonials/3.png" alt="">
                        </figure>
                    </div>
                    <h6>Amy Adams</h6>
                    <p>Neque porro quisquam est, qui dolorem ipsum quia consectetur, dolor sit amet, consectetur, numquam Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, at?</p>
                </div>
            </div>
            <!--Slide Item-->
            <div class="slide-item">
                <div class="inner-box text-center">
                    <div class="image-box">
                        <figure>
                            <img src="images/testimonials/1.png" alt="">
                        </figure>
                    </div>
                    <h6>Adam Rose</h6>
                    <p>Neque porro quisquam est, qui dolorem ipsum quia consectetur, dolor sit amet, consectetur, numquam Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, at?</p>
                </div>
            </div>
            <!--Slide Item-->
            <div class="slide-item">
                <div class="inner-box text-center">
                    <div class="image-box">
                        <figure>
                            <img src="images/testimonials/2.png" alt="">
                        </figure>
                    </div>
                    <h6>David Warner</h6>
                    <p>Neque porro quisquam est, qui dolorem ipsum quia consectetur, dolor sit amet, consectetur, numquam Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, at?</p>
                </div>
            </div>
            <!--Slide Item-->
            <div class="slide-item">
                <div class="inner-box text-center">
                    <div class="image-box">
                        <figure>
                            <img src="images/testimonials/3.png" alt="">
                        </figure>
                    </div>
                    <h6>Amy Adams</h6>
                    <p>Neque porro quisquam est, qui dolorem ipsum quia consectetur, dolor sit amet, consectetur, numquam Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias, at?</p>
                </div>
            </div>
        </div>
    </div>
</section>--%>
    <!--End testimonial-section-->
</asp:Content>
