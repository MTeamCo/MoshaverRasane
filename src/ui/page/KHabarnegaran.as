package ui.page
	//ui.page.KHabarnegaran
{
	import Aroos.ui.pages.search.SearchPage;
	
	import contents.PageData;
	import contents.displayPages.DynamicLinks;
	import contents.interFace.DisplayPageInterface;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import picContest.PicConst;
	import picContest.services.webCaller.GetPhotograghers;
	import picContest.ui.elements.PreLoader;
	
	public class KHabarnegaran extends MovieClip implements DisplayPageInterface
	{
		private var dynamiclink:DynamicLinks ;
		private var profile:GetPhotograghers;
		private var PreLoaderMC:PreLoader ;
		public function KHabarnegaran()
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
				
				dynamiclink.setUp(profile.pageData());
				/*if (profile.data[i].UserTypeBaseId=='24')
				{
				}*/
			}
			PreLoaderMC.visible = false ;
		}
		protected function reloadPhotoGraphers(event:Event):void
		{
			profile.reLoad(1000);
		}
		public function setUp(pageData:PageData):void
		{
			//Alert.show('test');
			profile.load('0','',23);
			
			dynamiclink.changeDeltaXY(0,0);
			
			dynamiclink.height = PicConst.pagesRect.height-70;
			
			
			
		}
	}
}