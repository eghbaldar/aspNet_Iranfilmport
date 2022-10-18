Imports System.IO
Imports System.Text
Imports System.Security.Cryptography

Public Class Encryptor

    Private RJ As Rijndael = Rijndael.Create
    Private MD As New MD5CryptoServiceProvider

    Private Function Md5Hash(ByVal Value As String) As Byte()
        Return MD.ComputeHash(ASCIIEncoding.ASCII.GetBytes(Value))
    End Function

    Public Function EncryptText(ByVal TextToEncrypt As String, ByVal Key As String) As String
        RJ.Key = Md5Hash(Key)
        RJ.Mode = CipherMode.ECB
        Dim ToEncrypt As Byte() = Encoding.ASCII.GetBytes(TextToEncrypt)
        Return Convert.ToBase64String(RJ.CreateEncryptor().TransformFinalBlock(ToEncrypt, 0, ToEncrypt.Length))
    End Function

    Public Function DecryptText(ByVal EncryptedText As String, ByVal Key As String) As String
        Try
            RJ.Key = Md5Hash(Key)
            RJ.Mode = CipherMode.ECB
            Dim ToDecrypt As Byte() = Convert.FromBase64String(EncryptedText)
            Return ASCIIEncoding.ASCII.GetString(RJ.CreateDecryptor().TransformFinalBlock(ToDecrypt, 0, ToDecrypt.Length))
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

End Class