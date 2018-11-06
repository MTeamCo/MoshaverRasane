package ui.page
	//ui.page.CommentItemExtend
{
	import Aroos.ui.pages.comments.CommentEvent;
	
	import appManager.displayContentElemets.TitleText;
	
	import contents.LinkData;
	import contents.alert.Alert;
	import contents.displayPages.LinkItem;
	
	import diagrams.calender.CalenderConstants;
	import diagrams.calender.MyShamsi;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.utils.getTimer;
	
	import ofogh.ui.pages.newsComments.NewsCommentContainer;
	
	import picContest.services.types.VComment;
	import picContest.services.types.VPhotoComment;
	import picContest.ui.elements.Avatar;
	
	import soundPlayer.SoundPlayer;
	import soundPlayer.SoundPlayerEvent;
	[Event(name="COMMENT_SELECTED", type="Aroos.ui.pages.comments.CommentEvent")]
	[Event(name="COMMENTS_PROFILE_SELECTED", type="Aroos.ui.pages.comments.CommentEvent")]

	public class CommentItemExtend extends LinkItem
	{
		public var comment:VPhotoComment ;
		
		public var comment2:VComment ;
		
		private var backMC:MovieClip,
		senderTitleContainer:MovieClip,
		senderTitleTF:TextField,
		commentContainer:MovieClip,
		commentText:TextField;
		
		private var avatar:Avatar ;
		
		private var selectTime:uint,
		maxSelectDelay:uint = 200 ;
		
		private var dateField:TitleText ; 
		
		private var waveArea:Sprite,
		waveMask:Sprite;
		private var imPlaying:Boolean;
		
		public function CommentItemExtend(mouseChildAccept:Boolean=false)
		{
			super(true);
			backMC = Obj.get("back_mc",this);
			senderTitleContainer = Obj.get("sender_txt",this);
			senderTitleTF = Obj.get("text_txt",senderTitleContainer);
			commentContainer = Obj.get("comment_txt",this);
			commentText = Obj.get("text_txt",commentContainer);
			
			dateField = Obj.get("date_txt",this);
			
			avatar = Obj.findThisClass(Avatar,this,true);
			avatar.loadImage('');
		}
		override public function get height():Number
		{
			return backMC.height ;
		}
		
		override public function setUp(linkData:LinkData):void
		{
			trace("Manage comment size");
			myLinkData = linkData ;
			if(linkData.dynamicData is VPhotoComment)
			{
				comment = linkData.dynamicData as VPhotoComment  ;
			}
			else
			{
				//Make the comment object form VComment class
				comment2 = linkData.dynamicData as VComment ;
				comment = new VPhotoComment();
				comment.UserTitle = comment2.FullName ;
				//Alert.show('1'+comment2.FullName)
				comment.Comment = comment2.Comment;
				comment.PhotoName = comment2.PhotoName ;
				comment.UserId = comment2.UserId ;
				comment.FileName = comment2.FileName ;
				comment.CreatedDate = comment2.ActionDate ;
			}
			
			TextPutter.onTextArea(senderTitleTF,'-',true,true,false,0,false,false);
			var deltaY:Number = senderTitleContainer.height ;
			
			TextPutter.onTextArea(senderTitleTF,comment.UserTitle,true,true,false,0,false,false);
			var showComment:Boolean = true ;
			if(comment.FileName!='')
			{
				var waveForm:Array = comment.Comment.split(',');
				if(waveForm.length>1)
				{
					showComment = false ;
					commentText.text = '' ;
					waveArea = drawWaveForm(waveForm,commentText.getBounds(this)) ;
					waveMask = drawWaveMask(commentText.getBounds(this));
					this.addChild(waveArea);
					this.addChild(waveMask);
					waveArea.mask = waveMask ;
					
					
					function drawWaveMask(rect:Rectangle):Sprite
					{
						var sprite:Sprite = new Sprite();
						
						sprite.graphics.beginFill(0x000000,0);
						sprite.graphics.drawRect(0,0,rect.width,rect.height);
						
						sprite.x = rect.x ;
						sprite.y = rect.y ;
						return sprite ;
					}
					
					function drawWaveForm(waveArray:Array,rect:Rectangle):Sprite
					{
						var sprite:Sprite = new Sprite();
						
						sprite.graphics.beginFill(0x000000,0);
						sprite.graphics.drawRect(0,0,rect.width,rect.height);
						
						sprite.graphics.beginFill(0x000000,0.5);
						sprite.graphics.moveTo(0,rect.height);
						//sprite.graphics.drawRect(0,0,rect.width,rect.height);
						
						trace("waveArray : "+waveArray);
						
						var H:Number = rect.height ;
						var W:Number = rect.width/waveArray.length ;
						const maxWave:uint = 150 ;
						trace("H : "+H);
						for(var i:int = 0 ; i<waveArray.length ; i++)
						{
							trace("int(waveArray[i]) : "+int(waveArray[i]));
							var currentWave:Number = (H/2)-(H/2)*(Math.min(maxWave,Math.abs(int(waveArray[i])))/maxWave) ; 
							trace(i+"currentWave : "+currentWave);
							sprite.graphics.lineTo(i*W,currentWave);
							sprite.graphics.lineTo(i*W+W,currentWave);
						}
						sprite.graphics.lineTo(rect.width,rect.height);
						
						sprite.x = rect.x ;
						sprite.y = rect.y ;
						return sprite ;
					}
				}
			}
			
			if(showComment)
				TextPutter.onTextArea(commentText,comment.Comment,true,true,false,0,true);
			deltaY = Math.max(0,Math.max(senderTitleContainer.height,commentContainer.height)-deltaY) ;
			
			backMC.height += deltaY;
			
			trace("deltaY : "+deltaY);
			
			trace("avatar : "+avatar);
			avatar.mouseChildren = false ;
			
			this.addEventListener(MouseEvent.MOUSE_DOWN,whantToSelectSomething);
			//this.addEventListener(MouseEvent.MOUSE_UP,somthingSelected);
			if(this.stage==null)
			{
				this.addEventListener(Event.ADDED_TO_STAGE,loadAvatar);
			}
			else
			{
				loadAvatar();
			}
			
			if(dateField)
			{
				var miladi:Date = ServerDate.serverDateToDate(comment.CreatedDate) ;
				var shamsi:MyShamsi = MyShamsi.miladiToShamsi(miladi);
				var currentDate:Date =  new Date();
				
				var stringedDate:String = '' ;
				
				if(miladi.fullYear!=currentDate.fullYear)
				{
					stringedDate += shamsi.fullYear+'/'+(shamsi.month+1)+'/'+shamsi.date+' ' ;
				}
				else if(miladi.month!=currentDate.month || miladi.date != currentDate.date)
				{
					stringedDate += UnicodeStatic.convert(CalenderConstants.monthNames[shamsi.month])+'/'+shamsi.date+' ' ;
				}
				
				stringedDate += TimeToString.dateToString(miladi,true,false,false);
				
				dateField.setUp(stringedDate,false,false,0,true);
			}
			
		}
		
		protected function loadAvatar(event:Event=null):void
		{
			// TODO Auto-generated method stub
			avatar.loadImage(comment.senderImage());
		}
		
		protected function whantToSelectSomething(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			selectTime = getTimer();
		}
		
		/*protected function somthingSelected(event:MouseEvent):void
		{
		// TODO Auto-generated method stub
		trace("Comment mouse up : "+(getTimer()-selectTime));
		if((getTimer()-selectTime)<maxSelectDelay)
		{
		trace("event.target : "+event.target);
		if(event.target == avatar)
		{
		trace("\tAvatar selected");
		this.dispatchEvent(new CommentEvent(CommentEvent.COMMENTS_PROFILE_SELECTED,comment));
		}
		else
		{
		trace("\tComment selected");
		this.dispatchEvent(new CommentEvent(CommentEvent.COMMENT_SELECTED,comment));
		}
		}
		}*/
		
		override public function imSelected(event:MouseEvent=null):void
		{
			if(comment.FileName!='')
			{
				if(imPlaying)
				{
					if(waveArea.hitTestPoint(stage.mouseX,stage.mouseY))
					{
						SoundPlayer.pause(NewsCommentContainer.commentSoundId,true);
						SoundPlayer.play(NewsCommentContainer.commentSoundId,true,true,Math.max(0,Math.min(1,waveArea.mouseX/waveArea.width)));
						SoundPlayer.eventsDispatch.addEventListener(SoundPlayerEvent.STOPED,removeListening);
						this.addEventListener(Event.REMOVED_FROM_STAGE,canselListening);
						this.addEventListener(Event.ENTER_FRAME,animSound);
					}
				}
				else
				{
					SoundPlayer.pause(NewsCommentContainer.commentSoundId,true);
					SoundPlayer.addSound(comment.attachedFileURL(),NewsCommentContainer.commentSoundId,false,1,getIndex());
					SoundPlayer.play(NewsCommentContainer.commentSoundId,false,true);
					SoundPlayer.eventsDispatch.addEventListener(SoundPlayerEvent.STOPED,removeListening);
					this.addEventListener(Event.REMOVED_FROM_STAGE,canselListening);
					this.addEventListener(Event.ENTER_FRAME,animSound);
				}
				imPlaying = true ;
			}
			else
			{
				if(event.target == avatar)
				{
					trace("\tAvatar selected");
					this.dispatchEvent(new CommentEvent(CommentEvent.COMMENTS_PROFILE_SELECTED,comment));
				}
				else
				{
					trace("\tComment selected");
					this.dispatchEvent(new CommentEvent(CommentEvent.COMMENT_SELECTED,comment));
				}
			}
		}
		
		protected function animSound(event:Event):void
		{
			waveMask.scaleX = SoundPlayer.getPlayedPrecent(NewsCommentContainer.commentSoundId) ;
		}
		
		protected function canselListening(event:Event):void
		{
			SoundPlayer.pause(NewsCommentContainer.commentSoundId,true);
			removeListening(null);
		}
		
		private function removeListening(event:SoundPlayerEvent):void
		{
			if(event!=null)
			{
				if(event.CallerID != getIndex())
				{
					return ;
				}
			}
			imPlaying = false ;
			this.addEventListener(Event.REMOVED_FROM_STAGE,canselListening);
			this.removeEventListener(Event.ENTER_FRAME,animSound);
			SoundPlayer.eventsDispatch.removeEventListener(SoundPlayerEvent.STOPED,canselListening);
		}
	}
}