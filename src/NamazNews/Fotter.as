package NamazNews
	//NamazNews.Fotter
{
	import flash.display.MovieClip;
	import flash.utils.setTimeout;
	
	import picContest.PicConst;
	
	public class Fotter extends MovieClip
	{
		public function Fotter()
		{
			super();
			setTimeout(setfotter,0);
		}
		public function setfotter()
		{
			this.y += PicConst.stageDeltaRect.height;
		}
	}
}