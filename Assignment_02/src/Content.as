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
		
		/**
		 *Content클래스의 생성자 
		 * Content클래스는 내부의 흰바탕의 이미지와 자식윈도우를 가짐
		 */		
		public function Content()
		{
			_content = new Image(Texture.fromEmbeddedAsset(_contentImage));
			_content.addEventListener(TouchEvent.TOUCH,onContentClicked);
			_content.y = 30;
			addChild(_content);
		}
		
		/**
		 *내부흰바탕(_content)이 터치될 때 호출되는 함수
		 * @param event
		 * 터치가 클릭일 경우 새로운윈도우를 생성하며 자식윈도우로 추가
		 */		
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