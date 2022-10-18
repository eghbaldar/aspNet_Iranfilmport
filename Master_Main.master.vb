
Partial Class Master_Main
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        '''''''''''''''''''''''''''''''''' English Language '''''''''''''''''''''''''''''''''
        Dim MainMenu, TopBar

        If Not String.IsNullOrEmpty(Request.QueryString("lang")) Then
            If Request.QueryString("lang").Trim.ToLower = "en" Then
                LiteralCssMain.Text = "<link rel='stylesheet' type='text/css' href='" + ResolveUrl("~/files/css/styleEn.css") + "' />"
                MainMenu = Page.LoadControl("~/usercontrols/MainMenuEn.ascx")
                TopBar = Page.LoadControl("~/usercontrols/TopBarEn.ascx")
                PnlMenu.Controls.Add(MainMenu)
                PnlTopBar.Controls.Add(TopBar)
            Else
                LiteralCssMain.Text = "<link rel='stylesheet' type='text/css' href='" + ResolveUrl("~/files/css/style.css") + "' />"
                MainMenu = Page.LoadControl("~/usercontrols/MainMenuFa.ascx")
                TopBar = Page.LoadControl("~/usercontrols/TopBarFa.ascx")
                PnlMenu.Controls.Add(MainMenu)
                PnlTopBar.Controls.Add(TopBar)
            End If
        Else
            LiteralCssMain.Text = "<link rel='stylesheet' type='text/css' href='" + ResolveUrl("~/files/css/style.css") + "' />"
            MainMenu = Page.LoadControl("~/usercontrols/MainMenuFa.ascx")
            TopBar = Page.LoadControl("~/usercontrols/TopBarFa.ascx")
            PnlMenu.Controls.Add(MainMenu)
            PnlTopBar.Controls.Add(TopBar)
        End If
        ''''''''''''''''''  ba false kardane in gozine mifahmim k dar safeye LOGIN nistim
        Dim Dll_dash As New DLL_Dashboard
        Dll_dash.EnableCheckCookie = False
        ''''''''''''''''''
        If Not IsPostBack Then
            Dim DB As New DLL
            DB.InsertStatistical(Request.UserHostAddress.ToString, Request.Url.ToString)
        End If
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As System.EventArgs) Handles btnSearch.Click
        If txtSearch.Value.Trim <> "" And txtSearch.Value.ToString <> "جستجو در مطالب درگاه فیلم ایران ..." Then

            'Response.Redirect("post/search/" + txtSearch.Value.ToString.Replace(" ", "-"))

            'Response.Write("<script>")
            'Response.Write("window.open('" + "https://www.google.com/search?q=site:http://iranfilmport.com " + txtSearch.Value.ToString.Replace(" ", "+") + "','_blank')")
            'Response.Write("</script>")

            Response.Redirect("https://www.google.com/search?q=site:http://iranfilmport.com " + txtSearch.Value.ToString.Replace(" ", "+"))
        End If
    End Sub

End Class

