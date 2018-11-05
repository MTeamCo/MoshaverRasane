package DaneshBonyad.ui.pages
	//DaneshBonyad.ui.pages.InlineURL
{
	import appManager.event.TitleEvent;
	
	import contents.PageData;
	import contents.interFace.PageContentBaseClass;
	
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.media.StageWebView;
	
	import picContest.Pic;
	import picContest.PicConst;
	import picContest.ui.elements.PreLoader;
	
	import stageManager.StageManager;
	
	public class InlineURL extends PageContentBaseClass
	{
		private static var sw:StageWebView ;
		
		public function InlineURL()
		{
			super();
			this.graphics.beginFill(0xff0000,0);
			this.graphics.drawRect(PicConst.pagesRect.x,PicConst.pagesRect.y,PicConst.pagesRect.width,PicConst.pagesRect.height);
		}
		
		override public function setUp(pageData:PageData):void
		{
			if(sw==null)
			{
				sw = new StageWebView()
			}
			
			trace('swwwwwwwwwwwwwwwwwwwwwwwww :',sw)
			//sw.stage = this.stage ;
			this.dispatchEvent(new TitleEvent('لطفا صبر کنید ...'));	
			
			
			sw.addEventListener(Event.COMPLETE,sw_complate_fun);
			//updatePageView();
			this.addEventListener(Event.ENTER_FRAME,updatePageView);
			this.addEventListener(Event.REMOVED_FROM_STAGE,unLoad);
			var stageRect:Rectangle = new Rectangle(14,this.getBounds(stage).y,737,PicConst.pagesRect.height);
			sw.stage = this.stage ;
			sw.viewPort = stageRect ;
			sw.loadURL(DaneshBonian.Adres);
			trace('VVVVVVVVVVVVVV:',DaneshBonian.Adres);
		}
		
		protected function sw_complate_fun(event:Event):void
		{
			this.dispatchEvent(new TitleEvent('نقشه راه ارزیابی و حمایت'));	

		}
		
		protected function unLoad(event:Event):void
		{
			this.removeEventListener(Event.ENTER_FRAME,updatePageView);
			this.removeEventListener(Event.REMOVED_FROM_STAGE,unLoad);
			sw.stage = null ;
			sw.dispose();
			sw = null ;
		}
		
		private function updatePageView(e:*=null):void
		{
			// TODO Auto Generated method stub
			//var stageRect:Rectangle = this.getBounds(stage);
			//sw.viewPort = stageRect ;
			
			if(Obj.isAccesibleByMouse(this))
			{
				sw.stage = stage ;
			}
			else
			{
				sw.stage = null ;
			}
		}
	}
}