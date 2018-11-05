package DaneshBonyad.ui
{//JashnvareSalamat.ui.NewsListGeneratorExtended
	import DaneshBonyad.ui.pages.Doreha;
	//import JashnvareSalamat.ui.pages.DorehaJashnvare;
	
	import appManager.event.AppEventContent;
	import appManager.event.TitleEvent;
	
	import contents.LinkData;
	
	import flash.events.Event;
	
	import ofogh.ui.pages.newsList.NewsListGenerator;
	
	import picContest.Pic;
	
	public class NewsListGeneratorExtended extends NewsListGenerator
	{
		public function NewsListGeneratorExtended()
		{
			super();

		}
		
		override protected function newsReady(event:Event):void{

			if(service_getNews.data.length == 1){
				var link:LinkData = new LinkData();
				link.id = Pic.config.news_content_page_id ;
				link.level = -2;
				Pic.newsManager.selectThisNews(service_getNews.data[0]);
				this.dispatchEvent(new AppEventContent(link));
			}
			else
			{
				//this.dispatchEvent(new TitleEvent(Doreha.TitlePageTo));
				
				super.newsReady(event);
			}
		}
	}
}