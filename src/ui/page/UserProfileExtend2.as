package ui.page
	//ui.page.UserProfileExtend2
{
	import Aroos.ui.pages.profile.UserProfile;
	
	import appManager.displayContentElemets.TitleText;
	import appManager.event.AppEventContent;
	
	import componentStatic.TextBox;
	
	import contents.LinkData;
	import contents.PageData;
	import contents.alert.Alert;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import picContest.Pic;
	import picContest.PicConst;
	import picContest.PicEvent;
	
	public class UserProfileExtend2 extends UserProfile
	{
		private var commentnumber:TitleText;
		private var newsnumber:TitleText;
		private var title1:MovieClip;
		private var title2:MovieClip;
		public function UserProfileExtend2()
		{
			commentnumber = Obj.get('commentnumber_mc',this)
			newsnumber = Obj.get('newsnumber_mc',this)
			title1 = Obj.get('title1_mc',this);
			title2 = Obj.get('title2_mc',this);
		}
		override public function setUp(pageData:PageData):void
		{
			if(!Pic.userManager.isLogedIn())
			{
				var registerLink:LinkData = new LinkData();
				registerLink.level = -2 ;
				registerLink.id = Pic.config.registration_page ;
				this.dispatchEvent(new AppEventContent(registerLink));
				this.visible = false ;
				return ;
			}
			myPageData = pageData ;
			
			gallery_selectorMC.stop();
			gallery_selectorMC.gotoAndStop(2);
			gallery_waitingMC = Obj.get("waiting_mc",gallery_selectorMC);
			gallery_acceptedMC = Obj.get("accepted_mc",gallery_selectorMC);
			gallery_notSentMC = Obj.get("saved_mc",gallery_selectorMC);
			//button_changePass = Obj.get("pass_change_mc",this);
			
			gallery_notSentMC.addEventListener(MouseEvent.CLICK,openSpecialGallery);
			gallery_acceptedMC.addEventListener(MouseEvent.CLICK,opneAcceptedGallery);
			gallery_waitingMC.addEventListener(MouseEvent.CLICK,openNotAcceptedImages);
			
			
			
			//txt_comments.text = Pic.userManager.profile.TotalPhotos ;
			updateTexts(null);
			
			
			link_avatar_editor = pageData.links1[0];
			link_profile_editor = pageData.links1[1];
			link_onLogedOut = pageData.links1[2];
			link_local_storage = pageData.links1[3];
			//link_passEditor = pageData.links1[4];
			
			
			
			userNameTF.setUp(userProfile.fullName());
			if(realUserNameTF)
				realUserNameTF.setUp(userProfile.UserName);
			if(phoneNumberTF)
				phoneNumberTF.setUp(userProfile.MobileNo);
			if(adressTF)
				adressTF.setUp(userProfile.Adress,true,false);
			galleryRect = PicConst.pagesRect ;
			galleryRect.height-=galleryMC.y ;
			galleryMC.setUp2(galleryRect,5);
			
			if(editUserMC!=null)
			{
				editUserMC.addEventListener(MouseEvent.CLICK,editUser);
			}		
			avatarMC.addEventListener(MouseEvent.CLICK,openAvatarEditor);
			logoutMC.addEventListener(MouseEvent.CLICK,logOutUser);
			savedMC.addEventListener(MouseEvent.CLICK,openSavedStorage);
			
			/*if(button_changePass!=null)
			{
			button_changePass.addEventListener(MouseEvent.CLICK,openPassEditor);
			}*/
			
			
			Pic.userManager.addEventListener(PicEvent.PROFILE_UPDATED,updateTexts);
			this.addEventListener(Event.REMOVED_FROM_STAGE,unLoad);
			commentnumber.text = String(userProfile.CommentCount);
			newsnumber.text = String(userProfile.NewsCount);				
			if (commentnumber.text=='0')
			{
				commentnumber.visible=false;
				title1.visible=false;
			}
			else
			{
				title1.addEventListener(MouseEvent.CLICK,showkhabarnegaranPage);
				
			}
			if (newsnumber.text=='0')
			{
				newsnumber.visible=false;
				title2.visible=false;
			}
			else
			{
				title2.addEventListener(MouseEvent.CLICK,showsahebankhabarPage);
			}
			
		}
		
		protected function showsahebankhabarPage(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			var linkdata:LinkData = new LinkData;
			linkdata.id = 'khabarnegaran_page2';
			linkdata.level=-1;
			this.dispatchEvent(new AppEventContent(linkdata));
		}
		
		protected function showkhabarnegaranPage(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
				var linkdata:LinkData = new LinkData;
				linkdata.id = 'khabarnegaran_page';
				linkdata.level=-1;
				this.dispatchEvent(new AppEventContent(linkdata));
			
		}
	}
}