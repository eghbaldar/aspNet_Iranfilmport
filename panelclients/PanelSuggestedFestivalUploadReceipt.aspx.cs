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
            if (fileExtension == ".jpg")
            {
                // Check the file signature
                byte[] fileBytes = new byte[10];
                FileUpload.PostedFile.InputStream.Read(fileBytes, 0, 10);
                if (fileBytes[0] == 0xFF && fileBytes[1] == 0xD8 && fileBytes[2] == 0xFF && (fileBytes[3] == 0xE0 || fileBytes[3] == 0xE1))
                {
                    // Check the file size (less than 1 MB)
                    if (FileUpload.PostedFile.ContentLength < 1024 * 1024)
                    {
                        string randomfilename = Guid.NewGuid().ToString();
                        string savePath = Server.MapPath("~/files/uploadFiles/clientfestivalsuggestedreceipt/" + randomfilename + fileExtension);

                        try
                        {
                            DLL_Panel dl = new DLL_Panel();
                            FileUpload.SaveAs(savePath);
                            string message = "رسید با موفقیت آپلود شد. لطفا منتظر تماس کارشناسان شرکت بمانید.";
                            string jsFunction = "MyAlert('" + message + "|" +Page.RouteData.Values["id"].ToString() + "|4000|True');";
                            dl.UpdateFestivalSuggestionAgree(Convert.ToInt64(Page.RouteData.Values["festivalId"]), '2');
                            dl.UpdateFestivalSuggestionReceipt(Convert.ToInt64(Page.RouteData.Values["festivalId"]), randomfilename + fileExtension);
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