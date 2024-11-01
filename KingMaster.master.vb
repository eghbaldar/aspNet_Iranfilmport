
Partial Class KingMaster
    Inherits System.Web.UI.MasterPage

	Private Sub KingMaster_Load(sender As Object, e As EventArgs) Handles Me.Load
		If Not IsPostBack Then
			Dim DB As New DLL
			DB.InsertStatistical(Request.UserHostAddress.ToString, Request.Url.ToString)
		End If
	End Sub
End Class

