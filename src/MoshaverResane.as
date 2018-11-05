package
{
	import Aroos.ui.pages.editProfile.EditPassPage;
	import Aroos.ui.pages.search.SearchPage;
	
	import Tabnak.ui.pages.AllKhabarContentPage;
	
	import appManager.displayContentElemets.LightImage;
	
	import contents.Contents;
	import contents.displayPages.DynamicLinks;
	
	import darkBox.DarkBox;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	
	import mx.events.DynamicEvent;
	
	import ofogh.ui.pages.newsList.NewsLinkItem;
	
	import picContest.Pic;
	import picContest.PicConst;
	import picContest.PicContestMain;
	
	import popForm.PopMenuContent;
	
	import restDoaService.RestDoaService;
	
	import stageManager.StageManager;
	
	public class MoshaverResane extends PicContestMain
	{
		
		public function MoshaverResane()
		{
			EditPassPage.numAndString=false;
			NewsLinkItem.splitParag_if_to_long= false;
			super(0,true,true,true,false,true,true,1,false,false,true,false,false);
			RestDoaService.setUp(Pic.config.restServicesDomain)
			Unicode.estesna= '-[]»«)(":';
			StageManager.add("footer_css",0,1,false);
			AllKhabarContentPage.AlignText = true ;
			SearchPage.searchType = 2 ;
		}
	}
}