using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Text;

public partial class captcha : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Bitmap objBMP = new System.Drawing.Bitmap(180, 50);
        Graphics objGraphics = System.Drawing.Graphics.FromImage(objBMP);
        objGraphics.Clear(Color.Orange);
        objGraphics.TextRenderingHint = TextRenderingHint.AntiAlias;
        //' Configure font to use for text
        Font objFont = new Font("Arial", 30, FontStyle.Bold);
        string randomStr = "";
        int[] myIntArray = new int[7];
        int x;
        //That is to create the random # and add it to our string 
        Random autoRand = new Random();
        for (x = 0; x < 7; x++)
        {
            myIntArray[x] = System.Convert.ToInt32(autoRand.Next(0, 9));
            randomStr += (myIntArray[x].ToString());
        }
        //This is to add the string to session cookie, to be compared later
        Session.Add("randomStr", randomStr);
        //' Write out the text
        objGraphics.DrawString(randomStr, objFont, Brushes.White, 3, 3);
        /////////////////////
        Pen p = new Pen(Color.White  , 5);
        objGraphics.DrawLine(p, 0, 10, 600, 10);
        objGraphics.DrawLine(p, 0, 20, 600, 20);
        objGraphics.DrawLine(p, 0, 30, 600, 30);
        objGraphics.DrawLine(p, 0, 40, 600, 40);
        //////////////////////////
        //' Set the content type and return the image
        Response.ContentType = "image/GIF";
        objBMP.Save(Response.OutputStream, ImageFormat.Gif);
        objFont.Dispose();
        objGraphics.Dispose();
        objBMP.Dispose();
        }
    }
