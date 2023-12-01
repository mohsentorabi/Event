B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Activity
Version=6
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: True
#End Region

Sub Process_Globals
	Dim boolBMP As Boolean
	Dim bmpcache As Bitmap
	Dim strInfo(6) As String
	Dim lst1 As List
	Dim lst2 As List
	Dim lst3 As List
	Dim ch As ContentChooser
	
	End Sub

Sub Globals
	'all
	Private tabMain As TabHost
	Private tapsell As Tapsell
'	Private ad As String

	'for pic
	Private imgPersonaly As ImageView
	Private btnChPic As Button
	'Dim cr As RSCrop
	
	
	'for info
	Private pnlInfo As Panel
	Private txtBirthdate As EditText
	Private txtBirthtown As EditText
	Private txtMlife As EditText
	Private txtName As EditText
	Private txtSarbazi As EditText
	
	'for School
	Private lstSch As ListView
	Private btnAddSch As Button
	Private txtSchool As EditText
	Private spnProof As Spinner
	Private txtCourse As EditText
	Private txtAvg As EditText
	
	'for Learn
	Private lstLearn As ListView
	Private btnAddLearn As Button
	Private txtLearn As EditText
	
	'for Job
	Private lstJob As ListView
	Private btnAddJob As Button
	Private txtJob As EditText
	Private txtRoll As EditText
	Private txtLong As EditText

	Private spnSex As Spinner
End Sub

Sub Activity_Create(FirstTime As Boolean)
	Activity.LoadLayout("layTab")
	
	tapsell.initialize("blpfmnkepopeetbjsntnqtknqpklodoojmiaqdeldniorbclodarsmlabfteookrprbece")
	tapsell.requestAd("5f60b75cb081620001cc87ca", True) 'ani banner

	
	Activity.Title = Application.LabelName
'	Activity.TitleColor = Colors.Cyan
	
	tabMain.AddTab("تصویر","layPic.bal")
	tabMain.AddTab("شخصی","layInfo.bal")
	tabMain.AddTab("تحصیلی","laylstSCH.bal")
	tabMain.AddTab("مهارت","laylstLe.bal") 'آموزشی
	tabMain.AddTab("کاری","laylstJ.bal")
	
	
	btnAddSch.SetBackgroundImage(LoadBitmap(File.DirAssets,"add.png"))
	btnAddLearn.SetBackgroundImage(LoadBitmap(File.DirAssets,"add.png"))
	btnAddJob.SetBackgroundImage(LoadBitmap(File.DirAssets,"add.png"))
	
	btnChPic.SetBackgroundImage(LoadBitmap(File.DirAssets,"addpic.png"))
	
	lst1.Initialize
	lst2.Initialize
	lst3.Initialize
	
	
	bmpcache.InitializeMutable(150dip,200dip)
	
'	tim.Initialize("tim",1000)
'	tim.Enabled = False
	imgPersonaly.Bitmap = LoadBitmap(File.DirAssets , "128.png")
	Activity.AddMenuItem3("ساخت رزومه","generate",LoadBitmap(File.DirAssets,"chk.png"),True)
	Activity.AddMenuItem3("راهنمایی","Helpb",LoadBitmap(File.DirAssets,"help.png"),True)
	Activity.AddMenuItem3("بیرون رفتن","exit",LoadBitmap(File.DirAssets,"export.png"),True)
	
	spnProof.AddAll(Array As String("دیپلم" , "کاردانی" , "کارشناسی" , "کارشاسی ارشد" , "دکترا" ))
	spnSex.AddAll( Array As String("زن" , "مرد"))
	spnSex.SelectedIndex = 0

	'Click add to list:  ide://goto?Sub=btnAddSch_Click
	lstThemes
'	tapsell.showAd(ad, True, True, tapsell.ROTATION_LOCKED_PORTRAIT, True)
		
	'Dim in1 As PhoneIntents
	'Dim n As Notification
	'n.Initialize
	'n.AutoCancel = True
	'n.Icon = "icon"
	'n.Light = True
	'n.Vibrate  = False
	'n.SetInfo("وبسایت ماتیسا","خدمات برنامه نویسی و آموزش",(in1.OpenBrowser("https://maatisa.ir")))
	'n.Notify(1)
