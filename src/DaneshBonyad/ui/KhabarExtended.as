package DaneshBonyad.ui
{//JashnvareSalamat.ui.KhabarExtended
	import Tabnak.ui.pages.AllKhabarContentPage;
	import Tabnak.ui.pages.SoundPlayer;
	import Tabnak.ui.pages.TitleAksha;
	import Tabnak.ui.pages.VideoPlayer;
	
	import appManager.displayContentElemets.LightImage;
	import appManager.displayContentElemets.TextParag;
	import appManager.displayContentElemets.TitleText;
	import appManager.event.TitleEvent;
	
	import darkBox.DarkBox;
	import darkBox.ImageFile;
	
	import diagrams.calender.MyShamsi;
	
	import flash.display.MovieClip;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.net.dns.AAAARecord;
	import flash.net.navigateToURL;
	
	
	import ofogh.ui.pages.newsContent.NewsContentToolbar;
	
	import picContest.NewsEvent;
	import picContest.Pic;
	import picContest.PicConst;
	import picContest.services.webCallerNews.GetNewsGallery;
	
	public class KhabarExtended extends AllKhabarContentPage
	{
		private var _PdfLink_mc:MovieClip ;

		
		public function KhabarExtended()
		{
			super();

		}
		
		
		
		override public function drawInterface():void
		{
			this.dispatchEvent(new TitleEvent(myVNews.Title));
			
			Pic.newsManager.addVeiw();
			
			trace("Stored myVNews : "+JSON.stringify(myVNews,null,' '));
			
			mySoundPlayer.setUp(myVNews.getMP3(),myVNews.TitleFileName4);
			myVideoPlayer.setUp(myVNews.FileUrl,myVNews.FileUrlTitle);
			
			/*if(myPageData.links2.length>0)
			{
				link_comments = myPageData.links2[0];
			}
			else
			{
				trace("****WARNING!!! COMMENT LINK DEACTIVAED**********");
			}*/
			
			
			_PdfLink_mc = Obj.get("PdfLink_mc",this);
			newsToolabar = Obj.get("Liker_mc",this);
			_Proloader_mc = Obj.get("Proloader_mc",this);
			_Proloader_mc.visible = false ;
			_Title_mc = Obj.get("Title_mc",this);
			_Tarikh_mc = Obj.get("Tarikh_mc",this);
			_TitleAks1_mc = Obj.get("TitleAks1_mc",this);
			_TitleAks2_mc = Obj.get("TitleAks2_mc",this);
			_TitleAks3_mc = Obj.get("TitleAks3_mc",this);
			_Kholase_parag1_Mc = Obj.get("Kholase_parag1_Mc",this);
			_Paragraf1_Mc = Obj.get("Paragraf1_Mc",this);
			_Paragraf2_Mc = Obj.get("Paragraf2_Mc",this);
			_SoundTitle_mc = Obj.get("SoundTitle_mc",this);
			_TitleAksha_mc = Obj.get("TitleAksha_mc",this);
			_Tablighat_mc = Obj.get("Tablighat_mc",this);
			
			
			
			getNewsGallery = new GetNewsGallery();
			getNewsGallery.addEventListener(Event.COMPLETE,getNewsGalleryCOMPLETE_fun)
			getNewsGallery.addEventListener(ErrorEvent.ERROR,getNewsGallerySERVER_ERROR_fun)
			getNewsGallery.addEventListener(Event.UNLOAD,getNewsGallerynoNet)
			getNewsGallery.load(myVNews.NewsId)
			//
			newsToolabar.setUp(Pic.newsManager.getSelectedNews(),link_comments);
			newsToolabar.updateDataFromWeb();
			//
			imageList = new Vector.<ImageFile>()
			//چیدن مطالب روی صفحه
			newsToolabar.x = 0
			//
			//_PdfLink_mc.buttonMode = true;
			
			if(isNotEmpty(myVNews.Title)){
				if(_Title_mc is TitleText)
				{
					(_Title_mc as TitleText).setUp(myVNews.Title,true);
				}
				else if(_Title_mc is TextParag)
				{
					(_Title_mc as TextParag).setUp(myVNews.Title,true,true,false,false,false,false,false,false,true,false,false,0,false);
				}
			}
			//if(Tarikh_current !== ""){
			dateok = ServerDate.serverDateToDate(myVNews.CreatedDate);
			shamsiDate = MyShamsi.miladiToShamsi(dateok)
			_Tarikh_mc.setUp(String(shamsiDate.showStringFormat(false,false)),true);
			//}
			if(myVNews.FileUrl !== ""){
				this.setChildIndex(myVideoPlayer,numChildren-1)
			}
			if(myVNews.NewsBreif !== ""){
				_Kholase_parag1_Mc.setUp(myVNews.NewsBreif,true,true,false,false,false,false,false,true,true)
			}
			
			trace('::::::::::::::::::::1',myVNews.TitleFileName1)
			trace('::::::::::::::::::::2',myVNews.TitleFileName2)
			trace('::::::::::::::::::::3',myVNews.TitleFileName3)
			
			if(isNotEmpty(myVNews.TitleFileName1)){
				_TitleAks1_mc.setUp(myVNews.TitleFileName1,true);
				_allPrimaryAks++
			}
			if(isNotEmpty(myVNews.Context)){
				_Paragraf1_Mc.setUp(myVNews.Context,true,true,false,false,false,false,false,true,true)
			}
			if(isNotEmpty(myVNews.TitleFileName2)){
				_TitleAks2_mc.setUp(myVNews.TitleFileName2,true);
				_allPrimaryAks++
			}
			if(isNotEmpty(myVNews.Context2)){
				
				_Paragraf2_Mc.setUp(myVNews.Context2,true,true,false,false,false,false,false,true,true)
			}
			if(isNotEmpty(myVNews.TitleFileName3)){
				_TitleAks3_mc.setUp(myVNews.TitleFileName3,true);
				_allPrimaryAks++
			}
			newsFirstImages = 0 ;
			if(myVNews.FileName1 !== ""){
				newsFirstImages++;
				myImage1 = new LightImage();
				this.addChild(myImage1);
				myImage1.x = 1000
				myImage1.setUp(myVNews.getImage(0),false,730,-1);
				imageList.push(new ImageFile(myVNews.getImage(0),myVNews.TitleFileName1,1))
				myImage1.addEventListener(Event.COMPLETE,image1Loaded);
				myImage1.addEventListener(MouseEvent.CLICK,ClickImage1);
			}
			if(myVNews.FileName2 !== ""){
				newsFirstImages++;
				myImage2 = new LightImage();
				this.addChild(myImage2);
				myImage2.x = 1000
				myImage2.setUp(myVNews.getImage(1),false,730,-1);
				imageList.push(new ImageFile(myVNews.getImage(1),myVNews.TitleFileName2,1))
				myImage2.addEventListener(Event.COMPLETE,image2Loaded);
				myImage2.addEventListener(MouseEvent.CLICK,ClickImage1);
			}
			if(myVNews.FileName3 !== ""){
				newsFirstImages++;
				myImage3 = new LightImage();
				this.addChild(myImage3);
				myImage3.x = 1000
				myImage3.setUp(myVNews.getImage(2),false,730,-1);
				imageList.push(new ImageFile(myVNews.getImage(2),myVNews.TitleFileName3,1))
				myImage3.addEventListener(Event.COMPLETE,image3Loaded);
				myImage3.addEventListener(MouseEvent.CLICK,ClickImage1);
			}
			_Proloader_mc.x = 384
			_Proloader_mc.y = _y
			//
			refresh1();
			scrollAll = new ScrollMT(this,new Rectangle (0,0,PicConst.pagesRect.width,PicConst.pagesRect.height),null,true);
			
			if(allSocialButtons.length>0)
			{
				trace("** load socials");
				Pic.newsManager.addEventListener(NewsEvent.SOCIAL_LOADED,showSocialButtons);
				Pic.newsManager.loadCurrentNewsSocialMedia();
			}
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		override public function refresh1():void
		{
			_y = newsToolabar.y;
			//
			newsToolabar.x = 0;
			//newsToolabar.y = _y+15
			_y = _y + newsToolabar.height;
			//
			/*if(socialButtons_Telegram ){
			socialButtons_Telegram.x = 35
			socialButtons_Telegram.y = _y+15
			}
			//
			if(socialButtons_Instagram){
			socialButtons_Instagram.x = 17.55
			socialButtons_Instagram.y = _y+15
			_y = _y + socialButtons_Instagram.height
			}*/
			
			//
			if(isNotEmpty(myVNews.Title)){
				_Title_mc.x = 0;
				_y = _y + 5;
				_Title_mc.y = _y;
				_y = _y + _Title_mc.height;
			}
			//if(Tarikh_current !== ""){
			_Tarikh_mc.x = 40;
			_y = _y - 65;
			_Tarikh_mc.y = _y;
			_y = _y + _Tarikh_mc.height;
			//}
			if(isNotEmpty(myVNews.NewsBreif)){
				_Kholase_parag1_Mc.x = 0;
				_y = _y + 5;
				_Kholase_parag1_Mc.y = _y;
				_y = _y + _Kholase_parag1_Mc.height;
			}
			if(myVNews.FileName4 !== ""){
				mySoundPlayer.x = 0
				_y = _y + 5
				mySoundPlayer.y =_y
				_y = _y + mySoundPlayer.height
			}
			if(myVNews.FileUrl !== "" && myVNews.FileUrl!=null){
				myVideoPlayer.x = 320;
				if(myImage1==null)
				{
					myVideoPlayer.y = _y + myVideoPlayer.height/2 ;
					_y+=myVideoPlayer.height*2 ;
				}
				else
				{
					myVideoPlayer.y = _y + ((myImage1.height/2)-64)
				}
				this.setChildIndex(myVideoPlayer,numChildren-1)
			}
			if(myVNews.FileName1 !== "" && !myImage1.isLoading()){
				myImage1.x =17.5;
				_y = _y + paddingImages;
				myImage1.y = _y;
				_y = _y + myImage1.height;
			}
			if(isNotEmpty(myVNews.TitleFileName1)){
				_TitleAks1_mc.x = 0
				_y = _y + 5
				_TitleAks1_mc.y = _y
				_y = _y + _TitleAks1_mc.height
			}
			if(isNotEmpty(myVNews.Context)){
				
				_Paragraf1_Mc.x = 0
				_y = _y + 5
				_Paragraf1_Mc.y = _y;
				_y = _y + _Paragraf1_Mc.height
			}
			if(myVNews.FileName2 !== "" && !myImage2.isLoading()){
				myImage2.x = 17.5
				_y = _y + paddingImages;
				myImage2.y = _y
				_y = _y + myImage2.height
			}
			if(isNotEmpty(myVNews.TitleFileName2)){
				_TitleAks2_mc.x = 0
				_y = _y + 5
				_TitleAks2_mc.y = _y
				_y = _y + _TitleAks2_mc.height
			}
			if(isNotEmpty(myVNews.Context2)){
				_Paragraf2_Mc.x = 0
				_y = _y + paddingImages;
				_Paragraf2_Mc.y = _y
				_y = _y + _Paragraf2_Mc.height
			}
			if(myVNews.FileName3 !== "" && !myImage3.isLoading()){
				myImage3.x = 17.5
				_y = _y + paddingImages;
				myImage3.y = _y
				_y = _y + myImage3.height
			}
			if(isNotEmpty(myVNews.TitleFileName3)){
				_TitleAks3_mc.x = 0
				_y = _y + 5
				_TitleAks3_mc.y = _y
				_y = _y + _TitleAks3_mc.height
			}
			if(_Tablighat_mc !== null){
				_Tablighat_mc.x = 0
				_Tablighat_mc.y = _y+ 5;
			}
			if(_PdfLink_mc != null){
				_PdfLink_mc.y = _y;
				_PdfLink_mc.x = 62.4
			}
			
			_Proloader_mc.x = 384
			_Proloader_mc.y = _y + 5
			
				

			//
			if(_allPrimaryAks == _cunterPrimaryAks){
				Tabnak.ui.pages.AllKhabarContentPage._RefreshOk = true
				imagesOk()
			}
		}
		
		override public function imagesOk():void
		{
			if(_RefreshOk == true && _GalleryOk == true){
				for(var c = 0 ; c<getNewsGallery.data.length ; c++)
				{
					trace("♦ show gallery images : "+getNewsGallery.data[c].getImage());
					mygallery[c] = new LightImage();
					this.addChild(mygallery[c]);
					imageList.push(new ImageFile(getNewsGallery.data[c].getImage(),getNewsGallery.data[c].Title,1))
					mygallery[c].addEventListener(Event.COMPLETE,mygallery_fun);
					mygallery[c].addEventListener(ErrorEvent.ERROR,mygalleryERROR_fun);
					mygallery[c].addEventListener(MouseEvent.CLICK,ClickImage1);
					mygallery[c].x = 1000
					mygallery[c].setUp(getNewsGallery.data[c].getImage(),false,730,-1);
					//
					gallerytitle[c] = new TitleAksha();
					this.addChild(gallerytitle[c]);
					gallerytitle[c].setUp(getNewsGallery.data[c].Title,true);
					gallerytitle[c].x = 1000
				}
				if(_PdfLink_mc != null){
					_PdfLink_mc.y = _y;
					_PdfLink_mc.x = 62.4

				}
			}
		}
		
		
		override public function refresh2():void
		{
			for(var b = 0 ; b<getNewsGallery.data.length ; b++)
			{
				_y = _y + paddingGalleryImages
				mygallery[b].x = 17.5
				mygallery[b].y = _y;
				trace("mygallery["+b+"].y : "+mygallery[b].y);
				_y = _y + mygallery[b].height;
				//
				if(getNewsGallery.data[b].Title!='')
				{
					_y = _y + paddingGalleryImages;
					gallerytitle[b].x = 17.5;
					gallerytitle[b].y = _y;	
					_y = _y + gallerytitle[b].height
				}
				if(_PdfLink_mc != null){
					_PdfLink_mc.y = _y;
				}
				if(_Tablighat_mc!=null)
				{
					_Tablighat_mc.y = _y ;
					_PdfLink_mc.x = 62.4

				}
				//
				_Proloader_mc.visible = false
			}
		}
		
		override protected function openSocial(event:MouseEvent):void
		{
			var socialName:String = (event.currentTarget as MovieClip).name.split('_mc').join('') ;
			
			if(socialName  ==  'PdfLink'){
				trace(Pic.newsManager.getSocialMedias().getSpecialSocial(socialName)[0].Url);
				//imageList.setUp(myVNews.getImage(0),false,740,-1);
	
				var _imageFile:ImageFile = new ImageFile(Pic.newsManager.getSocialMedias().getSpecialSocial(socialName)[0].Url,'',5)
				var iamgeList:Vector.<ImageFile> = new Vector.<ImageFile>()
					iamgeList.push(_imageFile)
					DarkBox.show(iamgeList)

			}else{
				navigateToURL(new URLRequest(Pic.newsManager.getSocialMedias().getSpecialSocial(socialName)[0].Url));					
			}
		}
		
		
		
		
		
		
		
		
		
		
		private function isNotEmpty(str:String):Boolean
		{
			if(str==null)
			{
				return false ;
			}
			if(str.split('\t').join('').split(' ').join('').split('\n').join('').split('\r').join('')!='')
			{
				return true ;
			}
			else
			{
				return false ;
			}
		}
	}
}