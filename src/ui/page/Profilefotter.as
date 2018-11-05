package ui.page
	//ui.page.Profilefotter
{
	import appManager.event.AppEventContent;
	
	import contents.LinkData;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	import picContest.Pic;
	
	public class Profilefotter extends MovieClip
	{
		private var edit:MovieClip;	
		public function Profilefotter()
		{
			super();
			edit = Obj.get('edit_mc2',this);
			edit.addEventListener(MouseEvent.CLICK,sabtnam);
		}
		protected function sabtnam(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			var Linkdata:LinkData = new LinkData();
			Linkdata.id='profile_page'
			if (Pic.userManager.isLogedIn())
			{
				this.dispatchEvent(new AppEventContent(Linkdata));
				//Hints.show('test');
			}
			
			if (!Pic.userManager.isLogedIn())
			{
				Hints.show('ابتدا ثبت نام کنید');
				var Linkdata2:LinkData = new LinkData();
				Linkdata.id='register_page'
				this.dispatchEvent(new AppEventContent(Linkdata));
			}
			
		}
	}
}