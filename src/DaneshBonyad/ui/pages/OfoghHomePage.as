package DaneshBonyad.ui.pages
{//JashnvareSalamat.ui.pages.OfoghHomePage

	import contents.Contents;
	import contents.PageData;
	import contents.interFace.DisplayPageInterface;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import ofogh.ui.pages.newsList.NewsListGenerator;
	
	import picContest.Pic;
	import picContest.PicConst;
	import picContest.services.webCaller.GetPhotos;
	import picContest.ui.elements.PreLoader;
	import picContest.ui.pages.gallery.GalleryLinks;
	import picContest.ui.pages.gallery.GalleryPage;
	
	public class OfoghHomePage extends MovieClip implements DisplayPageInterface
	{
		private var newsList:NewsListGenerator ;
		
		private var galleryList:GalleryPage ;
		
		private var dividerMC:MovieClip ;
		
		private var myPreLoader:PreLoader ;
		
		public static var singleline:Boolean = true;
		//private var scrollAll:ScrollMT;

		public function OfoghHomePage()
		{
			super();
			
			trace('TTTT1', PicConst.pagesRect.height);
			//scrollAll = new ScrollMT(this,new Rectangle (0,0,PicConst.pagesRect.width,PicConst.pagesRect.height),null,true)

			myPreLoader = new PreLoader();
			
			newsList = Obj.findThisClass(NewsListGenerator,this) ;
			galleryList = Obj.findThisClass(GalleryPage,this) ;
			dividerMC = Obj.get("divider_mc",this) ;
			
			setUp(null) ;
		}
		
		public function setUp(pageData:PageData):void
		{

			var stageDeltaHeight:Number = PicConst.stageDeltaRect.height;
			dividerMC.y+=stageDeltaHeight;
			if(galleryList!=null)
			{
				//galleryList.y = dividerMC.y+dividerMC.height ;
				trace("galleryList height is : "+(dividerMC.y-galleryList.y));
			}
			
			newsList.height = dividerMC.y-newsList.y ;
			newsList.setUp2('','160',null,"",null,Contents.homePage);
			this.addChild(myPreLoader);
			myPreLoader.x = newsList.width/2+newsList.x;
			myPreLoader.y = newsList.height/2+newsList.y;
			
			newsList.addEventListener(Event.COMPLETE,removePreLoader);
			newsList.addEventListener(Event.ACTIVATE,addPreLoader);
			
			var myContestid:String = '0';
			if(Pic.config.ignoredContests!='')
			{
				myContestid = Pic.config.ignoredContests ;
			}
			trace("**************************mycontest is : "+myContestid);
			if(galleryList!=null)
			{
				galleryList.setUp2(new Rectangle(0,0,768,galleryList.height),2,'0',myContestid,GetPhotos.sort_date,null,singleline);
			}
		}
		
		protected function removePreLoader(event:Event):void
		{
			Obj.remove(myPreLoader);
		}
		
		protected function addPreLoader(event:Event):void
		{
			this.addChild(myPreLoader);
		}
	}
}