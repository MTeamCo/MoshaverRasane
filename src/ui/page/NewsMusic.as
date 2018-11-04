package ui.page
	//ui.page.NewsMusic
{
	import flash.display.MovieClip;
	
	import ofogh.ui.pages.newsList.NewsListGenerator;
	
	import picContest.services.webCallerNews.GetNews;
	
	import stageManager.StageManager;
	
	public class NewsMusic extends MovieClip
	{
		private var newsList4:NewsListGenerator ;
		public function NewsMusic()
		{
			super();
			newsList4 = Obj.get("newsList_mc4",this) ;
			newsList4.horizontalMenu = false;
			newsList4.changeDeltaXY(0,3);
			newsList4.height += StageManager.stageDelta.height;
			newsList4.setUp2('','218',null,"",null,null,GetNews.direction_desc);
		}
	}
}