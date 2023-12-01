B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Activity
Version=6
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: False
#End Region


Sub Process_Globals
'	Dim timeSave As Timer
End Sub

Sub Globals
	Private tapsell As Tapsell
'	Private ad As String

	Private imgAll As ImageView
	Private pnlAll As Panel
	Private fam1 As FloatingActionMenu
	Dim dr As DrawResume
	Dim bmpDraw As Bitmap
'	Dim intTimer As Int = 0
	
	Dim rp As RuntimePermissions
End Sub

Sub Activity_Create(FirstTime As Boolean)
	Activity.LoadLayout("layAll")
	
	tapsell.initialize("blpfmnkepopeetbjsntnqtknqpklodoojmiaqdeldniorbclodarsmlabfteookrprbece")
	tapsell.requestAd("5f60b7d9b081620001cc87ce", False) 'ban
	
	Font.intFsize = 30
	Font.intLineSpace = 40dip
	If Font.strFont.Contains(".ttf") = False Then
		Font.strFont = "byekan.ttf"
	End If
	
	dr.Initialize
	bmpDraw = dr.Draw
	imgAll.Bitmap = bmpDraw
'	imgAll.Visible = chkAd
	'visible until ad
	
	fam1.ActivityHeight = 100%y
	fam1.ActivityWidth = 100%x
	fam1.Height = 100%y
	fam1.Left = 50%x
	fam1.Animated = True
	
'	timeSave.Initialize("timeSave",1000)
'	timeSave.Enabled = False
	
	Dim btnSave As FloatingActionButton
	btnSave.Initialize("fab")
	btnSave.IconDrawable = "ic_save_black_36_72"
	btnSave.Color = Colors.Yellow
	'btnSave.ColorDisabled = Colors.LightGray
	btnSave.ColorNormal = Colors.Yellow
	btnSave.ColorPressed = Colors.Gray
	'btnSave.ColorRipple = Colors.Yellow
	btnSave.ButtonSize = 0
	'btnSave.ShowShadow = False
	btnSave.showButtonInMenu(True)
	btnSave.LabelVisibility = 1
	btnSave.LabelText = "ذخیره تصویر"
	fam1.addMenuButton(btnSave)
	
	Dim btnfont As FloatingActionButton
	btnfont.Initialize("fab")
	btnfont.IconDrawable = "ic_font_black_36_32"
	btnfont.Color = Colors.Yellow
	'btnfont.ColorDisabled = Colors.LightGray
	btnfont.ColorNormal = Colors.Yellow
	btnfont.ColorPressed = Colors.Gray
	'btnfont.ColorRipple = Colors.Yellow
	btnfont.ButtonSize = 0
	'btnfont.ShowShadow = False
	btnfont.showButtonInMenu(True)
	btnfont.LabelVisibility = 0
	btnfont.LabelText = "انتخاب فونت"
	fam1.addMenuButton(btnfont)
	
	Dim btnfont As FloatingActionButton
	btnfont.Initialize("fab")
	btnfont.IconDrawable = "ic_font_black_36_32"
	btnfont.Color = Colors.Yellow
	'btnfont.ColorDisabled = Colors.LightGray
	btnfont.ColorNormal = Colors.RGB(167,102,255)
	btnfont.ColorPressed = Colors.RGB(109,53,186)
	'btnfont.ColorRipple = Colors.Yellow
	btnfont.ButtonSize = 0
	'btnfont.ShowShadow = False
	btnfont.showButtonInMenu(True)
	btnfont.LabelVisibility = 0
	btnfont.LabelText = "انتخاب فونت"
	fam1.addMenuButton(btnfont)
	
	Dim btnSave As FloatingActionButton
	btnSave.Initialize("fab")
	btnSave.IconDrawable = "ic_save_black_36_72"
	btnSave.Color = Colors.Yellow
	'btnSave.ColorDisabled = Colors.LightGray
	btnSave.ColorNormal = Colors.RGB(167,102,255)
	btnSave.ColorPressed = Colors.RGB(109,53,186)
	'btnSave.ColorRipple = Colors.Yellow
	btnSave.ButtonSize = 0
	'btnSave.ShowShadow = False
	btnSave.showButtonInMenu(True)
	btnSave.LabelVisibility = 1
	btnSave.LabelText = "ذخیره تصویر"
	fam1.addMenuButton(btnSave)
	
	'fam1.Color = Colors.Cyan
	fam1.MenuButtonColorNormal = Colors.RGB(85,152,144)
	fam1.MenuButtonColorPressed = Colors.RGB(34,111,101)
	'fam1.LabelsMargin = 2
	fam1.LabelsPaddingBottom = 2
	fam1.ClosedOnTouchOutside = True
	fam1.OpenDirection = 0
	fam1.LabelsPosition = 0
	'fam1.Invalidate
	fam1.showMenuButton(True)
	
