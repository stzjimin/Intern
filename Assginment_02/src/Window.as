package
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;

	public class Window extends Sprite
	{
		[Embed(source="GUI_resources\\titleBar.png")]
		private static const _barImage:Class;
		
		private static var count:int = 0;
		
		private var thisCount:int;
		private var _titleBar:Image;
		private var _background:Sprite;
		private var _content:Content;
		
		public function Window()
		{
			_background = new Sprite();
			addChild(_background);
			thisCount = count++;
			
			_titleBar = new Image(Texture.fromEmbeddedAsset(_barImage));
			_titleBar.addEventListener(TouchEvent.TOUCH, getTilteBarClick);
			
			_content = new Content();
			
			_background.addChild(_titleBar);
			_background.addChild(_content);
		}
		
		private function getTilteBarClick(event:TouchEvent):void
		{
			var touch:Touch = event.getTouch(_titleBar, TouchPhase.ENDED);
			if(touch && touch.tapCount == 2)
			{
				_content.visible = !_content.visible;
				/*
				_titleBar.removeEventListener(TouchEvent.TOUCH, getTilteBarClick);
				removeFromParent();
				*/
			}
			
			touch = event.getTouch(_titleBar,TouchPhase.BEGAN)
			if(touch)
			{
				trace("hahahah" + thisCount);
			}
			
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