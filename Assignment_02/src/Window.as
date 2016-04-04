package
{
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	
	public class Window extends Sprite
	{
		[Embed(source="GUI_resources\\titleBar.png")]
		private static const _barImage:Class;
		
		[Embed(source="GUI_resources\\minimize.png")]
		private static const _miniImage:Class;
		
		[Embed(source="GUI_resources\\revert.png")]
		private static const _revertImage:Class;
		
		[Embed(source="GUI_resources\\close.png")]
		private static const _closeImage:Class;
		
		private var _titleBar:Image;
		private var _background:Sprite;
		private var _content:Content;
		private var _miniButton:Button;
		private var _miniButtonTexture:Texture;
		private var _revertButton:Button;
		private var _revertButtonTexture:Texture;
		private var _closeButton:Button;
		private var _closeButtonTexture:Texture;
		
		public function Window()
		{
			_background = new Sprite();
			addChild(_background);
			
			_titleBar = new Image(Texture.fromEmbeddedAsset(_barImage));
			_titleBar.addEventListener(TouchEvent.TOUCH, getTilteBarClick);
			
			_content = new Content();
			
			_miniButtonTexture = Texture.fromEmbeddedAsset(_miniImage);
			_miniButton = new Button(_miniButtonTexture);
			_miniButton.x = 448;
			_miniButton.addEventListener(Event.TRIGGERED, onMiniTriggerd);
			_miniButton.visible = true;
			
			_revertButtonTexture = Texture.fromEmbeddedAsset(_revertImage);
			_revertButton = new Button(_revertButtonTexture);
			_revertButton.x = 448;
			_revertButton.addEventListener(Event.TRIGGERED, onRevertTriggerd);
			_revertButton.scaleY = 0.9;
			_revertButton.visible = false;
			
			_closeButtonTexture = Texture.fromEmbeddedAsset(_closeImage);
			_closeButton = new Button(_closeButtonTexture);
			_closeButton.x = 480;
			_closeButton.addEventListener(Event.TRIGGERED, onColseTriggerd);
			
			_background.addChild(_titleBar);
			_background.addChild(_miniButton);
			_background.addChild(_revertButton);
			_background.addChild(_closeButton);
			_background.addChild(_content);
			
			trace(_closeButton.width);
			trace(_miniButton.width);
			trace(_background.width);
		}
		
		private function onColseTriggerd(event:Event):void
		{
			_closeButton.removeEventListener(Event.TRIGGERED, onColseTriggerd);
			_titleBar.removeEventListener(TouchEvent.TOUCH, getTilteBarClick);
			removeFromParent();
		}
		
		private function onMiniTriggerd(event:Event):void
		{
			_miniButton.visible = false;
			_revertButton.visible = true;
			_content.visible = false;
		}
		
		private function onRevertTriggerd(event:Event):void
		{
			_revertButton.visible = false;
			_miniButton.visible = true;
			_content.visible = true;
		}
		
		private function getTilteBarClick(event:TouchEvent):void
		{
			var touch:Touch = event.getTouch(_titleBar, TouchPhase.ENDED);
			if(touch && touch.tapCount == 2)
			{
				_revertButton.visible = !_revertButton.visible;
				_miniButton.visible = !_miniButton.visible;
				_content.visible = !_content.visible;
			}
			
			/*
			touch = event.getTouch(_titleBar,TouchPhase.BEGAN)
			if(touch)
			{
			trace("Child = " + numChildren);
			}
			*/
			
			touch = event.getTouch(_titleBar, TouchPhase.MOVED);
			if(touch)
			{
				var touches:Touch = event.getTouch(stage);
				this.x += touches.globalX - touches.previousGlobalX;
				this.y += touches.globalY - touches.previousGlobalY;
			}
		}
	}
}