'	If FirstTime Then
'	tapsell.showAd(ad, False , False, tapsell.ROTATION_LOCKED_PORTRAIT, True)
'	End If
	
End Sub

Sub fab_onClick(obj As Object)
	If obj Is FloatingActionButton Then
		Dim btn As FloatingActionButton = obj
		If btn.LabelText="ذخیره تصویر" Then
			rp.CheckAndRequest(rp.PERMISSION_WRITE_EXTERNAL_STORAGE )
'			timeSave.Enabled = True
'			ProgressDialogShow("لطفا صبور باشید...")
		Else If btn.LabelText="انتخاب فونت" Then
			StartActivity(Font)
		End If
	Else If obj Is Label Then
		Dim lbl As Label = obj
		If lbl.Text="ذخیره تصویر" Then
			rp.CheckAndRequest(rp.PERMISSION_WRITE_EXTERNAL_STORAGE )
		Else If lbl.Text="انتخاب فونت" Then	
			StartActivity(Font)
		End If
	End If
	
End Sub

Sub Activity_PermissionResult (Permission As String, Result As Boolean)
	If Permission = rp.PERMISSION_WRITE_EXTERNAL_STORAGE And Result = True Then
		SaveResume
	Else
		MsgboxAsync("مجوز برای ذخیره داده نشد" , "")
	End If
End Sub

Sub SaveResume
	Dim outp As OutputStream
	Dim strtime As String
	DateTime.DateFormat= "yymmdd-HHmmss"
	strtime = "Resume_" & DateTime.Date(DateTime.Now)
	If File.Exists(File.DirRootExternal & "Maatisa/Resume_Creator","") = False Then
		File.MakeDir(File.DirRootExternal,"Maatisa/Resume_Creator")
	End If
	outp = File.OpenOutput(File.DirRootExternal & "/Maatisa/Resume_Creator/",strtime & ".png",False)
	bmpDraw.WriteToStream(outp,100,"PNG")
	outp.Close
'			ToastMessageShow("ذخیره شد",False)
	ToastMessageShow("Saved in: " & File.Combine(File.DirRootExternal,strtime & ".png"),True)
'	tapsell.showAd(ad, True, True, tapsell.ROTATION_LOCKED_PORTRAIT, True)

End Sub

Sub fam1_onClick(obj As Object)
	fam1.toggle(True)
End Sub

Sub Activity_Resume
	If Font.strFont.Contains(".ttf") = False Then
		Font.strFont = "byekan.ttf"
	End If
	
	bmpDraw = dr.Draw
	imgAll.Bitmap = bmpDraw
'	imgAll.Visible = chkAd
End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

'Sub Activity_LongClick
'	
'End Sub

Sub tapsell_onadavailable (zoneId As String, adId As String)
'	ad = adId
	tapsell.showAd(adId, False , False, tapsell.ROTATION_LOCKED_PORTRAIT, True)
End Sub

'Sub Tapsell_onExpiring (zoneId As String, adId As String)
'	ad = Null
''	tapsell.requestAd("5f60b7d9b081620001cc87ce", True) 'ani banner
''	MsgboxAsync("تبلیغات در دسترس نیست دوباره تلاش کنید" , "")
'End Sub

'Sub Tapsell_onAdShowFinished (zoneId As String, adId As String, completed As Boolean, rewarded As Boolean)
'	If rewarded = True And completed = True Then
'		fx.chkAd = True
''		imgAll.Visible = True
'	Else
'		MsgboxAsync( "متاسفانه برای مشاهده رزومه باید تبلیغ را تا انتها مشاهده نمایید" , "")
'	End If
''	Msgbox("Finished", "Tapsell")
'End Sub
''
'Sub Tapsell_onError(zoneId As String, error As String)
'	MsgboxAsync("تبلیغات در دسترس نیست دوباره تلاش کنید" , "")
'End Sub
''
'Sub Tapsell_onNoNetwork (zoneId As String)
'	MsgboxAsync("اینترنت در دسترس نیست به جهت نمایش تبلیغات" , "")
'End Sub
''
'Sub Tapsell_onNoAdAvailable (zoneId As String)
'	MsgboxAsync("تبلیغات در دسترس نیست دوباره تلاش کنید" , "")
'End Sub

'Sub tapsell_onadavailable (zoneId As String, adId As String)
'	ad = adId
'End Sub
'
'Sub Tapsell_onExpiring (zoneId As String, adId As String)
'	ad = Null
'	tapsell.requestAd("5f60b7d9b081620001cc87ce", True)
'End Sub


'Sub timeSave_Tick
'	intTimer = intTimer + 1
'	If intTimer = 3 Then
'		ProgressDialogHide
'		intTimer = 0
'		timeSave.Enabled = False
'	End If
'End Sub

