package NamazNews
	//NamazNews.NamazNewsMain
{
	import flash.display.MovieClip;
	import flash.geom.Rectangle;
	
	import picContest.PicConst;
	
	public class NamazNewsMain extends MovieClip
	{
		private var scrollMc:MovieClip;
		
		public function NamazNewsMain()
		{
			super();
			var newrecta:Rectangle = PicConst.pagesRect;
			newrecta.height = newrecta.height;
			scrollMc = Obj.get('scroll_mc',this);
			var scrol:ScrollMT = new ScrollMT(scrollMc,newrecta,null,true,false);
		}
	}
}