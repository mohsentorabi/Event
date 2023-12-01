B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Activity
Version=10
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: True
#End Region

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.

End Sub

Sub Globals
	'These global variables will be redeclared each time the activity is created.
	'These variables can only be accessed from this module.

End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	'Activity.LoadLayout("Layout1")
'	Dim wv As WebView
'	wv.Initialize("wv")
'	wv.LoadUrl("https://maatisa.ir/?p=261")
	
	Dim btn As Button
	btn.Initialize("btn")
	btn.Text = "مشاهده در وبسایت"
	btn.TextSize = fx.scaletextSize(16)
	btn.Typeface = Typeface.LoadFromAssets("byekan.ttf")
	Activity.AddView(btn , 0 , 0 , 100%x , 10%y)
	
	Dim scrl As ScrollView
	scrl.Initialize(1000dip)
	Dim lbl As Label
	lbl.Initialize("")
	lbl.Gravity = Gravity.RIGHT + Gravity.TOP
	lbl.TextSize = fx.scaletextSize(16)
	lbl.Typeface = Typeface.LoadFromAssets("byekan.ttf")
	
	lbl.Text = fx.StringFormat( File.ReadString(File.DirAssets, "privacy.txt") )
	scrl.Panel.AddView(lbl , 2%x , 0 , 98%x , 100%y)
	scrl.Color = Colors.Transparent
	scrl.Panel.Color = Colors.Transparent
	Activity.AddView(scrl , 0 , 10%y , 100%x , 100%y)
	
	Dim Obj1 As Reflector
	Obj1.Target = lbl
	Obj1.RunMethod3("setLineSpacing", 1 , "java.lang.float", 2 , "java.lang.float")

	
	Dim st As StringUtils
	lbl.Height = st.MeasureMultilineTextHeight(lbl , lbl.Text) * 2 + 100dip
	scrl.Panel.Height = lbl.Height
	
	Activity.Title= "سیاست حفظ حریم خصوصی"
'	wv.Visible = False
	'label
	' add with a label and link to site
	'ads
End Sub

Sub btn_Click
	Dim i As Intent
	i.Initialize(i.ACTION_VIEW , "https://maatisa.ir/?p=261")
	StartActivity(i)
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub
