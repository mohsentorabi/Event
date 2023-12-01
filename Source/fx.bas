B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=10
@EndOfDesignText@
'Code module
'Subs in this code module will be accessible from all modules.
Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.
	Dim FS As Float ' width / density * 160
'	Dim chkAd As Boolean
	Dim rs As RichString

End Sub

'fx.FS =  (Activity.Width / (Density * 160))
Sub scaletextSize(textSize As Float) As Float
	Dim fs2 As Float
	fs2 = FS * (textSize / 2.5)
	Return fs2
End Sub

Sub PerNumber(inter As String) As String
	Dim i As Int
	Dim str As String = ""
	For i = 0 To inter.Length - 1
		Select  inter.CharAt(i)
			Case "0"
				str = str & Chr(1776) ' 0660 - 0669 ==== 1632 - 1641
			Case "1"
				str = str & Chr(1777)
			Case "2"
				str = str & Chr(1778)
			Case	 "3"
				str = str & Chr(1779)
			Case "4"
				str = str & Chr(1780)
			Case "5"
				str = str & Chr(1781)
			Case "6"
				str = str & Chr(1782)
			Case "7"
				str = str & Chr(1783)
			Case "8"
				str = str & Chr(1784)
			Case "9"
				str = str & Chr(1785)
			Case Else
				str = str & inter.CharAt(i)
		End Select
	Next
	Return str
End Sub

Sub StringFormat(enStr As String) As RichString
	rs.Initialize(enStr)
	rs.Color2(Colors.Red , "{cr}" )
	rs.Style2(rs.STYLE_BOLD , "{sb}")
	rs.Style2(rs.STYLE_ITALIC , "{si}")
	rs.Underscore2( "{ul}" )
	rs.RelativeSize2(1.2 , "{rsa}")
	
	Return rs
End Sub

'Sub csb(text As String) As CSBuilder
'	Dim cs As CSBuilder
'	cs.Initialize.Typeface(Typeface.LoadFromAssets("samim.ttf" )).Color( mapTheme.Get("textprimary")).Alignment("ALIGN_CENTER").Size(16).Append(text).PopAll
'	
'	Return cs
'	' ALIGN_CENTER  OPPOSITE  NORMAL
'End Sub

'Sub ShowCustomToast(Text As Object, LongDuration As Boolean) ', BackgroundColor As Int)
'	Dim ctxt As JavaObject
'	ctxt.InitializeContext
'	Dim duration As Int
'	If LongDuration Then duration = 1 Else duration = 0
'	Dim toast As JavaObject
'	toast = toast.InitializeStatic("android.widget.Toast").RunMethod("makeText", Array(ctxt, csb(Text), duration))
'	Dim v As View = toast.RunMethod("getView", Null)
'	Dim cd As ColorDrawable
'	cd.Initialize(mapTheme.Get("actionprimary"), 20dip)
'	v.Background = cd
'	'uncomment to show toast in the center:
'	'   toast.RunMethod("setGravity", Array( _
'	'       Bit.Or(Gravity.CENTER_HORIZONTAL, Gravity.CENTER_VERTICAL), 0, 0))
'	toast.RunMethod("show", Null)
'End Sub
