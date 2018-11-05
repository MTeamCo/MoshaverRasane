package DaneshBonyad.ui
{//JashnvareSalamat.ui.BartarinTasvirExtended
	import Tabnak.ui.pages.Akhbar.DynamicNewsList;
	
	import contents.PageData;
	
	
	public class BartarinTasvirExtended extends DynamicNewsList
	{
		public function BartarinTasvirExtended()
		{
			super();
			
		}
		
		override protected function loadNews(newsTitle:String='',newsBaseId:String='0',searchOrder:String=null,isSpecial:String='',excludedBaseIds:Array=null,pageDataForUsintPageId:PageData=null):void
		{
			newsList.setUp2('','0',null,'true',null,null);

		}
	}
}