End Sub

Sub lstThemes
	txtName.TextSize = fx.scaletextSize(14)
	txtBirthdate.TextSize = fx.scaletextSize(14)
	txtBirthtown.TextSize = fx.scaletextSize(14)
	txtMlife.TextSize = fx.scaletextSize(14)
	txtSarbazi.TextSize = fx.scaletextSize(14)
	spnSex.TextSize = fx.scaletextSize(16)
	'sch
	txtAvg.TextSize = fx.scaletextSize(14)
	txtCourse.TextSize = fx.scaletextSize(14)
	txtSchool.TextSize = fx.scaletextSize(14)
	spnProof.TextSize = fx.scaletextSize(16)
	'edu
	txtLearn.TextSize = fx.scaletextSize(14)
	'job
	txtRoll.TextSize = fx.scaletextSize(14)
	txtLong.TextSize = fx.scaletextSize(14)
	txtJob.TextSize = fx.scaletextSize(14)
	
	Dim lbl4LSTsch1, lbl4LSTsch2 As Label
	lbl4LSTsch1.Initialize("")
	lbl4LSTsch2.Initialize("")
	lbl4LSTsch1.Gravity = Gravity.RIGHT + Gravity.CENTER_VERTICAL
	lbl4LSTsch2.Gravity = Gravity.RIGHT + Gravity.CENTER_VERTICAL
	lbl4LSTsch1.Padding = Array As Int(10dip , 2dip , 5dip, 2dip )
	lbl4LSTsch2.Padding = Array As Int(10dip , 2dip , 10dip, 2dip )
	lbl4LSTsch1.TextColor = Colors.White
	lbl4LSTsch2.TextColor = Colors.LightGray
	lbl4LSTsch1.TextSize = fx.scaletextSize(14)
	lbl4LSTsch2.TextSize = fx.scaletextSize(12)
'	lbl4LSTsch1.Typeface = Typeface.LoadFromAssets("calibril.ttf")
'	lbl4LSTsch2.Typeface = Typeface.LoadFromAssets("calibril.ttf")
	lbl4LSTsch1 = lstSch.TwoLinesLayout.Label
	lbl4LSTsch2 = lstSch.TwoLinesLayout.SecondLabel
	'lstSch.TwoLinesLayout.ItemHeight = 10%y
	
	Dim lbl4LSTedu1 As Label
	lbl4LSTedu1.Initialize("")
	lbl4LSTedu1.Gravity = Gravity.RIGHT + Gravity.CENTER_VERTICAL
	lbl4LSTedu1.Padding = Array As Int(10dip , 2dip , 5dip, 2dip )
	lbl4LSTedu1.TextColor = Colors.White
	lbl4LSTedu1.TextSize = fx.scaletextSize(14)
'	lbl4LSTedu1.Typeface = Typeface.LoadFromAssets("calibril.ttf")
'	lbl4LSTedu1.Typeface = Typeface.LoadFromAssets("calibril.ttf")
	lbl4LSTedu1 = lstLearn.SingleLineLayout.Label

	
	Dim lbl4LSTjob1, lbl4LSTjob2 As Label
	lbl4LSTjob1.Initialize("")
	lbl4LSTjob2.Initialize("")
	lbl4LSTjob1.Gravity = Gravity.RIGHT + Gravity.CENTER_VERTICAL
	lbl4LSTjob2.Gravity = Gravity.RIGHT + Gravity.CENTER_VERTICAL
	lbl4LSTjob1.Padding = Array As Int(10dip , 2dip , 5dip, 2dip )
	lbl4LSTjob2.Padding = Array As Int(10dip , 2dip , 10dip, 2dip )
	lbl4LSTjob1.TextColor = Colors.White
	lbl4LSTjob2.TextColor = Colors.LightGray
	lbl4LSTjob1.TextSize = fx.scaletextSize(14)
	lbl4LSTjob2.TextSize = fx.scaletextSize(12)
