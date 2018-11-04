package ui.page
	//ui.page.NewsSinema
{
	import flash.display.MovieClip;
	
	import ofogh.ui.pages.newsList.NewsListGenerator;
	
	import picContest.services.webCallerNews.GetNews;
	
	import stageManager.StageManager;
	
	public class NewsSinema extends MovieClip
	{
		private var newsList3:NewsListGenerator ;
		public function NewsSinema()
		{
			super();
			newsList3 = Obj.get("newsList_mc3",this) ;
			newsList3.horizontalMenu = false;
			newsList3.changeDeltaXY(0,3);
			newsList3.height += StageManager.stageDelta.height;
			newsList3.setUp2('','219',null,"",null,null,GetNews.direction_desc);
		}
	}
}