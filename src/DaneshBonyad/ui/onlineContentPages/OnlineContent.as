package DaneshBonyad.ui.onlineContentPages
	//JashnvareSalamat.ui.pages.onlineContentPages.OnlineContent
{
	import appManager.event.AppEventContent;
	
	import contents.PageData;
	import contents.displayPages.ParagData;
	import contents.displayPages.ParagPage;
	import contents.interFace.DisplayPageInterface;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import picContest.PicConst;
	import picContest.services.types.VPageContent;
	import picContest.services.webCaller.GetPageData;
	import picContest.ui.elements.PreLoader;
	
	public class OnlineContent extends MovieClip implements DisplayPageInterface
	{
		
		public static var rang:uint = 0x8D714F;
		
		private var myPreLoader:PreLoader ;
		
		private var service_getpage:GetPageData ;
		
		private var paragPage:ParagPage ;
		
		private const margin:Number = 40 ;
		
		public function OnlineContent()
		{
			super();
			
			myPreLoader = Obj.findThisClass(PreLoader,this);
			
			paragPage = Obj.findThisClass(ParagPage,this);
		}
		
		public function setUp(pageData:PageData):void
		{
			service_getpage = new GetPageData(true,true);
			service_getpage.addEventListener(Event.COMPLETE,contentLoaded);
			service_getpage.addEventListener(Event.CHANGE,contentLoaded);
			service_getpage.addEventListener(Event.UNLOAD,cannotUpdateContent);
			
			service_getpage.load(pageData.content);
			
			myPreLoader.x = PicConst.pagesRect.width/2;
			myPreLoader.y = PicConst.pagesRect.height/2;
			
			this.addEventListener(Event.REMOVED_FROM_STAGE,unLoad);
		}
		protected function cannotUpdateContent(event:Event):void
		{
			// TODO Auto-generated method stub
			Hints.noInternet();
			this.dispatchEvent(AppEventContent.lastPage());
		}
		
		protected function contentLoaded(event:Event,newRect:Rectangle=null):void
		{
			myPreLoader.visible = false ;
			trace("Server Content loaded");
			
			var paragContent:VPageContent ;
			
			var parags:Vector.<ParagData> = new Vector.<ParagData>();
			
			for(var i = 0 ; i<service_getpage.data.length ; i++)
			{
				paragContent = service_getpage.data[i] ;
				var paragText:String ='';
				if(paragContent.Paragraph!='')
				{
					paragText = paragContent.Paragraph+' ';
				}
				parags.push(new ParagData(paragText,paragContent.imageURL));
				trace(parags[parags.length-1]);
			}
			
			var paragRect:Rectangle ;
			if(newRect!=null)
			{
				paragRect = newRect.clone();
			}
			else
			{
				paragRect = PicConst.pagesRect;
			}
			//paragRect.top += paragPage.y;

			paragRect.width -= margin*2 +13;
			paragRect.height-=paragPage.y;
			paragPage.x = margin;
			paragPage.setUpParag(paragRect,parags,true,rang);
		}
		
		protected function unLoad(event:Event):void
		{
			// TODO Auto-generated method stub
			service_getpage.removeEventListener(Event.COMPLETE,contentLoaded);
			service_getpage.removeEventListener(Event.CHANGE,contentLoaded);
			service_getpage.removeEventListener(Event.UNLOAD,cannotUpdateContent);
		}
	}
}