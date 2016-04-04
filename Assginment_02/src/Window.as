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
		
		[Embed(source="GUI_resources\\revert.png")]
		private static const ButtonBG:Class;
		
		private static var count:int = 0;
		
		private var thisCount:int;
		private var _titleBar:Image;
		private var background:Sprite;
		
		public function Window()
		{
			background = new Sprite();
			addChild(background);
			thisCount = count++;
			_titleBar = new Image(Texture.fromEmbeddedAsset(_barImage));
			_titleBar.addEventListener(TouchEvent.TOUCH, getTilteBarClick);
			background.addChild(_titleBar);
		}
		
		private function getTilteBarClick(event:TouchEvent):void
		{
			var touch:Touch = event.getTouch(_titleBar, TouchPhase.ENDED);
			if(touch && touch.tapCount == 2)
			{
				_titleBar.removeEventListener(TouchEvent.TOUCH, getTilteBarClick);
				removeFromParent();
			}
			
			touch = event.getTouch(_titleBar,TouchPhase.BEGAN)
			if(touch)
			{
				trace("hahahah" + thisCount);
			}
		}
	}
}