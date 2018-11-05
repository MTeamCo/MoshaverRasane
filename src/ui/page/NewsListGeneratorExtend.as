package ui.page
	//ui.page.NewsListGeneratorExtend
{
	import appManager.event.AppEventContent;
	
	import contents.LinkData;
	import contents.PageData;
	
	import flash.events.Event;
	
	import ofogh.ui.pages.newsList.NewsListGenerator;
	
	import picContest.Pic;
	import picContest.PicConst;
	import picContest.services.webCallerNews.GetNews;
	import picContest.ui.elements.PreLoader;
	
	public class NewsListGeneratorExtend extends NewsListGenerator
	{
		private var PreLoaderMC:PreLoader ;
		public function NewsListGeneratorExtend()
		{
			super();
			
			//PreLoaderMC = Obj.findThisClass(PreLoader,this);
			//PreLoaderMC = new PreLoader();
			//PreLoaderMC.visible = true ;
			//this.addChild(PreLoaderMC);
			//PreLoaderMC.x = PicConst.pagesRect.width/2;
			//PreLoaderMC.y = PicConst.pagesRect.height/2;
		}
		/*override protected function removePreLoader(event:Event):void
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
		
		
		
		override public function dispatchCompleteEvent():void
		{
			this.dispatchEvent(new Event(Event.COMPLETE));
		}*/
		
	}
}