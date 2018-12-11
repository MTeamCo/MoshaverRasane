package ui.page
	//ui.page.NewsListGeneratorKHabargozar
{
	import Aroos.ui.pages.search.SearchPhotographerLinkItem;
	
	import appManager.event.AppEvent;
	import appManager.event.AppEventContent;
	import appManager.event.TitleEvent;
	
	import contents.Contents;
	import contents.LinkData;
	import contents.PageData;
	import contents.alert.Alert;
	import contents.displayPages.DynamicLinks;
	import contents.displayPages.LinkItem;
	
	import flash.desktop.NativeApplication;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.system.System;
	import flash.utils.setTimeout;
	
	import picContest.Pic;
	import picContest.services.types.VNews;
	import picContest.services.types.VUser;
	import picContest.services.webCallerNews.GetNews;
	import picContest.ui.elements.PreLoader;
	
	import stageManager.StageManager;
	
	import webService.webCallers.WebServiceCaller;
	
	/**Web service loaded completly*/
	[Event(name="complete", type="flash.events.Event")]
	/**No new available*/
	[Event(name="unload", type="flash.events.Event")]
	/**Starts to reload*/
	[Event(name="activate", type="flash.events.Event")]
	public class NewsListGeneratorKHabargozar extends DynamicLinks
	{
		public static const dispatcher:EventDispatcher = new EventDispatcher();
		
		public static var justOflineData:Boolean = true ;
		
		protected var service_getNews:GetNews ;
		
		/**This is the first news data. I have to controll it with new news list for chanes*/
		private var cashedFirstNewsData:VNews,
		cashedTotalNews:uint;
		private var Onlylikedstring:String;
		public var sesrvice_getOtherNews:GetNews ;
		
		public var newsIndex:uint,
		newsPageSize:uint=50;
		
		public var filterOnList:String = '' ;
		
		public var newsLoaderPreLoader:PreLoader ;
		
		public var currentTitle:String,
		currentBaseId:String,
		currentSearchOrder:String,
		currentIsSpecial:String;
		
		public static var currentBaseIds:Array = [];
		
		public var excludedBaseIDArray:Array ;
		
		public var savedPageData:PageData ;
		/**Used to store the news list ids*/
		private var lastNewsListId:String;
		
		private var data:VUser;
		
		
		/** videoFilter: 0>no difrent, 1>Only news those had video, 2>Only news whith out videos*/
		public var VideoFilter:uint;
		
		/**Private function make it open the first link if it was unique*/
		public var openTheUniqeOne:Boolean = false ;
		public function NewsListGeneratorKHabargozar()
		{
			super();
			iconsPerLine = 1;
			//iconsPerLine = 2;
			
			//setRevertListX = true;
			
			savedPageData = new PageData();
			
			//myDeltaY = 0 ;
			
			newsLoaderPreLoader = new PreLoader();
			newsLoaderPreLoader.visible = true ;
			
			newsIndex = 0 ;
			
			setTheService();
			
			this.addEventListener(Event.REMOVED_FROM_STAGE,unLoad);
			this.addEventListener(AppEvent.PAGE_CHANGES,controllNextLevelLink);
		}
		
		
		
		public static function getCurrentBaseIds():Array
		{
			return currentBaseIds.concat();
		}
		
		protected function controllNextLevelLink(event:AppEventContent):void
		{
			if(savedPageData.links2.length>0 && savedPageData.id != Contents.homeID)
			{
				event.stopImmediatePropagation();
				var newsLink:LinkData = event.linkData.clone();
				newsLink.id = savedPageData.links2[0].id ;
				this.parent.dispatchEvent(new AppEventContent(newsLink));
			}
		}
		
		public function setTheService(cashTheResult:Boolean=true):void
		{
			if(service_getNews)
			{
				deleteGentNewsEvents();
			}
			if(Pic.config.webServiceCashTimeout>0)
			{
				var storageDate:Date = new Date();
				storageDate.minutes -= Pic.config.webServiceCashTimeout ;
				service_getNews = new GetNews(cashTheResult,justOflineData,storageDate);
			}
			else
			{
				service_getNews = new GetNews(cashTheResult,true,null);
			}
			service_getNews.addEventListener(Event.CONNECT,removePreLoader);
			service_getNews.addEventListener(Event.COMPLETE,newsReady);
			service_getNews.addEventListener(Event.CHANGE,newsChangesReady);
			service_getNews.addEventListener(Event.UNLOAD,reloadeService);
			
			
			this.addEventListener(RELOAD_REQUIRED,reloadNews);
			NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE,reloadNews);
		}
		
		/**Cansel and delete last getNews Servcie*/
		private function deleteGentNewsEvents():void
		{
			//service_getNews.cansel();
			service_getNews.removeEventListener(Event.COMPLETE,newsReady);
			service_getNews.removeEventListener(Event.CHANGE,newsChangesReady);
			service_getNews.removeEventListener(Event.CONNECT,removePreLoader);
			service_getNews.removeEventListener(Event.UNLOAD,reloadeService);			
		}
		
		/**Server response*/
		protected function removePreLoader(event:Event):void
		{
			//Dispatch complete event to remove preloader icon
			dispatchCompleteEvent();
			if(filterOnList=='' && service_getNews.data.length==0 && service_getNews.connected)
			{
				this.dispatchEvent(new Event(Event.UNLOAD));
			}
			else if(openTheUniqeOne && service_getNews.connected && service_getNews.data.length == 1){
				var link:LinkData = new LinkData();
				link.id = Pic.config.news_content_page_id ;
				link.level = -2;
				Pic.newsManager.selectThisNews(service_getNews.data[0]);
				this.dispatchEvent(new AppEventContent(link));
			}
			else
			{
				this.visible = true ;
			}
		}
		
		/**Reload the list again*/
		protected function reloadNews(event:Event):void
		{
			if(sesrvice_getOtherNews)
			{
				sesrvice_getOtherNews.cansel();
			}
			//noMoreLinks();
			this.dispatchEvent(new Event(Event.ACTIVATE));
			trace("NEw index reset");
			
			//Reset the service
			
			deleteGentNewsEvents();
			
			service_getNews = new GetNews(true,false,null);
			service_getNews.addEventListener(Event.COMPLETE,newsChangesReady);
			service_getNews.addEventListener(Event.CONNECT,removePreLoader);
			loadFirstNewsRequest();
		}
		
		/**News list updated*/
		private function newsChangesReady(e:Event):void
		{
			trace("Updated");
			dispatchCompleteEvent();
			var lastScrollEffectStatus:Boolean = ScrollMT.lastScrollEffect();
			ScrollMT.showScrollEfect(false);
			trace("Loaded news are : "+service_getNews.data);
			var newsListId:String = service_getNews.generateUniqueIdForList();
			if(newsListId!=lastNewsListId)
			{
				lastNewsListId = newsListId ;
				newsReady(e);
			}
			else
			{
				trace("News not changed");
			}
			if(filterOnList == '' && service_getNews.data.length==0 && service_getNews.connected)
			{
				this.dispatchEvent(new Event(Event.UNLOAD));
			}
			
			if(openTheUniqeOne && service_getNews.connected && service_getNews.data.length == 1){
				var link:LinkData = new LinkData();
				link.id = Pic.config.news_content_page_id ;
				link.level = -2;
				Pic.newsManager.selectThisNews(service_getNews.data[0]);
				this.dispatchEvent(new AppEventContent(link));
			}
			ScrollMT.showScrollEfect(lastScrollEffectStatus);
		}
		
		private function reloadeService(e:Event):void
		{
			if(service_getNews.data==null || service_getNews.data.length==0)
			{
				(e.currentTarget as WebServiceCaller).reLoad(5000);
			}
			else
			{
				(e.currentTarget as WebServiceCaller).reLoad();
				dispatchCompleteEvent();
			}
		}
		
		protected function unLoad(event:Event):void
		{
			// TODO Auto-generated method stub
			currentBaseIds = [] ;
			//service_getNews.cansel();
			deleteGentNewsEvents();
			if(sesrvice_getOtherNews)
			{
				sesrvice_getOtherNews.cansel();
			}
			NativeApplication.nativeApplication.removeEventListener(Event.ACTIVATE,reloadNews);
		}
		
		override public function setUp(pageData:PageData):void
		{
			
			//data = pageData.dynamicData as VUser;
			//this.dispatchEvent(new TitleEvent(data.UserTitle));
			trace("*** *** ***** Load the news");
			myPageData = savedPageData = pageData;
			setUp2();
		}
		
		/**You can set more than one newsBase Id with , between ids : 1,2,12,...<br>
		 * videoFilter: 0>no difrent, 1>Only news those had video, 2>Only news whith out videos*/
		public function setUp2(newsTitle:String='',newsBaseId:String='0',searchOrder:String=null,isSpecial:String='',excludedBaseIds:Array=null,pageDataForUsintPageId:PageData=null,orderDirection:String=GetNews.direction_desc,onlyReturnMyFavorite:Boolean=false,videoFilter:uint=0):void
		{
			if(openTheUniqeOne)
			{
				this.visible = false ;
			}
			VideoFilter = videoFilter;
			myfavorite = onlyReturnMyFavorite ;
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
			if(newsBaseId==null)
			{
				newsBaseId = '0' ;
			}
			currentBaseIds = newsBaseId.split(',');
			if(currentBaseIds.length<=1)
			{
				currentBaseId = newsBaseId ;
			}
			else
			{
				currentBaseId = '0';
			}
			
			dispatcher.dispatchEvent(new Event(Event.CHANGE));
			
			currentSearchOrder = searchOrder ;
			currentIsSpecial = isSpecial ;
			currentOrderDirection = orderDirection ;
			loadFirstNewsRequest();
		}
		
		public function loadFirstNewsRequest():void
		{
			
			service_getNews.load(currentTitle,currentBaseId,0,newsPageSize,currentIsSpecial,currentSearchOrder,currentOrderDirection,myfavorite,LinkItemKHabargozaran.userid);
		}
		
		/**Filtere the news list on this string*/
		public function filter(filterListOn:String=''):void
		{
			trace("Filter list by this : "+filterListOn);
			filterOnList = filterListOn ;
			currentTitle = UnicodeStatic.KaafYe(filterOnList) ;
			
			showList(true);
			loadFirstNewsRequest();
		}
		
		protected function newsReady(event:Event):void
		{
			if(filterOnList=='' && openTheUniqeOne /*&& service_getNews.connected*/ && service_getNews.data.length == 1){
				var link:LinkData = new LinkData();
				link.id = Pic.config.news_content_page_id ;
				link.level = -2;
				Pic.newsManager.selectThisNews(service_getNews.data[0]);
				this.dispatchEvent(new AppEventContent(link));
				return ;
			}
			
			if(service_getNews.data.length==0)
			{
				trace("service_getNews.connected  : "+service_getNews.connected);
				if(filterOnList=='' && service_getNews.connected)
				{
					this.dispatchEvent(new Event(Event.UNLOAD));
				}
				super.setUp(new PageData());
				return ;
			}
			cashedFirstNewsData = service_getNews.data[0] ;
			cashedTotalNews = service_getNews.data.length ;
			if(sesrvice_getOtherNews)
			{
				sesrvice_getOtherNews.cansel();
			}
			newsIndex = newsPageSize ;
			
			sesrvice_getOtherNews = new GetNews(true,false);
			sesrvice_getOtherNews.addEventListener(Event.COMPLETE,otherNewsLoaded);
			sesrvice_getOtherNews.addEventListener(Event.UNLOAD,reloadeService);
			
			showList();
		
			/*if(firstNews.links1.length==0)
			{
			//No news
			this.dispatchEvent(new Event(Event.UNLOAD));
			}*/
		}
		
		/**Show the list from began*/
		public function showList(forceToReGenerateList:Boolean=false):void
		{
			var firstNews:PageData = service_getNews.pageData(excludedBaseIDArray,currentBaseIds,VideoFilter,filterOnList) ;
			if(filterOnList=='')
				firstNews.id = '';//savedPageData.id ;
			trace("+++++++++++++++++++++++++News length are : "+firstNews.links1.length);
			
			if(forceToReGenerateList==false && super.pageData!=null && super.pageData.links1.length==firstNews.links1.length)
			{
				super.update(firstNews);
			}
			else
			{
				super.setUp(firstNews);
			}
			var fakeReloader:MovieClip = new MovieClip();
			fakeReloader.graphics.beginFill(0,0);
			fakeReloader.graphics.drawRect(0,0,10,10);
			super.addReloadFeature(fakeReloader);
			if(service_getNews.data.length >= newsPageSize)
			{
				
				canGetMore(getMoreNewsLinks,newsLoaderPreLoader);
				if(firstNews.links1.length==0)
				{
					getMoreNewsLinks();
				}
			}
			
		}
		
		private function dispatchCompleteEvent():void
		{
			this.dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function getMoreNewsLinks():void
		{
			trace("**** newsIndex : "+newsIndex);
			
			sesrvice_getOtherNews.load(currentTitle,currentBaseId,newsIndex,newsPageSize,currentIsSpecial,currentSearchOrder,currentOrderDirection,false,LinkItemKHabargozaran.userid);
			
			
		}
		
		
		protected function otherNewsLoaded(event:Event):void
		{
			// TODO Auto-generated method stub
		
			newsIndex += newsPageSize ;
			var newLinks:Vector.<LinkData> = sesrvice_getOtherNews.pageData(excludedBaseIDArray,currentBaseIds,VideoFilter,filterOnList).links1.concat();
			if(super.pageData.links1.length==0)
			{
				var page:PageData = new PageData();
				page.links1 = newLinks ;
				super.setUp(page);
			}
			else
				super.addLink(newLinks);
			if(sesrvice_getOtherNews.data.length<newsPageSize)
			{
				noMoreLinks();
			}
			else
			{
				canGetMore(getMoreNewsLinks,newsLoaderPreLoader);
				if(newLinks.length==0)
				{
					getMoreNewsLinks();
				}
			}
			
		}
		
		
		
		/////////////////////////////////////
		
		private var linkCounter:uint = 0 ;
		public var currentOrderDirection:String;
		
		
		/*override protected function createLinkOn(newLink:LinkItem, currentLinksSensor:Sprite, linkIndex:uint, linkPerLine:uint):void
		{
		if(iconsPerLine==1)
		{
		super.createLinkOn(newLink,currentLinksSensor, linkIndex, linkPerLine);
		}
		else
		{
		newLink.y = currentLinksSensor.y ;
		var w:Number = newLink.width ;
		var W:Number = currentLinksSensor.width ;
		var delta:Number = (W-(iconsPerLine*w))/(iconsPerLine+1);
		
		
		newLink.x = delta+linkCounter*(w+delta);
		
		linkCounter = (linkCounter+1)%iconsPerLine ;
		
		if(linkCounter==0)
		{
		currentLinksSensor.y += newLink.height+delta ;
		}
		}
		}*/
		public var myfavorite:Boolean;
		
	
	}
}