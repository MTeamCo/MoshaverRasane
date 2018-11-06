package farsNews
	//farsNews.NewsPage
{
	import flash.display.MovieClip;
	
	import ofogh.ui.pages.newsList.NewsListGenerator;
	
	import picContest.PicConst;
	import picContest.services.webCallerNews.GetNews;
	
	import stageManager.StageManager;
	
	public class NewsPage extends MovieClip
	{
		private var newsList3:NewsListGenerator ;
		private var newsList2:NewsListGenerator ;
		
		public function NewsPage()
		{
			super();
			newsList3 = Obj.get("newsList3_mc",this) ;
			newsList2 = Obj.get("newsList2_mc",this) ;
			newsList2.horizontalMenu = true;
			newsList3.horizontalMenu = false;
			newsList3.changeDeltaXY(0,3);
			newsList3.height += StageManager.stageDelta.height;
			newsList3.setUp2('','222',null,"",null,null,GetNews.direction_desc);
			newsList2.setUp2('','231',null,"",null,null,GetNews.direction_desc);
			//newsList3.lockScroll();
			
		}
	}
}