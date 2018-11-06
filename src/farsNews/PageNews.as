package farsNews
	//farsNews.PageNews
{
	import flash.display.MovieClip;
	import ofogh.ui.pages.newsList.NewsListGenerator;
	
	import picContest.PicConst;
	import picContest.services.webCallerNews.GetNews;
	import flash.display.MovieClip;
	
	public class PageNews extends MovieClip
	{
		private var newsList1:NewsListGenerator ;
		public function PageNews()
		{
			super();
			newsList1 = Obj.get("newsList1_mc",this) ;
			newsList1.horizontalMenu = false;
			newsList1.changeDeltaXY(0,0);
			newsList1.setUp2('','',null,"",null,null,GetNews.direction_asc);
		}
	}
}