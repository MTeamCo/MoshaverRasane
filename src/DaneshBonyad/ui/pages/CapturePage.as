package DaneshBonyad.ui.pages
	//JashnvareSalamat.ui.pages.CapturePage
{
	import appManager.event.AppEventContent;
	
	import com.mteamapp.camera.MTeamCamera;
	
	import contents.Contents;
	import contents.LinkData;
	import contents.PageData;
	import contents.interFace.DisplayPageInterface;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.utils.ByteArray;
	
	import photoEditor.PhotoEdit;
	
	import picContest.Pic;
	import picContest.PicConst;
	
	import popForm.PopMenuEvent;
	
	public class CapturePage extends MovieClip implements DisplayPageInterface
	{
		private var button_rotate_left:MovieClip,
					button_rotate_right:MovieClip,
					button_capture:MovieClip,
					button_openCame:MovieClip,
					button_openGall:MovieClip;
					
		private var button_videoCamera:MovieClip,
					button_paint:MovieClip;
					
		public var cameraAreaMC:MovieClip ;
		
		private var mteamCamera:MTeamCamera ;
		
		private var link_image_editor:LinkData;
		
		private var captureBitmapData:BitmapData,
					videoIconMC:MovieClip;
					
		private var buttomItem:MovieClip ;
		
		public function CapturePage()
		{
			super();
			
			button_rotate_left = Obj.get("rotate_left_mc",this);
			button_rotate_right = Obj.get("rotate_right_mc",this);
			button_capture = Obj.getAllChilds("capture_mc",this)[0];
			button_openCame = Obj.getAllChilds("cmera_mc",this)[0];
			button_openGall = Obj.getAllChilds("gallery_mc",this)[0];
			
			buttomItem = Obj.get("buttom_css",this);
			
			button_paint = Obj.getAllChilds("paint_mc",this)[0];
			button_videoCamera = Obj.getAllChilds("video_camera_mc",this)[0];
			videoIconMC = Obj.get("video_icon_mc",this);
			
			cameraAreaMC = Obj.get("camera_mc",this);
			cameraAreaMC.height = PicConst.pagesRect.height - 80;

		}
		
		public function setUp(pageData:PageData):void
		{
			link_image_editor = pageData.links1[0];
			
			mteamCamera = new MTeamCamera(cameraAreaMC);

			if(buttomItem)
			{
				buttomItem.y = PicConst.pagesRect.height - 40 ;
			}
			
			button_rotate_left.addEventListener(MouseEvent.CLICK,rotateCamToLeft);
			button_rotate_right.addEventListener(MouseEvent.CLICK,rotateCameraRight);
			button_capture.addEventListener(MouseEvent.CLICK,captureCurrentImage);
			button_openCame.addEventListener(MouseEvent.CLICK,loadImageFromCamera);
			button_openGall.addEventListener(MouseEvent.CLICK,loadFromGall);
			
			if(button_paint)
			{
				button_paint.addEventListener(MouseEvent.CLICK,openPaint);
			}
			
			if(button_videoCamera)
			{
				captureBitmapData = new BitmapData(videoIconMC.width,videoIconMC.height,false,0x555555);
				if(videoIconMC)
				{
					captureBitmapData.draw(videoIconMC);
				}
				button_videoCamera.addEventListener(MouseEvent.CLICK,openVideoCamera);
			}
		}
		
			protected function openVideoCamera(event:MouseEvent):void
			{
				mteamCamera.deactivateCamera();
				if(DevicePrefrence.isItPC)
				{
					DeviceImage.loadVideo(videoReady,new File(Pic.config.video_debag_file));
				}
				else
				{
					DeviceImage.getVideoCamera(videoReady);
				}
			}
			
				private function videoReady():void
				{
					if(DeviceImage.videoBytes!=null)
					{
						trace("Video bytes : "+DeviceImage.videoBytes.length);
						saveCurrentVideo(DeviceImage.videoBytes,BitmapEffects.createJPG(captureBitmapData));//,DeviceImage.imageBytes);//BitmapEffects.createJPG(new BitmapData(100,100,false,0xff00ff)) );//
					}
					else
					{
						mteamCamera.activateCamera();
					}
				}
		
			/**Open paint*/
			protected function openPaint(event:MouseEvent):void
			{
				mteamCamera.deactivateCamera()
				PhotoEdit.Edit(new BitmapData(1024,768,false,0xffffff),onImagePainted);
			}
			
				/**image draw*/
				private function onImagePainted():void
				{
					if(PhotoEdit.image!=null)
					{
						saveCurrentImage(PhotoEdit.image);
					}
					else
					{
						mteamCamera.activateCamera();
					}
				}
		
		/**Call this function with null input to make it load device image gallery*/
		protected function loadFromGall(event:MouseEvent,forceToLoadFromImages:Boolean=false):void
		{
			trace("DeviceImage.isVideoFromGallerySupports() : "+DeviceImage.isVideoFromGallerySupports());
			trace("DevicePrefrence.isItPC : "+DevicePrefrence.isItPC);
			if((DeviceImage.isVideoFromGallerySupports() || DevicePrefrence.isItPC ) && button_capture!=null && forceToLoadFromImages!=true)
			{
				Hints.selector(Contents.lang.t.select_file,'',[Contents.lang.t.image_file,Contents.lang.t.video_file],onGalleryTypeSelected);
			}
			else
			{
				DeviceImage.loadImageFromGallery(deviceImageIsReady,button_openGall.getBounds(stage),Pic.config.contestImageW,Pic.config.contestImageW,Pic.config.media_debag_file_2);
			}
		}
		
			private function onGalleryTypeSelected(e:PopMenuEvent):void
			{
				trace("---The selected title is : "+e.buttonTitle);
				if(e.buttonTitle == Contents.lang.t.image_file)
				{
					trace("---Load device gallery");
					loadFromGall(null,true);
				}
				else
				{
					trace("---Load from device gallery");
					if(DevicePrefrence.isItPC)
					{
						DeviceImage.loadVideoFromGallery(videoReady,new File(Pic.config.video_debag_file));
					}
					else
					{
						DeviceImage.loadVideoFromGallery(videoReady);
					}
				}
			}
		
		protected function loadImageFromCamera(event:MouseEvent):void
		{
			DeviceImage.getCameraImage(deviceImageIsReady,Pic.config.contestImageW,Pic.config.contestImageH,Pic.config.media_debag_file);
		}
		
			private function deviceImageIsReady():void
			{
				if(DeviceImage.imageBitmapData!=null)
				{
					//Image is captured or loaded from the native device
					saveCurrentImage(DeviceImage.imageBytes);
				}
			}
		
		protected function captureCurrentImage(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			saveCurrentImage(BitmapEffects.changeSize(mteamCamera.getBitmapData(),Pic.config.contestImageW,Pic.config.contestImageH,true,true,false));
		}
		
		protected function rotateCameraRight(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			mteamCamera.rotateRight();
		}
		
		protected function rotateCamToLeft(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			mteamCamera.rotateLeft();
		}
		
		
		
		
		private function saveCurrentImage(capturedBitmap:*):void
		{
			// TODO Auto Generated method stub
			if(capturedBitmap is BitmapData)
			{
				capturedBitmap = BitmapEffects.createJPG(capturedBitmap) ;
			}
			Pic.userImages.addPhoto(capturedBitmap,'','');
			this.dispatchEvent(new AppEventContent(link_image_editor));
		}
		
		
		
		
		private function saveCurrentVideo(capturedVideo:ByteArray,videoIcon:ByteArray):void
		{
			Pic.userImages.addVideo(capturedVideo,videoIcon,'','');
			//Pic.userImages.addPhoto(capturedVideo,videoIcon,'','');
			this.dispatchEvent(new AppEventContent(link_image_editor));
		}
		
	}
}