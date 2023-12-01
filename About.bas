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

End Sub

Sub Globals
	Private tapsell As Tapsell
	Private adPanel As Panel

	Private lblAbout As Label
End Sub

Sub Activity_Create(FirstTime As Boolean)
	tapsell.initialize("blpfmnkepopeetbjsntnqtknqpklodoojmiaqdeldniorbclodarsmlabfteookrprbece")
	adPanel.Initialize("adPanel")
	Activity.AddView(adPanel, 0, 85%y, 100%x, 15%y)
	tapsell.fillBannerAd(adPanel, "5f60b836378a07000116b589", tapsell.BANNER_320x50)

	Activity.LoadLayout("layAbout")
	Activity.Title = "درباره ماتیسا"
'	Activity.TitleColor = Colors.Cyan
	lblAbout.TextSize = fx.scaletextSize(20)

End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub
