package ui.page
	//ui.page.NewsPageExtend
{
	import lmsPack.ui.pages.home.NewsPage;
	import contents.PageData;
	
	import flash.events.Event;
	
	import picContest.services.webCallerNews.GetNews;
	public class NewsPageExtend extends NewsPage
	{
		public static var openTheUniqeOne:Boolean = false ;
		public function NewsPageExtend()
		{
			super();
		}
		override public function setUp(pageData:PageData):void
		{
			myNewsList.addEventListener(Event.COMPLETE,startTheShow);
			myNewsList.setRevertListX = true;
			myNewsList.openTheUniqeOne = openTheUniqeOne ;
			myNewsList.setUp2('',pageData.content,null,'',null,null,GetNews.direction_asc);
			
		}
	}
}