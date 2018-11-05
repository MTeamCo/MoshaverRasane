package DaneshBonyad.ui.pages
{//DaneshBonyad.ui.pages.EmailSendExtended
	import appManager.event.AppEventContent;
	
	import contents.LinkData;
	
	import flash.display.MovieClip;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	public class EmailSendExtended extends EmailSend
	{
		private var __send_mc:MovieClip ;
		private var __preloader_mc:MovieClip ;
		private var __body_txt:TextField ;
		private var __subject_txt:TextField ;

		public function EmailSendExtended()
		{

			super();
			__send_mc = Obj.get("send_mc",this);
			__body_txt = Obj.get("body_txt",this);
			__subject_txt = Obj.get("subject_txt",this);

			__send_mc.addEventListener(MouseEvent.CLICK,_send_mc2_fun)

			__preloader_mc = Obj.get("preloader_mc",this);
			__preloader_mc.visible = false;
		}
		
		
		protected function _send_mc2_fun(event:MouseEvent):void
		{
			if (__body_txt.text !="" && __subject_txt.text !="")
			{
				__send_mc.visible = false;
				__preloader_mc.visible = true;
			}
		}
		override protected function emailsendcommand_UNLOAD(event:Event):void
		{
			Hints.show('ارتباط شما با اینترنت قطع شده است',true,3000);
			__send_mc.visible = true;
			__preloader_mc.visible = false;

		}
		
		override protected function emailsendcommand_ERROR(event:ErrorEvent):void
		{
			Hints.show('خطا در ارسال پیغام',true,3000);
			__send_mc.visible = true;
			__preloader_mc.visible = false;
		}
		
		override protected function emailsendcommand_COMPLETE(event:Event):void
		{
			Hints.show('اطلاعات شما با موفقیت ارسال گردید',true,3000);
			__send_mc.visible = true;
			__preloader_mc.visible = false;
			
			var linkdata:LinkData = new LinkData();
			linkdata.id = 'home';
			linkdata.level = 1;
			this.dispatchEvent(new AppEventContent(linkdata));

		}

		
	}
}