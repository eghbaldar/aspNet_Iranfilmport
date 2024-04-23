
Partial Class usercontrols_Header
    Inherits System.Web.UI.UserControl

    Dim DL As New DLL
    Dim DLLCMSS As New DLL_CMS

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Try
            If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
                If Request.QueryString("lang").Trim.ToLower = "en" Then
                    lbl_link_btn.Text = "HOW DO US ?"
                    lbl_link_btn2.Text = "HOW DO US ?"
                    lblEmailAddress.Text = "E-MAIL"
                    lblRightnow.Text = "LET'S CALL"
                Else
                    lbl_link_btn.Text = "ارسال فیلم و فیلمنامه"
                    lbl_link_btn2.Text = "ارسال فیلم و فیلمنامه"
                    lblEmailAddress.Text = "پست الکترونیک"
                    lblRightnow.Text = "تماس بگیرید"
                End If
            Else
                lbl_link_btn.Text = "ارسال فیلم و فیلمنامه"
                lbl_link_btn2.Text = "ارسال فیلم و فیلمنامه"
                lblEmailAddress.Text = "پست الکترونیک"
                lblRightnow.Text = "تماس بگیرید"
            End If

            advertiseModal.Visible = DL.GetStatusModalOnAllPage

            If DLLCMSS.GetMarquee().Trim().Length > 0 Then
                litMarquee.Text = "<marquee style='position: absolute;'> <img id='Image1' Width='170' src='/files/images/marquee/" + DLLCMSS.GetMarquee().Trim() + "' runat='server'></asp:Image> </marquee>"
            End If

        Catch ex As Exception

        End Try
    End Sub

End Class
