Imports Microsoft.VisualBasic
Imports RestSharp

Public Class SMS

    Public Shared numberHamkaran As String = "0983000505"
    Public Shared ApiLink As String = "http://ippanel.com:8080/?apikey=XVU06zwUg1yXY1Dl7gGXQJPIm2o0b9Rq5hytsI2FkFQ=&pid="
    Public Shared RestAPI As String = "http://188.0.240.110/api/select"
    Public Shared USERNAME As String = "ut9111380846"
    Public Shared PASSWORD As String = "kW2Es@hhnq"

    Public Function SendSms(to_ As String, pattern As String, par As String, val As String) As Boolean

        Try
            Dim client = New RestClient("http://188.0.240.110/api/select")
            Dim request = New RestRequest(Method.POST)
            request.AddHeader("cache-control", "no-cache")
            request.AddHeader("Content-Type", "application/json")
            request.AddParameter("undefined", "{""op"" : ""pattern""" _
                                 & ",""user"" : """ + SMS.USERNAME + """" _
                                 & ",""pass"":  """ + SMS.PASSWORD + """" _
                                 & ",""fromNum"" : """ + SMS.numberHamkaran + """" _
                                 & ",""toNum"": """ + to_.Trim() + """" _
                                 & ",""patternCode"": """ + pattern.Trim() + """" _
                                 & ",""inputData"" : [{""" + par.Trim() + """: """ + val.Trim() + """}]}", ParameterType.RequestBody)

            Dim response As IRestResponse = client.Execute(request)
            Return response.Content
        Catch ex As Exception
            Dim DLL_CMS As New DLL_CMS
            DLL_CMS.InsertErrorLogs("", "SMS", Err.Number, ex.Message)
        End Try

    End Function

	Public Function SendSms(to_ As String,
							pattern As String,
							par1 As String, val1 As String,
							par2 As String, val2 As String) As Boolean

		Try
			Dim client = New RestClient("http://188.0.240.110/api/select")
			Dim request = New RestRequest(Method.POST)
			request.AddHeader("cache-control", "no-cache")
			request.AddHeader("Content-Type", "application/json")
			request.AddParameter("undefined", "{""op"" : ""pattern""" _
								 & ",""user"" : """ + SMS.USERNAME + """" _
								 & ",""pass"":  """ + SMS.PASSWORD + """" _
								 & ",""fromNum"" : """ + SMS.numberHamkaran + """" _
								 & ",""toNum"": """ + to_.Trim() + """" _
								 & ",""patternCode"": """ + pattern.Trim() + """" _
								 & ",""inputData"" : [{""" + par1.Trim() + """: """ + val1.Trim() + """,""" + par2.Trim() + """: """ + val2.Trim() + """}]}", ParameterType.RequestBody)

			Dim response As IRestResponse = client.Execute(request)
			Return response.Content
		Catch ex As Exception
			Dim DLL_CMS As New DLL_CMS
			DLL_CMS.InsertErrorLogs("", "SMS", Err.Number, ex.Message)
		End Try

	End Function
End Class
