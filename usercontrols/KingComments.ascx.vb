Imports System.Web.Services
Imports System.Net
Imports Farahy.Security

Partial Class usercontrols_KingComments
    Inherits System.Web.UI.UserControl
    Dim s As SecurityImage
    Dim DL As New DLL

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            s = New SecurityImage(SecurityLevel.Normal)
            s.Generate()
            ImgCaptcha.ImageUrl = s.SecurityImageUri
            ImgCaptcha2.ImageUrl = s.SecurityImageUri
            ImgCaptcha.ToolTip = s.Code
            ImgCaptcha2.ToolTip = s.Code
        End If

        lblSection.Text = _Section
        lblId.Text = _Id_POST

        lblCommentCount.Text = String.Format("نظرات {0}", dgComment.Rows.Count)

    End Sub

    Private _Section As Long
    Public Property Section As Long
        Get
            Return _Section
        End Get
        Set(value As Long)
            _Section = value
        End Set
    End Property

    Private _Id_POST As Long
    Public Property IDPOST As Long
        Get
            Return _Id_POST
        End Get
        Set(value As Long)
            _Id_POST = value
        End Set
    End Property

    Protected Sub btnInsert_Click(sender As Object, e As System.EventArgs) Handles btnInsert.Click
        If ImgCaptcha.ToolTip.ToUpper = txtCaptcha.Text.Trim.ToUpper Then
            DL.InsertComment(_Section, _Id_POST, 0,
                             convertNumFatoEn(txtText.Text.Replace(ControlChars.Lf, "<br/>")),
                             txtName.Text.Trim, txtEmail.Text.Trim, False, 0)
            txtEmail.Text = ""
            txtName.Text = ""
            txtText.Text = ""
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myJsFn", "successAlert();", True)

            'refresh captcha
            txtCaptcha.Text = ""
            s = New SecurityImage(SecurityLevel.Normal)
            s.Generate()
            ImgCaptcha.ImageUrl = s.SecurityImageUri
            ImgCaptcha2.ImageUrl = s.SecurityImageUri
            ImgCaptcha.ToolTip = s.Code
            ImgCaptcha2.ToolTip = s.Code


        End If
    End Sub

    Public Function getdate(_Date As Object) As String
        Return ShamsiDate.Miladi2Shamsi(_Date, ShamsiDate.ShowType.LongDate)
    End Function

    Public Function convertNumFatoEn(ByVal T As String) As String
        Return T.Replace("۰", "0").Replace("۱", "1").Replace("۲", "2").Replace("۳", "3").Replace("۴", "4").Replace("۵", "5").Replace("۶", "6").Replace("۷", "7").Replace("۸", "8").Replace("۹", "9").Replace("٫", "/")
    End Function

    Private Sub btnInsertSubComment_Click(sender As Object, e As EventArgs) Handles btnInsertSubComment.Click
        Dim name, email, text As String
        Dim txtName As String = txtNameSubComment.Text
        If txtName <> "" Then name = txtName

        Dim txtEmail As String = txtEmailSubComment.Text
        If txtEmail <> "" Then email = txtEmail

        Dim txtText As String = txtTextSubComment.Text
        If txtText <> "" Then text = txtText
        DL.InsertComment(_Section, _Id_POST, Val(HiddenFieldSubCommentId.Value),
                         convertNumFatoEn(text.Trim.Replace(ControlChars.Lf, "<br/>")), name.Trim, email.Trim, False, 0)
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myJsFn", "successAlert();", True)

        'refresh captcha
        txtCaptchaSubComment.Text = ""
        s = New SecurityImage(SecurityLevel.Normal)
        s.Generate()
        ImgCaptcha.ImageUrl = s.SecurityImageUri
        ImgCaptcha2.ImageUrl = s.SecurityImageUri
        ImgCaptcha.ToolTip = s.Code
        ImgCaptcha2.ToolTip = s.Code

    End Sub

End Class
