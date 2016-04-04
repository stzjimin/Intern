package
{
	import flash.geom.Point;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;

	public class Content extends Sprite
	{
		[Embed(source="GUI_resources\\contents.png")]
		private static const _contentImage:Class;
		
		private var _content:Image;
		
		public function Content()
		{
			_content = new Image(Texture.fromEmbeddedAsset(_contentImage));
			_content.addEventListener(TouchEvent.TOUCH,onContentClicked);
			_content.y = 30;
			addChild(_content);
		}
		
		private function onContentClicked(event:TouchEvent):void
		{
			if(event.getTouch(_content,TouchPhase.BEGAN))
			{
				var clickedPos:Point = event.getTouch(_content,TouchPhase.BEGAN).getLocation(parent);
				var window:Window = new Window();
				window.x = clickedPos.x;
				window.y = clickedPos.y;
				addChild(window);
			}
		}
	}
}