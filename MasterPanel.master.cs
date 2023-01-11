using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPanel : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["PanelClient"] == null)
        {
            Response.Redirect("~/panel/");
        }

        DLL_Panel DL = new DLL_Panel();
        Int64 LeftDays;
        LeftDays=DL.GetLastLeftDaysOfInstallment(Convert.ToInt64(Page.RouteData.Values["id"]));
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
        }

}
