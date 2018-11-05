 package DaneshBonyad.ui.pages
{//DaneshBonyad.ui.pages.AllKhabarContentPageExtended
	
	import Tabnak.ui.pages.AllKhabarContentPage;
	
	import appManager.event.TitleEvent;
	
	public class AllKhabarContentPageExtended extends AllKhabarContentPage
	{
		
		
		public function AllKhabarContentPageExtended()
		{
			super();
		}
		
		override public function drawInterface():void
		{
			super.drawInterface();
			var firstPart:String = myVNews.Title.substr(0,4);
			var newTitle:String = myVNews.Title.substr(4,myVNews.Title.length) ;
			
			if(!isNaN(Number(firstPart)))
			{
				this.dispatchEvent(new TitleEvent(newTitle));
			}
		}
	}
}