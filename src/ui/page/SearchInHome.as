package ui.page
	//ui.page.SearchInHome
{
	import flash.display.MovieClip;
	import Aroos.ui.pages.search.SearchPage;
	import appManager.event.AppEventContent;
	import contents.LinkData;
	import contents.alert.Alert;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.SoftKeyboardType;
	import flash.text.TextField;
	import lmsPack.ui.pages.home.NewsPage;
	import ofogh.ui.pages.newsCategroyPage.NewsCatPage;
	import ofogh.ui.pages.newsList.NewsListFromSearch;
	import ofogh.ui.pages.newsList.NewsListGenerator;
	import picContest.NewsEvent;
	import picContest.NewsManager;
	import picContest.Pic;
	import picContest.services.types.TBase;
	import picContest.services.webCallerNews.GetNews;
	public class SearchInHome extends MovieClip
	{
		private var curretnTBase:TBase ;
		public static var serchinGroups:Boolean = false;
		private var searchMC:MovieClip,
		inputText:TextField;
		public function SearchInHome()
		{
			super();
			inputText = Obj.get("inputText_mc",this);
			
			FarsiInputCorrection.setUp(inputText,null,true,true,true);
			
			searchMC =  Obj.get("searchMC_mc",this);
			searchMC.addEventListener(MouseEvent.CLICK,openSearchPage);
		}
		protected function openSearchPage(event:MouseEvent):void
		{
			inputText.replaceSelectedText('');
			if (serchinGroups==true)
			{
				SearchPage.lastSearchedValueOnNews=Pic.newsManager.getSelectedCat().BaseId;
			}
			SearchPage.lastSearchedValueOnNews = inputText.text ;
			SearchPage.dontSaveLastSearchString = false ;
			SearchPage.instanceSearchOnOpen = true ;
			var linkData : LinkData = new LinkData();
			linkData.id = "search_page";
			linkData.level = -1;
			this.dispatchEvent(new AppEventContent(linkData));
			inputText.text = '';
			inputText.dispatchEvent(new Event(Event.CHANGE));
		}
	}
}