package DaneshBonyad.ui
{//JashnvareSalamat.ui.Aksfooter
	import appManager.displayContentElemets.TitleText;
	
	import contents.LinkData;
	
	import diagrams.calender.MyShamsi;
	
	import ofogh.ui.pages.newsList.NewsLinkItem;
	
	public class Aksfooter extends NewsLinkItem
	{
		private var _coment_mc:TitleText ;
		private var _like_mc:TitleText ;
		private var _zaman_mc:TitleText ;

		private var dateok:String ;
		private var shamsiDate:MyShamsi;


		public function Aksfooter(mouseChildAccept:Boolean=false, searchForElements:Boolean=true)
		{
			super(mouseChildAccept, searchForElements);
		}
		
		override public function setUp(linkData:LinkData):void
		{
			super.setUp(linkData)
			_coment_mc = Obj.get("coment_mc",this);
			_like_mc = Obj.get("like_mc",this);
			_zaman_mc = Obj.get("zaman_mc",this);

				
			
			if(myData.ConfirmedCommentCount == null && _coment_mc!=null){
				_coment_mc.setUp('0',true);
			}else if(_coment_mc!=null){
				_coment_mc.setUp(myData.ConfirmedCommentCount,true);
			}
			
			if(_like_mc!=null)
			{		
				_like_mc.setUp(String(myData.PositiveScore),true);
			}
			
			
			
			//dateok = ServerDate.serverDateToDate(myData.CreatedDate).toString();
			shamsiDate = MyShamsi.miladiToShamsi(ServerDate.serverDateToDate(myData.CreatedDate));
			
			//  1395/12/15
			var datnow:Date = new Date;
			
			if(datnow.date == ServerDate.serverDateToDate(myData.CreatedDate).date && _zaman_mc!=null){
				_zaman_mc.setUp('امروز',true);
			}else if(datnow.date+1 == ServerDate.serverDateToDate(myData.CreatedDate).date && _zaman_mc!=null){ //&&  (shamsiDate.month+1) == datnow.month
				_zaman_mc.setUp('دیروز',true);
			}else if(_zaman_mc!=null){
				_zaman_mc.setUp(shamsiDate.minutes + ' : ' + shamsiDate.hours + ' - ' + shamsiDate.fullYear+'/'+(shamsiDate.month+1)+'/'+shamsiDate.date,true);
			}
		}
	}
}