'	lbl4LSTjob1.Typeface = Typeface.LoadFromAssets("calibril.ttf")
'	lbl4LSTjob2.Typeface = Typeface.LoadFromAssets("calibril.ttf")
	lbl4LSTjob1 = lstJob.TwoLinesLayout.Label
	lbl4LSTjob2 = lstJob.TwoLinesLayout.SecondLabel
End Sub

Sub sendInfo
	
	Dim json_Send As JSONGenerator
	Dim map_All_Info As Map
	map_All_Info.Initialize
	Dim strdt As String
	DateTime.DateFormat= "yyyymmdd-HHmmss"
	strdt = DateTime.Date(DateTime.Now)
	map_All_Info.Put("dateTime" , strdt)
	map_All_Info.Put("name" , strInfo(0))
	map_All_Info.Put("birth" , strInfo(1))
	map_All_Info.Put("city" , strInfo(2))
	map_All_Info.Put("number" , strInfo(3))
	map_All_Info.Put("email" , strInfo(4))
	map_All_Info.Put("sex" , strInfo(5))
	map_All_Info.Put("sch-List" , lst1)
	map_All_Info.Put("edu-skil-List" , lst2)
	map_All_Info.Put("job-List" , lst3)
	If boolBMP Then
		Dim out As OutputStream
		out.InitializeToBytesArray(0)
		bmpcache.WriteToStream(out, 100, "PNG")
		out.Close
		Dim byte1() As Byte = out.ToBytesArray
		Dim str_Bytes As String
		str_Bytes = BytesToString(byte1 , 0 , byte1.Length , "UTF-8" )
		map_All_Info.Put("pic" , str_Bytes ) 'or img name and uploud with ftp
	End If
	
	json_Send.Initialize(map_All_Info)
	Dim str_Save_send As String
	str_Save_send = json_Send.ToString
	Dim strbu As String
	strbu = "Resume_" & DateTime.Date(DateTime.Now)
	File.WriteString(File.DirInternal , strbu & ".json" , json_Send.ToPrettyString(4) )
	'===========================send===and ads==============
	Dim job As HttpJob
	job.Initialize("" , Me)
	job.PostString("https://maatisa.ir/app/cv/reg.php" , str_Save_send)
	Wait For JobDone(job As HttpJob)
	If job.Success Then
		Log(job.GetString)
	End If
	job.Release
	StartActivity(All)
'	Dim job As HttpJob
'	job.Initialize("", Me) 
'	job.Download("https://maatisa.ir/app/....")
	'========================ADS==============================
	
	'=========================================================
End Sub

Sub generate_Click
	Msgbox2Async("آیا از صحت اطلاعات مطمئن هستید؟","مشاهده رزومه","تایید","لغو","", Application.Icon , True)
	Wait For Msgbox_Result (Result As Int)
	If Result = DialogResponse.POSITIVE Then
		strInfo(5) = spnSex.SelectedItem
		StartActivity(All)

		'Send data to server profile
		'sendInfo
'		StartActivity(All)
'		If ad <> Null Then
'			tapsell.showAd(ad, False, False, tapsell.ROTATION_LOCKED_PORTRAIT, True)
'		Else
'			tapsell.requestAd("5f60b7a2b081620001cc87cc", False) 'reward vid
'			MsgboxAsync("تبلیغات در دسترس نیست، دوباره دکمه تیک را بزنید" & CRLF & "*برای نمایش رزومه باید یک تبلیغ مشاهده کنید" , "")
'		End If
'		sendInfo
'		ProgressDialogShow("لطفا صبور باشید...")
'		tim.Enabled = True
		'=================if ads ok ================
'		StartActivity(All)
		'========================================
	End If
End Sub


Sub tapsell_onadavailable (zoneId As String, adId As String)
'	ad = adId
	tapsell.showAd(adId, False, False, tapsell.ROTATION_LOCKED_PORTRAIT, True)
