package farsNews
	//farsNews.Pagess
{
	import ofogh.ui.pages.newsList.NewsListGenerator;
	import flash.display.MovieClip;
	import picContest.PicConst;
	import picContest.services.webCallerNews.GetNews;
	
	public class Pagess extends NewsListGenerator
	{
		private var newsList3:NewsListGenerator ;
		public function Pagess()
		{
			super();
			newsList3 = Obj.get("newsList1_mc",this) ;
			newsList3.horizontalMenu = false;
			newsList3.changeDeltaXY(0,0);
			newsList3.setUp2('','158',null,"",null,null,GetNews.direction_asc);
			newsList3.lockScroll();
		}
	}
}