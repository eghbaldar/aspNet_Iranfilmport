
Imports System.Data
Imports System.Data.SqlClient

Partial Class CMS_Pages_resume
    Inherits System.Web.UI.Page

    Dim DL_CMS As New DLL_CMS

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim ds As New DLL_CMS
            txtCV.Value = ds.ShowResume(True)
            txtCVEn.Value = ds.ShowResume(False)
        End If
    End Sub

    Private Sub btnDown_Click(sender As Object, e As EventArgs) Handles btnDown.Click

        Dim currentIndex = lstPriorities.SelectedIndex '0

        If currentIndex <> (lstPriorities.Items.Count - 1) Then

            Dim currentItem = lstPriorities.Items.Item(currentIndex).ToString 'a
            Dim currentValue = lstPriorities.Items.Item(currentIndex).Value '6

            Dim downItem = lstPriorities.Items.Item(currentIndex + 1).ToString 'b
            Dim downValue = lstPriorities.Items.Item(currentIndex + 1).Value  '3

            DL_CMS.UpdateAccoladePriority(Val(currentValue), currentIndex + 1)
            DL_CMS.UpdateAccoladePriority(Val(downValue), currentIndex)

            lstPriorities.Items.RemoveAt(currentIndex)
            lstPriorities.Items.RemoveAt(currentIndex)

            Dim list2 As New ListItem(downItem, downValue)
            lstPriorities.Items.Insert(currentIndex, list2)

            Dim list As New ListItem(currentItem, currentValue)
            lstPriorities.Items.Insert(currentIndex + 1, list)



            lstPriorities.SelectedIndex = currentIndex + 1

        End If

    End Sub

    Private Sub btnUp_Click(sender As Object, e As EventArgs) Handles btnUp.Click

        Dim currentIndex = lstPriorities.SelectedIndex '1
        If currentIndex <> 0 Then

            Dim currentItem = lstPriorities.Items.Item(currentIndex).ToString '152
            Dim currentValue = lstPriorities.Items.Item(currentIndex).Value '3337

            Dim downItem = lstPriorities.Items.Item(currentIndex - 1).ToString '151
            Dim downValue = lstPriorities.Items.Item(currentIndex - 1).Value '2280

            DL_CMS.UpdateAccoladePriority(Val(downValue), currentIndex)
            DL_CMS.UpdateAccoladePriority(Val(currentValue), currentIndex - 1)

            lstPriorities.Items.RemoveAt(currentIndex)
            lstPriorities.Items.RemoveAt(currentIndex - 1)

            Dim list As New ListItem(currentItem, currentValue)
            lstPriorities.Items.Insert(currentIndex - 1, list)

            Dim list2 As New ListItem(downItem, downValue)
            lstPriorities.Items.Insert(currentIndex, list2)

            lstPriorities.SelectedIndex = currentIndex - 1

        End If


    End Sub

    Protected Sub btn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn.Click
        Dim ds As New DLL_CMS
        ds.UpdateResume(txtCV.Value, True)
    End Sub

    Protected Sub btnEn_Click(sender As Object, e As System.EventArgs) Handles btnEn.Click
        M_CV.ActiveViewIndex = 1
    End Sub

    Protected Sub btnFa_Click(sender As Object, e As System.EventArgs) Handles btnFa.Click
        M_CV.ActiveViewIndex = 0
    End Sub

    Protected Sub btnEnUpdate_Click(sender As Object, e As System.EventArgs) Handles btnEnUpdate.Click
        Dim ds As New DLL_CMS
        ds.UpdateResume(txtCVEn.Value, False)
    End Sub

    Private Sub btnShowAccolades_Click(sender As Object, e As EventArgs) Handles btnShowAccolades.Click
        Dim s As String = "window.open('resumeeachone/" & cmdFilm.SelectedValue.ToString & "' , '_blank','width=900, height=600');"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "alertscript", s, True)
    End Sub

    Private Sub lstPriorities_DataBound(sender As Object, e As EventArgs) Handles lstPriorities.DataBound

        If Not IsPostBack Then
            Dim sqlconnDesktop As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DesktopConnectionString").ConnectionString)
            Try
                If sqlconnDesktop.State = ConnectionState.Open Then sqlconnDesktop.Close()
                sqlconnDesktop.Open()
                Dim sqlcom As New SqlCommand("select [id],[film] from tbFilms", sqlconnDesktop)
                Dim reader As SqlDataReader
                reader = sqlcom.ExecuteReader()

                While reader.Read()

                    For i As Integer = 0 To lstPriorities.Items.Count - 1
                        If lstPriorities.Items.Item(i).ToString().Trim = reader.Item(0).ToString Then
                            Dim list As New ListItem(reader.Item(1).ToString, lstPriorities.Items.Item(i).Value.ToString)
                            lstPriorities.Items.RemoveAt(i)
                            lstPriorities.Items.Insert(i, list)
                        End If
                    Next
                End While


                sqlconnDesktop.Close()
            Catch ex As Exception
            Finally
                sqlconnDesktop.Close()
            End Try
        End If


    End Sub

    Private Sub cmdFilm_DataBound(sender As Object, e As EventArgs) Handles cmdFilm.DataBound
        cmdFilm.Items.Insert(0, New ListItem("--  فیلمی را انتخاب کنید  --", "0"))
    End Sub

End Class
