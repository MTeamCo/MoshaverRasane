package ui.page
	//ui.page.SearchPhotographersResultPageExtend
{
	import Aroos.ui.pages.search.SearchPhotographersResultPage;
	
	import appManager.displayContentElemets.TitleText;
	import appManager.event.AppEventContent;
	
	import contents.LinkData;
	import contents.PageData;
	import contents.alert.Alert;
	import contents.displayPages.DynamicLinks;
	import contents.interFace.DisplayPageInterface;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import picContest.Pic;
	import picContest.PicConst;
	import picContest.PicEvent;
	import picContest.services.types.VUser;
	import picContest.services.webCaller.GetPhotograghers;
	import picContest.ui.elements.PreLoader;
	
	public class SearchPhotographersResultPageExtend extends MovieClip implements DisplayPageInterface
	{
		private var dynamiclink:DynamicLinks ;
		private var profile:GetPhotograghers;
		private var PreLoaderMC:PreLoader ;
		private var data:VUser;
	//	public static var userid:String;
		public function SearchPhotographersResultPageExtend()
		{
			super();
			
			PreLoaderMC = new PreLoader();
			this.addChild(PreLoaderMC);
			PreLoaderMC.x = PicConst.pagesRect.width/2;
			PreLoaderMC.y = PicConst.pagesRect.height/2;
			dynamiclink = Obj.findThisClass(DynamicLinks,this);
			profile = new GetPhotograghers();
			profile.addEventListener(Event.COMPLETE,photoGraphersLoaded);
			profile.addEventListener(Event.UNLOAD,reloadPhotoGraphers);
		}
		
		protected function photoGraphersLoaded(event:Event):void
		{
			for(var i:int = 0 ; i< profile.data.length ; i++)
			{	
				dynamiclink.setUp(profile.pageData(1));
				
			}
			//userid = profile.data[i].UserId;
			
			PreLoaderMC.visible = false ;
		}
		protected function reloadPhotoGraphers(event:Event):void
		{
			profile.reLoad(1000);
		}
		public function setUp(pageData:PageData):void
		{
			profile.load('0','',24);
			dynamiclink.changeDeltaXY(0,0);
			dynamiclink.height = PicConst.pagesRect.height-100;

		}
	}
}