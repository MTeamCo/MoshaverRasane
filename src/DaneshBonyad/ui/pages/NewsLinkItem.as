package DaneshBonyad.ui.pages
	//DaneshBonyad.ui.pages.NewsLinkItem
{
	import appManager.displayContentElemets.TitleText;
	import appManager.event.AppEventContent;
	
	import contents.LinkData;
	import contents.displayPages.LinkItem;
	
	import diagrams.calender.MyShamsi;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import picContest.Pic;
	import picContest.services.types.TBase;
	import picContest.services.types.VNews;
	
	public class NewsLinkItem extends LinkItem
	{
		public static var splitTitle_if_to_long:Boolean = false ;
		
		protected var 	likeButtonMC:MovieClip,
						dislikeButtonMC:MovieClip,
						likeTextField:TextField,
						dislikeTextField:TextField;
		
		protected var myData:VNews ;
		
		private var height0:Number ;
		
		private var dateTF:TitleText ;
		
		/**This image will show if the dynamic image is not exists.<br>
		 * Name : fake_image_mc*/
		private var fakeImage:MovieClip ;
		
		private var newsTitle:TitleText ;
		
		public function NewsLinkItem(mouseChildAccept:Boolean=false,searchForElements:Boolean=true)
		{
			super(mouseChildAccept,searchForElements);
			if(searchForElements)
			{
				dateTF = Obj.get("date_txt",this);
				likeButtonMC = Obj.get("like_button_mc",this);
				if(likeButtonMC)
				{
					likeTextField = Obj.get("likes_txt",likeButtonMC);
				}
				dislikeButtonMC = Obj.get("dislike_button_mc",this);
				newsTitle = Obj.get("news_title_mc",this);
				if(dislikeButtonMC)
				{
					dislikeTextField = Obj.get("likes_txt",dislikeButtonMC);
				}
				fakeImage = Obj.getAllChilds("fake_image_mc",this)[0];
			}
			height0 = super.height ;
		}
		
		override public function get height():Number
		{
			return height0 ;
		}
		
		override public function setUp(linkData:LinkData):void
		{
			myLinkData = linkData ;
			if(likeButtonMC)
			{
				likeButtonMC.buttonMode = true ;
				likeButtonMC.mouseChildren = likeButtonMC.mouseEnabled = false ;
			}
			
			myData = linkData.dynamicData as VNews ;
			if(likeTextField)
				likeTextField.text = myData.PositiveScore ;
			
			if(dislikeTextField)
			{
				dislikeTextField.text = myData.NegativeScore ;
			}
			if(fakeImage!=null && linkData.iconURL!='')
			{
				fakeImage.visible = false ;
			}
			if(myParag)
			{
				myTitle = null ;
			}
			if(newsTitle)
			{
				myTitle = null ;
			}
			
			if(myLinkData!=null)
			{
				this.buttonMode = true ;
			}
			
			if(myImage!=null)
			{
				myImage.setUp(myData.getImage());
			}
			if(myTitle!=null)
			{
				myTitle.setUp(linkData.name,true,splitTitle_if_to_long);
			}
			else if(myParag!=null)
			{
				myParag.setUp(linkData.name,true,true,false,false,false,true,false,true,true,false,true);
			}
			
			if(newsTitle)
			{
				newsTitle.setUp(myData.Title,true,splitTitle_if_to_long);
				if(myParag)
				{
					myParag.setUp(myData.NewsBreif);
				}
			}
			if(dateTF!=null)
			{
				var shamsi:MyShamsi = MyShamsi.miladiToShamsi(ServerDate.serverDateToDate(myData.CreatedDate));
				dateTF.setUp(shamsi.showStringFormat(false,false));
			}
			//Why should user like the new without reading it??
			//likeButtonMC.addEventListener(MouseEvent.CLICK,addScoreIfLoggedIn);
		}
		
		protected function addScoreIfLoggedIn(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			
		}
		
		override public function imSelected(event:MouseEvent=null):void
		{
			var newsBase:TBase = new TBase();
			newsBase.Title = myData.NewsTypeBaseTitle ;
			newsBase.BaseId = myData.NewsTypeBaseId ;
			
			Pic.newsManager.selectThisNews(myData);
			Pic.newsManager.selectThisNewsCat(newsBase);
			
			if(false && likeButtonMC!=null && likeButtonMC.hitTestPoint(stage.mouseX,stage.mouseY))
			{
				if(Pic.userManager.isLogedIn())
				{
					Pic.newsManager.likeNew(myData);
				}
				else
				{
					var loginPageLink:LinkData = new LinkData() ;
					loginPageLink.id = Pic.config.registration_page ;
					this.dispatchEvent(new AppEventContent(loginPageLink));
				}
			}
			else
			{
				this.dispatchEvent(Pic.newsManager.newsContentEvent());
			}
		}
	}
}