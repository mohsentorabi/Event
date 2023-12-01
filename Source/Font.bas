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
	Dim strFont As String
	Dim intFsize As Int
	Dim intLineSpace As Int
End Sub

Sub Globals
	Private tapsell As Tapsell
	Private adPanel As Panel

	Private spnFont As Spinner
	Private skbFsize As SeekBar
	Private lblTestfont As Label
	Private lblsize As Label
	Private skbLineSPC As SeekBar
	Private lblLineSPC As Label
	Private Label1 As Label
	Private Label2 As Label
	Private lblF As Label
End Sub

Sub Activity_Create(FirstTime As Boolean)
	tapsell.initialize("blpfmnkepopeetbjsntnqtknqpklodoojmiaqdeldniorbclodarsmlabfteookrprbece")
	adPanel.Initialize("adPanel")
	Activity.AddView(adPanel, 0, 85%y, 100%x, 15%y)
	tapsell.fillBannerAd(adPanel, "5f60b836378a07000116b589", tapsell.BANNER_320x50)
	
	Activity.LoadLayout("layFont")
	lblTestfont.Text = "نوشته نمونه" 
	spnFont.Add("فرناز")
	spnFont.Add("نازنین")
	spnFont.Add("نازنین توپر")
	spnFont.Add("رویا")
	spnFont.Add("رویا توپر")
	spnFont.Add("تیتر")
	spnFont.Add("ترافیک")
	spnFont.Add("ترافیک توپر")
	spnFont.Add("وحید")
	spnFont.Add("یکان")
	spnFont.Add("کازابلانکا")
	spnFont.Add("عربی دیجیتال")
	spnFont.Add("دمرل")
	spnFont.Add("متین")
	spnFont.Add("میترا")
	spnFont.Add("نسخ تیتر")
	spnFont.Add("نسخ")
	spnFont.Add("سلهام")
	spnFont.Add("مهر توپر")
	
	skbFsize.Value = 30
	skbLineSPC.Value = 40
	
	Label1.TextSize = fx.scaletextSize(16)
	Label2.TextSize = fx.scaletextSize(16)
	lblsize.TextSize = fx.scaletextSize(16)
	lblLineSPC.TextSize = fx.scaletextSize(16)
	lblF.TextSize = fx.scaletextSize(16)
	spnFont.TextSize = fx.scaletextSize(18)
End Sub

Sub spnFont_ItemClick (Position As Int, Value As Object)
	Select Value
		Case "فرناز"
			strFont = "bfarnaz.ttf"
		Case "نازنین"
			strFont = "bnazanin.ttf"
		Case "نازنین توپر"
			strFont = "bnazaninb.ttf"
		Case "رویا"
			strFont = "broya.ttf"
		Case "رویا توپر"
			strFont = "broyab.ttf"
		Case "تیتر"
			strFont = "btitrb.ttf"
		Case "ترافیک"
			strFont = "btraffic.ttf"
		Case "ترافیک توپر"
			strFont = "btrafficb.ttf"
		Case "وحید"
			strFont = "bvahidb.ttf"
		Case "یکان"
			strFont = "byekan.ttf"
		Case "کازابلانکا"
			strFont = "casablanca_light.ttf"
		Case "عربی دیجیتال"
			strFont = "dig_arabia_xl.ttf"
		Case "دمرل"
			strFont = "domrol.ttf"
		Case "متین"
			strFont = "matin.ttf"
		Case "میترا"
			strFont = "mmitra_b.ttf"
		Case "نسخ تیتر"
			strFont = "naskh_titr.ttf"
		Case "نسخ"
			strFont = "naskhi.ttf"
		Case "سلهام"
			strFont = "selham.ttf"
		Case "مهر توپر"
			strFont = "smehrb.ttf"
		Case Else
			Log("Else")
	End Select
	lblTestfont.Typeface = Typeface.LoadFromAssets(strFont)
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Sub skbFsize_ValueChanged (Value As Int, UserChanged As Boolean)
	If UserChanged = True Then
		lblTestfont.TextSize = Value
		lblsize.Text = fx.PerNumber( Value )
		intFsize = Value
	End If
End Sub

Sub skbLineSPC_ValueChanged (Value As Int, UserChanged As Boolean)
	If UserChanged Then
		lblLineSPC.Text = fx.PerNumber( Value)
		intLineSpace = Value
	End If
End Sub