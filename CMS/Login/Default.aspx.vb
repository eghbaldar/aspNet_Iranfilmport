﻿Imports System.Net
Imports System.Web.Services
Imports System.IO

Partial Class Management_Login_Default
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        If Session("randomStr").ToString.Trim.ToLower = txtCaptcha.Text.Trim.ToLower And txtuser.Text.Trim <> "" And txtCaptcha.Text.Trim <> "" Then
            SendSMS(txtuser.Text)
            MultiView.ActiveViewIndex = 1
        End If

    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If HttpContext.Current.User.Identity.IsAuthenticated Then
            Response.Redirect("~/cms/pages/")
        End If
        If Not IsPostBack Then
            ImageCaptacha.ImageUrl = "~/captcha"
            ImageCaptachaSpecial.ImageUrl = "~/captcha"
        End If

    End Sub

    Private Sub btnValidation_Click(sender As Object, e As EventArgs) Handles btnValidation.Click
        If txtSMS.Text.Trim = Session("CodeCreated") Then
            Session.Remove("CodeCreated")
            Session("ADMIN") = "Full"
            FormsAuthentication.SetAuthCookie("ifp2021", True)
            Response.Redirect("~/cms/pages/")
        End If
    End Sub

    Private Sub btnChange_Click(sender As Object, e As ImageClickEventArgs) Handles btnChange.Click
        MultiView.ActiveViewIndex = 2
    End Sub

    Private Sub btnSpecialLogin_Click(sender As Object, e As EventArgs) Handles btnSpecialLogin.Click
        If Session("randomStr").ToString.Trim.ToLower = txtSpecialCaptcha.Text.Trim.ToLower _
        And txtSpecialUsername.Text.Trim <> "" And txtSpecialPassword.Text.Trim <> "" And
        txtSpecialCaptcha.Text.Trim <> "" Then

            Dim En As New Encryptor

            If txtSpecialUsername.Text.Trim = "ADMINadmin" And
                "/lGDnMnen1UQetcwygI8Bg==" = En.EncryptText(txtSpecialPassword.Text.Trim, "ASN2022ajaba*&^") Then
                Session.Remove("CodeCreated")
                Session("ADMIN") = "Full"
                FormsAuthentication.SetAuthCookie("ifp2021", True)
                Response.Redirect("~/cms/pages/")
            End If

        End If
    End Sub

    Private Function SendSMS(username As String) As Integer

        Dim cell As String = ""
        Select Case username.ToLower.Trim
            Case "asal"
                cell = "09112318211"
            Case "ali"
                cell = "09111380846"
            Case "tata"
                cell = "09112315480"
            Case "ali2"
                cell = "09216343320"
            Case "asal2"
                cell = "09332300598"
            Case "tata2"
                cell = "09020763947"
        End Select
        Dim Generator As New Random
        Dim CodeCreated As String = Generator.Next(600000, 999999)
        Session("CodeCreated") = CodeCreated
        Dim url As String = "http://login.parsgreen.com/UrlService/sendSMS.ashx?from=" +
        "10009332300598" +
        "&to=" + cell +
        "&text=" + String.Format("کد عبور: {0} می باشد. «درگاه فیلم ایران»", CodeCreated) +
        "&signature=" + "9D57838D-3935-4724-BB71-5A5FCB2EA579"

        Dim req As HttpWebRequest = CType(WebRequest.Create(url), HttpWebRequest)
        Dim resp As Net.WebResponse = req.GetResponse()
        Dim st = resp.GetResponseStream()
        Dim sr = New StreamReader(st, Encoding.UTF8)
        Dim _responseStr As String = sr.ReadToEnd()
        sr.Close()
        resp.Close()

    End Function


End Class
