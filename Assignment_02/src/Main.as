package
{
	import flash.geom.Point;
	
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.utils.Color;
	
	public class Main extends Sprite
	{
		private var _quad:Quad;
		private var _loadingProgText:TextField;
		
		/**
		 *Main클래스의 생성자 
		 * 시작할 때 BitmapLoader를 이용하여 필요한 비트맵을 받아오며, 비트맵 로드가 끝나고 난 후 터치를위한 사각형(_quad)이 생성
		 */		
		public function Main()
		{
			_loadingProgText = new TextField(50, 50, "로딩중\n" + "0/5");
			_loadingProgText.x = 300;
			_loadingProgText.y = 300;
			addChild(_loadingProgText);
			new BitmapLoader(onloadingProgress,onloadingComplete);
		}
		
		private function onloadingProgress(prog:int):void
		{
			_loadingProgText.text = "로딩중\n" + prog + "/5";
		}
		
		private function onloadingComplete():void
		{
			_loadingProgText.removeFromParent();
			_loadingProgText = null;
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