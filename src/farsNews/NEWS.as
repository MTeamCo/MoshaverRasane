package farsNews
	//farsNews.NEWS
{
	import flash.display.MovieClip;
	
	import lmsPack.ui.pages.home.MyNewsOnHome;
	
	import picContest.Pic;
	import picContest.PicConst;
	
	public class NEWS extends MyNewsOnHome
	{
		public function NEWS()
		{
			
			deltaY = 0 ;
			deltaX = 10 ;
			super();
			iconsPerLine = 1 ;
			horizontalMenu = true;
	
			
			height = 256;//PicConst .pagesRect.height-this.y+Pic.config.MenuHTopHome ;
			
			setUp2('','163');//Next, you have to set the news group here		}
	}
}
}