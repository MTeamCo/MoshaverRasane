package ui.page
	//ui.page.FilterHomePage
{
	import contents.alert.Alert;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.SoftKeyboardType;
	
	import ofogh.ui.pages.newsList.NewsListGenerator;
	
	import picContest.PicConst;
	import picContest.services.webCallerNews.GetNews;
	import picContest.ui.elements.PreLoader;
	
	import popForm.PopButtonData;
	import popForm.PopField;
	import popForm.PopMenuEvent;
	import popForm.PopMenuFields;
	
	public class FilterHomePage extends MovieClip
	{
		private var newsListfilter:NewsListGeneratorExtend ;
		private var akhbar:PopField;
		private var back:MovieClip;
		private var PreLoaderMC:PreLoader;
		public function FilterHomePage()
			{
			super();
			/*PreLoaderMC = new PreLoader();
			this.addChild(PreLoaderMC);
			PreLoaderMC.x = PicConst.pagesRect.width/2;
			PreLoaderMC.y = PicConst.pagesRect.height/2;*/
			akhbar = Obj.getAllChilds("akhbar_mc",this)[0];
			back = Obj.get('back_mc',this);
			akhbar.enabled = false ;
			akhbar.setUp('اخبارها','اخبارها',SoftKeyboardType.DEFAULT,false,true,true,1,1,1,0,null,true);
			akhbar.addEventListener(MouseEvent.CLICK,selectfootelh);
			newsListfilter = Obj.getAllChilds("newsListfilter_mc",this)[0];
			newsListfilter.visible=false;
			back.visible=false;
			newsListfilter.horizontalMenu = false;
			newsListfilter.changeDeltaXY(0,3);
			
		
		function selectfootelh(e:MouseEvent):void
		{
			var options:Array = [];
			options.push(new PopButtonData('سینما',2,1))
			options.push(new PopButtonData('فناوری',2,2))
			options.push(new PopButtonData('تجسمی',2,3))
			options.push(new PopButtonData('موسیقی',2,4))
			options.push(new PopButtonData('حذف فیلتر',2,5))
			Hints.selector('','',options,SElectedFoot);
			
		}
		function SElectedFoot(e:PopMenuEvent):void
		{	
			akhbar.text = e.buttonTitle ;
			//Alert.show('1**'+e.buttonTitle);
			if (e.buttonID == 1)
			{
				back.visible=true;
				newsListfilter.visible=true;
				newsListfilter.setUp2('','219',null,"",null,null,GetNews.direction_desc);
				//PreLoaderMC.visible = false ;
			}
			else if (e.buttonID == 2)
			{
				back.visible=true;
				newsListfilter.visible=true;
				newsListfilter.setUp2('','217',null,"",null,null,GetNews.direction_desc);
			}
			else if (e.buttonID == 3)
			{
				back.visible=true;
				newsListfilter.visible=true;
				newsListfilter.setUp2('','216',null,"",null,null,GetNews.direction_desc);
			}
			else if (e.buttonID == 4)
			{
				back.visible=true;
				newsListfilter.visible=true;
				newsListfilter.setUp2('','218',null,"",null,null,GetNews.direction_desc);	
			}
			else if (e.buttonID == 5)
			{
				back.visible=false;
				newsListfilter.visible=false;
				akhbar.setUp('اخبارها','اخبارها');
			}
		}
			}
	}
}