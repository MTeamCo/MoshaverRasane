package ui.page
	//ui.page.NewsFanavari
{
	import flash.display.MovieClip;
	
	import ofogh.ui.pages.newsList.NewsListGenerator;
	
	import picContest.services.webCallerNews.GetNews;
	
	import stageManager.StageManager;
	
	public class NewsFanavari extends MovieClip
	{
		private var newsList2:NewsListGenerator ;
		public function NewsFanavari()
		{
			super();
			newsList2 = Obj.get("newsList_mc2",this) ;
			newsList2.horizontalMenu = false;
			newsList2.changeDeltaXY(0,3);
			//newsList2.height += StageManager.stageDelta.height;
			newsList2.setUp2('','217',null,"",null,null,GetNews.direction_desc);
			newsList2.freezeScroll();
			newsList2.iconsPerLine= 2;
			newsList2.horizontalMenu=true;
		}
	}
}