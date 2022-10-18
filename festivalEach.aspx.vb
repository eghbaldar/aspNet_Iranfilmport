
Partial Class festivalEach
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = RouteData.Values("name") + "- درگاه فیلم ایران"
    End Sub

    Public Function getshortfeature(ByVal e As Object)
        Select Case e.ToString
            Case 1
                Return "دسته فستیوال: " + "کوتاه"
            Case 2
                Return "دسته فستیوال: " + "بلند"
            Case 3
                Return "دسته فستیوال: " + "کوتاه و بلند"
        End Select
    End Function

    Public Function getgenre(ByVal e As Object)
        Dim DL As New DLL_CMS
        Dim Result As String
        For i As Byte = 0 To Len(Str(e)) - 2
            Select Case DL.EachValueOfGenreFestival(RouteData.Values("id")).Tables(0).Rows(i)(0).ToString()
                Case 1
                    Result += "Animation" + " "
                Case 2
                    Result += "Documentary" + " "
                Case 3
                    Result += "Experimental" + " "
                Case 4
                    Result += "Music Video" + " "
                Case 5
                    Result += "Fiction" + " "
                Case 6
                    Result += "Television" + " "
                Case 7
                    Result += "Virtual" + " "
                Case 8
                    Result += "Advertisement" + " "
            End Select            
        Next
        Return "ژانرهای قابل پذیرش: " + Result
    End Function

    Public Function getLevel(ByVal e As Object)
        Select Case e.ToString
            Case 1
                Return "سطح فستیوال: " + "A+"
            Case 2
                Return "سطح فستیوال: " + "A"
            Case 3
                Return "سطح فستیوال: " + "B"
            Case 3
                Return "سطح فستیوال: " + "Cs"
        End Select
    End Function

End Class
