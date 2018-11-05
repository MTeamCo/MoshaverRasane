package DaneshBonyad.ui.pages
{//JashnvareSalamat.ui.pages.Link_toSlider
	import appManager.event.AppEventContent;
	
	import contents.PageData;
	import contents.interFace.DisplayPageInterface;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	public class Link_toSlider extends MovieClip implements DisplayPageInterface
	{
		private var _download_mc:MovieClip;

		
		public function Link_toSlider()
		{
			super();
			_download_mc = Obj.get("download_mc",this);
			_download_mc.addEventListener(MouseEvent.CLICK,_download_mc_fun);

		}
		
		protected function _download_mc_fun(event:MouseEvent):void
		{
			navigateToURL(new URLRequest("http://vezarat.smtinfo.ir/component/rppams/?task=download.getfile"), "_blank");
			
		}
		
		public function setUp(pageData:PageData):void
		{
			//this.dispatchEvent(AppEventContent.lastPage());
		}
	}
}