package
{
	import flash.geom.Point;
	
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.utils.Color;
	
	public class Main extends Sprite
	{
		private var _quad:Quad;
		
		/**
		 *Main클래스의 생성자 
		 * Main클래스는 바탕이되는 사각형(_quad)과 자식윈도우를 가짐
		 */		
		public function Main()
		{
			_quad = new Quad(700, 700, Color.argb(125, 125, 255, 255));
			_quad.addEventListener(TouchEvent.TOUCH,onQuadClicked);
			addChild(_quad);
		}
		
		/**
		 *바탕이 되는 사각형(_quad)이 터치될 때 호출되는 함수 
		 * @param event
		 * 터치가 클릭일 경우 새로운윈도우를 생성하며 자식윈도우로 추가
		 */		
		private function onQuadClicked(event:TouchEvent):void
		{
			if(event.getTouch(_quad,TouchPhase.BEGAN))
			{
				var clickedPos:Point = event.getTouch(_quad,TouchPhase.BEGAN).getLocation(parent);
				var window:Window = new Window();
				window.x = clickedPos.x;
				window.y = clickedPos.y;
				addChild(window);
			}
		}
	}
}