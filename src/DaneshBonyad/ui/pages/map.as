package DaneshBonyad.ui.pages
{//JashnvareSalamat.ui.pages.map
	
	import appManager.displayContentElemets.TitleText;
	
	import contents.Contents;
	import contents.PageData;
	import contents.interFace.DisplayPageInterface;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import myAsCSS.MyAsCSS;
	
	import myMultiTouch.zoomer2;
	
	import picContest.PicConst;
	
	public class map extends MovieClip implements DisplayPageInterface 
	{
		private var map_pic:MovieClip ;
		private var next_mc:MovieClip ;
		private var priv_mc:MovieClip ;
		private var bg:MovieClip ;
		
		
		private var myTitle:TitleText ;
		private var setBtn:SetButton= new SetButton()
		public function map() {
			super();
			myTitle = Obj.findThisClass(TitleText,this);
			// constructor code
			map_pic = Obj.get("_map_pic",this);
			next_mc = Obj.get("_next_mc",this);
			priv_mc = Obj.get("_priv_mc",this);
			bg = Obj.get("_bg",this);
		}
		public function setUp(pageData:PageData):void
		{
			if(myTitle != null)
			{
				myTitle.setUp(pageData.title);
			}
			
			trace("ididid :",pageData.id)
			map_pic.gotoAndStop(pageData.id)
			chekButton_fun()
			if(map_pic.page.totalFrames==1)
			{
				next_mc.visible = false 
				priv_mc.visible = false
			}
			else
			{
				map_pic.page.gotoAndStop(1)
				//next_mc.addEventListener(MouseEvent.CLICK,next_fun)
				//priv_mc.addEventListener(MouseEvent.CLICK,priv_fun)
			}
			bg.height = bg.height*MyAsCSS.stageScaleY	
			scrol_fun()
		}
		private function next_fun(evt:MouseEvent):void
		{
			zoomer2.resetZoom(map_pic.page)
			map_pic.page.nextFrame()
			scrol_fun()
			chekButton_fun()
			trace("fdfdffdfsdfsfffds")
		}
		private function priv_fun(evt:MouseEvent):void
		{
			zoomer2.resetZoom(map_pic.page)
			map_pic.page.prevFrame()
			scrol_fun()
			chekButton_fun()
		}
		private function chekButton_fun():void
		{
			setBtn.setButtons_fun(next_mc,SetButton.NEXT,chekFrame)
			setBtn.setButtons_fun(priv_mc,SetButton.PREV,chekFrame)
			//next_mc.visible = setBtn.setButtons_fun(1,map_pic.page.totalFrames,map_pic.page.currentFrame)[1]
			//priv_mc.visible = setBtn.setButtons_fun(1,map_pic.page.totalFrames,map_pic.page.currentFrame)[2]
		}
		private function scrol_fun():void
		{

				zoomer2.zoomAct(map_pic.page,new Rectangle(16,0,734,map_pic.height))
				Contents.config.deltaStageRect.height	
                 
			var scrol:ScrollMT	= new ScrollMT(map_pic,new Rectangle(16,0,732,PicConst.pagesRect.height),new Rectangle(0,0,1000,map_pic.height),false,false,true)	
		}
		
		public function chekFrame():void
		{
			trace('currnet farma :',setBtn.current)
		}
	}
	
}
