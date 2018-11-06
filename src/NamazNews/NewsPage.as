package NamazNews
	//NamazNews.NewsPage
{
	import lmsPack.ui.pages.home.NewsPage;
	
	import picContest.PicConst;
	
	public class NewsPage extends lmsPack.ui.pages.home.NewsPage
	{
		public function NewsPage()
		{
			super();
			myNewsList.height = PicConst.pagesRect.height-myNewsList.y-300 ;
		}
	}
}