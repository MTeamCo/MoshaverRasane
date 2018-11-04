package ui.page
	//ui.page.DarkhastKHabargozari
{
	import appManager.event.AppEventContent;
	
	import componentStatic.EmailValidation;
	
	import contents.Contents;
	import contents.History;
	import contents.LinkData;
	import contents.PageData;
	import contents.interFace.PageContentBaseClass;
	
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.ReturnKeyLabel;
	import flash.text.SoftKeyboardType;
	import flash.text.TextField;
	
	import picContest.Pic;
	import picContest.PicConst;
	import picContest.services.webCaller.RegisterQuetion;
	
	import popForm.PopButton;
	import popForm.PopField;
	
	
	public class DarkhastKHabargozari extends PageContentBaseClass
	{
		public var f_subjectMC:PopField,
		f_emailMC:PopField,
		f_phoneMC:PopField,
		f_nameMC:PopField,
		
		f_textMC:PopField ;
		
		public var allFieldsTogather:Array ;
		
		
		public var sendMC:PopButton ;
		
		private var service_emailsendcommand:RegisterQuetion;
		
		private var scrollMT:ScrollMT ;
		
		public function DarkhastKHabargozari()
		{
			super();
			f_subjectMC = Obj.get("subject_mc",this);
			f_emailMC = Obj.get("email_mc",this);
			f_phoneMC = Obj.get("phone_mc",this);
			f_nameMC = Obj.get("name_mc",this);
			f_textMC = Obj.get("text_mc",this);
			
			allFieldsTogather = [] ;
			addFieldsToList(f_subjectMC);
			addFieldsToList(f_emailMC);
			addFieldsToList(f_phoneMC);
			addFieldsToList(f_nameMC);
			addFieldsToList(f_textMC);
			
			sendMC = Obj.get("send_mc",this);
			
			scrollMT = new ScrollMT(this,PicConst.pagesRect,null,true);
			
			this.graphics.beginFill(0xffffff,0);
			this.graphics.drawRect(0,0,PicConst.pagesRect.width,this.height);
		}
		private function addFieldsToList(myField:PopField):void
		{
			// TODO Afuto Generated method stub
			if(myField)
			{
				allFieldsTogather.push(myField);
			}
		}
		
		override public function setUp(pageData:PageData):void
		{
			if(Pic.config.registerToSendMessage && !Pic.userManager.isLogedIn()){
				Hints.show(Contents.lang.t.register_befor_send_file,true,5000);
				
				var linkData:LinkData = new LinkData()
				linkData.id = "register_page"
				linkData.level = 1
				this.dispatchEvent(new AppEventContent(linkData))
			}
			else
			{
				f_subjectMC.setUp(Contents.lang.t.send_mail_subject,'می خواهم خبرگزار باشم',SoftKeyboardType.DEFAULT,false,true,true,1,1,1,0,null,false,false,ReturnKeyLabel.NEXT,selectNextField);
				f_emailMC.setUp(Contents.lang.t.send_mail_emaol,Pic.userManager.profile.EMailAddress,SoftKeyboardType.EMAIL,false,true,true,1,1,1,0,null,false,false,ReturnKeyLabel.NEXT,selectNextField);
				f_phoneMC.setUp(Contents.lang.t.send_mail_phone,Pic.userManager.profile.MobileNo,SoftKeyboardType.NUMBER,false,true,true,1,1,1,0,null,false,false,ReturnKeyLabel.NEXT,selectNextField);
				f_nameMC.setUp(Contents.lang.t.send_mail_name,Pic.userManager.profile.fullName(),SoftKeyboardType.DEFAULT,false,true,true,1,1,1,0,null,false,false,ReturnKeyLabel.NEXT,selectNextField);
				f_textMC.setUp(Contents.lang.t.send_mail_text,'',SoftKeyboardType.DEFAULT,false,true,true,3,1,1,0,null,false,false,ReturnKeyLabel.NEXT);
				
				sendMC.setUp(Contents.lang.t.send_mail_submit);
				
				sendMC.addEventListener(MouseEvent.CLICK,sendTheLetter);
			}
		}
		
		
		private function selectNextField(doneField:TextField):void
		{
			trace("Open the next textField"+doneField.parent.name);
			var currentField:PopField ;
			for(var i = 0 ; i<allFieldsTogather.length ; i++)
			{
				currentField = allFieldsTogather[i] as PopField ;
				trace("currentField  : "+currentField.name)
				if(currentField.textField == doneField)
				{
					trace("\tFounded");
					if(i<allFieldsTogather.length-1)
					{
						(allFieldsTogather[i+1] as PopField).activateKeyBoard();
					}
					else
					{
						sendTheLetter(null);
					}
					return ;
				}
			}
		}
		
		/**Returns true if mail was ok*/
		protected function controlMail():Boolean
		{
			if(EmailValidation.check(f_emailMC.text)){
				return true ;
			}
			f_emailMC.colorChange(2);
			return false ; 
		}
		
		/**Returns true if the phone was correct*/
		protected function controlPhone():Boolean
		{
			if(PhoneNumberEditor.clearPhoneNumber(f_phoneMC.text)=='false'){
				f_phoneMC.colorChange(2);
				return false ;
			}
			return true ;
		}
		
		/**Returns true if he name was entered*/
		protected function controlName():Boolean
		{
			if(f_nameMC.text==''){
				f_nameMC.colorChange(2);
				return false;
			}
			return true ;
		}
		
		/**Returns true if the subject was entered*/
		protected function controlSubject():Boolean
		{
			if(f_subjectMC.text == ''){
				f_subjectMC.colorChange(2);
				return false ;
			}
			return true ;
		}
		
		/**Return true if the body was entered*/
		protected function controlTextBody():Boolean
		{
			if(f_textMC.text == ''){
				f_textMC.colorChange(2);
				return false ;
			}
			return true ;
		}
		
		/**Send the letter*/
		protected function sendTheLetter(event:MouseEvent):void
		{
			f_emailMC.colorChange(1);
			f_nameMC.colorChange(1);
			f_phoneMC.colorChange(1);
			f_subjectMC.colorChange(1);
			f_textMC.colorChange(1);
			
			if(controlMail() && controlPhone() && controlName() && controlSubject() && controlTextBody())
			{
				Hints.pleaseWait(canselSending);
				if(service_emailsendcommand)
				{
					service_emailsendcommand.cansel();
				}
				service_emailsendcommand = new RegisterQuetion(false,false);
				
				var userId:String ;
				if(Pic.userManager.isLogedIn())
				{
					userId = Pic.userManager.userId ;
				}
				else
				{
					userId = Pic.config.defaultUserIdToSendMessage.toString() ;
				}
				
				service_emailsendcommand.load(f_emailMC.text,f_phoneMC.text,f_nameMC.text,f_subjectMC.text,f_textMC.text,userId)
				service_emailsendcommand.addEventListener(Event.COMPLETE,emailsendcommand_COMPLETE)
				service_emailsendcommand.addEventListener(ErrorEvent.ERROR,emailsendcommand_ERROR)
				service_emailsendcommand.addEventListener(Event.UNLOAD,emailsendcommand_UNLOAD);
			}
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
			Hints.show(Contents.lang.t.send_mail_success,true,5000,backToLastPage);
		}
		
		private function backToLastPage():void
		{
			this.dispatchEvent(History.lastPage());
		}
		
		private function canselSending(e):void
		{
			service_emailsendcommand.cansel();
		}
	
	}
	
}