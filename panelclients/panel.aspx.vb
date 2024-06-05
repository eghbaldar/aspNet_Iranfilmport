Imports System.Data.SqlClient
Imports System.Data
Imports System.Net
Imports System.Web.Services

Partial Class panel
    Inherits System.Web.UI.Page

    Dim sqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DesktopConnectionString").ConnectionString)
    Dim Dll As New DLL_Panel

    Protected Sub btnLogin_Click(sender As Object, e As System.EventArgs) Handles btnLogin.Click

        If (String.IsNullOrEmpty(Session("randomStr"))) Then
            ScriptManager.RegisterStartupScript(Me, GetType(String), "key", "myAlert('تظیمات امنیتی مرورگر شما با اختلال مواجه است، لطفا کد امنیتی را دوباره وارد کرده و ورود کنید');", True)
            ImageCaptacha.ImageUrl = "~/captcha"
        Else
            If Session("randomStr").ToString.Trim.ToLower = txtCaptcha.Text.Trim.ToLower Then
                Dim IDUSER As Long = Dll.GetValid(txtUser.Text.Trim, txtPass.Text.Trim)
                If IDUSER > 0 Then
                    Dll.UpdateVisitCounter(IDUSER)
                    FormsAuthentication.SetAuthCookie(IDUSER, True)
                    Session.Add("username-temp", txtUser.Text.Trim)
                    Response.Redirect("~/panel/client/" & IDUSER)
                End If
            End If
        End If

    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        Try
            If Request.QueryString("user") <> Nothing And Request.QueryString("pass") <> "" Then
                txtUser.Text = Request.QueryString("user")
                txtPass.TextMode = TextBoxMode.SingleLine
                txtPass.Text = Request.QueryString("pass")
            End If
        Catch ex As Exception

        End Try
        lblPanelVersion.Text = "Version: " & PanelVersion.Version
        Try
            If Session("PanelClient").ToString <> "" Then Response.Redirect("~/panel/client/" & Session("PanelClient").ToString)
        Catch ex As Exception
            Session.Remove("PanelClient")
        End Try

        ImageCaptacha.ImageUrl = "~/captcha"
        ImageCaptchaPhone.ImageUrl = "~/captcha"
        If Not Dll.Version.Trim = Nothing Then
            lblVersion.Text = Dll.Version.Replace("ي", "ی")
            If Not IsPostBack Then ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Modal", "window.onload = function() { loadMODAL(); };", True)
        End If

        If Not IsPostBack Then
            txtPhone3.Attributes.Add("onkeyup", "txtInputChanged(this.value);")
        End If

    End Sub

    Private Sub btnChangeToPhone_Click(sender As Object, e As EventArgs) Handles btnChangeToPhone.Click
        MultiView.ActiveViewIndex = 1
    End Sub


End Class
