package  DaneshBonyad.ui
	//DaneshBonyad.ui.CoachPages
	{
		import DaneshBonyad.ui.NewsListGeneratorVertical;
		
		import appManager.displayContentElemets.TitleText;
		import appManager.event.AppEvent;
		import appManager.event.AppEventContent;
		
		import contents.Contents;
		import contents.History;
		import contents.LinkData;
		import contents.PageData;
		import contents.displayPages.DynamicLinks;
		import contents.interFace.DisplayPageInterface;
		import contents.interFace.PageContentBaseClass;
		
		import flash.display.MovieClip;
		import flash.events.ErrorEvent;
		import flash.events.Event;
		
		import ofogh.ui.pages.newsList.NewsListGenerator;
		
		import picContest.Pic;
		import picContest.PicConst;
		import picContest.services.types.TBase;
		import picContest.services.webCaller.GetSubBases;
		import picContest.ui.elements.PreLoader;
		
		/**This class will load the pageData.conent as the news base id and show the pageData.title as the page title*/
		public class CoachPages extends PageContentBaseClass
		{
			private var titleMC:TitleText ;
			
			//protected var newsList: NewsListGenerator ;
			public var pageDatakarimpoor:String = '';
			private var curretnTBase:TBase ;
			private var dastegroh:GetSubBases;
			private var myDynamicLinks:DynamicLinks ;
			private var link_nextPage:LinkData ;
			private var newTbase:TBase;

			private var preLoaderMC:PreLoader;
			
			public function CoachPages ()
			{
				super();
				myDynamicLinks = Obj.findThisClass(DynamicLinks,this);
				myDynamicLinks.horizontalMenu = true;
				//newsList = Obj.findThisClass(DynamicLinks,this);
				//newsList.iconsPerLine = 1;
				//newsList.horizontalMenu = true;
				titleMC = Obj.findThisClass(TitleText,this);
				curretnTBase = Pic.newsManager.getSelectedCat() ;
				preLoaderMC = Obj.findThisClass(PreLoader,this);
				//newsList.showStepByStep = true ;
				
				
				dastegroh = new GetSubBases();
				dastegroh.addEventListener(Event.COMPLETE,dastegroh_COMPLETE);
				dastegroh.addEventListener(Event.CONNECT,dastegrohCONNECT);
				dastegroh.addEventListener(ErrorEvent.ERROR,dastegroh_ERROR);
				dastegroh.load(1);//DorehaJashnvare.IdPage

				
				
				setUp(null);

			}
			
			protected function dastegroh_ERROR(event:ErrorEvent):void
			{
				// TODO Auto-generated method stub
				
			}
			
			protected function dastegrohCONNECT(event:Event):void
			{
				// TODO Auto-generated method stub
				
			}
			
			protected function dastegroh_COMPLETE(event:Event):void
			{
				
				//grohIdloaded(pageDatakarimpoor);
				
				
				var _pageData:PageData = new PageData();
				
				//dastegroh.data = dastegroh.data.sort(mySort);
				
				//for ( var i:uint=0; i<dastegroh.data.length;i++)
				
				for ( var i:int=dastegroh.data.length-1; i>=0;i--)
				{
					var _linkData:LinkData = new LinkData();
					_linkData.name = dastegroh.data[i].Title;//.substr(4,dastegroh.data[i].Title.length);
					_linkData.id = dastegroh.data[i].Id.toString();
					_linkData.iconURL = dastegroh.data[i].getImageThumbnail()
					_pageData.links1.push(_linkData);
					
				}
				myDynamicLinks.setUp(_pageData);
				
				//grohIdloaded(_pageData);
				preLoaderMC.visible = false ;

				
				
				
				
				
				
				
				
				
				
				
				
			}
			
			public function grohIdloaded(id:String){
				//newsList.addEventListener(Event.COMPLETE,newsLoaded);
				//newsList.addEventListener(Event.UNLOAD,noNewsLoaded);
				var newsListBaseIds:Array = pageDatakarimpoor.split(',') ;
				var includedList:Array = [] ;
				var excludedList:Array = [] ;
				for(var i = 0 ; i<newsListBaseIds.length ; i++)
				{
					if(String(newsListBaseIds[i]).indexOf('-')==-1)
					{
						//no -
						includedList.push(newsListBaseIds[i]);
					}
					else
					{
						includedList.push(String(newsListBaseIds[i]).split('-').join(''));
					}
				}
				
				if(excludedList.length == 0)
				{
					excludedList = null ;
				}
				if(includedList.length==0)
				{
					includedList.push('0');
				}
				
				trace("includedList : "+includedList);
				trace("excludedList : "+excludedList);
				loadNews('',includedList.join(','),null,'',excludedList,null);
			}
			
			
			
			override public function setUp(pageData:PageData):void
			{
				
				pageData = Contents.getPage('ArchivSalamat');
				myDynamicLinks.addEventListener(AppEvent.PAGE_CHANGES,pageSelected);
				link_nextPage = pageData.links2[0];

				
				/*if(titleMC)
				{
					titleMC.text = pageData.title ;
				}
				
				newsList.height = PicConst.pagesRect.height-newsList.y;
				newsList.addEventListener(Event.COMPLETE,newsLoaded);
				newsList.addEventListener(Event.UNLOAD,noNewsLoaded);
				var pageDatakarimpoor:String = '145';
				var newsListBaseIds:Array = pageDatakarimpoor.split(',') ;
				var includedList:Array = [] ;
				var excludedList:Array = [] ;
				for(var i = 0 ; i<newsListBaseIds.length ; i++)
				{
					if(String(newsListBaseIds[i]).indexOf('-')==-1)
					{
						//no -
						includedList.push(newsListBaseIds[i]);
					}
					else
					{
						includedList.push(String(newsListBaseIds[i]).split('-').join(''));
					}
				}
				
				if(excludedList.length == 0)
				{
					excludedList = null ;
				}
				if(includedList.length==0)
				{
					includedList.push('0');
				}
				
				trace("includedList : "+includedList);
				trace("excludedList : "+excludedList);
				loadNews('',includedList.join(','),null,'',excludedList,pageData);*/
			}
			
			protected function pageSelected(event:AppEventContent):void
			{
				event.stopImmediatePropagation();
				
				newTbase = new TBase();
				newTbase.BaseId = event.linkData.id;
				newTbase.Title = event.linkData.name;
				
				//TitlePageTo = event.linkData.name;
				
				Pic.newsManager.selectThisNewsCat(newTbase);
				this.dispatchEvent(new AppEventContent(link_nextPage));
			}
			
			
			
			
			
			
			
			
			
			/**Override this to manage loaded contents again*/
			protected function loadNews(newsTitle:String='',newsBaseId:String='0',searchOrder:String=null,isSpecial:String='',excludedBaseIds:Array=null,pageDataForUsintPageId:PageData=null):void
			{
				//newsList.setUp2(newsTitle,newsBaseId,searchOrder,isSpecial,excludedBaseIds,pageDataForUsintPageId);
			}
			
			protected function noNewsLoaded(event:Event):void
			{
				// TODO Auto-generated method stub
				Hints.show(Contents.lang.t.no_news_available);
				this.dispatchEvent(History.lastPage());
			}
			
			protected function newsLoaded(event:Event):void
			{
				// TODO Auto-generated method stub
				preLoaderMC.visible = false ;
				//newsList.alpha = 0 ; 
				//AnimData.fadeIn(newsList);
			}
		}
	}
	
	