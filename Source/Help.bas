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

	Private scrlHelp As ScrollView
	Dim lblHelp As Label
	Dim bkup As String
End Sub

Sub Activity_Create(FirstTime As Boolean)
	tapsell.initialize("blpfmnkepopeetbjsntnqtknqpklodoojmiaqdeldniorbclodarsmlabfteookrprbece")
	adPanel.Initialize("adPanel")
	Activity.AddView(adPanel, 0, 85%y, 100%x, 15%y)
	tapsell.fillBannerAd(adPanel, "5f60b836378a07000116b589", tapsell.BANNER_320x50)

	Activity.LoadLayout("layHelp")
	scrlHelp.Height = 100%y
	Activity.Title = "راهنما"
'	Activity.TitleColor = Colors.Cyan
	Dim su As StringUtils
	lblHelp.Initialize("lblHelp")
	scrlHelp.Panel.AddView(lblHelp,10dip,10dip,100%x - 20dip,1000dip)
	bkup = "نخست، از اینکه برنامه ما را انتخاب فرمودید سپاسگذاریم." &CRLF& _
	 "ما دراین برنامه تلاش کردیم تا هرچه بیشتر نیازهای شما را برآورده کنیم." &CRLF& _
	"برای ورود به برنامه دکمه «ورود به برنامه» را بزنید سپس در سربرگ تصویر، عکس موردنظر خود برای درج در رزومه انتخاب و برش بزنید." &CRLF& _
	"در سربرگ شخصی، اطلاعات شخصی خود را طبق راهنما وارد نمایید." &CRLF& _
	 "برای درج سوابق تحصیلی (مدرسه و دانشگاه)، در سربرگ تحصیلی اطلاعات را یکی یکی وارد و پس از پایان هرخط دکمه اضافه را بزنید." _
	&CRLF& "برای سوابق آموزشی و مهارت های خود و سوابق شغلی به ترتیب در سربرگ های آموزشی و مهارت و کاری اطلاعات خود را ثبت نمایید." _
	&CRLF& "باید توجه داشته داشته باشید برای زیبایی فایل خروجی در هر خط از توضیحات اضافی بپرهیزید و فقط نکات کلیدی را بنویسید." &CRLF& ""   _
	& CRLF & "اکنون برای ساخت رزومه خود دکمه «تیک» یا ساخت رزومه واقع در نوار بالایی برنامه را بزنید، به صفحه ای هدایت میشوید که رزومه ساخته شده خود را برای ویرایش میبینید" _
	&CRLF& "در این صفحه دکمه ای گوشه پایین سمت راست واقع شده که برای ذخیره تصویر یا تغییر اندازه متن و یا تغییر نوع قلم و همچنین فاصله بین خطوط بکار میرود." _
	&CRLF& "در صفحه تنظیمات قلم، شما میتوانید اندازه و نوع قلم را که دارای تنوع زیادی است را انتخاب کنید و سپس با زدن دکمه برگشت تغییرات خود را مشاهده کنید." _
	&CRLF &CRLF & "امیدواریم این برنامه نظر شما را جلب کرده باشد و کمک شایانی برای جوانان این مرز و بوم باشد" &CRLF& _
	 "با احترام - محسن ترابی" & CRLF & _
	 "گروه توسعه نرم افزار ماتیسا"
	lblHelp.Text = bkup
	lblHelp.Gravity = Gravity.RIGHT
	lblHelp.Typeface = Typeface.LoadFromAssets("casablanca_light.ttf")
	lblHelp.TextSize = fx.scaletextSize(20)
	Dim Obj1 As Reflector
   Obj1.Target = lblHelp
   Obj1.RunMethod3("setLineSpacing", 1 , "java.lang.float", 1.8, "java.lang.float")
	
	scrlHelp.Panel.Color = Colors.Transparent
	lblHelp.Height = su.MeasureMultilineTextHeight(lblHelp,lblHelp.Text) * 2
	scrlHelp.Panel.Height = lblHelp.Height
	'su.MeasureMultilineTextHeight(lblHelp,lblHelp.Text)  * 2
	'Msgbox(lblHelp.Text,"")
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub
