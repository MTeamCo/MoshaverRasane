package ui.page
	//ui.page.SearchPageExtend
{
	import Aroos.ui.pages.search.SearchPage;
	
	import appManager.event.AppEventContent;
	
	import contents.Contents;
	import contents.LinkData;
	import contents.PageData;
	import contents.alert.Alert;
	import contents.interFace.DisplayPageInterface;
	import contents.interFace.PageContentBaseClass;
	
	import dataManager.GlobalStorage;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.ReturnKeyLabel;
	import flash.text.TextField;
	
	import picContest.NewsEvent;
	import picContest.Pic;
	import picContest.PicConst;
	import picContest.PicEvent;
	import picContest.services.types.SP_SeperatedHashtags_Result;
	import picContest.services.webCaller.GetAllContest;
	
	import popForm.PopButtonData;
	import popForm.PopMenu;
	import popForm.PopMenuContenDisplay;
	import popForm.PopMenuContent;
	import popForm.PopMenuEvent;

	public class SearchPageExtend extends PageContentBaseClass
	{
		protected var dynamicList:PopMenuContenDisplay ;
		
		private var buttonsContainer:MovieClip,
		userSearchMC:MovieClip,
		newsSearchMC:MovieClip,
		photoSearchMC:MovieClip;
		
		/**Advanced search type : 0: photo search, 1: user search 2: news Search, 3:searchForCode*/
		public static var searchType:uint = 0 ;
		
		//private var serachTypeId:String = "searchTypeId" ;
		
		protected var inputTF:TextField ;
		
		public static var lastSearchedValueOnPic:String = '' ;
		public static var lastSearchedValueOnUsers:String = '' ;
		public static var lastSearchedValueOnNews:String = '' ;
		
		private var searchMC:MovieClip ;
		
		/**Photo search will open in new page (but users page had to load in current page) I changed my mind, I will open the users in new page too*/
		protected var link_photo_search_result:LinkData ;
		/**User page list link*/
		protected var link_photographers_search_result:LinkData ;
		/**News page link list*/
		protected var link_news_search_result:LinkData ;
		
		
		protected var resetMC:MovieClip ;
		protected var _frame_on_lang:MovieClip ;
		
		
		/**Use this if you dont whant to use online real hashtags*/
		private static var fakeHashTags:Array ;
		
		
		public static var dontSaveLastSearchString:Boolean = true ;
		
		public static var instanceSearchOnOpen:Boolean = false ;
		public function SearchPageExtend()
		{
			super();
			if(dontSaveLastSearchString)
			{
				lastSearchedValueOnPic = '' ;
				lastSearchedValueOnUsers = '' ;
				lastSearchedValueOnNews = '' ;
			}
			
			resetMC = Obj.get("reset_mc",this);
			
			searchMC = Obj.getAllChilds("search_mc2",this)[0];
			searchMC.buttonMode = true ;
			searchMC.addEventListener(MouseEvent.CLICK,searchFunction);
			/*if(GlobalStorage.load(serachTypeId)!=null)
			{
			searchType = GlobalStorage.load(serachTypeId); 
			}*/
			_frame_on_lang = Obj.get("frame_on_lang",this);
			
			if(_frame_on_lang==null)
			{
				_frame_on_lang = this ;
			}
			
			inputTF = Obj.get("input_txt2",_frame_on_lang);
			//inputTF = Obj.getAllChilds("input_txt",this)[0];
			
			dynamicList = Obj.findThisClass(PopMenuContenDisplay,this);
			buttonsContainer = Obj.get("search_buttons_mc2",this);
			userSearchMC = Obj.get("users_mc2",buttonsContainer);
			photoSearchMC = Obj.get("images_mc2",buttonsContainer);
			newsSearchMC = Obj.get("news_mc2",buttonsContainer);
			
			//userSearchMC.addEventListener(MouseEvent.CLICK,chageTheSearchTypeToUserSearch);
			if(resetMC)
			{
				resetMC.addEventListener(MouseEvent.CLICK,resetFields);
			}
			
			this.addEventListener(Event.REMOVED_FROM_STAGE,unLoad);
		}
		public static function setFakeHashtags(hashtagButtonList:Array):void
		{
			fakeHashTags = hashtagButtonList.concat();
		}
		
		/**Reset all fields*/
		protected function resetFields(event:MouseEvent):void
		{
			inputTF.text = '' ;
		}		
		
		private function controlTextFieldForSearchButton(e:*=null):void
		{
			if(inputTF.text=='')
			{
				searchMC.mouseChildren = searchMC.mouseEnabled = false ;
				searchMC.alpha = 0.5 ;
			}
			else
			{
				searchMC.mouseChildren = searchMC.mouseEnabled = true ;
				searchMC.alpha = 1.0 ;
			}
		}
		
		override public function setUp(pageData:PageData):void
		{
			saveCurrentSearchText();
			searchType = 1 ;
			inputTF = Obj.get("input_txt2",_frame_on_lang);
			inputTF.addEventListener(Event.CHANGE,controlTextFieldForSearchButton);
			link_photo_search_result = pageData.links2[0] ;
			link_photographers_search_result = pageData.links2[1] ;
			if(pageData.links2.length>2)
			{
				link_news_search_result = pageData.links2[2] ;
			}
			
			dynamicList.height = PicConst.pagesRect.height-dynamicList.y ;
			inputTF.text='نام مورد نظر خود را وارد کنید';
			FarsiInputCorrection.setUp(inputTF,null,true,true,false,true,true,true,ReturnKeyLabel.SEARCH,searchFunction);
			
			
			
			photoSearchMC.addEventListener(MouseEvent.CLICK,changeTheSearchTypeToImageSearch);
			
			if(newsSearchMC)
			{
				newsSearchMC.addEventListener(MouseEvent.CLICK,searchForNews);
			}
			
			
			
			setTheButtonInterface();
			
			if(fakeHashTags==null && Pic.userSearch.hashTags.length==0)
			{
				Pic.userSearch.getHashTags();
				Pic.userSearch.addEventListener(PicEvent.HASH_TAGS_UPDATED,setHashTags);
			}
			else
			{
				setHashTags();
			}
			
			controlTextFieldForSearchButton();
			
			if(instanceSearchOnOpen)
			{
				searchFunction(null);
			}
			instanceSearchOnOpen = false ;
		}
		
		protected function searchForNews(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			trace("Chagne the search type to news search model");
			saveCurrentSearchText();
			searchType = 2 ;
			setTheButtonInterface();
		}
		
		/**This will make searched text saved to static variable for next usings*/
		protected function saveCurrentSearchText():void
		{
			switch(searchType)
			{
				case(0):
					lastSearchedValueOnPic = inputTF.text ;
					break;
				case(1):
					lastSearchedValueOnUsers = inputTF.text ;
					break;
				case(2):
					lastSearchedValueOnNews = inputTF.text ;
					break;
			}
		}
		
		/**Update the search interface*/
		private function setTheButtonInterface():void
		{
			// TODO Auto Generated method stub
			switch(searchType)
			{
				case(0):
					inputTF.text = lastSearchedValueOnPic ;
					buttonsContainer.gotoAndStop(1);
					dynamicList.visible = true ;
					break;
				case(1):
					inputTF.text = lastSearchedValueOnUsers ;
					buttonsContainer.gotoAndStop(2);
					dynamicList.visible = false ;
					break;
				case(2):
					inputTF.text = lastSearchedValueOnNews ;
					buttonsContainer.gotoAndStop(3);
					dynamicList.visible = false ;
					break;
			}
			inputTF.dispatchEvent(new Event(Event.CHANGE));
		}
		
		protected function changeTheSearchTypeToImageSearch(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			trace("Change the search type to Image seraching");
			saveCurrentSearchText();
			searchType = 0 ;
			setTheButtonInterface();
		}
		
		/*protected function chageTheSearchTypeToUserSearch(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			trace("Change the search type to User seraching");
			//Alert.show('click');
			saveCurrentSearchText();
			searchType = 1 ;
			//setTheButtonInterface();
		}*/
		
		
		protected function unLoad(event:Event):void
		{
			// TODO Auto-generated method stub
			saveCurrentSearchText();
			Pic.userSearch.removeEventListener(PicEvent.SEARCH_PHOTO_RESULT_READY,photoSearchResult);
			Pic.userSearch.removeEventListener(PicEvent.HASH_TAGS_UPDATED,setHashTags);
			Pic.userSearch.removeEventListener(PicEvent.SEARCH_PHOTOGRAPHERS_READY,photographersSearchResult);
			
			Pic.userSearch.removeEventListener(PicEvent.SEARCH_PHOTO_RESULT_READY,photoSearchResult);
			
			//Pic.newsManager.canselLastSearch();
			Pic.newsManager.removeEventListener(NewsEvent.SEARCH_COMPLETED,controllTheNewsSearchResult);
			Pic.newsManager.removeEventListener(NewsEvent.SEARCH_FAILD,newsSearchFaild);
		}
		
		protected function setHashTags(event:Event=null):void
		{
			Pic.userSearch.removeEventListener(PicEvent.HASH_TAGS_UPDATED,setHashTags);
			var popText:PopMenuContent;
			if(fakeHashTags==null)
			{
				var hashTags:Vector.<SP_SeperatedHashtags_Result> = Pic.userSearch.hashTags ;
				var buttons:Array = [] ;
				for(var i = 0 ; i<hashTags.length ; i++)
				{
					var hashButton:PopButtonData = new PopButtonData(hashTags[i].Hashtag+'('+hashTags[i].HashtagCount+')',1,hashTags[i].Hashtag,true,true,true);
					buttons.push(hashButton);
				}
				popText = new PopMenuContent('',null,buttons,null);
			}
			else
			{
				popText = new PopMenuContent('',null,fakeHashTags,null);
			}
			
			
			dynamicList.setUp(popText);
			dynamicList.addEventListener(PopMenuEvent.POP_BUTTON_SELECTED,hashTagSelected);
		}
		
		protected function hashTagSelected(event:PopMenuEvent):void
		{
			// TODO Auto-generated method stub
			inputTF.text = '#'+event.buttonID ;
			inputTF.dispatchEvent(new Event(Event.CHANGE)) ;
			
			searchFunction();
		}
		
		/**Advanced search type : 0: photo search, 1: user search 2: news Search, 3:searchForCode*/
		protected function searchFunction(event:*=null,myText:String=null,advancedSearchType:int = -1,selectedContestId:String = '0',isWinner:Boolean=false):void
		{
			// TODO Auto-generated method stub
			if(myText==null)
			{
				myText = inputTF.text ;
			}
			trace("Search for : "+myText);
			
			if(advancedSearchType==-1)
			{
				advancedSearchType = searchType ;
			}
			
			Pic.userSearch.addEventListener(PicEvent.SEARCH_PHOTO_RESULT_READY,photoSearchResult);
			Pic.userSearch.addEventListener(PicEvent.SEARCH_PHOTOGRAPHERS_READY,photographersSearchResult);
			
			Pic.newsManager.addEventListener(NewsEvent.SEARCH_COMPLETED,controllTheNewsSearchResult);
			Pic.newsManager.addEventListener(NewsEvent.SEARCH_FAILD,newsSearchFaild);
			
			switch(advancedSearchType)
			{
				case(0):
					Hints.pleaseWait(canselSearchPhoto);
					Pic.userSearch.searchPhoto(myText,selectedContestId,0,0,'0',isWinner);
					break
				case(1):
					Hints.pleaseWait(canselSearchPhoto);
					Pic.userSearch.searchPhotoGraphers(myText);
					break;
				case(2):
					Hints.pleaseWait(canselSearchPhoto);
					Pic.newsManager.search(myText);
					break;
				case(3):
					Hints.pleaseWait(canselSearchPhoto);
					Pic.userSearch.searchPhoto('',selectedContestId,0,1,myText,isWinner);
					break;
			}
		}
		
		protected function photoSearchResult(event:Event):void
		{
			// TODO Auto-generated method stub
			Hints.hide();
			if(Pic.userSearch.searchPhotoResult.length ==0)
			{
				Hints.show(Contents.lang.t.no_result_founded);
			}
			else
			{
				trace("SearchResult ready. results :"+Pic.userSearch.searchPhotoResult.length);
				this.dispatchEvent(new AppEventContent(link_photo_search_result));
			}
		}
		
		
		
		protected function newsSearchFaild(event:Event):void
		{
			// TODO Auto-generated method stub
			Hints.noInternet();
		}
		
		protected function controllTheNewsSearchResult(event:Event):void
		{
			// TODO Auto-generated method stub
			Hints.hide();
			if(Pic.newsManager.getSearchedNews().length>0)
			{
				this.dispatchEvent(new AppEventContent(link_news_search_result));
			}
			else
			{
				Hints.show(Contents.lang.t.no_result_founded);
			}
		}
		
		
		
		protected function photographersSearchResult(event:Event):void
		{
			// TODO Auto-generated method stub
			Hints.hide();
			if(Pic.userSearch.searchPhotoGraphersResult.length==0)
			{
				Hints.show(Contents.lang.t.no_result_founded);
			}
			else
			{
				trace("Photo graphers search had "+Pic.userSearch.searchPhotoGraphersResult.length+" results");
				this.dispatchEvent(new AppEventContent(link_photographers_search_result));
			}
		}
		
		protected function canselSearchPhoto(e:*=null):void
		{
			Pic.userSearch.cansel();
		}
	}
}