package ui.page
	//ui.page.LinkItemKHabargozaran
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
	public class LinkItemKHabargozaran extends LinkItem
	{
		private var avatar:Avatar ;
		
		private var userName:TitleText ;
		
		private var sentPhotos:TitleText ;
		
		private var myUser:VUser ;
		
		public static var userid:String;
		
		public function LinkItemKHabargozaran()
		{
			super();
			avatar = Obj.findThisClass(Avatar,this,true);
			userName = Obj.get("user_name_txt",this);
			sentPhotos = Obj.get("user_sent_photo_txt",this);
		}
		override public function setUp(linkData:LinkData):void
		{
			myUser = linkData.dynamicData as VUser ;
			avatar.loadImage(linkData.iconURL);
			userName.text = linkData.name ;
			
		}
		override public function imSelected(event:MouseEvent=null):void
		{
			userid = myUser.UserId;
			var linkdata:LinkData = new LinkData();
			linkdata.id = 'newkhabargozarha';
			linkdata.level = -1;
			this.dispatchEvent(new AppEventContent(linkdata));
			
		}
		
	}
}