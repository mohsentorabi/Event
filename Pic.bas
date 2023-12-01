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
	
End Sub

Sub Globals
	Private imgPersonaly As ImageView
	Private btnChPic As Button
End Sub

Sub Activity_Create(FirstTime As Boolean)

	Activity.LoadLayout("layPic")
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub


