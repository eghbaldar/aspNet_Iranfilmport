Imports System.Drawing

Partial Class convertToUnscale
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim bm As New Bitmap(MapPath("~/" + Request.QueryString("photo")))
        Dim w As Integer = Val(Request.QueryString("w"))
        Dim h As Integer = Val(Request.QueryString("h"))
        Dim thumb As New Bitmap(w, h)
        Dim g As Graphics = Graphics.FromImage(thumb)
        g.InterpolationMode = Drawing2D.InterpolationMode.HighQualityBicubic
        g.DrawImage(bm, New Rectangle(0, 0, w, h), New Rectangle(0, 0, bm.Width, bm.Height), GraphicsUnit.Pixel)
        Response.ContentType = "image/jpeg"
        thumb.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg)
        g.Dispose()
        thumb.Dispose()
        bm.Dispose()

    End Sub

End Class
