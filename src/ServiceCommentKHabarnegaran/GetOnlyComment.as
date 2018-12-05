package ServiceCommentKHabarnegaran
{
	import com.mteamapp.JSONParser;
	
	import contents.LinkData;
	import contents.PageData;
	import contents.alert.Alert;
	
	import picContest.services.types.VNews;
	
	import webService.types.WebServiceParser;
	import webService.webCallers.WebServiceCaller;
	
	public class GetOnlyComment extends WebServiceCaller
	{
		public static var returnRevertedList:Boolean = false ;
		public var data:Vector.<VNews> = new Vector.<VNews>();
		
		public function pageData():PageData
		{
			if(data==null)
			{
				return new PageData();
			}
			else
			{
				var pageData:PageData = new PageData();
				for(var i = 0 ; i<data.length ; i++)
				{
					var link:LinkData = data[i].linkData();
					pageData.links1.push(link);
				}
				return pageData ;
			}
		}
		
		public function GetOnlyComment(offlineDataIsOK_v:Boolean=false, justLoadOfline_v:Boolean=false, maximomOfflineData:Date=null)
		{
			super("GetOnlyComment", offlineDataIsOK_v, justLoadOfline_v, maximomOfflineData);
		}
		public function load(UserId:String='',LanguageBaseId:int=11):void
		{
			super.loadParams(UserId,LanguageBaseId);
		}
		override protected function manageData(pureData:String):Boolean
		{
			data = new Vector.<VNews>();
			var toData:Object = {data:data} ;
			var fromData:Object = {data:JSON.parse(pureData)};
			JSONParser.parsParams(fromData,toData);
			return true
		}
	}
}