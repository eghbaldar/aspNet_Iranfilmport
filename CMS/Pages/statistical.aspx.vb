Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Drawing
Partial Class CMS_Pages_statistical
    Inherits System.Web.UI.Page

    Protected Sub btnSearch_Click(sender As Object, e As System.EventArgs) Handles btnSearch.Click
        Response.Redirect("statistical.aspx?keypoint=" + txtKeypoint.Text.Trim)


    End Sub
    Dim sqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("iranfilmportConnectionString").ConnectionString)
    Private Sub exec()
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("SELECT * FROM [tbl_statisticalPages] where url like N'%" + Request.QueryString("keypoint") + "%' order by [count] desc", sqlconn)
            Dim sqld As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqld.Fill(ds)
            DGpages.DataSource = ds.Tables(0)
            DGpages.DataBind()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then exec()
        If Request.QueryString("keypoint") <> "" And Not IsPostBack Then
            txtKeypoint.Text = Request.QueryString("keypoint")
        End If
    End Sub
End Class
