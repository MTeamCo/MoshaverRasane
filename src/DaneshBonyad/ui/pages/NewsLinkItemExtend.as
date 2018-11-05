package DaneshBonyad.ui.pages
{//JashnvareSalamat.ui.pages.NewsLinkItemExtend
	import appManager.displayContentElemets.TitleText;
	
	import contents.LinkData;
	
	import flash.events.Event;
	
	import ofogh.ui.pages.newsList.NewsLinkItem;
	
	public class NewsLinkItemExtend extends NewsLinkItem
	{
		//private var _Sartitr_mc:TitleText ;searchForElements

		public function NewsLinkItemExtend(mouseChildAccept:Boolean=false, searchForElements:Boolean=true)
		{
			super(mouseChildAccept, searchForElements);
		}
		
		override public function setUp(linkData:LinkData):void
		{
			super.setUp(linkData)
			//_Sartitr_mc = Obj.get("Sartitr_mc",this);
			//_Sartitr_mc.setUp(myData.Head,true,splitTitle_if_to_long);
		}
	}
}