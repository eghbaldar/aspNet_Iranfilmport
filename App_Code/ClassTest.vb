Imports Microsoft.VisualBasic

Public Class ClassTest

    Private _Id As Integer
    Public Property Id() As Long
        Get
            Return _Id
        End Get
        Set(value As Long)
            _Id = value
        End Set
    End Property

    Private _idUser As String
    Public Property idUser As Byte
        Get
            Return _idUser
        End Get
        Set(value As Byte)
            _idUser = value
        End Set
    End Property

    Private _datetime As String
    Public Property datetime As String
        Get
            Return _datetime
        End Get
        Set(value As String)
            _datetime = value
        End Set
    End Property

    Private _note As String
    Public Property note As String
        Get
            Return _note
        End Get
        Set(value As String)
            _note = value
        End Set
    End Property

End Class
