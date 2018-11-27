package ui.page
	//ui.page.LinkItemKHabarnegaran
{
	import contents.displayPages.LinkItem;
	import appManager.displayContentElemets.TitleText;
	import appManager.event.AppEventContent;
	import contents.LinkData;
	import contents.alert.Alert;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import picContest.services.types.VUser;
	import picContest.ui.elements.Avatar;
	public class LinkItemKHabarnegaran extends LinkItem
	{
		private var avatar:Avatar ;
		
		private var userName:TitleText ;
		
		private var sentPhotos:TitleText ;
		
		private var myUser:VUser ;
		
		public static var userid:String;
		public function LinkItemKHabarnegaran()
		{
			super();
			avatar = Obj.findThisClass(Avatar,this,true);
			userName = Obj.get("user_name_txt",this);
			sentPhotos = Obj.get("user_sent_photo_txt",this);
		}
		override public function setUp(linkData:LinkData):void
		{
			myUser = linkData.dynamicData as VUser ;
			/*if(sentPhotos)
			{
			myUser = linkData.dynamicData as VUser ;
			sentPhotos.text = myUser.TotalPhotos ;
			
			}*/
			
			avatar.loadImage(linkData.iconURL);
			userName.text = linkData.name ;
			//myLinkData = linkData;
			
			
		}
		override public function imSelected(event:MouseEvent=null):void
		{
			userid = myUser.UserId;
			var linkdata:LinkData = new LinkData();
			linkdata.id = 'newkhabarnegaran';
			linkdata.level = -1;
			this.dispatchEvent(new AppEventContent(linkdata));
			
		}
	}
}