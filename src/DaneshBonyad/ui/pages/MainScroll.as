package DaneshBonyad.ui.pages
{//JashnvareSalamat.ui.pages.MainScroll
	import contents.PageData;
	import contents.interFace.DisplayPageInterface;
	
	import flash.display.MovieClip;
	import flash.geom.Rectangle;
	
	import picContest.PicConst;
	
	public class MainScroll extends MovieClip implements DisplayPageInterface
	{
		private var scrollAll:ScrollMT;

		public function MainScroll()
		{
			super();
		}
		
		public function setUp(pageData:PageData):void
		{
			scrollAll = new ScrollMT(this,new Rectangle (0,0,PicConst.pagesRect.width,PicConst.pagesRect.height),null,true)
			trace('mehdi       mehdi');
		}
	}
}