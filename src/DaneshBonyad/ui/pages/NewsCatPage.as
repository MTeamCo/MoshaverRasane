package DaneshBonyad.ui.pages
	//JashnvareSalamat.ui.pages.NewsCatPage
{
	//import JashnvareSalamat.ui.pages.DorehaJashnvare;
	
	import appManager.displayContentElemets.TitleText;
	import appManager.event.TitleEvent;
	
	import contents.Contents;
	import contents.History;
	import contents.PageData;
	import contents.interFace.DisplayPageInterface;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import ofogh.ui.pages.newsList.NewsListGenerator;
	
	import picContest.Pic;
	import picContest.PicConst;
	import picContest.services.types.TBase;
	import picContest.services.webCallerNews.GetNews;
	import picContest.ui.elements.PreLoader;
	
	public class NewsCatPage extends MovieClip implements DisplayPageInterface
	{
		private var titleMC:TitleText ;
		
		private var newsList:NewsListGenerator ;
		
		private var curretnTBase:TBase ;
		
		private var preLoaderMC:PreLoader;
		
		public function NewsCatPage()
		{
			super();
			newsList = Obj.findThisClass(NewsListGenerator,this);
			titleMC = Obj.findThisClass(TitleText,this);
			curretnTBase = Pic.newsManager.getSelectedCat() ;
			preLoaderMC = Obj.findThisClass(PreLoader,this);
		}
		
		public function setUp(pageData:PageData):void
		{

			trace("Load news content for this cat");
			if(curretnTBase.Title!=null)
			{
				titleMC.text = curretnTBase.Title ;
			}
			else if(pageData.title!=null)
			{
				titleMC.text = pageData.title ;

			}
			newsList.height = PicConst.pagesRect.height-newsList.y;
			newsList.addEventListener(Event.COMPLETE,newsLoaded);
			newsList.addEventListener(Event.UNLOAD,noNewsLoaded);
			newsList.setUp2('',curretnTBase.BaseId,GetNews.sort_Title,'',Pic.config.ignoredNewsOnSliderMenu.split(','),null,GetNews.direction_asc);
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