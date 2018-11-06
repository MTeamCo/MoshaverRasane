package NamazNews
	//NamazNews.NewsPageExtended
{
	import farsNews.NewsPage;
	
	import ofogh.ui.pages.newsList.NewsListGenerator;
	
	import picContest.services.webCallerNews.GetNews;
	
	public class NewsPageExtended extends NewsPage
	{
		private var newsList3:NewsListGenerator ;
		
		public function NewsPageExtended()
		{
			super();
			newsList3.setUp2('','222',null,"",null,null,GetNews.direction_desc);
		}
	}
}