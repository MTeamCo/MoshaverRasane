package DaneshBonyad.ui.pages
{//JashnvareSalamat.ui.pages.EmailSend
	import appManager.event.AppEventContent;
	
	import componentStatic.EmailValidation;
	
	import contents.Contents;
	import contents.History;
	import contents.LinkData;
	import contents.PageData;
	import contents.interFace.DisplayPageInterface;
	
	import flash.display.MovieClip;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.SoftKeyboardType;
	import flash.text.TextField;
	
	import picContest.Pic;
	import picContest.PicConst;
	import picContest.services.webCaller.RegisterQuetion;
	
	import spark.components.TextInput;
	
	public class EmailSend extends MovieClip implements DisplayPageInterface
	{
		public var allText:String = '';
		
		protected var _email_mc:MovieClip ;
		protected var _phone_mc:MovieClip ;
		protected var _name_mc:MovieClip ;
		protected var _subject_mc:MovieClip ;
		protected var _body_mc:MovieClip ;
		
		protected var _send_mc:MovieClip ;
		

		protected var _flag_mc:MovieClip ;

		
		protected var _email_txt:TextField ;
		protected var _phone_txt:TextField ;
		protected var _name_txt:TextField ;
		protected var _subject_txt:TextField ;
		protected var _body_txt:TextField ;
		//
		
		protected var _text1_1:TextField,
		_text1_2:TextField,
		_text1_3:TextField,
		_text1_4:TextField,
		_text1_5:TextField,
		_text1_6:TextField,
		_text1_7:TextField,
		_text1_8:TextField,
		_text1_9:TextField,
		_text1_10:TextField,
		_text1_11:TextField,
		_text1_12:TextField,
		_text1_13:TextField,
		_text1_14:TextField,
		_text1_15:TextField,
		_text1_16:TextField,
		_text1_17:TextField,
		_text1_18:TextField,
		_text1_19:TextField,
		_text1_20:TextField,
		_text1_21:TextField,
		_text1_22:TextField,
		_text2_1:TextField,
		_text2_2:TextField,
		_text2_3:TextField,
		_text2_4:TextField,
		_text2_5:TextField,
		_text2_6:TextField,
		_text2_7:TextField,
		_text2_8:TextField,
		_text2_9:TextField,
		_text2_10:TextField,
		_text2_11:TextField,
		_text2_12:TextField,
		_text2_13:TextField,
		_text2_14:TextField,
		_text2_15:TextField,
		_text2_16:TextField;

		
		protected var _chek_0:MovieClip,
						_chek_1:MovieClip,
						_chek_2:MovieClip,
						_chek_3:MovieClip,
						_chek_4:MovieClip,
						_chek_5:MovieClip,
						_chek_6:MovieClip,
						_chek_7:MovieClip,
						_chek_8:MovieClip,
						_chek_9:MovieClip;

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		private var emailsendcommand:RegisterQuetion;
		
		private var scrollAll:ScrollMT;


		public function EmailSend()
		{
			super();
			
			
			_email_mc = Obj.get("email_mc",this);
			_phone_mc = Obj.get("phone_mc",this);
			_name_mc = Obj.get("name_mc",this);
			_subject_mc = Obj.get("subject_mc",this);
			_body_mc = Obj.get("body_mc",this);
			
			
			_send_mc = Obj.get("send_mc",this);
			_flag_mc = Obj.get("flag_mc",this);
			
			_email_txt = Obj.get("email_txt",this);
			_phone_txt = Obj.get("phone_txt",this);
			_name_txt = Obj.get("name_txt",this);
			_subject_txt = Obj.get("subject_txt",this);
			_body_txt = Obj.get("body_txt",this);
			//
			_text1_1 = Obj.get("text1_1",this);
			_text1_2 = Obj.get("text1_2",this);
			_text1_3 = Obj.get("text1_3",this);
			_text1_4 = Obj.get("text1_4",this);
			_text1_5 = Obj.get("text1_5",this);
			_text1_6 = Obj.get("text1_6",this);
			_text1_7 = Obj.get("text1_7",this);
			_text1_8 = Obj.get("text1_8",this);
			_text1_9 = Obj.get("text1_9",this);
			_text1_10 = Obj.get("text1_10",this);
			_text1_11 = Obj.get("text1_11",this);
			_text1_12 = Obj.get("text1_12",this);
			_text1_13 = Obj.get("text1_13",this);
			_text1_14 = Obj.get("text1_14",this);
			_text1_15 = Obj.get("text1_15",this);
			_text1_16 = Obj.get("text1_16",this);
			_text1_17 = Obj.get("text1_17",this);
			_text1_18 = Obj.get("text1_18",this);
			_text1_19 = Obj.get("text1_19",this);
			_text1_20 = Obj.get("text1_20",this);
			_text1_21 = Obj.get("text1_21",this);
			_text1_22 = Obj.get("text1_22",this);
			_text2_1 = Obj.get("text2_1",this);
			_text2_2 = Obj.get("text2_2",this);
			_text2_3 = Obj.get("text2_3",this);
			_text2_4 = Obj.get("text2_4",this);
			_text2_5 = Obj.get("text2_5",this);
			_text2_6 = Obj.get("text2_6",this);
			_text2_7 = Obj.get("text2_7",this);
			_text2_8 = Obj.get("text2_8",this);
			_text2_9 = Obj.get("text2_9",this);
			_text2_10 = Obj.get("text2_10",this);
			_text2_11 = Obj.get("text2_11",this);
			_text2_12 = Obj.get("text2_12",this);
			_text2_13 = Obj.get("text2_13",this);
			_text2_14 = Obj.get("text2_14",this);
			_text2_15 = Obj.get("text2_15",this);
			_text2_16 = Obj.get("text2_16",this);

			//
			_chek_0 = Obj.get("chek_0",this);
			_chek_1 = Obj.get("chek_1",this);
			_chek_2 = Obj.get("chek_2",this);
			_chek_3 = Obj.get("chek_3",this);
			_chek_4 = Obj.get("chek_4",this);
			_chek_5 = Obj.get("chek_5",this);
			_chek_6 = Obj.get("chek_6",this);
			_chek_7 = Obj.get("chek_7",this);
			_chek_8 = Obj.get("chek_8",this);
			_chek_9 = Obj.get("chek_9",this);
			//
			_chek_0.addEventListener(MouseEvent.CLICK,_chek_0_fun);
			_chek_1.addEventListener(MouseEvent.CLICK,_chek_1_fun);
			_chek_2.addEventListener(MouseEvent.CLICK,_chek_2_fun);
			_chek_3.addEventListener(MouseEvent.CLICK,_chek_3_fun);
			_chek_4.addEventListener(MouseEvent.CLICK,_chek_4_fun);
			_chek_5.addEventListener(MouseEvent.CLICK,_chek_5_fun);
			_chek_6.addEventListener(MouseEvent.CLICK,_chek_6_fun);
			_chek_7.addEventListener(MouseEvent.CLICK,_chek_7_fun);
			_chek_8.addEventListener(MouseEvent.CLICK,_chek_8_fun);
			_chek_9.addEventListener(MouseEvent.CLICK,_chek_9_fun);

			
			
			
			
			
			
			
			
			
			
			_flag_mc.visible = false
			_email_mc.stop()
			_phone_mc.stop()
			_name_mc.stop()
			_subject_mc.stop()
			_body_mc.stop();
			_send_mc.buttonMode = true ;
			_send_mc.addEventListener(MouseEvent.CLICK,_send_mc_fun)
				
			_email_txt.text = Pic.userManager.profile.EMailAddress
			_phone_txt.text = Pic.userManager.profile.MobileNo
			_name_txt.text = Pic.userManager.profile.FirstName + " " + Pic.userManager.profile.LastName
			_subject_txt.text = 'فراخوان'
			_body_txt.text = '   '
				
			FarsiInputCorrection.setUp(_email_txt)
			FarsiInputCorrection.setUp(_phone_txt,SoftKeyboardType.NUMBER)
			FarsiInputCorrection.setUp(_name_txt)
			FarsiInputCorrection.setUp(_subject_txt)
			FarsiInputCorrection.setUp(_body_txt)
			//
			FarsiInputCorrection.setUp(_text1_1)
			FarsiInputCorrection.setUp(_text1_2)
			FarsiInputCorrection.setUp(_text1_3)
			FarsiInputCorrection.setUp(_text1_4)
			FarsiInputCorrection.setUp(_text1_5)
			FarsiInputCorrection.setUp(_text1_6)
			FarsiInputCorrection.setUp(_text1_7)
			FarsiInputCorrection.setUp(_text1_8)
			FarsiInputCorrection.setUp(_text1_9)
			FarsiInputCorrection.setUp(_text1_10)
			FarsiInputCorrection.setUp(_text1_11)
			FarsiInputCorrection.setUp(_text1_12)
			FarsiInputCorrection.setUp(_text1_13)
			FarsiInputCorrection.setUp(_text1_14)
			FarsiInputCorrection.setUp(_text1_15)
			FarsiInputCorrection.setUp(_text1_16)
			FarsiInputCorrection.setUp(_text1_17)
			FarsiInputCorrection.setUp(_text1_18)
			FarsiInputCorrection.setUp(_text1_19)
			FarsiInputCorrection.setUp(_text1_20)
			FarsiInputCorrection.setUp(_text1_21)
			FarsiInputCorrection.setUp(_text1_22)
			FarsiInputCorrection.setUp(_text2_1)
			FarsiInputCorrection.setUp(_text2_2)
			FarsiInputCorrection.setUp(_text2_3)
			FarsiInputCorrection.setUp(_text2_4)
			FarsiInputCorrection.setUp(_text2_5)
			FarsiInputCorrection.setUp(_text2_6)
			FarsiInputCorrection.setUp(_text2_7)
			FarsiInputCorrection.setUp(_text2_8)
			FarsiInputCorrection.setUp(_text2_9)
			FarsiInputCorrection.setUp(_text2_10)
			FarsiInputCorrection.setUp(_text2_11)
			FarsiInputCorrection.setUp(_text2_12)
			FarsiInputCorrection.setUp(_text2_13)
			FarsiInputCorrection.setUp(_text2_14)
			FarsiInputCorrection.setUp(_text2_15)
			FarsiInputCorrection.setUp(_text2_16)
							
		}
		
		protected function _chek_9_fun(event:MouseEvent):void
		{
			if(_chek_9.currentFrame == 1){
				_chek_9.gotoAndStop(2);
			}else{
				_chek_9.gotoAndStop(1);
			}
		}
		
		protected function _chek_8_fun(event:MouseEvent):void
		{
			if(_chek_8.currentFrame == 1){
				_chek_8.gotoAndStop(2);
			}else{
				_chek_8.gotoAndStop(1);
			}
		}
		
		protected function _chek_7_fun(event:MouseEvent):void
		{
			if(_chek_7.currentFrame == 1){
				_chek_7.gotoAndStop(2);
			}else{
				_chek_7.gotoAndStop(1);
			}
		}
		
		protected function _chek_6_fun(event:MouseEvent):void
		{
			if(_chek_6.currentFrame == 1){
				_chek_6.gotoAndStop(2);
			}else{
				_chek_6.gotoAndStop(1);
			}
		}
		
		protected function _chek_5_fun(event:MouseEvent):void
		{
			if(_chek_5.currentFrame == 1){
				_chek_5.gotoAndStop(2);
			}else{
				_chek_5.gotoAndStop(1);
			}
		}
		
		protected function _chek_4_fun(event:MouseEvent):void
		{
			if(_chek_4.currentFrame == 1){
				_chek_4.gotoAndStop(2);
			}else{
				_chek_4.gotoAndStop(1);
			}
		}
		
		protected function _chek_3_fun(event:MouseEvent):void
		{
			if(_chek_3.currentFrame == 1){
				_chek_3.gotoAndStop(2);
			}else{
				_chek_3.gotoAndStop(1);
			}
		}
		
		protected function _chek_2_fun(event:MouseEvent):void
		{
			if(_chek_2.currentFrame == 1){
				_chek_2.gotoAndStop(2);
			}else{
				_chek_2.gotoAndStop(1);
			}			
		}
		
		protected function _chek_1_fun(event:MouseEvent):void
		{
			if(_chek_1.currentFrame == 1){
				_chek_1.gotoAndStop(2);
			}else{
				_chek_1.gotoAndStop(1);
			}			
		}
		
		protected function _chek_0_fun(event:MouseEvent):void
		{
			if(_chek_0.currentFrame == 1){
				_chek_0.gotoAndStop(2);
			}else{
				_chek_0.gotoAndStop(1);
			}
		}
		
		protected function controlMail():uint
		{
			if(!EmailValidation.check(_email_txt.text)){
				_email_mc.gotoAndStop(2) ;
				_flag_mc.visible = true ;
			}else{
				_email_mc.gotoAndStop(1)
				return 1 
			}
			return 0 ; 
		}
		
		protected function controlPhone():uint
		{
			if(_phone_txt.text == ''){
				_phone_mc.gotoAndStop(2);
				_flag_mc.visible = true;
				return 0 ;
			}else{
				_phone_mc.gotoAndStop(1)
				return 1 ;
			}
		}
		
		protected function controlName():uint
		{
			if(_name_txt.text.split(' ').join('') == ''){
				_name_mc.gotoAndStop(2);
				_flag_mc.visible = true;
				return 0;
			}else{
				_name_mc.gotoAndStop(1);
				return 1 ;
			}
		}
		
		protected function controlSubject():uint
		{
			if(_subject_txt.text == ''){
				_subject_mc.gotoAndStop(2);
				_flag_mc.visible = true;
				return 0 ;
			}else{
				_subject_mc.gotoAndStop(1);
				return 1 ;
			}
		}
		
		protected function controlBody():uint
		{
			if(_body_txt.text == ''){
				_body_mc.gotoAndStop(2);
				_flag_mc.visible = true ;
				return 0 ;
			}else{
				_body_mc.gotoAndStop(1)
				return 1 ;
			}
		}
		
		
		protected function _send_mc_fun(event:MouseEvent):void
		{
			
			var a:int = 0
			a+=controlMail();
			a+=controlPhone();
			a+=controlName();
			a+=controlSubject();
			a+=controlBody();
			
			if(a >= 5){
				Hints.pleaseWait(canselSending);
				if(emailsendcommand)
				{
					emailsendcommand.cansel();
				}
				emailsendcommand = new RegisterQuetion(false,false);
				
				var userId:String ;
				if(Pic.userManager.isLogedIn())
				{
					userId = Pic.userManager.userId ;
				}
				else
				{
					userId = Pic.config.defaultUserIdToSendMessage.toString() ;
				}
				//
				//
				allText = 'مشخصات فیلم \n \r  \t' + _text1_1.text + '\n \r\n \r';
				allText += 'نام فیلم: \n \r   \t' + _text1_1.text + '\n \r \n \r ';
				allText += 'نام فیلم به انگلیسی: \n \r   \t' + _text1_2.text + '\n \r \n \r ';
				allText += 'مدت فیلم: \n \r   \t' + _text1_3.text + '\n \r \n \r ';
				allText += 'قطع: \n \r   \t' + _text1_4.text + '\n \r \n \r ';
				allText += 'سال تولید: \n \r   \t' + _text1_5.text + '\n \r \n \r ';
				allText += 'کارگردان: \n \r   \t' + _text1_6.text + '\n \r \n \r ';
				allText += 'دستیار کارگردان: \n \r   \t' + _text1_7.text + '\n \r \n \r ';
				allText += 'پژوهشگر: \n \r   \t' + _text1_8.text + '\n \r \n \r ';
				allText += 'فیلمبردار/تصویربردار: \n \r   \t' + _text1_9.text + '\n \r \n \r ';
				allText += 'صدابردار: \n \r   \t' + _text1_10.text + '\n \r \n \r ';
				allText += 'صداگذار: \n \r   \t' + _text1_11.text + '\n \r \n \r ';
				allText += 'تدوینگر: \n \r   \t' + _text1_12.text + '\n \r \n \r ';
				allText += 'نویسنده گفتار متن: \n \r   \t' + _text1_13.text + '\n \r \n \r ';
				allText += 'گوینده متن: \n \r   \t' + _text1_14.text + '\n \r \n \r ';
				allText += 'آهنگساز: \n \r   \t' + _text1_15.text + '\n \r \n \r ';
				allText += 'مدیر تولید: \n \r   \t' + _text1_16.text + '\n \r \n \r ';
				allText += 'عکاس: \n \r   \t' + _text1_17.text + '\n \r \n \r ';
				allText += 'مجری طرح: \n \r   \t' + _text1_18.text + '\n \r \n \r ';
				allText += 'تهیه کننده: \n \r   \t' + _text1_19.text + '\n \r \n \r ';
				allText += 'تهیه شده در: \n \r   \t' + _text1_20.text + '\n \r \n \r ';
				allText += 'موضوع: \n \r   \t' + _text1_21.text + '\n \r \n \r ';
				allText += 'خلاصه فیلم: \n \r   \t' + _text1_22.text + '\n \r \n \r ';

				allText += 'مشخصات فیلمساز \n \r   \t' + _text2_1.text + '\n \r \n \r ';
				allText += 'نام و نام خانوادگی: \n \r   \t' + _text2_1.text + '\n \r \n \r ';
				allText += 'نام و نام خانوادگی به انگلیسی: \n \r   \t' + _text2_2.text + '\n \r \n \r ';
				allText += 'تاریخ تولد: \n \r   \t' + _text2_3.text + '\n \r \n \r ';
				allText += 'محل تولد: \n \r   \t' + _text2_4.text + '\n \r \n \r ';
				allText += 'محل اقامت: \n \r   \t' + _text2_5.text + '\n \r \n \r ';
				allText += 'کد ملی: \n \r   \t' + _text2_6.text + '\n \r \n \r ';
				allText += 'میزان تحصیلات: \n \r   \t' + _text2_7.text + '\n \r \n \r ';
				allText += 'تلفن: \n \r   \t' + _text2_8.text + '\n \r \n \r ';
				allText += 'پست الکترونیکی: \n \r   \t' + _text2_9.text + '\n \r \n \r ';
				allText += 'سوابق فیلمسازی: \n \r   \t' + _text2_10.text + '\n \r \n \r ';
				allText += 'جوایز مهم: \n \r   \t' + _text2_11.text + '\n \r \n \r ';
				allText += 'نشانی کارگردان: \n \r   \t' + _text2_12.text + '\n \r \n \r ';
				allText += 'نشانی تهیه کننده: \n \r   \t' + _text2_13.text + '\n \r \n \r ';
				allText += 'تلفن همراه و ثابت تهیه کننده: \n \r \n \r   \t' + _text2_14.text + '\n \r \n \r ';
				allText += 'اینجانب: \n \r   \t' + _text2_15.text + '\n \r \n \r ';
				if(_chek_0.currentFrame == 2){
					allText += 'تهیه کننده: ' + '\n \r ';
				}
				allText += 'فیلم: \n \r   \t' + _text2_16.text + '\n \r \n \r ';
				allText += 'متقاضی شرکت در بخش: \n \r   \t' ;
				if(_chek_1.currentFrame == 2){
					allText += 'سینمایی _ ' ;
				}
				if(_chek_2.currentFrame == 2){
					allText += 'مستند _ ' ;
				}
				if(_chek_3.currentFrame == 2){
					allText += 'فیلم کوتاه _ ' ;
				}
				if(_chek_4.currentFrame == 2){
					allText += 'دانشجویی _ ' ;
				}
				if(_chek_5.currentFrame == 2){
					allText += 'نماهنگ و تیزر _ ' ;
				}
				if(_chek_6.currentFrame == 2){
					allText += 'سریال های داستانی _ ' ;
				}
				if(_chek_7.currentFrame == 2){
					allText += 'بخش فیلم های تلویزیونی _ ' ;
				}
				if(_chek_8.currentFrame == 2){
					allText += 'برنامه های تلویزیونی و گزارش های خبری _ ' ;
				}
				if(_chek_9.currentFrame == 2){
					allText += 'مردمی _ ' ;
				}
				allText += 'هستم.' ;

				//emailsendcommand.load(_email_txt.text,_phone_txt.text,_name_txt.text,_subject_txt.text,allText,userId)
				emailsendcommand.load(_email_txt.text,_phone_txt.text,_name_txt.text,_subject_txt.text,allText,userId)
				emailsendcommand.addEventListener(Event.COMPLETE,emailsendcommand_COMPLETE)
				emailsendcommand.addEventListener(ErrorEvent.ERROR,emailsendcommand_ERROR)
				emailsendcommand.addEventListener(Event.UNLOAD,emailsendcommand_UNLOAD);
			}
		}
		
		private function canselSending(e):void
		{
			emailsendcommand.cansel();
		}
		
		protected function emailsendcommand_UNLOAD(event:Event):void
		{
			Hints.noInternet();
		}
		
		protected function emailsendcommand_ERROR(event:ErrorEvent):void
		{
			Hints.noInternet();
			trace('Server problem‼!!');
		}
		
		protected function emailsendcommand_COMPLETE(event:Event):void
		{
			//this.dispatchEvent(History.lastPage());
			this.dispatchEvent(AppEventContent.lastPage())
			Hints.show('اطلاعات شما با موفقیت ارسال گردید',true,3000);
		}
		
		//'Your information was sent successfully'
		public function setUp(pageData:PageData):void
		{
			scrollAll = new ScrollMT(this,new Rectangle (0,0,PicConst.pagesRect.width,PicConst.pagesRect.height),null,true)

			if(Pic.config.registerToSendMessage && !Pic.userManager.isLogedIn()){
				Hints.show(Contents.lang.t.register_befor_send_file,true,5000);
				
				var linkData:LinkData = new LinkData()
				linkData.id = "register_page"
				linkData.level = 1
				this.dispatchEvent(new AppEventContent(linkData))
			}
			//
		}
	}
}