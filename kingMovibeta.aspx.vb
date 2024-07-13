
Partial Class kingMovibeta
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Page.MetaDescription = "پخش و ارسال فیلم با همکاری شرکت اسپانیایی"
        Title = "همکاری با شرکت پخش فیلم Movibeta"
        ''''''''''''' کامنت
        KingComments.Section = 7
        KingComments.IDPOST = -1
    End Sub
End Class
