package DaneshBonyad.ui
{//DaneshBonyad.ui.BellowLink
	import contents.PageData;
	import contents.interFace.DisplayPageInterface;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	public class BellowLink extends MovieClip implements DisplayPageInterface
	{
		private var _telegram_mc:MovieClip ;
		private var _web_mc:MovieClip ;

		public function BellowLink()
		{
			super();
			_telegram_mc = Obj.get("telegram_mc",this);
			_telegram_mc.buttonMode = true;
			_telegram_mc.addEventListener(MouseEvent.CLICK,_telegram_mc_fun);
			_web_mc = Obj.get("web_mc",this);
			_web_mc.buttonMode = true;
			_web_mc.addEventListener(MouseEvent.CLICK,_web_mc_fun);

		}
		
		protected function _web_mc_fun(event:MouseEvent):void
		{
			navigateToURL(new URLRequest("http://iransaakht.ir/Pages/home.aspx"), "_blank");
		}
		
		protected function _telegram_mc_fun(event:MouseEvent):void
		{
			//navigateToURL(new URLRequest("http://www.google.com/"), "_blank");
		}
		
		public function setUp(pageData:PageData):void
		{
		}
	}
}