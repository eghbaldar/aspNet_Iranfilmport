using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPanel : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            // check user in all pages based on cookie! 
            HttpCookie decryptedCookie = Context.Request.Cookies[FormsAuthentication.FormsCookieName];
            FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(decryptedCookie.Value);
            var identity = new GenericIdentity(ticket.Name);
            var principal = new GenericPrincipal(identity, null);
            HttpContext.Current.User = principal;
            if (principal.Identity.Name != Page.RouteData.Values["id"].ToString())
            {
                Response.Redirect("~/panel");
            }
            //
        }
        catch (Exception ex)
        {
            Response.Redirect("~/panel");
        }

        lblPanelVersion.Text = "Version: " + PanelVersion.Version;
        DLL_Panel DL = new DLL_Panel();
        Int64 LeftDays;
        LeftDays = DL.GetLastLeftDaysOfInstallment(Convert.ToInt64(Page.RouteData.Values["id"]));
        if (!IsPostBack && LeftDays < 0)
        {
            if (Math.Abs(LeftDays) > 0 && Math.Abs(LeftDays) < 10)
            {
                lblWarningInstallment.Text = String.Format("{0} روز از موعد سر رسید قسط تان گذشته است. خواهشمندیم توجه فرمائید، پس از 10 روز مهلت تعیین شده، سامانه شما محدود خواهد شد.", "<span class='RedCircle' style='padding:10px;'>" + Math.Abs(LeftDays).ToString() + "</span><br/><br/>");
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Modal", "window.onload = function() { loadMODAL(); };", true);
            }
            else if (Math.Abs(LeftDays) > 10)
            {
                lblWarningInstallment.Text = String.Format("{0} روز از موعد سر رسید قسط تان گذاشته است و از آنجایی که سامانه اختصاصی پس از 10 روز مهلت جهت پرداخت قسط، خودبخود غیر فعال خواهد شد، امکان دسترسی شما به سامانه محدود شده است. جهت فعال شدن سامانه با واحد مالی شرکت تماس حاصل فرمائید.", "<span class='RedCircle' style='padding:10px;'>" + Math.Abs(LeftDays).ToString() + "</span><br/><br/>");
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Modal", "window.onload = function() { loadMODAL(); };", true);
            }
        }
        // suggested festivals
        DLL_Panel pnl = new DLL_Panel();
        try
        {
            var unseenfestivals = pnl.GetUnseenFestivalSuggestion(Session["username-temp"].ToString());
            if (Convert.ToUInt32(unseenfestivals) > 0)
            {
                Session.Remove("username-temp");
                string msg = "<img src='../../../files/images/icons/panel_festivals.png'/>";
                msg += "<br>";
                msg += string.Format("<span style='font-size:22px;'>از طرف دپارتمان پخش «درگاه فیلم ایران»، {0} فستیوال به شما پیشنهاد شده است. </span>", "<b style='color:red;'>" + unseenfestivals + "</b>");
                msg += "<br>";
                msg += "لطفا به لینک زیر ورود کرده و در صورت علاقه اقدام به ثبت کنید.";
                msg += "<br>";
                msg += "<a style='text-decoration:none;color:blue;font-weight:bold;' href='../../../panel/PanelSuggestedFestival/"+ Page.RouteData.Values["id"] + "' style='color:blue;'>«ورود به بخش پیشنهادات»</a>";
                lblWarningInstallment.Text = msg;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Modal", "window.onload = function() { loadMODAL(); };", true);
            }
        }
        catch { }

    }

}
