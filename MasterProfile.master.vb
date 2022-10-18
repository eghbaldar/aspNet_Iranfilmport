'Imports System.Web.Routing

Partial Class MasterProfile
    Inherits System.Web.UI.MasterPage

    Dim DLL_dash As New DLL_Dashboard
    Dim DLL_Profile As New DLL_Profile
    Dim username As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try

            username = Page.RouteData.Values("username")


            With DLL_dash.ShowInformation(DLL_Profile.GetEmailByUsername(username)).Tables(0)
                '-------------------------
                If .Rows(0)("Personalphoto").ToString() = "" Then
                    imgAvatar.ImageUrl = "~\dashboard/assets/img/NonUser.png"
                Else
                    imgAvatar.ImageUrl = "~\files\uploadFiles\PhotoHeaderUsers\" + .Rows(0)("Personalphoto").ToString()
                End If

                lblName.Text = DLL_Profile.GetNameByUsername(Page.RouteData.Values("username")).Replace("ي", "ی")
                lblNameEn.Text = .Rows(0)("EngName").ToString() & " " & .Rows(0)("EngLastName").ToString()

                Select Case .Rows(0)("type").ToString()
                    Case 1
                        lblPosition.Text = "کارگردان"
                    Case 2
                        lblPosition.Text = "تهیه کننده"
                    Case 3
                        lblPosition.Text = "پخش کننده"
                    Case 4
                        lblPosition.Text = "نماینده فیلم"
                    Case 5
                        lblPosition.Text = "شرکت مجری طرح"
                    Case 6
                        lblPosition.Text = "بازیگر"
                End Select

                Page.Title = lblName.Text & " - " & "درگاه فیلم ایران"
                Page.MetaDescription = "فیلمساز ، فیلمسازی، کارگردان، کارگردانی، نویسنده، فیلمنامه نویس، فیلمنامه، سینمایی، فیلم، فیلم سینمایی، فیلم کوتاه، فیلمکوتاه ، جشنواره فیلم کوتاه، فستیوال فیلم کوتاه"

                Select Case .Rows(0)("Degree").ToString()
                    Case 0
                        lblMajor.Text = "زیر دیپلم"
                    Case 1
                        lblMajor.Text = "دیپلم"
                    Case 2
                        lblMajor.Text = "فوق دیپلم"
                    Case 3
                        lblMajor.Text = "لیسانس"
                    Case 4
                        lblMajor.Text = "فوق لیسانس"
                    Case 5
                        lblMajor.Text = "دکتری"
                End Select
                lblField.Text = .Rows(0)("Field").ToString().Replace("ي", "ی")

                If Not String.IsNullOrWhiteSpace(.Rows(0)("BirthDate").ToString.Trim) Then
                    lblAge.Text = ShamsiDate.Miladi2Shamsi(.Rows(0)("BirthDate").ToString(), ShamsiDate.ShowType.ShortDate)
                Else
                    lblAge.Visible = False
                End If

                If .Rows(0)("StatusUser") = "3" Then TruthSymbol.Visible = True

                '-------------------------
                lblemail.Text = IIf(Convert.ToBoolean(.Rows(0)("emailshow").ToString()) = True, .Rows(0)("email").ToString(), "اجازه نمایش ندارد")
                lblmobile.Text = IIf(Convert.ToBoolean(.Rows(0)("mobileshow").ToString()) = True, .Rows(0)("mobile").ToString(), "اجازه نمایش ندارد")
                lblwebsite.Text = IIf(.Rows(0)("website").ToString().Trim <> "", "<a href='" + .Rows(0)("website").ToString() + "' target='_blank'>" + .Rows(0)("website").ToString().Replace("http://", Nothing).Replace("www.", Nothing) + "</a>", "وارد نشده")
                lbladdress.Text = IIf(.Rows(0)("address").ToString().Trim <> "", .Rows(0)("website").ToString(), "درج نشده")
                ''-------------------- Contact Icons
                linkFace.Text = getLiteral("http://facebook.com/" + .Rows(0)("fblink").ToString(), "fa-facebook-f")
                linkImdb.Text = getLiteral(.Rows(0)("imdblink").ToString(), "fa-imdb")
                linkInstagram.Text = getLiteral("http://instagram.com/" + .Rows(0)("instalink").ToString(), "fa-instagram")
                linkTwitter.Text = getLiteral("http://twitter.com/" + .Rows(0)("twlink").ToString(), "fa-twitter")
                ''-------------------- 
                'PnlHeader.BackImageUrl = "~\files\uploadFiles\PhotoHeaderUsers\" + .Rows(0)("headerphoto").ToString()

            End With

            If Not DLL_Profile.getStatus(username) Then
                'اگه پروفایل کاربر تائید شده نباشد
                form1.Attributes.Add("class", "BlurBody")
                prohibitProfile.Visible = True
            End If
        Catch ex As Exception

        End Try

    End Sub

    Private Function getLiteral(ByVal url As String, ByVal type As String) As String
        Return "<a target='_blank' href='" + url + "' class='social-link' ><i class='fab " + type + "'></i></a>"
    End Function

    Public Function getLink(ByVal id As Object, ByVal title As Object) As String
        Dim D As New DLL
        Dim T As String = D.GetClearString(title.ToString())
        If T.Substring(T.Length - 1, 1) = "-" Then T = T.Substring(0, T.Length - 1)
        If T.Length > 50 Then
            Return String.Format("~/{0}/{1}", id.ToString, T.Substring(0, 50))
        Else
            Return String.Format("~/{0}/{1}", id.ToString, T)
        End If
    End Function

    Protected Sub btnBackToPage_Click(sender As Object, e As System.EventArgs) Handles btnBackToPage.Click
        Response.Redirect("~/filmmaker/" & username)
    End Sub
End Class

