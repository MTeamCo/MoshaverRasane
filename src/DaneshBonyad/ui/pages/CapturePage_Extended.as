package DaneshBonyad.ui.pages
{//JashnvareSalamat.ui.pages.CapturePage_Extended
	import Aroos.ui.pages.CapturePage;
	
	import flash.display.MovieClip;
	
	import picContest.PicConst;
	
	public class CapturePage_Extended extends CapturePage
	{

		private var buttomItem:MovieClip ;

		public function CapturePage_Extended()
		{
			super();
			cameraAreaMC = Obj.get("camera_mc",this);
			cameraAreaMC.height = PicConst.pagesRect.height - 80;

			
			buttomItem = Obj.get("buttom_css",this);
			buttomItem.y = PicConst.pagesRect.height - 80 ;

		}
	}
}