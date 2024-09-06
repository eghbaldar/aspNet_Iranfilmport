using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class panelclients_Default : System.Web.UI.Page
{
    protected void btnSendReceipt_Click(object sender, EventArgs e)
    {
        if (FileUpload.HasFile)
        {
            string filename = Path.GetFileName(FileUpload.FileName);
            string fileExtension = Path.GetExtension(filename).ToLower();


            // Check if the file extension is .jpg
            byte[][] allowedSignatures = {
    new byte[] { 0xFF, 0xD8, 0xFF, 0xE0 },
    new byte[] { 0xFF, 0xD8, 0xFF, 0xE1 },
    new byte[] { 0x89, 0x50, 0x4E, 0x47 },
    new byte[] { 0x47, 0x49, 0x46, 0x38 },
    new byte[] { 0x42, 0x4D }
};

            string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif", ".bmp" };

            if (allowedExtensions.Contains(Path.GetExtension(FileUpload.PostedFile.FileName).ToLower()))
            {
                // Check the file signature
                byte[] fileBytes = new byte[4];
                FileUpload.PostedFile.InputStream.Read(fileBytes, 0, 4);

                if (allowedSignatures.Any(sig => sig.SequenceEqual(fileBytes)))
                {
                    // Check the file size (less than 1 MB)
                    if (FileUpload.PostedFile.ContentLength < 1024 * 1024)
                    {
                        string randomFileName = Guid.NewGuid().ToString();
                        string savePath = Path.Combine(Server.MapPath("~/files/uploadFiles/clientfestivalsuggestedreceipt/"), randomFileName + Path.GetExtension(FileUpload.PostedFile.FileName));

                        try
                        {
                            DLL_Panel dl = new DLL_Panel();
                            FileUpload.PostedFile.SaveAs(savePath);
                            string message = "رسید با موفقیت آپلود شد. لطفا منتظر تماس کارشناسان شرکت بمانید.";
                            string jsFunction = "MyAlert('" + message + "|" + Page.RouteData.Values["id"].ToString() + "|4000|True');";
                            dl.UpdateFestivalSuggestionAgree(Convert.ToInt64(Page.RouteData.Values["festivalId"]), '2');
                            dl.UpdateFestivalSuggestionReceipt(Convert.ToInt64(Page.RouteData.Values["festivalId"]), Path.GetFileName(savePath));

                            // sms
                            SMS sms = new SMS();
                            try
                            {
                                sms.SendSms("09112315480", "0jjvekuiwcgoodw", "name", dl.GetNameCustomer(Convert.ToInt64(Page.RouteData.Values["id"].ToString())));
                            }
                            catch (Exception)
                            {
                                throw;
                            }
                            // email
                            try
                            {
                                Email email = new Email();
                                long userId = Convert.ToInt64(Page.RouteData.Values["id"]);
                                email.SendMail("iranfilmportdistributor@gmail.com","کاربر: " + 
                                    dl.GetNameCustomer(userId) + "<br/>" + "<strong>" + "درخواست فستیوال پولی کرده است" + "</strong>", "درخواست فستیوال پولی: "+
                                    dl.GetNameCustomer(userId), "https://iranfilmport.com/cms/pages/requestedfestivalsclient");                                
                            }
                            catch (Exception)
                            {

                                throw;
                            }

                            ClientScript.RegisterStartupScript(this.GetType(), "YourKey", jsFunction, true);
                        }
                        catch (Exception ex)
                        {
                            string message = "خطایی رخ داده است.";
                            string jsFunction = "MyAlert('" + message + "| |2000|false')";
                            ClientScript.RegisterStartupScript(this.GetType(), "YourKey", jsFunction, true);
                        }
                    }
                    else
                    {
                        string message = "حجم باید کمتر از یک مگابات باشد.";
                        string jsFunction = "MyAlert('" + message + "| |2000|false')";
                        ClientScript.RegisterStartupScript(this.GetType(), "YourKey", jsFunction, true);
                    }
                }
                else
                {
                    string message = "فرمت فایل قابل قبول نیست.";
                    string jsFunction = "MyAlert('" + message + "| |2000|false')";
                    ClientScript.RegisterStartupScript(this.GetType(), "YourKey", jsFunction, true);
                }
            }
            else
            {
                string message = "فرمت فایل قابل قبول نیست.";
                string jsFunction = "MyAlert('" + message + "| |2000|false')";
                ClientScript.RegisterStartupScript(this.GetType(), "YourKey", jsFunction, true);
            }
        }
        else
        {
            string message = "ابتدا فایل را انتخاب کنید.";
            string jsFunction = "MyAlert('" + message + "| |2000|false')";
            ClientScript.RegisterStartupScript(this.GetType(), "YourKey", jsFunction, true);
        }
    }
}