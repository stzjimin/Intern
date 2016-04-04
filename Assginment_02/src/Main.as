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
		
		public function Main()
		{
			_quad = new Quad(700, 700, Color.argb(125, 125, 255, 255));
			_quad.addEventListener(TouchEvent.TOUCH,onQuadClicked);
			addChild(_quad);
		}
		
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
			/*
			if(event.getTouch(_quad,TouchPhase.BEGAN) && event.ctrlKey)
			{
				var currentPos:Point = event.getTouch(_quad,TouchPhase.BEGAN).getLocation(parent);
				var msgBox:Game = new Game("HAHAHAHAHAHA");
				msgBox.x = currentPos.x;
				msgBox.y = currentPos.y;
				trace("tirg!!");
				addChild(msgBox);
			}
			else if(event.getTouch(_quad,TouchPhase.BEGAN))
			{
				trace("trig!!");
			}
			*/
		}
	}
}