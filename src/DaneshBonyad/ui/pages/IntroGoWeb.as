package DaneshBonyad.ui.pages
{//JashnvareSalamat.ui.pages.IntroGoWeb
	import contents.PageData;
	import contents.interFace.DisplayPageInterface;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	public class IntroGoWeb extends MovieClip implements DisplayPageInterface
	{
		public var _goweb_mc:MovieClip ;

		public function IntroGoWeb()
		{
			super();
			_goweb_mc = Obj.get("goweb",this);
			_goweb_mc.addEventListener(MouseEvent.CLICK,_goweb_mc_fun);
			_goweb_mc.buttonMode = true;

		}
		
		public function setUp(pageData:PageData):void
		{	
		}

		protected function _goweb_mc_fun(event:MouseEvent):void
		{
			navigateToURL(new URLRequest("http://farhang.isti.ir/"), "_blank");

		}
	}
}