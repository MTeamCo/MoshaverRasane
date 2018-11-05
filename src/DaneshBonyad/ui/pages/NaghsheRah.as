package DaneshBonyad.ui.pages
{//DaneshBonyad.ui.pages.NaghsheRah
	import contents.PageData;
	import contents.interFace.DisplayPageInterface;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	public class NaghsheRah extends MovieClip implements DisplayPageInterface
	{		
		private var _page1_1:SimpleButton;
		private var _page1_2:SimpleButton;
		private var _page1_3:SimpleButton;
		private var _page1_4:SimpleButton;
		private var _page1_5:SimpleButton;
		private var _page1_6:SimpleButton;
		private var _page1_7:SimpleButton;
		//
		private var _page2_1:SimpleButton;
		private var _page2_2:SimpleButton;
		private var _page2_3:SimpleButton;
		private var _page2_4:SimpleButton;
		private var _page2_5:SimpleButton;
		private var _page2_6:SimpleButton;
		//
		private var _page3_1:SimpleButton;
		private var _page3_2:SimpleButton;
		private var _page3_3:SimpleButton;
		private var _page3_4:SimpleButton;
		private var _page3_5:SimpleButton;
		private var _page3_6:SimpleButton;
		private var _page3_7:SimpleButton;
		private var _page3_8:SimpleButton;
		private var _page3_9:SimpleButton;
		private var _page3_10:SimpleButton;
		//
		private var _page4_1:SimpleButton;
		private var _page4_2:SimpleButton;
		private var _page4_3:SimpleButton;
		private var _page4_4:SimpleButton;
		private var _page4_5:SimpleButton;
		private var _page4_6:SimpleButton;
		private var _page4_7:SimpleButton;
		private var _page4_8:SimpleButton;
		private var _page4_9:SimpleButton;
		private var _page4_10:SimpleButton;
		private var _page4_11:SimpleButton;
		//
		
		public function NaghsheRah()
		{
			super();
			//
			_page1_1 = Obj.get("page1_1",this);
			_page1_2 = Obj.get("page1_2",this);
			_page1_3 = Obj.get("page1_3",this);
			_page1_4 = Obj.get("page1_4",this);
			_page1_5 = Obj.get("page1_5",this);
			_page1_6 = Obj.get("page1_6",this);
			_page1_7 = Obj.get("page1_7",this);
			_page1_1.addEventListener(MouseEvent.CLICK,_page1_1_fun);
			_page1_2.addEventListener(MouseEvent.CLICK,_page1_2_fun);
			_page1_3.addEventListener(MouseEvent.CLICK,_page1_3_fun);
			_page1_4.addEventListener(MouseEvent.CLICK,_page1_4_fun);
			_page1_5.addEventListener(MouseEvent.CLICK,_page1_5_fun);
			_page1_6.addEventListener(MouseEvent.CLICK,_page1_6_fun);
			_page1_7.addEventListener(MouseEvent.CLICK,_page1_7_fun);
			//
			_page2_1 = Obj.get("page2_1",this);
			_page2_2 = Obj.get("page2_2",this);
			_page2_3 = Obj.get("page2_3",this);
			_page2_4 = Obj.get("page2_4",this);
			_page2_5 = Obj.get("page2_5",this);
			_page2_6 = Obj.get("page2_6",this);
			_page2_1.addEventListener(MouseEvent.CLICK,_page2_1_fun);
			_page2_2.addEventListener(MouseEvent.CLICK,_page2_2_fun);
			_page2_3.addEventListener(MouseEvent.CLICK,_page2_3_fun);
			_page2_4.addEventListener(MouseEvent.CLICK,_page2_4_fun);
			_page2_5.addEventListener(MouseEvent.CLICK,_page2_5_fun);
			_page2_6.addEventListener(MouseEvent.CLICK,_page2_6_fun);
			//
			_page3_1 = Obj.get("page3_1",this);
			_page3_2 = Obj.get("page3_2",this);
			_page3_3 = Obj.get("page3_3",this);
			_page3_4 = Obj.get("page3_4",this);
			_page3_5 = Obj.get("page3_5",this);
			_page3_6 = Obj.get("page3_6",this);
			_page3_7 = Obj.get("page3_7",this);
			_page3_8 = Obj.get("page3_8",this);
			_page3_9 = Obj.get("page3_9",this);
			_page3_10 = Obj.get("page3_10",this);
			_page3_1.addEventListener(MouseEvent.CLICK,_page3_1_fun);
			_page3_2.addEventListener(MouseEvent.CLICK,_page3_2_fun);
			_page3_3.addEventListener(MouseEvent.CLICK,_page3_3_fun);
			_page3_4.addEventListener(MouseEvent.CLICK,_page3_4_fun);
			_page3_5.addEventListener(MouseEvent.CLICK,_page3_5_fun);
			_page3_6.addEventListener(MouseEvent.CLICK,_page3_6_fun);
			_page3_7.addEventListener(MouseEvent.CLICK,_page3_7_fun);
			_page3_8.addEventListener(MouseEvent.CLICK,_page3_8_fun);
			_page3_9.addEventListener(MouseEvent.CLICK,_page3_9_fun);
			_page3_10.addEventListener(MouseEvent.CLICK,_page3_10_fun);
			//
			_page4_1 = Obj.get("page4_1",this);
			_page4_2 = Obj.get("page4_2",this);
			_page4_3 = Obj.get("page4_3",this);
			_page4_4 = Obj.get("page4_4",this);
			_page4_5 = Obj.get("page4_5",this);
			_page4_6 = Obj.get("page4_6",this);
			_page4_7 = Obj.get("page4_7",this);
			_page4_8 = Obj.get("page4_8",this);
			_page4_9 = Obj.get("page4_9",this);
			_page4_10 = Obj.get("page4_10",this);
			_page4_11 = Obj.get("page4_11",this);
			_page4_1.addEventListener(MouseEvent.CLICK,_page4_1_fun);
			_page4_2.addEventListener(MouseEvent.CLICK,_page4_2_fun);
			_page4_3.addEventListener(MouseEvent.CLICK,_page4_3_fun);
			_page4_4.addEventListener(MouseEvent.CLICK,_page4_4_fun);
			_page4_5.addEventListener(MouseEvent.CLICK,_page4_5_fun);
			_page4_6.addEventListener(MouseEvent.CLICK,_page4_6_fun);
			_page4_7.addEventListener(MouseEvent.CLICK,_page4_7_fun);
			_page4_8.addEventListener(MouseEvent.CLICK,_page4_8_fun);
			_page4_9.addEventListener(MouseEvent.CLICK,_page4_9_fun);
			_page4_10.addEventListener(MouseEvent.CLICK,_page4_10_fun);
			_page4_11.addEventListener(MouseEvent.CLICK,_page4_11_fun);

		}
		
		protected function _page4_11_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?siteid=2&fkeyid=&siteid=2&pageid=14782"), "_blank");
		}
		
		protected function _page4_10_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=14671&siteid=2"), "_blank");
		}
		
		protected function _page4_9_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?siteid=2&fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=14770"), "_blank");
		}
		
		protected function _page4_8_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?siteid=2&fkeyid=&siteid=2&pageid=14794"), "_blank");
		}
		
		protected function _page4_7_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?fkeyid=&siteid=2&fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=13947"), "_blank");
		}
		
		protected function _page4_6_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?siteid=2&fkeyid=&siteid=2&pageid=14793"), "_blank");
		}
		
		protected function _page4_5_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?siteid=2&fkeyid=&siteid=2&pageid=14792"), "_blank");
		}
		
		protected function _page4_4_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?fkeyid=&siteid=2&fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=13948"), "_blank");
		}
		
		protected function _page4_3_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=14548&siteid=2"), "_blank");
		}
		
		protected function _page4_2_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?fkeyid=&siteid=2&fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=14751"), "_blank");
		}
		
		protected function _page4_1_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?siteid=2&siteid=2&fkeyid=&siteid=2&fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=8394&newsview=5691"), "_blank");
		}
		
		protected function _page3_10_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?siteid=2&fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=14599"), "_blank");
		}
		
		protected function _page3_9_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?siteid=2&fkeyid=&siteid=2&pageid=14718"), "_blank");
		}
		
		protected function _page3_8_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=14720"), "_blank");
		}
		
		protected function _page3_7_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?siteid=2&fkeyid=&siteid=2&pageid=13951"), "_blank");
		}
		
		protected function _page3_6_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?siteid=2&siteid=2&fkeyid=&siteid=2&fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=8155&newsview=9579"), "_blank");
		}
		
		protected function _page3_5_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?fkeyid=&siteid=2&fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=13950&siteid=2"), "_blank");
		}
		
		protected function _page3_4_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?siteid=2&fkeyid=&siteid=2&pageid=14777"), "_blank");
		}
		
		protected function _page3_3_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?fkeyid=&siteid=2&fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=13949"), "_blank");
		}
		
		protected function _page3_2_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?siteid=2&siteid=2&fkeyid=&siteid=2&fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=10366&siteid=2"), "_blank");
		}
		
		protected function _page3_1_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?siteid=2&fkeyid=&siteid=2&pageid=14796"), "_blank");
		}
		
		protected function _page2_6_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?fkeyid=&siteid=2&fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=14716&siteid=2"), "_blank");
		}
		
		protected function _page2_5_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?siteid=2&fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=14008"), "_blank");
		}
		
		protected function _page2_4_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?siteid=2&fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=13039"), "_blank");
		}
		
		protected function _page2_3_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=8429&siteid=2"), "_blank");
		}
		
		protected function _page2_2_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=9508&siteid=2"), "_blank");
		}
		
		protected function _page2_1_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=8394&newsview=2458"), "_blank");
		}
		
		protected function _page1_7_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?fkeyid=&siteid=2&fkeyid=&siteid=2&fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=151"), "_blank");
		}
		
		protected function _page1_6_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?fkeyid=&siteid=2&fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=1244&siteid=2"), "_blank");
		}
		
		protected function _page1_5_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=12717"), "_blank");
		}
		
		protected function _page1_4_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?siteid=2&fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=14765"), "_blank");
		}
		
		protected function _page1_3_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?fkeyid=&siteid=2&fkeyid=&siteid=2&pageid=1244&siteid=2"), "_blank");
		}
		
		protected function _page1_2_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://reg.daneshbonyan.ir/login.aspx?ReturnUrl=%2f"), "_blank");
		}
		
		protected function _page1_1_fun(event:MouseEvent):void
		{
			DaneshBonian.navigateToURL(new URLRequest("http://daneshbonyan.isti.ir/index.aspx?siteid=2&fkeyid=&siteid=2&pageid=14051"), "_blank");
		}
		
		
		public function setUp(pageData:PageData):void
		{
		}
	}
}