package
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;

	public class Window extends Sprite
	{
		[Embed(source="GUI_resources\\titleBar.png")]
		private static const _barImage:Class;
		
		[Embed(source="GUI_resources\\revert.png")]
		private static const ButtonBG:Class;
		
		private var _titleBar:Image;
		
		public function Window()
		{
			_titleBar = new Image(Texture.fromEmbeddedAsset(_barImage));
			_titleBar.addEventListener(TouchEvent.TOUCH, getTilteBarClick);
			addChild(_titleBar);
		}
		
		public function getTilteBarClick(event:TouchEvent):void
		{
			if(event.getTouch(_titleBar,TouchPhase.BEGAN))
			{
				trace("hahahah");
			}
		}
	}
}