package DaneshBonyad.ui.pages.home
	//DaneshBonyad.ui.pages.home.HomeSlider
{
	import appManager.displayContent.SliderGallery;
	import appManager.displayContent.SliderImageItem;
	import appManager.displayContentElemets.Image;
	import appManager.displayContentElemets.TitleText;
	import appManager.event.AppEventContent;
	import appManager.event.TitleEvent;
	
	import contents.Contents;
	import contents.LinkData;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import picContest.Pic;
	import picContest.PicConst;
	import picContest.services.types.VSponsor;
	import picContest.services.webCaller.GetSponsors;
	import picContest.services.webCallerNews.GetNews;
	import picContest.ui.elements.PreLoader;
	
	import stageManager.StageManager;
	
	public class HomeSlider extends MovieClip
	{
		private var slideGallery:SliderGallery
		private var myPreLoaderMC:PreLoader ;
		private var images:Vector.<SliderImageItem>;
		private var service_Homeservice:GetNews;
		private var currentsponser:VSponsor;
		private var _title_mc:TitleText ;
		private var _line_mc:MovieClip ;

		
		//private var bottomMC:MovieClip ;
		
		public function HomeSlider()
		{
			super();

			_title_mc = Obj.get("title_mc",this);
			_line_mc = Obj.get("line_mc",this);
			_line_mc.alpha = 0;
			this.addEventListener(Event.REMOVED_FROM_STAGE,removestage)
			myPreLoaderMC = Obj.findThisClass(PreLoader,this);
			slideGallery = Obj.findThisClass(SliderGallery,this);
			//slideGallery.height = (slideGallery.height)+(PicConst.stageDeltaRect.height);
			//trace('{{{{{{{{{{{{{{{{{{{1',(slideGallery.height)+(PicConst.stageDeltaRect.height))
			slideGallery.addEventListener(MouseEvent.CLICK,sliderClicked);
			
			images = new Vector.<SliderImageItem>();
			//
			//bottomMC = Obj.get("bottom_mc",this);
			//trace("1. bottomMC.y: "+bottomMC.y);
			//bottomMC.y = globalToLocal(new Point(0,StageManager.stageVisibleArea.bottom)).y; 
			
			trace("StageManager.stageVisibleArea.bottom : "+StageManager.stageVisibleArea.bottom+' > '+globalToLocal(new Point(0,StageManager.stageVisibleArea.bottom)).y);
			//trace("2. bottomMC.y: "+bottomMC.y);
			
			service_Homeservice = new GetNews(true,false,null);
			service_Homeservice.addEventListener(Event.COMPLETE,loadimage);
			service_Homeservice.addEventListener(Event.CHANGE,loadimage);
			service_Homeservice.addEventListener(Event.UNLOAD,nonet)
			service_Homeservice.load("","160");
			this.dispatchEvent(new TitleEvent(''));

			slideGallery.addEventListener(Event.CHANGE,slideGallery_fun);
		}
		
		protected function slideGallery_fun(event:Event):void
		{
			_title_mc.setUp(service_Homeservice.data[slideGallery.getCurrentSelectedImage()].Title,true);
			this.dispatchEvent(new TitleEvent(''));

		}		
		
		
		protected function sliderClicked(event:MouseEvent):void
		{
			var selectedLink:uint = slideGallery.getCurrentSelectedImage() ;
			if(slideGallery.getCurrentSelectedImage()<service_Homeservice.data.length)
			{
				//if(service_Homeservice.data[selectedLink].Description!='')
				//{
				//	navigateToURL(new URLRequest(service_Homeservice.data[selectedLink].Description));
				//}
			}
			trace('FFFFFFFFFFFFFFFFF',slideGallery.getCurrentSelectedImage());
			
			Pic.newsManager.selectThisNews(service_Homeservice.data[selectedLink]);
			var loginPageLink:LinkData = new LinkData() ;
			loginPageLink.id = 'news_content_page' ;
			this.dispatchEvent(new AppEventContent(loginPageLink));


			
		}
		
		
		public function loadimage(evt:Event)
		{

			_line_mc.alpha = .40;
			this.dispatchEvent(new TitleEvent(''));

			trace('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>??????????????????????',service_Homeservice.data.length);
			if (service_Homeservice.data.length>0)
			{
				activateButton();
				for ( var i:uint=0; i<service_Homeservice.data.length;i++)
				{
					images.push(new SliderImageItem(service_Homeservice.data[i].getImage(0)));
				}
			}
			slideGallery.setUp(images,0,3500);
			_title_mc.setUp(service_Homeservice.data[0].Title,true);
		}
		
		public function nonet(evt:Event)
		{
			service_Homeservice.reLoad(5000)
			activateButton();
		}
		
		private function activateButton():void
		{
			myPreLoaderMC.visible = false ;
	
		}

		
		protected function imageChanged(event:Event):void
		{
			if(slideGallery.getCurrentSelectedImage()==4)
			{
				slideGallery.setUp(images);
			}
		}
		//
		public function removestage(evt:Event):void
		{
			service_Homeservice.removeEventListener(Event.UNLOAD,nonet)
			service_Homeservice.removeEventListener(Event.COMPLETE,loadimage)
			service_Homeservice.cansel()
		}

	}
}
