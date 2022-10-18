<%@ Page Title="" Language="VB" MasterPageFile="~/MasterProfile.master" AutoEventWireup="false"
    CodeFile="profile.aspx.vb" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="HiddenFieldEmail" runat="server" />
    <section class="intro-section">
        <%--<h2 class="section-title">Hello, Daisy Murphy!</h2>--%>
        <div style="text-align: justify;" runat="server" id="contextBioFa">
            <asp:Label ID="lblBioFa" runat="server" Text="Label"></asp:Label>
                    <hr />
        </div>

        <div style="text-align: justify; direction: ltr;" runat="server" id="contextBioEn">
            <asp:Label ID="lblBioEn" runat="server" Text="Label"></asp:Label>
                    <hr />
        </div>

        <%--<a href="#!" class="btn btn-primary btn-hire-me">HIRE ME</a>--%>
    </section>
    <section class="portfolio-section">
        <%--<h2 class="section-title">
            پوستر</h2>--%>
        <div class="portfolio-wrapper">
            <asp:Repeater ID="RepeaterPoster" runat="server" DataSourceID="SDS_Poster">
                <ItemTemplate>
                    <figure class="portfolio-item hover-box">
                        <asp:LinkButton PostBackUrl='<%# GetProjectLink(Eval("projectid","{0}") & "|" & Eval("namef","{0}") & "|" & Eval("type","{0}")) %>' ID="LinkButton1" runat="server">
                        <div style="float: left; margin: 10px; position: relative;">
                            <div class="topright">
                                <asp:Image ID="Image2" ImageUrl="files/images/logos/confidence_logo_small.png" runat="server"
                                    Visible='<%# IIF(Eval("Truth")=True,True,False) %>' Width="50"
                                     AlternateText="نماد اعتماد درگاه فیلم ایران"
                                    title="این اثر دارای نماد اعتماد درگاه فیلم ایران است" />
                            </div>
                            <asp:Image AlternateText="پوستر" ID="Image1" CssClass="portfolio-item-img"
                                ImageUrl='<%# Page.ResolveUrl(String.Format("~/files/uploadFiles/ProjectPhotos/{0}", Eval("File"))) %>'
                                runat="server" />
                        </div>
                        <figcaption class="portfolio-item-details overlay">
                        
                            <h5 class="portfolio-item-title">
                                <asp:Label ID="Label3" runat="server" ForeColor="#ffe600" Text='<%# Eval("type","{0}") %>'></asp:Label></h5>
                            <p class="portfolio-item-description">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("namef","{0}") %>'></asp:Label>
                            </p>
                            <p class="portfolio-item-description">
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("namee","{0}") %>'></asp:Label>
                            </p>
                        
                        </figcaption>
                        </asp:LinkButton>
                    </figure>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SDS_Poster" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
                SelectCommand="exec sp_showPosterProfile @email">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HiddenFieldEmail" Name="email" PropertyName="Value"
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </section>
    <section class="testimonial-section">
        <div id="testimonialCarousel" class="testimonial-carousel carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="../../files/profileAssets/images/eachprofile.png" alt="profile" class="testimonial-img">
                    <p class="testimonial-content">
                        شما می‌توانید صفحه اختصاصی خود را به راحتی ایجاد کنید.</p>
                    <p class="testimonial-name">
                    </p>
                </div>
                <div class="carousel-item">
                    <img src="../../files/profileAssets/images/easy.png" alt="profile" class="testimonial-img">
                    <p class="testimonial-content">
                        هر فیلمساز و فیلمنامه‌نویس یک صفحه اختصاصی اینترنتی</p>
                    <p class="testimonial-name">
                    </p>
                </div>
                <%--<div class="carousel-item">
                            <p class="testimonial-content">Mauris magna sapien, pharetra consectetur fringilla vitae,
                                interdum sed tortor.</p>
                            <img src="assets/images/Profile.png" alt="profile" class="testimonial-img">
                            <p class="testimonial-name">Nout Golstein</p>
                        </div>--%>
            </div>
            <ol class="carousel-indicators">
                <li data-target="#testimonialCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#testimonialCarousel" data-slide-to="1"></li>
                <%--<li data-target="#testimonialCarousel" data-slide-to="2"></li>--%>
            </ol>
        </div>
    </section>
    <footer>
            
 «درگاه فیلم ایران» تخصصی‌ترین مرکز ارسال و پخش فیلم به فستیوال‌های خارجی
                           
<br /> 
<br />
                           <span style="font-size: 10px;">W W W . I R A N F I
    L M P O R T . C O M
    <br />
    <br />
    <div style="direction: ltr;">
        (+98) 9216343320 / (+98) 9020763947 / (+98) 9332300598
    </div>
</span>
            
            </footer>
</asp:Content>