End Sub
'
'Sub Tapsell_onExpiring (zoneId As String, adId As String)
'	ad = Null
'	tapsell.requestAd("5f60b75cb081620001cc87ca", True) 'ani banner
'End Sub
'
'Sub Tapsell_onAdShowFinished (zoneId As String, adId As String, completed As Boolean, rewarded As Boolean)
'	If rewarded = True And completed = True Then
'		StartActivity(All)
'	Else
'		MsgboxAsync("تبلیغات در دسترس نیست، دوباره دکمه تیک را بزنید" & CRLF & "*برای نمایش رزومه باید یک تبلیغ را تا پایان مشاهده کنید" , "")
'	End If
''	Msgbox("Finished", "Tapsell")
'End Sub


Sub exit_Click
	StartActivity(Main)
End Sub

Sub Helpb_Click
	StartActivity(Help)
End Sub

Sub tim_Tick
'	intTim = intTim + 1
'	If intTim = 3 Then
'		ProgressDialogHide
'		intTim = 0
'		'Activity.Finish
'		tim.Enabled = False
'	End If
End Sub

Sub Activity_Resume
	
End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

'for pic
Sub btnChPic_Click
	'cr.Initialize("cr","img.png" )
	'cr.cropImage2(True,False,False,False)
	If boolBMP = False Then
		ch.Initialize("ch")
		ch.Show("image/*","انتخاب عکس")
	Else
		Msgbox2Async("مایل به چه کاری هستید؟" , "انتخاب یا حذف عکس" , "انتخاب" , "لغو" , "حذف" , Null , True)
		Wait For Msgbox_Result (Result As Int)
		If Result = DialogResponse.POSITIVE Then
			ch.Initialize("ch")
			ch.Show("image/*","انتخاب عکس")
		Else If Result = DialogResponse.NEGATIVE Then
			bmpcache = Null
			boolBMP = False
			imgPersonaly.Bitmap = LoadBitmap(File.DirAssets , "128.png")
		End If
	End If
End Sub

Sub ch_Result (Success As Boolean, Dir As String, FileName As String)
	If Success Then
		bmpcache = LoadBitmap(Dir,FileName)
		boolBMP = True
		imgPersonaly.Bitmap = bmpcache
	Else
		ToastMessageShow("عکسی انتخاب نشده است",True)
	End If
End Sub

Sub cr_Cropped (Success As Boolean, Pathname As String)
	If Success = True Then
		Log($"Crop: ${Success} - P: ${Pathname}"$)
		If File.Exists(File.DirInternal,"img.png") = True Then
			Log($"if in crop"$)
			bmpcache = LoadBitmap(File.DirInternal,"img.png")
			imgPersonaly.Bitmap = bmpcache
		Else
				ToastMessageShow("عکس را دوباره انتخاب کنید",True)
		End If
	Else
		ToastMessageShow("عکس را دوباره انتخاب کنید",True)
	End If
End Sub

'for 3 Lists
Sub btnAddSch_Click
	lstSch.AddTwoLines(fx.PerNumber( $"    ${spnProof.SelectedItem} - ${txtCourse.Text}"$ ), fx.PerNumber( $"    ${txtSchool.Text} - ${txtAvg.Text}"$ ) )
	Dim map1 As Map
	map1.Initialize
	map1.Clear
	map1.Put("1st" , fx.PerNumber( $"${spnProof.SelectedItem} رشته ${txtCourse.Text}"$))
	map1.Put( "2nd" , fx.PerNumber( $"${txtSchool.Text} (معدل ${txtAvg.Text})"$ ) )
	lst1.Add(map1)
'	lstSch.AddSingleLine("    " & txtSchool.Text)
'	lst1.Add(txtSchool.Text)
	spnProof.SelectedIndex = 0
	txtCourse.Text = ""
	txtSchool.Text = ""
	txtAvg.Text = ""
End Sub

Sub btnAddLearn_Click
	lstLearn.AddSingleLine(fx.PerNumber( "    " & txtLearn.Text) )
	lst2.Add(fx.PerNumber( txtLearn.Text))
	txtLearn.Text = ""
End Sub

