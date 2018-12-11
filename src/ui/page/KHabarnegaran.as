package ui.page
	//ui.page.KHabarnegaran
{
	import Aroos.ui.pages.search.SearchPage;
	
	import contents.PageData;
	import contents.alert.Alert;
	import contents.displayPages.DynamicLinks;
	import contents.interFace.DisplayPageInterface;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import picContest.PicConst;
	import picContest.services.webCaller.GetPhotograghers;
	import picContest.ui.elements.PreLoader;
	
	import popForm.PopField;
	
	public class KHabarnegaran extends MovieClip implements DisplayPageInterface
	{
		private var dynamiclink:DynamicLinks ;
		private var profile:GetPhotograghers;
		private var PreLoaderMC:PreLoader ;
		private var searchFieldTF:PopField ;
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
			searchFieldTF = Obj.get("search_mc",this);
		}
		protected function photoGraphersLoaded(event:Event):void
		{
			dynamiclink.setUp(profile.pageData(2));
			PreLoaderMC.visible = false ;
		}
		protected function reloadPhotoGraphers(event:Event):void
		{
			profile.reLoad(1000);
		}
		public function setUp(pageData:PageData):void
		{
			//Alert.show('test');
			if(searchFieldTF)
			{
				searchFieldTF.setUp('جستجو','');
				searchFieldTF.addEventListener(Event.RENDER,aFiltereEntered);
			}
			profile.load('0','',23);
			
			dynamiclink.changeDeltaXY(0,0);
			
			dynamiclink.height = PicConst.pagesRect.height-70;
			
			
			
		}
		protected function aFiltereEntered(event:Event):void
		{
			dynamiclink.setUp(profile.pageData(2,searchFieldTF.text));
			
		}
		
	}
}