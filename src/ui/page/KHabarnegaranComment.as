package ui.page
	//ui.page.KHabarnegaranComment
{
	import Aroos.ui.pages.search.SearchPhotographerLinkItem;
	
	import ServiceCommentKHabarnegaran.GetOnlyComment;
	
	import contents.LinkData;
	import contents.PageData;
	import contents.alert.Alert;
	import contents.displayPages.DynamicLinks;
	import contents.interFace.DisplayPageInterface;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import picContest.Pic;
	import picContest.PicConst;
	import picContest.ui.elements.PreLoader;
	
	import webService.webCallers.WebServiceCaller;
	
	public class KHabarnegaranComment extends MovieClip implements DisplayPageInterface
	{
		private var dynamiclink:DynamicLinks ;
		private var service_onlycomment:GetOnlyComment;
		private var PreLoaderMC:PreLoader ;
		public function KHabarnegaranComment()
		{
			super();
			PreLoaderMC = new PreLoader();
			this.addChild(PreLoaderMC);
			PreLoaderMC.x = PicConst.pagesRect.width/2;
			PreLoaderMC.y = PicConst.pagesRect.height/2;
			dynamiclink = Obj.findThisClass(DynamicLinks,this);
			service_onlycomment = new GetOnlyComment();
			service_onlycomment.addEventListener(Event.COMPLETE,NewsLoaded);
			service_onlycomment.addEventListener(Event.UNLOAD,reloadNews);
		}
		protected function NewsLoaded(event:Event):void
		{
			var linkdata:LinkData;
			
			for(var i:int = 0 ; i< service_onlycomment.data.length ; i++)
			{	
				dynamiclink.setUp(service_onlycomment.pageData());
			  //Alert.show('Title:'+service_onlycomment.data[i].Title);
			}
			PreLoaderMC.visible = false ;
		}
		protected function reloadNews(event:Event):void
		{
			service_onlycomment.reLoad(1000);
		}
		public function setUp(pageData:PageData):void
		{
			service_onlycomment.load(LinkItemKHabarnegaran.userid);
			dynamiclink.height = PicConst.pagesRect.height-70;
		}

	}
}