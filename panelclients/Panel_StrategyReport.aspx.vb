
Partial Class Panel_StrategyReport
    Inherits System.Web.UI.Page
    Private Sub Panel_StrategyReport_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim Panel As New DLL_Panel
        HF_Aplus.Value = Panel.GetLevelByFilm(Page.RouteData.Values("idFilm"), "A+")
        HF_A.Value = Panel.GetLevelByFilm(Page.RouteData.Values("idFilm"), "A")
        HF_B.Value = Panel.GetLevelByFilm(Page.RouteData.Values("idFilm"), "B")
        HF_C.Value = Panel.GetLevelByFilm(Page.RouteData.Values("idFilm"), "C")
        HF_D.Value = Panel.GetLevelByFilm(Page.RouteData.Values("idFilm"), "D")

        GetStrategy()

    End Sub

    Sub GetStrategy()

        Dim _Panel As New DLL_Panel

        Dim idFilm As Long = Page.RouteData.Values("idFilm")
        Dim result As String
        Dim General As String() = _Panel.GetStrategy(idFilm).Split(";")

        If Val(_Panel.GetProfessional(idFilm)) = 0 Then 'صفر یعنی اینکه این فیلم قرارداد حرفه ای ندارد و بسته ای است
            '---------------------------------
            lblStrategyText.Text = "مدل قرارداد: " & "پکیج (بسته‌ای)"
            '---------------------------------
            lblMethod.Text = "تعداد فستیوال‌های: " & _Panel.GetAllCountFestival(idFilm) & " تا" & "</br>" &
                "تعداد فستیوال های باقیمانده: " + _Panel.GetLeftoverSubmissionOfLimitedFilm(idFilm).ToString + " تا"
            '---------------------------------
            For i As Byte = 0 To General.Length - 1
                Dim SubGeneral As String() = General(i).Split("-")
                Select Case SubGeneral(0)
                    Case "1"
                        result += "A+: " + SubGeneral(1) + " >> Submitted:" + IIf(_Panel.GetLevelFilm("A+", idFilm) = Nothing, "0", _Panel.GetLevelFilm("A+", idFilm)) + "</br>"
                    Case "2"
                        result += "A: " + SubGeneral(1) + " >> Submitted:" + IIf(_Panel.GetLevelFilm("A", idFilm) = Nothing, "0", _Panel.GetLevelFilm("A", idFilm)) + "</br>"
                    Case "3"
                        result += "B: " + SubGeneral(1) + " >> Submitted:" + IIf(_Panel.GetLevelFilm("B", idFilm) = Nothing, "0", _Panel.GetLevelFilm("B", idFilm)) + "</br>"
                    Case "4"
                        result += "C: " + SubGeneral(1) + " >> Submitted:" + IIf(_Panel.GetLevelFilm("C", idFilm) = Nothing, "0", _Panel.GetLevelFilm("C", idFilm)) + "</br>"
                    Case "5"
                        result += "D: " + SubGeneral(1) + " >> Submitted:" + IIf(_Panel.GetLevelFilm("D", idFilm) = Nothing, "0", _Panel.GetLevelFilm("D", idFilm)) + "</br>"
                End Select
            Next
        Else 'قرارداد حرفه ای
            '---------------------------------

            If Val(_Panel.GetLeftoverYearOfUnlimitedFilm(_Panel.GetOneYearOrTwoYear(idFilm), idFilm)) <> 0 Then 'وقتی عدد صفر باشد یعنی تا کنون هیچ ثبت نامی صورت نگرفته است

                If _Panel.GetOneYearOrTwoYear(idFilm) > 300 And _Panel.GetOneYearOrTwoYear(idFilm) < 400 Then 'یعنی قرارداد یکساله بوده است

                    Dim DAYS As Integer = _Panel.GetLeftoverYearOfUnlimitedFilm(_Panel.GetOneYearOrTwoYear(idFilm), idFilm)
                    lblStrategyText.Text = "نوع قرارداد: یکساله" + " (روزهای باقیمانده: " + DAYS.ToString + ")" + vbCrLf

                    'Select Case DAYS
                    '    Case Is > 275 'روی ای پلاس ها و ای ها تمرکز شود
                    '        lblStrategyText.Text += "در سه ماه نخست هستیم، روی ای پلاس و ای تمرکز شود"
                    '    Case 180 To 275  'یعنی سه ماه را رد کرده است
                    '        lblStrategyText.Text += "سه ماه اول رد شده است و بهتر است دیگر روی ای پلاس و ای تمرکز نشده و سراغ بی ها بروید"
                    '    Case Is < 180 'یعنی 6 ماه اول رد شده است
                    '        lblStrategyText.Text += "شش ماه اول رد شده است و بهتر است روی لول های سی و یا دی در صورت قرارداد تمرکز شود"
                    'End Select
                    'تعیین استراتژی برای مدل های نامحدود
                    '---------------------------------
                    Select Case _Panel.GetMethod(idFilm)
                        Case "0" 'مختلط
                            lblMethod.Text = "نوع استراتژی: مختلط - Mixed" & "</br>" & "روزهای سپری شده: " & 365 - DAYS & "</br>" & "تمرکز کنونی: "
                            Select Case 365 - DAYS
                                Case Is < 120
                                    lblMethod.Text += vbCrLf + "A+ , A , B"
                                Case 120 To 270
                                    lblMethod.Text += vbCrLf + "A+ , A , B , C"
                                Case Is > 270
                                    lblMethod.Text += vbCrLf + "A+ , A , B , C , [D]"
                            End Select
                        Case "1" 'کاهنده
                            lblMethod.Text = "نوع استراتژی: کاهنده - Reducer" & "</br>" & "روزهای سپری شده: " & 365 - DAYS & "</br>" & "تمرکز کنونی: "
                            Select Case 365 - DAYS
                                Case Is < 90
                                    lblMethod.Text += vbCrLf + "A+ , A"
                                Case 90 To 240
                                    lblMethod.Text += vbCrLf + "A+ , A , B"
                                Case Is > 240
                                    lblMethod.Text += vbCrLf + "A+ , A , B , C , [D]"
                            End Select
                        Case "2"
                            lblMethod.Text = "نوع استراتژی: ساده - Simple" & "</br>" & "روزهای سپری شده: " & 365 - DAYS & "</br>" & "تمرکز کنونی: "
                            lblMethod.Text += vbCrLf + "A+ , A , B , C , [D]"
                        Case "3"
                            lblMethod.Text = "نوع استراتژی: فول - Full" & "</br>" & "روزهای سپری شده: " & 365 - DAYS & "</br>" & "تمرکز کنونی: "
                            Select Case 365 - DAYS
                                Case Is < 182
                                    lblMethod.Text += vbCrLf + "A+"
                                Case Else
                                    lblMethod.Text += vbCrLf + "A+ , A"
                            End Select
                    End Select
                    '---------------------------------

                Else 'یعنی قرارداد دوساله بوده است

                    Dim DAYS As Integer = _Panel.GetLeftoverYearOfUnlimitedFilm(_Panel.GetOneYearOrTwoYear(idFilm), idFilm)
                    lblStrategyText.Text = "نوع قرارداد: دوساله" + " (روزهای باقیمانده: " + DAYS.ToString + ")" + vbCrLf

                    'Select Case DAYS
                    '    Case Is > 490 'روی ای پلاس ها و ای ها تمرکز شود
                    '        lblStrategyText.Text += "در هشت ماه نخست هستیم، روی ای پلاس و ای تمرکز شود"
                    '    Case 250 To 490 'یعنی سه ماه را رد کرده است
                    '        lblStrategyText.Text += "هشت ماه اول رد شده است و بهتر است دیگر روی ای پلاس و ای تمرکز نشده و سراغ بی ها بروید"
                    '    Case Is < 250 'یعنی 6 ماه اول رد شده است
                    '        lblStrategyText.Text += "سطوح ای پلاس، ای و بی کافی است و بهتر است روی لول های سی و یا دی در صورت قرارداد تمرکز شود"
                    'End Select

                    'تعیین استراتژی برای مدل های نامحدود
                    '---------------------------------
                    Select Case _Panel.GetMethod(idFilm)
                        Case "0" 'مختلط
                            lblMethod.Text = "نوع استراتژی: مختلط - Mixed" & "</br>" & "روزهای سپری شده: " & 730 - DAYS & "</br>" & "تمرکز کنونی: "
                            Select Case 730 - DAYS
                                Case Is < 270
                                    lblMethod.Text += vbCrLf + "A+ , A , B"
                                Case 270 To 630
                                    lblMethod.Text += vbCrLf + "A+ , A , B , C"
                                Case Is > 630
                                    lblMethod.Text += vbCrLf + "A+ , A , B , C , [D]"
                            End Select
                        Case "1" 'کاهنده
                            lblMethod.Text = "نوع استراتژی: کاهنده - Reducer" & "</br>" & "روزهای سپری شده: " & 730 - DAYS & "</br>" & "تمرکز کنونی: "
                            Select Case 730 - DAYS
                                Case Is < 240
                                    lblMethod.Text += vbCrLf + "A+ , A"
                                Case 240 To 630
                                    lblMethod.Text += vbCrLf + "A+ , A , B"
                                Case Is > 630
                                    lblMethod.Text += vbCrLf + "A+ , A , B , C , [D]"
                            End Select
                        Case "2"
                            lblMethod.Text = "نوع استراتژی: ساده - Simple" & "</br>" & "روزهای سپری شده: " & 730 - DAYS & "</br>" & "تمرکز کنونی: "
                            lblMethod.Text += vbCrLf + "A+ , A , B , C , [D]"
                        Case "3"
                            lblMethod.Text = "نوع استراتژی: فول - Full" & "</br>" & "روزهای سپری شده: " & 730 - DAYS & "</br>" & "تمرکز کنونی: "
                            Select Case 730 - DAYS
                                Case Is < 365
                                    lblMethod.Text += vbCrLf + "A+"
                                Case Else
                                    lblMethod.Text += vbCrLf + "A+ , A"
                            End Select
                    End Select
                    '---------------------------------
                End If
                '---------------------------------
                Dim X As Long = _Panel.GetAllCountSubmitted(idFilm) 'تعداد کل ثبت نامی های این پروژه

                For i As Byte = 0 To General.Length - 1
                    Dim SubGeneral As String() = General(i).Split("-")

                    Select Case SubGeneral(0)
                        Case "1"
                            result += "A+: (" + SubGeneral(1) + "%) >>  Submitted: (" + Math.Round(((Val(_Panel.GetLevelFilm("A+", idFilm)) * 100) / X)).ToString + "%)" + "</br>"
                        Case "2"
                            result += "A: (" + SubGeneral(1) + "%) >>  Submitted: (" + Math.Round((Val(_Panel.GetLevelFilm("A", idFilm)) * 100) / X).ToString + "%)" + "</br>"
                        Case "3"
                            result += "B: (" + SubGeneral(1) + "%) >>  Submitted: (" + Math.Round((Val(_Panel.GetLevelFilm("B", idFilm)) * 100) / X).ToString + "%)" + "</br>"
                        Case "4"
                            result += "C: (" + SubGeneral(1) + "%) >>  Submitted: (" + Math.Round((Val(_Panel.GetLevelFilm("C", idFilm)) * 100) / X).ToString + "%)" + "</br>"
                        Case "5"
                            result += "D: (" + SubGeneral(1) + "%) >>  Submitted: (" + Math.Round((Val(_Panel.GetLevelFilm("D", idFilm)) * 100) / X).ToString + "%)" + "</br>"
                    End Select
                Next

            Else
                If _Panel.GetOneYearOrTwoYear(idFilm) > 300 And _Panel.GetOneYearOrTwoYear(idFilm) < 400 Then 'یعنی قرارداد یکساله بوده است
                    lblStrategyText.Text = "نوع قرارداد: یکساله" + " (ثبت نامی صورت نگرفته است)"
                    result = "استراتژی بعد از اولین ارسال نمایش داده میشود"
                Else
                    lblStrategyText.Text = "نوع قرارداد: دوساله" + " (ثبت نامی صورت نگرفته است)"
                    result = "استراتژی بعد از اولین ارسال نمایش داده میشود"
                End If
            End If
        End If
        lblStrategy.Text = result

    End Sub



End Class
