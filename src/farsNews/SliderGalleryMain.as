package farsNews
	//farsNews.SliderGalleryMain
{
	
	import appManager.displayContent.SliderGallery;
	import appManager.displayContent.SliderImageItem;
	import appManager.displayContentElemets.Image;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import picContest.services.webCaller.GetSponsors;
	
	public class SliderGalleryMain extends Sprite
	{
		private var service_slider:GetSponsors;
		private var slideGallery:SliderGallery
		
		private var images:Vector.<SliderImageItem>;
		
		
		
		public function SliderGalleryMain()
		{
			super();
			slideGallery = Obj.findThisClass(SliderGallery,this);
			
			setup();
			
			slideGallery.addEventListener(MouseEvent.CLICK,openURL);
			
			//images.push(new SliderImageItem("Data/images/01.jpg"));
			//images.push(new SliderImageItem("Data/images/02.jpg"));
			
			this.addEventListener(Event.REMOVED_FROM_STAGE,unLoad);
			
		}
		
		protected function openURL(event:MouseEvent):void
		{
			if(service_slider.data[slideGallery.currentImageIndex].Description!='')
			{
				navigateToURL(new URLRequest(service_slider.data[slideGallery.currentImageIndex].Description));
			}
		}
		
		protected function unLoad(event:Event):void
		{
			service_slider.removeEventListener(Event.COMPLETE,galeryload);
		}
		public function setup()
		{
			trace ('call function++++++++++++++++++++++++++++++');
		
			service_slider = new GetSponsors(true,true);
			service_slider.addEventListener(Event.COMPLETE,galeryload);
			service_slider.load('0',GetSponsors.type_Home);
			
		}
		public function galeryload(slid:*)
		{
			
			images = new Vector.<SliderImageItem>(); 
			//service_slider.data[0].
			for( var i= 0;i<service_slider.data.length;i++)
			(
				images.push(new SliderImageItem(service_slider.data[i].imageReal()))
				
			)
			slideGallery.setUp(images,0,6000);
				
		}

	}	
	
}