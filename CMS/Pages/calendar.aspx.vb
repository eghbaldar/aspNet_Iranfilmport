
Imports System.Globalization

Partial Class CMS_Pages_calendar
    Inherits System.Web.UI.Page

    Private Sub CMS_Pages_calendar_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            For i As Byte = 1 To 31
                cmdDays.Items.Add(i.ToString)
            Next
            For j As Integer = 1402 To 1410 Step 1
                cmdyears.Items.Add(j.ToString)
            Next

            cmdDays.Text = Convert.ToDateTime(ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate)).Day
            cmdMonths.SelectedValue = Convert.ToDateTime(ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate)).Month
            cmdyears.Text = Convert.ToDateTime(ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate)).Year

            lblShamsiToMiladi.Text = GetShamsi()
            dgCalendar.DataBind()
        End If
    End Sub
    Protected Sub btnGoToDate_Click(sender As Object, e As EventArgs) Handles btnGoToDate.Click

        lblShamsiToMiladi.Text = GetShamsi()
        pnlAdd.Visible = True
        dgCalendar.DataBind()

    End Sub

    Private Function GetShamsi() As String
        Dim p As PersianCalendar = New PersianCalendar()
        Dim dt As DateTime = New DateTime(cmdyears.Text, cmdMonths.SelectedValue.ToString, cmdDays.Text, p)
        Return dt.ToShortDateString.ToString(CultureInfo.InvariantCulture)
    End Function

    Private Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        Dim DL_CMS As New DLL_CMS
        DL_CMS.InsertCalendar(lblShamsiToMiladi.Text, txtAdd.Text)
        dgCalendar.DataBind()
        txtAdd.Text = ""
    End Sub

    Public Sub DeleteCal(sender As Object, e As CommandEventArgs)
        Dim DL_CMS As New DLL_CMS
        DL_CMS.DeleteCalendar(Val(e.CommandArgument.ToString))
        dgCalendar.DataBind()
    End Sub

    Public Function GetShamsiHtml(e As Object) As String
        Return ShamsiDate.Miladi2Shamsi(e.ToString, ShamsiDate.ShowType.LongDate)
    End Function

    Private Sub cmdDays_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmdDays.SelectedIndexChanged
        lblShamsiToMiladi.Text = GetShamsi()
        dgCalendar.DataBind()
    End Sub

    Private Sub cmdMonths_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmdMonths.SelectedIndexChanged
        lblShamsiToMiladi.Text = GetShamsi()
        dgCalendar.DataBind()
    End Sub

    Private Sub cmdyears_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmdyears.SelectedIndexChanged
        lblShamsiToMiladi.Text = GetShamsi()
        dgCalendar.DataBind()
    End Sub
End Class
