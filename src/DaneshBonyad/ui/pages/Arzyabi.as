package DaneshBonyad.ui.pages
{//JashnvareSalamat.ui.pages.Arzyabi
	import contents.PageData;
	import contents.interFace.DisplayPageInterface;
	
	import darkBox.DarkBox;
	import darkBox.ImageFile;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Arzyabi extends MovieClip implements DisplayPageInterface
	{
		
		public var _image1:MovieClip ;
		private var imageList:Vector.<ImageFile> ;

		public function Arzyabi()
		{
			super();
			_image1 = Obj.get("image1",this);
			_image1.buttonMode = true;
			_image1.addEventListener(MouseEvent.CLICK,_image1_fun);

		}
		
		protected function _image1_fun(event:MouseEvent):void
		{
			trace('CXXXXXXXXXXXXSSSSSSSSSSSSSSSSSSSSD');
			imageList = new Vector.<ImageFile>()
			imageList.push(new ImageFile('D:/karimpoor/PicContestApp/Project/DaneshBonian/src/Data/images/image1.jpg','',2))
			DarkBox.show(imageList,0)
		}
		
		public function setUp(pageData:PageData):void
		{
		}
	}
}