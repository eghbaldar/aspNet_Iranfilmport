<%@ Application Language="VB" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="System.Web.Routing.Route" %>
<%@ Import Namespace="System.Web" %>

<script runat="server">

    Protected Sub Application_BeginRequest(sender As Object, e As System.EventArgs)

        'remove default.aspx
        Dim context As HttpContext = HttpContext.Current
        Dim url As String = context.Request.RawUrl.ToString()
        If url.EndsWith("/default.aspx", StringComparison.OrdinalIgnoreCase) Then
            url = url.Substring(0, url.Length - 12)
            context.Response.Redirect(url)
        End If
        'برای از بین بردن پسوند بقیه صفحات باید از تکنیک
        'httpRedirect
        'در فایل web.config
        'استفاده کن

    End Sub

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        RegisterRoutes(RouteTable.Routes)
        RegisterRoutes_username(RouteTable.Routes)
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        'Response.Redirect("~/عدم-دسترسی")
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
    End Sub
    Shared Sub RegisterRoutes(ByVal routes As RouteCollection)
        routes.MapPageRoute("rss1", "rss1", "~/test.aspx")
        '------------- for working updatepanel
        routes.Ignore("{resource}.apk/{*pathInfo}")
        routes.Ignore("{resource}.axd/{*pathInfo}")
        routes.Ignore("{resource}.css/{*pathInfo}")
        routes.Ignore("{resource}.axd/{*pathInfo}")
        routes.Ignore("{resource}.jpg/{*pathInfo}")
        routes.Ignore("{*allaspx}", New With {.allaspx = ".*\.aspx(/.*)?"})
        routes.Ignore("{file}.js")
        routes.Ignore("{file}.css")
        routes.Ignore("{file}.png")
        routes.Ignore("{file}.apk")
        '---------------------------------------------
        routes.MapPageRoute("rss", "rss", "~/rss.aspx")
        routes.MapPageRoute("rule", "قوانین-و-مقررات", "~/kingrules.aspx") 'rules.aspx
        routes.MapPageRoute("howitworks", "پخش-و-ارسال-فیلم", "~/kingHowitworks.aspx") 'howitworks.aspx
        routes.MapPageRoute("article", "نقد-تحلیل-اخبار-فیلم-کوتاه", "~/kingPosts.aspx") 'posts.aspx
        routes.MapPageRoute("mediamaking", "رسانه-سازی-پخش-فیلم", "~/kingService_mediamaking.aspx") 'service_mediamaking
        routes.MapPageRoute("movibeta", "movibeta", "~/kingmovibeta.aspx") 'movibeta.aspx
        routes.MapPageRoute("Services", "سرویس-های-پخش-فیلم", "~/kingservices.aspx") 'services
        routes.MapPageRoute("oscars", "فستیوال-های-اسکاری-فیلم-کوتاه", "~/kingFestivalsOscar.aspx") 'festivalsOscar.aspx
        routes.MapPageRoute("festivalABC", "فستیوال-های-فیلم", "~/kingfestivalABC.aspx") 'festivalABC
        routes.MapPageRoute("contact", "تماس-با-درگاه-فیلم-ایران", "~/kingContact.aspx") 'contact.aspx
        routes.MapPageRoute("contactus", "contactus", "~/kingContact.aspx") 'Contact.aspx
        routes.MapPageRoute("aboutus", "درباره-درگاه-فیلم-ایران", "~/KingAboutUs.aspx") 'aboutus.aspx
        routes.MapPageRoute("about", "about", "~/KingAboutUs.aspx") 'aboutus.aspx
        routes.MapPageRoute("customers", "مشتریان-درگاه-فیلم-ایران", "~/kingOurClients.aspx") ''customers.aspx
        routes.MapPageRoute("price", "هزینه-پخش-بین-المللی-فیلم", "~/kingprices.aspx") 'prices.aspx
        routes.MapPageRoute("consultation", "مشاوره-پخش-بین-المللی-فیلم", "~/kingConsultation.aspx") 'consultation.aspx
        routes.MapPageRoute("consultationScript", "مشاوره-فیلمنامه-کوتاه-مشاوره-فیلمنامه-بلند", "~/kingConsultationscript.aspx") 'consultationscript.aspx
        routes.MapPageRoute("features", "ویژگی-های-پخش-فیلم-درگاه-فیلم-ایران", "~/kingFeatures.aspx") 'features.aspx
        routes.MapPageRoute("notallow", "عدم-دسترسی", "~/notAllow.aspx")
        routes.MapPageRoute("profileband", "پروفایل-خارج-از-دسترس", "~/outProfile.aspx")
        routes.MapPageRoute("resume", "کارنامه-پخش-فیلم-درگاه-فیلم-ایران", "~/KingAccolades.aspx") 'CV.aspx
        routes.MapPageRoute("resume2", "accolades", "~/KingAccolades.aspx") 'CV.aspx
        routes.MapPageRoute("login", "ورود-و-ثبت-نام", "~/login.aspx") '****
        routes.MapPageRoute("me", "me", "~/login.aspx") '****
        routes.MapPageRoute("namad", "نماد-اعتماد-درگاه-فیلم-ایران", "~/kingNamad.aspx") 'namad.aspx
        routes.MapPageRoute("strategy", "برنامه-استراتژیک-پخش-فیلم-به-جشنواره-های-خارجی", "~/kingStrategy.aspx") 'strategy.aspx
        routes.MapPageRoute("exhibition", "picks", "~/kingExhibition.aspx") 'exhibition.aspx
        routes.MapPageRoute("send", "send", "~/kingSendPreInformation.aspx") 'sendfilm.aspx
        routes.MapPageRoute("team", "team", "~/kingteam.aspx") 'team.aspx
        routes.MapPageRoute("originality", "originality", "~/kingfeatures.aspx") 'features.aspx
        routes.MapPageRoute("faq", "faq", "~/kingfaq.aspx") 'camscanner.aspx
        routes.MapPageRoute("captcha", "captcha", "~/captcha.aspx") '****
        routes.MapPageRoute("trailer", "trailer", "~/trailer.aspx") '****
        routes.MapPageRoute("advertiseFa", "ارسال-خبر-و-تبلیغات", "~/kingAdvertisement.aspx") 'advertise.aspx
        routes.MapPageRoute("advertiseEn", "advertise", "~/kingadvertise.aspx") 'advertise.aspx
        routes.MapPageRoute("sendinformation", "sendinformation", "~/sendinformation.aspx") '****
        routes.MapPageRoute("participationplan", "participationplan", "~/kingparticipationplan.aspx") 'participationplan.aspx
        routes.MapPageRoute("features2", "features", "~/kingfeatures.aspx") 'features.aspx
        routes.MapPageRoute("testimonial", "تصدیق-نامه-فیلمسازان", "~/kingTestimonials.aspx") 'testimonial.aspx
        routes.MapPageRoute("agents", "agents", "~/kingagents.aspx") 'agents.aspx
        routes.MapPageRoute("tempcontract", "contract/{id}", "~/kingcontract.aspx") 'contract
        routes.MapPageRoute("GeneralDetails", "GeneralDetails/{type}", "~/GeneralDetails.aspx") '****
        routes.MapPageRoute("RevisingScreenplay", "نگارش-بازنویسی-فیلمنامه-کوتاه-بلند", "~/kingRevisingScreenplay.aspx") 'RevisingScreenplay
        routes.MapPageRoute("advertiseModalInterface", "advertiseModalInterface", "~/advertiseModalInterface.aspx") '****
        routes.MapPageRoute("onlinecourses", "courses/{title}", "~/kingcourses.aspx") 'courses.aspx
        '----------------------------------------------------------------------------------------
        routes.MapPageRoute("panel", "panel/", "~/panelclients/panel.aspx")
        routes.MapPageRoute("panelClient", "panel/client/{id}", "~/panelclients/PanelMain.aspx")
        routes.MapPageRoute("panelMoney", "panel/money/{id}", "~/panelclients/PanelMoney.aspx")
        routes.MapPageRoute("panelTickets", "panel/tickets/{id}", "~/panelclients/PanelTicket.aspx")
        routes.MapPageRoute("panelTicketsNew", "panel/newtickets/{id}", "~/panelclients/PanelTicketNew.aspx")
        routes.MapPageRoute("panelStrategyReports", "panel/panelStrategyReports/{id}/{idFilm}", "~/panelclients/Panel_StrategyReport.aspx")
        routes.MapPageRoute("panelReceipt", "panel/PanelReceipt/{id}/{idSubmission}/", "~/panelclients/PanelReceipt.aspx")
        routes.MapPageRoute("panelTicketVoice", "panel/ticket/voice/{file}", "~/panelclients/playvoice.aspx")
        routes.MapPageRoute("PanelReports", "panel/PanelReports/{id}/{IdFilm}", "~/panelclients/PanelReports.aspx")
        routes.MapPageRoute("PanelSuggestedFestival", "panel/PanelSuggestedFestival/{id}/", "~/panelclients/PanelSuggestedFestival.aspx")
        routes.MapPageRoute("PanelSuggestedFestivalUploadReceipt", "panel/PanelSuggestedFestivalUploadReceipt/{id}/{festivalId}", "~/panelclients/PanelSuggestedFestivalUploadReceipt.aspx")
        '----------------------------------------------------------------------------------------
        '----------------------------------------------------------------------------------------
        '----------------------------------------------------------------------------------------
        '----------------------------------------------------------------------------------------
        '----------------------------------------------------------------------------------------
        '----------------------------------------------------------------------------------------
        '----------------------------------------------------------------------------------------
        'ساخت لینک داینامیک
        'routes.MapPageRoute("dynamicLink", "link/d/{randomString}", "~/files/images/background/banner_1.jpg")
        '----------------------------------------------------------------------------------------
        '---------------- Verification Code
        routes.MapPageRoute("VerificationCode", "login/{veriC}/{email}", "~/login.aspx")
        routes.MapPageRoute("convertToUnscale", "convertToUnscale", "~/convertToUnscale.aspx")
        '----------------------------------------------------------------------------------------
        '----------------------------------------------------------------------------------------
        '----------------------------------------------------------------------------------------
        '                                       Festival
        '----------------------------------------------------------------------------------------
        '----------------------------------------------------------------------------------------
        '----------------------------------------------------------------------------------------
        '---------------- نکته ای در خصوص کد زیر وجوددارد که در پایینتر توضیح داده خواهدشد
        routes.MapPageRoute("festival", "جشنواره-های-فیلم-کوتاه-بلند", "~/kingFestivals.aspx") 'festivals.aspx
        routes.MapPageRoute("festivalSearch", "festivals/search/{*items}", "~/kingfestivalSearch.aspx") 'festivalSearch.aspx
        'routes.MapPageRoute("festivalEach", "festival/{id}/{name_en}/{name_fa}", "~/aFestival.aspx")                
        'دستورات زیر یعنی اگر دو پارامتر نام فارسی و انگلیسی خالی بودند خطا ندهد
        routes.MapPageRoute("festivalEach",
        "festival/{id}/{name_en}/{name_fa}",
        "~/kingAFestival.aspx",
        True,
        New RouteValueDictionary(New With
            {.id = " ",
             .name_en = " ",
             .name_fa = " "})) 'aFestival.aspx
        'وقتی از کد بالا استفاده میکنید لینک که از تگ انچور بصورت زیر استفاده میکنند دچار مشکل خواهند شد
        '<a href="#"></a> 
        'برای رفع مشکل بصورت زیر بنویسید
        '<a href='<%= ResolveUrl("~/#")%>'></a>       
        '----------------------------------------------------------------------------------------
        '----------------------------------------------------------------------------------------
        '----------------------------------------------------------------------------------------
        '                                          Dashboard
        '----------------------------------------------------------------------------------------
        '----------------------------------------------------------------------------------------
        '----------------------------------------------------------------------------------------
        routes.MapPageRoute("dsahboard", "dashboard/", "~/dashboard/user/me/")
        routes.MapPageRoute("dsahboardMain", "dashboard/user/me/", "~/dashboard/Default.aspx")
        routes.MapPageRoute("dsahboardProject", "dashboard/user/me/projects", "~/dashboard/projects.aspx")
        routes.MapPageRoute("dsahboardService", "dashboard/user/me/services", "~/dashboard/services.aspx")
        routes.MapPageRoute("dsahboardSubmission", "dashboard/user/me/submission", "~/dashboard/submission.aspx")
        routes.MapPageRoute("dsahboardInvoice", "dashboard/user/me/invoice", "~/dashboard/invoice.aspx")
        routes.MapPageRoute("dsahboardMSG", "dashboard/user/me/messages", "~/dashboard/messages.aspx")
        routes.MapPageRoute("dsahboardAproject", "dashboard/user/me/aproject/{id}", "~/dashboard/aproject.aspx")
        routes.MapPageRoute("dsahboardAmsg", "dashboard/user/me/messages/msg/{id}", "~/dashboard/msg.aspx")
        routes.MapPageRoute("dsahboardFactor", "dashboard/user/me/contract/factor/{factor}", "~/dashboard/contract.aspx")
        routes.MapPageRoute("dsahboardPreCheckout", "dashboard/user/me/precheckout/{festivalID}", "~/dashboard/preCheckout.aspx")
        routes.MapPageRoute("dsahboardCheckout", "dashboard/user/me/checkout/{festivalID}/{projectID}/{deadlineID}", "~/dashboard/checkout.aspx")
        routes.MapPageRoute("dsahboardCallBackBacnk", "dashboard/user/me/CallBackBank", "~/dashboard/CallBackBank.aspx")
        routes.MapPageRoute("dsahboardWallet", "dashboard/user/me/Wallet", "~/dashboard/Wallet.aspx")
        '----------------------------------------------------------------------------------------
        '----------------------------------------------------------------------------------------
        '----------------------------------------------------------------------------------------
        '                                          CMS
        '----------------------------------------------------------------------------------------
        '----------------------------------------------------------------------------------------
        '----------------------------------------------------------------------------------------
        routes.MapPageRoute("cmsSitemap", "cms/pages/sitemap/", "~/sitemap.aspx")
        'کد زیر برای آن است که ادیتور آپلود عکس درست باز شود، چون پسوندهای ای اس پی ایکس بسته شده اند
        routes.MapPageRoute("cmsImagesManagement", "cms/pages/imagesManagement/", "~/cms/pages/imagesManagement.aspx")
        routes.MapPageRoute("cmsSecurityImageGenerator", "usercontrols/SecurityImageGenerator/", "~/usercontrols/SecurityImageGenerator.aspx")

        routes.MapPageRoute("cmsAddPost", "cms/pages/AddNewPost/", "~/cms/pages/addBolg.aspx")
        routes.MapPageRoute("cmsAddFestival", "cms/pages/AddFestival/", "~/cms/pages/addFest.aspx")
        routes.MapPageRoute("cmsBackToWallet", "cms/pages/BacktoWallet/", "~/cms/pages/backtowallet.aspx")
        routes.MapPageRoute("cmsCategoryOfPost", "cms/pages/CategoryOfPost/", "~/cms/pages/categoryArticle.aspx")
        routes.MapPageRoute("cmsComments", "cms/pages/Comments/", "~/cms/pages/comment.aspx")
        routes.MapPageRoute("cmsContact", "cms/pages/Contact/", "~/cms/pages/contact.aspx")
        routes.MapPageRoute("cms", "cms/pages/", "~/cms/pages/Default.aspx")
        routes.MapPageRoute("cmsDesktopSubmissionList", "cms/pages/DesktopSubmissionList/", "~/cms/pages/Desktop_SubmissionList.aspx")
        routes.MapPageRoute("cmsDollars", "cms/pages/Dollars/", "~/cms/pages/dollars.aspx")
        routes.MapPageRoute("cmsEditPost", "cms/pages/EditPost/", "~/cms/pages/editArticle.aspx")
        routes.MapPageRoute("cmsEditFest", "cms/pages/EditFestival/", "~/cms/pages/editFest.aspx")
        routes.MapPageRoute("cmsFileManagement", "cms/pages/FileManagement/", "~/cms/pages/fileManagement.aspx")
        routes.MapPageRoute("cmsGeneralInvoice", "cms/pages/GeneralInvoice/", "~/cms/pages/GeneralInvoice.aspx")
        routes.MapPageRoute("cmsGeneralSetting", "cms/pages/GeneralSetting/", "~/cms/pages/GeneralSetting.aspx")
        routes.MapPageRoute("cmsInvoices", "cms/pages/Invoices/", "~/cms/pages/invoice.aspx")
        routes.MapPageRoute("cmsInvoiceMSG", "cms/pages/InvoiceMSG/", "~/cms/pages/invoiceMSG.aspx")
        routes.MapPageRoute("cmsmsgTOusers", "cms/pages/msgTOusers/", "~/cms/pages/msgTOusers.aspx")
        routes.MapPageRoute("cmsPosterofcustomer", "cms/pages/posterofcustomer/", "~/cms/pages/posterofcustomer.aspx")
        routes.MapPageRoute("cmsprofileCreator", "cms/pages/profileCreator/", "~/cms/pages/profileCreator.aspx")
        routes.MapPageRoute("cmsprofileEdit", "cms/pages/profileEdit/", "~/cms/pages/profileEdit.aspx")
        routes.MapPageRoute("cmsProfileInvoice", "cms/pages/ProfileInvoice/", "~/cms/pages/ProfileInvoice.aspx")
        routes.MapPageRoute("cmsSitemapProfileProject", "cms/pages/ProfileProject/", "~/cms/pages/ProfileProject.aspx")
        routes.MapPageRoute("cmsprofiles", "cms/pages/profiles/", "~/cms/pages/profiles.aspx")
        routes.MapPageRoute("cmsprojectEdit", "cms/pages/projectEdit/", "~/cms/pages/projectEdit.aspx")
        routes.MapPageRoute("cmsprojects", "cms/pages/projects/", "~/cms/pages/projects.aspx")
        routes.MapPageRoute("cmsresume", "cms/pages/resume/", "~/cms/pages/resume.aspx")
        routes.MapPageRoute("cmssendinfo", "cms/pages/sendinfo/", "~/cms/pages/sendinfo.aspx")
        routes.MapPageRoute("cmsslider", "cms/pages/slider/", "~/cms/pages/slider.aspx")
        routes.MapPageRoute("cmsstatistical", "cms/pages/statistical/", "~/cms/pages/statistical.aspx")
        routes.MapPageRoute("cmssubmission", "cms/pages/submission/", "~/cms/pages/submission.aspx")
        routes.MapPageRoute("cmsusers", "cms/pages/users/", "~/cms/pages/users.aspx")
        routes.MapPageRoute("cmsadvertise", "cms/pages/advertise/", "~/cms/pages/advertise.aspx")
        routes.MapPageRoute("cmsparticipationplan", "cms/pages/participationplan", "~/cms/pages/participationplan.aspx")
        routes.MapPageRoute("cmsaboutus", "cms/pages/aboutus", "~/cms/pages/about.aspx")
        routes.MapPageRoute("cmsAPK", "cms/pages/apks", "~/cms/pages/apk.aspx")
        routes.MapPageRoute("cmsresumeEdit", "cms/pages/resumeEdit/{idCV}", "~/cms/pages/resumeEdit.aspx")
        routes.MapPageRoute("cmscommentClients", "cms/pages/commentClients/", "~/cms/pages/commentClients.aspx")
        routes.MapPageRoute("cmsresumeeach", "cms/pages/resumeeachone/{id_film}", "~/cms/pages/resumeeachone.aspx")
        routes.MapPageRoute("cmsagents", "cms/pages/agents/", "~/cms/pages/agents.aspx")
        routes.MapPageRoute("Calendar", "cms/pages/Calendar/{*date}", "~/cms/pages/Calendar.aspx")
        routes.MapPageRoute("scriptconsultation", "cms/pages/scriptconsultation", "~/cms/pages/scriptconsultation.aspx")
        routes.MapPageRoute("modalAdvert", "cms/pages/modalAdvert", "~/cms/pages/modalAdvert.aspx")
        routes.MapPageRoute("testimonialsCms", "cms/pages/testimonials", "~/cms/pages/testimonials.aspx")
        routes.MapPageRoute("activities", "cms/pages/activities", "~/cms/pages/activities.aspx")
        routes.MapPageRoute("sms", "cms/pages/sms", "~/cms/pages/sms.aspx")
        routes.MapPageRoute("requestedfestivalsclient", "cms/pages/requestedfestivalsclient", "~/cms/pages/requestedfestivalsclient.aspx")
        routes.MapPageRoute("errorLogs", "cms/pages/errorLogs", "~/cms/pages/errorLogs.aspx")
        routes.MapPageRoute("cmsfeatures", "cms/pages/features", "~/cms/pages/features.aspx")

    End Sub

    Shared Sub RegisterRoutes_username(ByVal routes As RouteCollection)
        '------------------------------------------------------------------ Runtime profile
        routes.MapPageRoute("filmmaker", "filmmaker/{username}", "~/profile.aspx")
        routes.MapPageRoute("filmmakerProject", "filmmaker/{username}/{IdProject}/{nameProject}", "~/profile_project.aspx")
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '                                          B L O G
        '----------------------------------------------------------------------------------------
        '----------------------------------------------------------------------------------------
        '----------------------------------------------------------------------------------------
        routes.MapPageRoute("tags", "tag/{text}", "~/kingtags.aspx") 'tags.aspx
        routes.MapPageRoute("POSTwithUnique", "{id}", "~/KingPost.aspx") 'post.aspx => KingPost.aspx
        routes.MapPageRoute("POST", "{id}/{title}", "~/KingPost.aspx") 'post.aspx => KingPost.aspx
        routes.MapPageRoute("categories", "{id}/{title}/دسته-محتوایی", "~/kingcategories.aspx") 'categories.aspx
        routes.MapPageRoute("types", "{type}/{title}/دسته-اصلی", "~/kingmaincategories.aspx") 'types.aspx
        'routes.MapPageRoute("postSearch", "post/search/{text}", "~/postSearch.aspx")
        '----------------------------------------------------------------------------------------
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '                                          webservice
        '----------------------------------------------------------------------------------------
        '----------------------------------------------------------------------------------------
        routes.MapPageRoute("webs1", "api/api/api/api", "~/{*Action}")


    End Sub

</script>