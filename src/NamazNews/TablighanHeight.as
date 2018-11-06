package NamazNews
	//NamazNews.TablighanHeight
{
	import flash.display.MovieClip;
	
	import picContest.PicConst;
	
	public class TablighanHeight extends MovieClip
	{
		private var Tablighanmc:MovieClip;
		
		public function TablighanHeight()
		{
			super();
			Tablighanmc = Obj.get("Tablighan_mc",this);
			//Tablighanmc.y = PicConst.pagesRect.y-Tablighanmc.y+375;
			
			Tablighanmc.y = PicConst.pagesRect.height-Tablighanmc.height-this.y;
			
		}
	}
}