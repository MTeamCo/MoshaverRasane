package ui.page
	//ui.page.NewsPage
{
	import flash.display.MovieClip;
	
	import ofogh.ui.pages.newsList.NewsListGenerator;
	
	import picContest.PicConst;
	import picContest.services.webCallerNews.GetNews;
	import picContest.ui.elements.PreLoader;
	
	import stageManager.StageManager;
	
	public class NewsPage extends MovieClip
	{
		private var newsList1:NewsListGenerator ;
		private var PreLoaderMC:PreLoader ;
		public function NewsPage()
		{
			super();
			//PreLoaderMC = new PreLoader();
			//this.addChild(PreLoaderMC);
			//PreLoaderMC.x = PicConst.pagesRect.width/2;
			//PreLoaderMC.y = PicConst.pagesRect.height/2;
			newsList1 = Obj.get("newsList1_mc",this) ;
			//newsList1.horizontalMenu = false;
			//newsList1.changeDeltaXY(0,3);
			//Hints.show('لطفا کمی صبر کنید');
			//newsList1.height += StageManager.stageDelta.height;
			newsList1.setUp2('','216',null,"",null,null,GetNews.direction_desc);
			
		}
	}
}