Sub btnAddJob_Click
	lstJob.AddTwoLines(fx.PerNumber( $"    ${txtJob.Text}"$) , fx.PerNumber($"    ${txtRoll.Text} به مدت ${txtLong.Text}"$ ))
	Dim map2 As Map
	map2.Initialize
	map2.Clear
	map2.Put("1st" ,fx.PerNumber( $"${txtJob.Text}"$))
	map2.Put( "2nd" , fx.PerNumber($"${txtRoll.Text} به مدت ${txtLong.Text}"$ ))
	lst3.Add(map2)
	
'	lstJob.AddSingleLine("    " & txtJob.Text)
'	lst3.Add(txtJob.Text)
	txtJob.Text = ""
	txtRoll.Text = ""
	txtLong.Text = ""

End Sub

Sub lstSch_ItemClick (Position As Int, Value As Object)
	Msgbox2Async("قصد انجام چه عملیاتی را دارید؟","عملیات حذف","حذف","لغو","حذف همه",Application.Icon ,True)
	Wait For Msgbox_Result (Result As Int)
	If Result = DialogResponse.POSITIVE Then
		lstSch.RemoveAt(Position)
		lst1.RemoveAt(Position)
	Else If Result = DialogResponse.NEGATIVE Then
		lstSch.Clear
		lst1.Clear
	End If
	
End Sub

Sub lstLearn_ItemClick (Position As Int, Value As Object)
	Msgbox2Async("قصد انجام چه عملیاتی را دارید؟","عملیات حذف","حذف","لغو","حذف همه",Application.Icon , True)
	Wait For Msgbox_Result (Result As Int)
	If Result = DialogResponse.POSITIVE Then
		lstLearn.RemoveAt(Position)
		lst2.RemoveAt(Position)
	Else If Result = DialogResponse.NEGATIVE Then
		lstLearn.Clear
		lst2.Clear
	End If
End Sub

Sub lstJob_ItemClick (Position As Int, Value As Object)
	Msgbox2Async("قصد انجام چه عملیاتی را دارید؟","عملیات حذف","حذف","لغو","حذف همه",Application.Icon , True)
	Wait For Msgbox_Result (Result As Int)
	If Result = DialogResponse.POSITIVE Then
		lstJob.RemoveAt(Position)
		lst3.RemoveAt(Position)
	Else If Result = DialogResponse.NEGATIVE Then
		lstJob.Clear
		lst3.Clear
	End If
End Sub

'Sub txtJob_EnterPressed
'	btnAddJob_Click
'End Sub

Sub txtLearn_EnterPressed
	btnAddLearn_Click
End Sub

'Sub txtSchool_EnterPressed
'	btnAddSch_Click
'End Sub

'for info
Sub txtSarbazi_TextChanged (Old As String, New As String) 'EMAIL
	If txtSarbazi.Text <> "" Then
		strInfo(4) = txtSarbazi.Text
	Else
		strInfo(4) = ""
	End If
End Sub

Sub txtName_TextChanged (Old As String, New As String)
	If txtName.Text <> "" Then
		strInfo(0) = txtName.Text
	Else
		strInfo(0) = ""
	End If
End Sub

Sub txtMlife_TextChanged (Old As String, New As String)
	If txtMlife.Text <> "" Then
		strInfo(2) = txtMlife.Text
	Else
		strInfo(2) = ""
	End If
End Sub

Sub txtBirthtown_TextChanged (Old As String, New As String)
	If txtBirthtown.Text <> "" Then
		strInfo(3) = fx.PerNumber( txtBirthtown.Text)
	Else
		strInfo(3) = ""
	End If
End Sub

Sub txtBirthdate_TextChanged (Old As String, New As String)
	If txtBirthdate.Text <> "" Then
		strInfo(1) = fx.PerNumber( txtBirthdate.Text )
	Else
		strInfo(1) = ""
	End If
End Sub

Sub spnSex_ItemClick (Position As Int, Value As Object)
	strInfo(5) = Value
End Sub

Sub tabMain_TabChanged
	Select tabMain.CurrentTab
		Case 0
			Activity.Title = "عکس شخصی"
		Case 1
			Activity.Title = "اطلاعات شخصی"
		Case 2
			Activity.Title = "تحصیلی"
		Case 3
			Activity.Title = "مهارت ها"
		Case 4
			Activity.Title = "سوابق کاری"
	End Select
End Sub