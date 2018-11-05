package DaneshBonyad.ui.pages
{//DaneshBonyad.ui.pages.Doreha
	import appManager.displayContentElemets.TitleText;
	import appManager.event.AppEvent;
	import appManager.event.AppEventContent;
	import appManager.event.TitleEvent;
	
	import com.mteamapp.StringFunctions;
	
	import contents.LinkData;
	import contents.PageData;
	import contents.displayPages.DynamicLinks;
	import contents.displayPages.LinkItem;
	import contents.interFace.DisplayPageInterface;
	
	import flash.display.MovieClip;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	
	import picContest.Pic;
	import picContest.PicConst;
	import picContest.services.types.IdTitles;
	import picContest.services.types.TBase;
	import picContest.services.webCaller.GetSubBases;
	
	public class Doreha extends MovieClip implements DisplayPageInterface
	{
		private var dastegroh:GetSubBases;
		private var myDynamicLinks:DynamicLinks ;
		private var link_nextPage:LinkData ;
		public static var TitlePageTo:String;

		private var newTbase:TBase;
		
		
		//private var _Title_mc:TitleText ;
		
		public function Doreha()
		{
			super();
			//_Title_mc = Obj.get("Title_mc",this);
			//_Title_mc.setUp(DorehaJashnvare.TitlePage,true);
			
			myDynamicLinks = Obj.findThisClass(DynamicLinks,this);
			myDynamicLinks.height = PicConst.pagesRect.height + 15;

			

			

		}
		
		protected function dastegroh_ERROR(event:ErrorEvent):void
		{
		}
		
		protected function dastegrohCONNECT(event:Event):void
		{
		}
		
		private function mySort(A:IdTitles,B:IdTitles):int
		{
			var a:String = A.Title ;
			var b:String = B.Title ;
			
			return StringFunctions.compairFarsiString(a,b) ;
		}
		
		protected function dastegroh_COMPLETE(event:Event):void
		{
			
			var _pageData:PageData = new PageData();
			
			//dastegroh.data = dastegroh.data.sort(mySort);
			//for ( var i:uint=dastegroh.data.length; i>0;i--)

			
			
			for ( var i:int=dastegroh.data.length-1; i>=0;i--)
			{
				var _linkData:LinkData = new LinkData();
				_linkData.name = dastegroh.data[i].Title;//.substr(4,dastegroh.data[i].Title.length);
				_linkData.id = dastegroh.data[i].Id.toString();
				_linkData.iconURL = dastegroh.data[i].getImageThumbnail();
				_pageData.links1.push(_linkData);
			}
			myDynamicLinks.setUp(_pageData);
		}
		
		
		public function setUp(pageData:PageData):void
		{
			myDynamicLinks.addEventListener(AppEvent.PAGE_CHANGES,pageSelected);
			link_nextPage = pageData.links2[0];
			//this.dispatchEvent(new TitleEvent(DorehaJashnvare.TitlePage));
			dastegroh = new GetSubBases();
			dastegroh.addEventListener(Event.COMPLETE,dastegroh_COMPLETE);
			dastegroh.addEventListener(Event.CONNECT,dastegrohCONNECT);
			dastegroh.addEventListener(ErrorEvent.ERROR,dastegroh_ERROR);
			dastegroh.load(Number(pageData.content));//DorehaJashnvare.IdPage
		}
		
		
		protected function pageSelected(event:AppEventContent):void
		{
			event.stopImmediatePropagation();
			
			newTbase = new TBase();
			newTbase.BaseId = event.linkData.id;
			newTbase.Title = event.linkData.name;
			TitlePageTo = event.linkData.name;

			Pic.newsManager.selectThisNewsCat(newTbase);
			this.dispatchEvent(new AppEventContent(link_nextPage));
		}
	}
}