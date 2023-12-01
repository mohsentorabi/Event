B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@

Sub Class_Globals
	Dim cm As Canvas
	Dim strschool As String = "سوابق تحصیلی"
	Dim strlearn As String = "مهارت‌ها و سوابق آموزشی"
	Dim strjob As String = "سوابق کاری"
	Dim i1,i2,i3,plus1,plus2,plus3 As Int
	Dim bmpAll As Bitmap
	
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize

End Sub

'این تابع را فراخوانی کنید و داخل متغیری از نوع Bitmap بریزید
'Dim b as Bitmap
'Dim dr as DrawResume
'b=dr.Draw
Public Sub Draw As Bitmap
'	Dim bb As B4XView
	
	
	bmpAll.InitializeMutable(768dip,1280dip)
	
	cm.Initialize2(bmpAll)
	Dim rectback As Rect
	rectback.Initialize(0,0,768dip,1280dip)
	cm.DrawRect(rectback,Colors.White,True,1)
	Dim rectImage As Rect
	rectImage.Initialize(60dip,60dip,190dip,240dip)
	
	Dim bmpGender As Bitmap

	If AllTab.boolBMP = True Then
		cm.DrawBitmap(AllTab.bmpcache,Null,rectImage)
	Else
		If AllTab.strInfo(5) = "زن" Then
			bmpGender.Initialize(File.DirAssets,"f.png")
		Else
			bmpGender.Initialize(File.DirAssets, "m.png")
		End If
		cm.DrawBitmap(bmpGender,Null,rectImage)
	End If
	
	Dim scache As String = "به نام خدا"
	cm.DrawText(scache,370dip,50dip,Typeface.LoadFromAssets(Font.strFont),Font.intFsize,Colors.Black,"CENTER")
	If AllTab.strInfo(0) <> "" Then
		cm.DrawText("نام و نام خانوادگی:    " & AllTab.strInfo(0) ,720dip,140dip,Typeface.LoadFromAssets(Font.strFont),Font.intFsize,Colors.Black,"RIGHT")
	End If
		If AllTab.strInfo(1) <> "" Then
		cm.DrawText("تاریخ تولد:    " & AllTab.strInfo(1) ,720dip,180dip,Typeface.LoadFromAssets(Font.strFont),Font.intFsize,Colors.Black,"RIGHT")
	End If
		If AllTab.strInfo(2) <> "" Then
		cm.DrawText("محل زندگی:    " & AllTab.strInfo(2) ,720dip,220dip,Typeface.LoadFromAssets(Font.strFont),Font.intFsize,Colors.Black,"RIGHT")
	End If
		If AllTab.strInfo(3) <> "" Then
		cm.DrawText("شماره تماس:    " & AllTab.strInfo(3) ,720dip,260dip,Typeface.LoadFromAssets(Font.strFont),Font.intFsize,Colors.Black,"RIGHT")
	End If
		If AllTab.strInfo(4) <> "" Then
		cm.DrawText("ایمیل:    " & AllTab.strInfo(4) ,720dip,300dip,Typeface.LoadFromAssets(Font.strFont),Font.intFsize,Colors.Black,"RIGHT")
	End If
	
	'==================NEW===EDIT=1===============
	If AllTab.lst1.Size <> 0 Then
		cm.DrawText(strschool,700dip,400dip,Typeface.LoadFromAssets(Font.strFont),Font.intFsize,Colors.Black,"RIGHT")
		cm.DrawLine(525dip,425dip,710dip,425dip,Colors.Black,3dip)
		plus1 = 465dip
		For i1 = 0 To AllTab.lst1.Size - 1
			Dim map1 As Map
			map1.Initialize
			map1 = AllTab.lst1.Get(i1)
			cm.DrawText("-  " & map1.Get("1st") ,700dip,plus1,Typeface.LoadFromAssets(Font.strFont),Font.intFsize,Colors.Black,"RIGHT")
			cm.DrawText( $"    ${map1.Get("2nd")}"$ ,700dip,plus1 + Font.intLineSpace ,Typeface.LoadFromAssets(Font.strFont),Font.intFsize -4 ,Colors.Black,"RIGHT")
			
'			cm.DrawText("-  " & AllTab.lst1.Get(i1) ,720dip,plus1,Typeface.LoadFromAssets(Font.strFont),Font.intFsize,Colors.Black,"RIGHT")
			plus1 = plus1 + ( Font.intLineSpace * 2 ) '40
		Next
	End If
	'=============================================
	
	If AllTab.lst2.Size <> 0 Then
		cm.DrawText(strlearn,700dip,765dip,Typeface.LoadFromAssets(Font.strFont),Font.intFsize,Colors.Black,"RIGHT")
		cm.DrawLine(420dip,790dip,710dip,790dip,Colors.Black,3dip)
		plus2 = 830dip
		For i2 = 0 To AllTab.lst2.Size - 1
			cm.DrawText("-  " & AllTab.lst2.Get(i2) ,700dip,plus2,Typeface.LoadFromAssets(Font.strFont),Font.intFsize,Colors.Black,"RIGHT")
			plus2 = plus2 + 40dip
		Next
	End If
	
	'==================NEW===EDIT==3==============
	If AllTab.lst3.Size <> 0 Then
		cm.DrawText(strjob,370dip,400dip,Typeface.LoadFromAssets(Font.strFont),Font.intFsize,Colors.Black,"RIGHT")
		cm.DrawLine(240dip,425dip,380dip,425dip,Colors.Black,3dip)
		plus3 = 465dip
		For i3 = 0 To AllTab.lst3.Size - 1
			Dim map3 As Map
			map3.Initialize
			map3 = AllTab.lst3.Get(i3)
			cm.DrawText("-  " & map3.Get("1st") ,370dip,plus3,Typeface.LoadFromAssets(Font.strFont),Font.intFsize,Colors.Black,"RIGHT")
			cm.DrawText( "    " & map3.Get("2nd") ,370dip,plus3 + Font.intLineSpace ,Typeface.LoadFromAssets(Font.strFont),Font.intFsize -4 ,Colors.Black,"RIGHT")
'			cm.DrawText("-  " & AllTab.lst3.Get(i3) ,370dip,plus3,Typeface.LoadFromAssets(Font.strFont),Font.intFsize,Colors.Black,"RIGHT")
			plus3 = plus3 + ( Font.intLineSpace * 2 ) '40
		Next
	End If
	'===========================================
	Dim strWatermark As String
	strWatermark = "maatisa.ir - رزومه ساز ماتیسا"
	cm.DrawText(strWatermark ,30dip,1250dip,Typeface.LoadFromAssets(Font.strFont), 20 ,Colors.Red ,"LEFT")
	
	Dim rectOver As Rect
	rectOver.Initialize(10dip,10dip,758dip,1270dip)
	cm.DrawRect(rectOver,Colors.Black,False,3dip)
	Return(bmpAll)
	
End Sub