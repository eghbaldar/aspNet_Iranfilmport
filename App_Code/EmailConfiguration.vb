﻿Imports Microsoft.VisualBasic

Public Class EmailConfiguration
    Public Const BODY As String = "<div style='font-family:BNazanin, B Nazanin, Tahoma;border:1px solid #fffdeb;direction:rtl;text-align:center; padding-right:30px; padding-left:30px;'> <div style='color:black;background-color:#ffe419; padding:15px; font-size:30px; font-family:arial;margin:5px;-moz-border-radius: 5px;	-webkit-border-radius: 5px;'>IRAN FILM PORT</div> </div> <div style='font-family:BNazanin, B Nazanin, Tahoma;padding:10px;border:1px solid #fffdeb;direction:rtl;font-size:30px;text-align:right; padding-right:30px; padding-left:30px;'> <div style='margin:5px; text-align:right; font-size:20px !important; padding:5px;'>" + "<table background='https://iranfilmport.com/files/images/background/backEmail.png' width='100%' style='min-height:100px;font-size:20px !important;'> <tr> <td> {0} </td> </tr> </table>" + "</div> <div style='padding:10px;text-align:center;background-color:#ffe419;margin:5px;-moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px; font-size:20px; color:blue;{2}'>" + "<a href=" + "{1}" + " target='_blank' style='color:black;text-decoration:none;'>" + "جهت مشاهده لینک، کلیک کنید" + "</a>" + "</div> <div style='text-align:center;'> <img width='150px' src='http://iranfilmport.com/files/images/logos/logoSquare.png' /></div> <div style='text-align:center;'> <a href='http://iranfilmport.com' style='color:gray;text-decoration:none;font-size:10px; '> Iran Film Port ®</a> <br/> <a href='http://eghbaldar.ir' style='color:gray;text-decoration:none;font-size:10px; '> Under the Supervision of Alimohammad Eghbaldar ®</a></div></div>"
    Public Const FROM As String = "noreply@iranfilmport.com"
    Public Const SMTP_CLIENT As String = "mail.iranfilmport.com"
    Public Const PASS As String = "mailIFP2019"
End Class
