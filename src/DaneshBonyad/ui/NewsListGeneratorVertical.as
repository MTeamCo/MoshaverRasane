
package DaneshBonyad.ui
	//ui.oxygen.NewsListGeneratorVertical
{
	import contents.LinkData;
	import contents.PageData;
	import contents.displayPages.DynamicLinks;
	
	import flash.events.Event;
	import flash.system.System;
	
	import mx.preloaders.Preloader;
	
	import picContest.Pic;
	import picContest.services.webCallerNews.GetNews;
	
	import webService.webCallers.WebServiceCaller;
	
	/**Web service loaded completly*/
	[Event(name="complete", type="flash.events.Event")]
	/**No new available*/
	[Event(name="unload", type="flash.events.Event")]
	public class  NewsListGeneratorVertical extends DynamicLinks
	{
		private var service_getNews:GetNews ;
		
		private var sesrvice_getOtherNews:GetNews ;
		
		private var newsIndex:uint,
		newsPageSize:uint=50;
		
		private var newsLoaderPreLoader:Preloader ;
		
		private var currentTitle:String,
		currentBaseId:String,
		currentSearchOrder:String,
		currentIsSpecial:String;
		
		private var currentBaseIds:Array ;
		
		private var excludedBaseIDArray:Array ;
		
		private var savedPageData:PageData ;
		
		public function  NewsListGeneratorVertical()
		{
			super();
			
			savedPageData = new PageData();
			
			myDeltaY = 0 ;
			
			newsLoaderPreLoader = new Preloader();
			newsLoaderPreLoader.visible = true ;
			
			newsIndex = 0 ;
			
			setTheService();
			
			this.addEventListener(Event.REMOVED_FROM_STAGE,unLoad);
		}
		
		public function setTheService(cashTheResult:Boolean=true):void
		{
			if(service_getNews)
			{
				service_getNews.cansel();
				service_getNews.removeEventListener(Event.COMPLETE,newsReady);
				service_getNews.removeEventListener(Event.CHANGE,newsReady);
				service_getNews.removeEventListener(Event.UNLOAD,reloadeService);
			}
			if(Pic.config.webServiceCashTimeout>0)
			{
				var storageDate:Date = new Date();
				storageDate.minutes -= Pic.config.webServiceCashTimeout ;
				service_getNews = new GetNews(cashTheResult,true,storageDate);
			}
			else
			{
				service_getNews = new GetNews(cashTheResult,false,null);
			}
			service_getNews.addEventListener(Event.COMPLETE,newsReady);
			service_getNews.addEventListener(Event.CHANGE,newsReady);
			service_getNews.addEventListener(Event.UNLOAD,reloadeService);
		}
		
		private function reloadeService(e:Event):void
		{
			(e.currentTarget as WebServiceCaller).reLoad();
		}
		
		protected function unLoad(event:Event):void
		{
			// TODO Auto-generated method stub
			service_getNews.cansel();
			if(sesrvice_getOtherNews)
			{
				sesrvice_getOtherNews.cansel();
			}
		}
		
		override public function setUp(pageData:PageData):void
		{
			trace("*** *** ***** Load the news");
			savedPageData = pageData;
			setUp2();
			//super.setUp(pageData);
		}
		
		/**You can set more than one newsBase Id with , between ids : 1,2,12,...*/
		public function setUp2(newsTitle:String='',newsBaseId:String='0',searchOrder:String=null,isSpecial:String='',excludedBaseIds:Array=null,pageDataForUsintPageId:PageData=null):void
		{
			if(pageDataForUsintPageId!=null)
			{
				savedPageData = pageDataForUsintPageId ;
			}
			excludedBaseIDArray = excludedBaseIds ;
			// TODO Auto Generated method stub
			if(searchOrder==null)
			{
				searchOrder = GetNews.sort_date ;
			}
			currentTitle = newsTitle ;
			currentBaseIds = newsBaseId.split(',');
			if(currentBaseIds.length<=1)
			{
				currentBaseId = newsBaseId ;
			}
			else
			{
				currentBaseId = '0';
			}
			currentSearchOrder = searchOrder ;
			currentIsSpecial = isSpecial ;
			service_getNews.load(currentTitle,currentBaseId,newsIndex,newsPageSize,currentIsSpecial,currentSearchOrder);
		}
		
		protected function newsReady(event:Event):void
		{
			if(sesrvice_getOtherNews)
			{
				sesrvice_getOtherNews.cansel();
			}
			newsIndex = newsPageSize ;
			
			sesrvice_getOtherNews = new GetNews(true,false);
			sesrvice_getOtherNews.addEventListener(Event.COMPLETE,otherNewsLoaded);
			sesrvice_getOtherNews.addEventListener(Event.UNLOAD,reloadeService);
			
			var firstNews:PageData = service_getNews.pageData(excludedBaseIDArray,currentBaseIds) ;
			firstNews.id = savedPageData.id ;
			trace("+++++++++++++++++++++++++News length are : "+firstNews.links1.length);
			
			super.setUp(firstNews);
			if(firstNews.links1.length >= newsPageSize)
			{
				canGetMore(getMoreNewsLinks,newsLoaderPreLoader);
			}
			
			this.dispatchEvent(new Event(Event.COMPLETE));
			if(firstNews.links1.length==0)
			{
				//No news
				this.dispatchEvent(new Event(Event.UNLOAD));
			}
		}
		
		private function getMoreNewsLinks():void
		{
			sesrvice_getOtherNews.load(currentTitle,currentBaseId,newsIndex,newsPageSize);
		}
		
		protected function otherNewsLoaded(event:Event):void
		{
			// TODO Auto-generated method stub
			newsIndex += newsPageSize ;
			var newLinks:Vector.<LinkData> = sesrvice_getOtherNews.pageData().links1 ;
			super.addLink(newLinks);
			if(newLinks.length<newsPageSize)
			{
				noMoreLinks();
			}
			else
			{
				canGetMore(getMoreNewsLinks,newsLoaderPreLoader);
			}
		}
	}
}