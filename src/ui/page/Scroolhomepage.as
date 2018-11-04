package ui.page
	//ui.page.Scroolhomepage
{
	import flash.display.MovieClip;
	import flash.geom.Rectangle;
	import flash.utils.setTimeout;
	
	import picContest.PicConst;
	
	public class Scroolhomepage extends MovieClip
	{
		private var scrollMc:MovieClip;
		public function Scroolhomepage()
		{
			super();
			setTimeout(setUp,0);
			
		}
		public function setUp():void
		{
			var rectanglee:Rectangle = PicConst.pagesRect;
			rectanglee.height = rectanglee.height-200;
			scrollMc = Obj.get('scroll_mc',this);
			var scrol:ScrollMT = new ScrollMT(scrollMc,rectanglee,null,true,false);
			
		}
	}
}