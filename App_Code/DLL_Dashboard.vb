Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography

Public Class DLL_Dashboard

    ''' <summary>
    ''' نگه داشتن ایمیل کاربر پس از ورود از طریق کوکی
    ''' </summary>
    ''' <remarks></remarks>
    ''' 
    Public _Email_ As String
    ''
    Dim sqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("iranfilmportConnectionString").ConnectionString)

    Public Function Insert_ProfileCreator(ByVal email As String, ByVal VerificationCode As String) As Byte
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_dash_InsertPreRegister '" + _
                                         email + "','" + VerificationCode + "'", sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function Update_AfterVerificationLink(ByVal email As String, ByVal mobile As String, ByVal name As String, ByVal lastname As String, ByVal type As Integer, ByVal username As String, ByVal password As String, ByVal regDate As Date) As Byte
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim Encrypt As New Encryptor
            Dim sqlcom As New SqlCommand("exec dbo.sp_dash_UpdateAfterVerificationLink '" + email + "','" + mobile + "','" + name + "','" + lastname + "'," + type.ToString + ",'" + username + "','" + Encrypt.EncryptText(password, "IfP_COM") + "','" + regDate.ToString + "'", sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function Update_UpdatePersonalInformation(ByVal name As String, ByVal lastname As String, _
                                                     ByVal type As Byte, ByVal engName As String, ByVal _
                                                     engLastname As String, ByVal bio As String, ByVal engBio As String, _
                                                     ByVal birthDay As String, ByVal address As String, ByVal web As String, _
                                                     ByVal mobileShow As Boolean, ByVal emailShow As Boolean, _
                                                     ByVal tell As String, ByVal degree As Byte, _
                                                     ByVal filed As String, ByVal tw As String, ByVal Insta As String, _
                                                     ByVal FB As String, ByVal IMDB As String, ByVal Google As String, _
                                                     ByVal countryCode As Integer, ByVal state As String, ByVal city As String, _
                                                     ByVal email As String) As Byte
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_dash_UpdatePersonalInformation '" + name + "','" + lastname + "'," + type.ToString + ",'" + engName + "','" + engLastname + "',N'" + bio + "','" + engBio + "','" + birthDay.ToString + "','" + address + "','" + web + "'," + mobileShow.ToString + "," + emailShow.ToString + ",'" + tell + "'," + degree.ToString + ",'" + filed + "','" + tw + "','" + Insta + "','" + FB + "','" + IMDB + "','" + Google + "'," + countryCode.ToString + ",'" + state + "','" + city + "','" + Email + "'", sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function CheckVeriC(ByVal email As String, ByVal veriC As String) As Boolean
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select count(*) from tbl_VerificationEmailCode where email='" + email + "' and verificationCode='" + veriC + "' and flag=0", sqlconn)
            If Val(sqlcom.ExecuteScalar()) > 0 Then
                Return True
            Else
                Return False
            End If
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function Update_UpdateVerificationCode(ByVal email As String, ByVal VerificationCode As String) As Byte
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_dash_UpdateVerificationCode '" + _
                                         email + "','" + VerificationCode + "'", sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function CheckLogin(ByVal email As String, ByVal pass As String) As Boolean
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim Encrypt As New Encryptor
            Dim sqlcom As New SqlCommand("select count(*) from tbl_ProfileCreator where email='" + email + "' and password='" + _
                                         Encrypt.EncryptText(pass, "IfP_COM") + "' and statususer != 2", sqlconn)
            If Val(sqlcom.ExecuteScalar()) > 0 Then
                Return True
            Else
                Return False
            End If
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Shared _EnableCheckCookie As Boolean = False
    Public Property EnableCheckCookie() As Boolean
        Get
            Return _EnableCheckCookie
        End Get
        Set(ByVal value As Boolean)
            _EnableCheckCookie = value
        End Set
    End Property

    Public Function ShowInformation(ByVal email As String) As DataSet
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select * from tbl_ProfileCreator where email='" & email.ToString & "'", sqlconn)
            Dim sqlda As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqlda.Fill(ds)
            Return ds
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function Update_PictureProfileHeader(ByVal email As String, ByVal photo As String, ByVal flag As Boolean) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            'Flag=fasle : تغییر عکس پروفایل    Flag=True : یعنی تغییر عکس هدر
            Dim sqlcom As New SqlCommand("exec dbo.sp_dash_updatePictureProfileHeader " + _
                                         "'" + photo + "','" + email + "'," + flag.ToString, sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function Update_Mobile(ByVal email As String, ByVal mobile As String) As Byte
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_dash_UpdateMobile '" + _
                                         mobile + "','" + email + "'", sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function Update_MeliCard(ByVal email As String, ByVal MeliCardPic As String, ByVal BirthCertificatePic As String) As Byte
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_dash_UpdateMeliCard '" + _
                                         MeliCardPic + "','" + BirthCertificatePic + "','" + email + "'", sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function Update_Username(ByVal username As String, ByVal pass As String, ByVal email As String) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_dash_UpdateUsernamePassword '" + username + "','" + ShowInformation(email).Tables(0).Rows(0)("password") + "','" + email + "'", sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function
    Public Function Update_Username_CMS(ByVal username As String, ByVal pass As String, ByVal email As String) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_dash_UpdateUsernamePassword_CMS '" + username + "','','" + email + "',0", sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function
    Public Function Update_Password_CMS(ByVal username As String, ByVal pass As String, ByVal email As String) As String
        Try
            Dim Encrypt As New Encryptor
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_dash_UpdateUsernamePassword_CMS '','" + Encrypt.EncryptText(pass, "IfP_COM") + "','" + email + "',1", sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function Update_Password(ByVal pass As String, ByVal email As String) As Byte
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim Encrypt As New Encryptor
            Dim sqlcom As New SqlCommand("exec dbo.sp_dash_UpdateUsernamePassword '" + ShowInformation(email).Tables(0).Rows(0)("username") + "','" + Encrypt.EncryptText(pass, "IfP_COM") + "','" + email + "'", sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function CheckDuplicateUsername(ByVal username As String) As Boolean
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select count(*) from tbl_ProfileCreator where username='" + username + "'", sqlconn)
            If Val(sqlcom.ExecuteScalar()) > 0 Then
                Return False
            Else
                Return True
            End If
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function CheckStructureUsername(ByVal username As String) As Byte
        Try
            If username.Length > 6 Then
                If username.IndexOf(" ") < 0 Then
                    If Not Char.IsNumber(username.Substring(0, 1)) Then
                        Return 1 'OK
                    Else
                        Return 2 'اول عبارت عدد است
                    End If
                Else
                    Return 3 'در عبارت فاصله وجود دارد
                End If
            Else
                Return 4 'باید عبارت بالای 6 کلمه باشد
            End If
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function CheckDuplicateEmail(ByVal email As String) As Boolean
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select count(*) from tbl_ProfileCreator where email='" + email + "'", sqlconn)
            If Val(sqlcom.ExecuteScalar()) > 0 Then
                Return False
            Else
                Return True
            End If
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function InsertProject(ByVal email As String, ByVal type As Byte, ByVal nameF As String, ByVal nameE As String, ByVal sysnopsisF As String, ByVal sysnopsisEn As String, ByVal productDate As Date, ByVal pageLink As String, ByVal director As String, ByVal writer As String, ByVal producer As String, ByVal detail As String) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_dash_InsertProject '" + email + "'," + type.ToString + ",'" + nameF + "','" + nameE + "','" + sysnopsisF + "','" + sysnopsisEn + "','" + productDate.ToShortDateString + "','" + pageLink + "','" + director + "','" + writer + "','" + producer + "','" + detail + "'", sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function ShowProject(ByVal ID As String) As DataSet
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select * from tbl_Projects where id=" & ID.ToString + "", sqlconn)
            Dim sqlda As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqlda.Fill(ds)
            Return ds
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function CheckMoreSuspendProject(ByVal email As String) As Boolean
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select count(*) from tbl_Projects where email='" + email + "' and status=0", sqlconn)
            If Val(sqlcom.ExecuteScalar()) > 0 Then
                Return False
            Else
                Return True
            End If
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function InsertProjectPhotos(ByVal projectId As Long, ByVal file As String, ByVal type As Byte) As Byte
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_dash_InsertProjectPhotos " + projectId.ToString + ",'" + file + "'," + type.ToString, sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function CheckMorePhotos(ByVal ProjectID As String, ByVal type As Byte) As Boolean
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Select Case type
                Case 1 ' poster
                    Dim sqlcom As New SqlCommand("select count(*) from tbl_Projects_photos where type=1 and projectid=" + ProjectID, sqlconn)
                    If Val(sqlcom.ExecuteScalar()) > 0 Then
                        Return True
                    Else
                        Return False
                    End If
                Case 2 'sill
                    Dim sqlcom As New SqlCommand("select count(*) from tbl_Projects_photos where type=2 and projectid=" + ProjectID, sqlconn)
                    If Val(sqlcom.ExecuteScalar()) > 2 Then
                        Return True
                    Else
                        Return False
                    End If
                Case 3 ' backstage
                    Dim sqlcom As New SqlCommand("select count(*) from tbl_Projects_photos where type=3 and projectid=" + ProjectID, sqlconn)
                    If Val(sqlcom.ExecuteScalar()) > 2 Then
                        Return True
                    Else
                        Return False
                    End If
            End Select
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function UpdateProjectLink(ByVal id As Long, ByVal link As String, ByVal pass As String) As Byte
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_dash_UpdateProjectLink " + id.ToString + ",'" + link + "','" + pass + "'", sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function CheckProjectLink(ByVal ProjectID As String) As Boolean
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select count(*) from tbl_Projects where link != '' and projectid=" + ProjectID, sqlconn)
            If Val(sqlcom.ExecuteScalar()) > 0 Then
                Return False
            Else
                Return True
            End If
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetNameWithEmail(ByVal email As String) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select top 1 [name]+' '+[lastname] from tbl_ProfileCreator where email='" + email + "'", sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function UpdateFlagMessage(ByVal id As Long) As Byte
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_dash_UpdateFlagMessage " + id.ToString, sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function showNotification(ByVal email As String, ByVal Type As Byte) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_dash_showNotification '" + email + "'", sqlconn)
            Dim sqlda As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqlda.Fill(ds)
            Select Case Type
                Case 1 'msg
                    Return ds.Tables(0).Rows(0)("msg").ToString
                Case 2 'festival
                    Return ds.Tables(0).Rows(0)("submission").ToString
                Case 3 'notPaid
                    Return ds.Tables(0).Rows(0)("notPaid").ToString
                Case 4 'project
                    Return ds.Tables(0).Rows(0)("project").ToString
            End Select
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function CheckIdentityCards(ByVal email As String) As Boolean
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select count(*) from tbl_ProfileCreator where BirthCertificatePic != '' and MeliCardPic != '' and email='" + email + "'", sqlconn)
            If sqlcom.ExecuteScalar > 0 Then
                Return True
            Else
                Return False
            End If
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function
    '
    Public Function UpdateProject(ByVal nameF As String, ByVal nameE As String, ByVal sysF As String, ByVal sysE As String, ByVal productDate As Date, ByVal pageLink As String, ByVal director As String, ByVal writter As String, ByVal producer As String, ByVal otherCast As String, ByVal id As Long) As Byte
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_dash_UpdateProject '" + nameF + "','" + nameE + "','" + sysF + "','" + sysE + "','" + productDate.ToShortDateString + "','" + pageLink + "','" + director + "','" + writter + "','" + producer + "','" + otherCast + "'," + id.ToString, sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function DeleteProjectPhoto(ByVal id As Long) As Byte
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_dash_deleteProjectPhoto " + id.ToString, sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function DeleteProject(ByVal id As Long) As Byte
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec dbo.sp_delete_Project " + id.ToString, sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetNameOfFestival(ByVal id As Integer) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [title_fa]+' - '+[title_en] from tbl_festivals where id=" + id.ToString, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function GetFilms(ByVal email As String) As DataTable
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [nameF]+' - '+[nameE] from tbl_Projects where email='" + email + "'", sqlconn)
            Dim sqlda As New SqlDataAdapter(sqlcom)
            Dim ds As New DataSet
            sqlda.Fill(ds)
            Return ds.Tables(0)
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function InsertCheckout(email As String, festivalID As Long, ProjectID As Long, DeadlineID As Long, Price As String)
        'Price = به تومان
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("Insert into tbl_invoice (email,festivalID,ProjectID,DeadlineID,Price,DollarToRial,Commission) values ('" + email + "'," + festivalID.ToString + "," + ProjectID.ToString + "," + DeadlineID.ToString + ",'" + Price + "', (select top 1 [DollarToRial] from tbl_setting) ,(select case	when /*fee*/ (select top 1 fee	from dbo.tbl_festivalDeadline	where id=" + DeadlineID.ToString + ")<>0	then (select top 1 CommissionForFee from dbo.tbl_setting)		when /*free*/	(select top 1 fee	from dbo.tbl_festivalDeadline	where id=" + DeadlineID.ToString + ")=0 then (select top 1 CommissionForFree from dbo.tbl_setting)	end))", sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function CalcPriceOfFestival(DeadlineId As Long) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select CASE	WHEN [fee] = 0	THEN ([fee] * CAST((select [DollarToRial] from tbl_setting) as bigint)) + CAST((select [CommissionForFree] from tbl_setting) as bigint)	WHEN [fee] <> 0	THEN ([fee] * CAST((select [DollarToRial] from tbl_setting) as bigint)) + CAST((select [CommissionForFee] from tbl_setting) as bigint)	END from dbo.tbl_festivalDeadline where id=" + DeadlineId.ToString, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    ''' <summary>
    ''' آیا مقدار فاکتور جاری با دلار روز برابری میکند؟
    ''' </summary>
    ''' <param name="DeadlineId"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function CalcPriceLikePast(Price As Long, DeadlineId As Long, InvoiceID As Long) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("exec sp_NewCalcPrice " + Price.ToString + "," + DeadlineId.ToString + "," + InvoiceID.ToString, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function DuplicationFactorNotPay(email As String, festivalID As Long, deadlineID As Long, projectID As Long) As Boolean
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select COUNT(*) from dbo.tbl_invoice where email='" + email + "' and festivalID=" + festivalID.ToString + " and deadlineID=" + deadlineID.ToString + " and projectID=" + projectID.ToString + " and (payment_code is null or payment_code='')", sqlconn)
            If Val(sqlcom.ExecuteScalar) > 0 Then
                Return False
            Else
                Return True
            End If
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function DuplicationFactorPay(email As String, festivalID As Long, deadlineID As Long, projectID As Long) As Boolean
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select COUNT(*) from dbo.tbl_invoice where email='" + email + "' and festivalID=" + festivalID.ToString + " and deadlineID=" + deadlineID.ToString + " and projectID=" + projectID.ToString + " and (payment_code is not null or payment_code <> '')", sqlconn)
            If Val(sqlcom.ExecuteScalar) > 0 Then
                Return False
            Else
                Return True
            End If
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function ExistAnyUnpayFactor(email As String) As Boolean
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select COUNT(*) from dbo.tbl_invoice where email='" + email + "' and payment_code is null or payment_code=''", sqlconn)
            If Val(sqlcom.ExecuteScalar) > 1 Then
                Return False
            Else
                Return True
            End If
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function DeleteFactor(ByVal id As Long) As Byte
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("delete from tbl_invoice where id=" + id.ToString, sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function UpdateTransactionCode(ByVal id As Long, transaction_code As Long) As Byte
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("update tbl_invoice set transaction_code=" + transaction_code.ToString + " where id=" + id.ToString, sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function getPriceWithTransactionCode(transaction_code As Long) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [price] from tbl_invoice where transaction_code=" + transaction_code.ToString, sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function UpdatePaymentCode(ByVal transaction_code As Long, payment_code As Long) As Byte
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("update tbl_invoice set payment_date=getdate(), payment_code=" + payment_code.ToString + " where transaction_code=" + transaction_code.ToString, sqlconn)
            Return sqlcom.ExecuteNonQuery()
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function getWallet(email As String) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [wallet] from tbl_ProfileCreator where email='" + email + "'", sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function InsertWallet(email As String, amount As Long, transaction_code As String)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("insert into tbl_wallet (email,amount,transaction_code) values ('" + email + "'," + amount.ToString + ",'" + transaction_code.ToString + "')", sqlconn)
            Return sqlcom.ExecuteNonQuery
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function UpdateWallet(email As String, amount As Long, payment_code As Long)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("update tbl_wallet set payment_code=" + payment_code.ToString + " ,flag=1 where email='" + email + "' and id=(select top 1 [id] from tbl_wallet where email='" + email + "' order by [id] desc )  update tbl_ProfileCreator set wallet=wallet + " + amount.ToString + " where email='" + email + "'", sqlconn)
            Return sqlcom.ExecuteNonQuery
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function getLastAmount4Wallet(email As String) As String
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [amount] from tbl_wallet where email='" + email + "' order by id desc", sqlconn)
            Return sqlcom.ExecuteScalar
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function IsWalletEnough(email As String, amount As Long) As Boolean

        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select [wallet] from tbl_ProfileCreator where email='" + email + "'", sqlconn)
            If amount < Val(sqlcom.ExecuteScalar.ToString) Then
                Return True
            Else
                Return False
            End If
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function UpdateWalletValue(email As String, Price As Long, invoiceID As Long)
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("update tbl_ProfileCreator set wallet=cast(wallet as bigint)-" + Price.ToString + " where email='" + email + "'  update tbl_invoice set payment_date=getdate(), payment_code=-1 where id=" + invoiceID.ToString() + " and email='" + email + "'", sqlconn)
            Return sqlcom.ExecuteNonQuery
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

    Public Function SendForgotPassword(Email As String) As Boolean
        Dim Encrypt As New Encryptor
        Dim E As New Email
        Try
            If sqlconn.State = ConnectionState.Open Then sqlconn.Close()
            sqlconn.Open()
            Dim sqlcom As New SqlCommand("select top 1 [password] from tbl_ProfileCreator where email='" + Email + "'", sqlconn)
            If sqlcom.ExecuteScalar.ToString <> "" Then
                E.SendMail(Email, String.Format("کلمه عبور شما: {0} می باشد لطفا از لینک زیر اقدام به ورود محیط کاربری خود کنید.", _
                            Encrypt.DecryptText(sqlcom.ExecuteScalar, "IfP_COM")), "ارسال کلمه عبور", _
                           "http://iranfilmport.com/ورود-و-ثبت-نام")
                Return True
            Else
                Return False
            End If
            sqlconn.Close()
        Catch ex As Exception
        Finally
            sqlconn.Close()
        End Try
    End Function

End Class
