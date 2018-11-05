package  DaneshBonyad.ui.pages
	//oxygen.ui.pages.CoachPages
	{
		//import JashnvareSalamat.ui.NewsListGeneratorVertical;
		
		import appManager.displayContentElemets.TitleText;
		
		import contents.Contents;
		import contents.History;
		import contents.PageData;
		import contents.interFace.DisplayPageInterface;
		import contents.interFace.PageContentBaseClass;
		
		import flash.display.MovieClip;
		import flash.events.Event;
		
		import ofogh.ui.pages.newsList.NewsListGenerator;
		
		import picContest.Pic;
		import picContest.PicConst;
		import picContest.services.types.TBase;
		import picContest.ui.elements.PreLoader;
		
		
		/**This class will load the pageData.conent as the news base id and show the pageData.title as the page title*/
		public class CoachPages extends PageContentBaseClass
		{
			private var titleMC:TitleText ;
			
			protected var newsList: NewsListGenerator ;
			
			private var curretnTBase:TBase ;
			
			private var preLoaderMC:PreLoader;
			
			public function CoachPages ()
			{
				
				super();
				newsList = Obj.findThisClass(NewsListGenerator,this);
				newsList.iconsPerLine = 3;
				titleMC = Obj.findThisClass(TitleText,this);
				curretnTBase = Pic.newsManager.getSelectedCat() ;
				preLoaderMC = Obj.findThisClass(PreLoader,this);
			}
			
			override public function setUp(pageData:PageData):void
			{
				trace("Load news content for this cat : "+pageData.content+"> for >"+pageData.title);
				
				if(titleMC)
				{
					titleMC.text = pageData.title ;
				}
				
				newsList.height = PicConst.pagesRect.height-newsList.y;
				newsList.addEventListener(Event.COMPLETE,newsLoaded);
				newsList.addEventListener(Event.UNLOAD,noNewsLoaded);
				
				var newsListBaseIds:Array = pageData.content.split(',') ;
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
				loadNews('',includedList.join(','),null,'',excludedList,pageData);
			}
			
			/**Override this to manage loaded contents again*/
			protected function loadNews(newsTitle:String='',newsBaseId:String='0',searchOrder:String=null,isSpecial:String='',excludedBaseIds:Array=null,pageDataForUsintPageId:PageData=null):void
			{
				newsList.setUp2(newsTitle,newsBaseId,searchOrder,isSpecial,excludedBaseIds,pageDataForUsintPageId);
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
				newsList.alpha = 0 ; 
				AnimData.fadeIn(newsList);
			}
		}
	}
	
	