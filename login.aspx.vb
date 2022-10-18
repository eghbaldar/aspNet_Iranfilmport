
Partial Class login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '''''''''''''''''''''' ba true kardane in gozine mifahmim k dar safeye LOGIN hastim
        Dim Dll_dash As New DLL_Dashboard
        Dll_dash.EnableCheckCookie = True
        ''''''''''''''''''''''
    End Sub
End Class
