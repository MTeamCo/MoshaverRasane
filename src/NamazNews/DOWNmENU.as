package NamazNews
	//NamazNews.DOWNmENU
{
	import flash.display.MovieClip;
	import flash.utils.setTimeout;
	
	import picContest.PicConst;
	
	public class DOWNmENU extends MovieClip
	{
		
		public function DOWNmENU()
		{
			super();
			
			setTimeout(setY,0);
		}
		
		public function setY()
		{
			this.y += PicConst.stageDeltaRect.height;
		}
	}
	
}