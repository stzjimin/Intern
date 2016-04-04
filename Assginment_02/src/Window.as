package
{
	import flash.geom.Point;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.DisplayObject;
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
			_titleBar.x = 0;
			_titleBar.y = 0;
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
				trace("b_x = " + background.x);
				trace("b_y = " + background.y);
				trace("t_x = " + _titleBar.x);
				trace("t_y = " + _titleBar.y);
				trace("th_x = " + this.x);
				trace("th_y = " + this.y);
				trace("hahahah" + thisCount);
			}
			
			var touches:Vector.<Touch> = event.getTouches(stage);
			if(touches)
			{
				touch = event.getTouch(_titleBar, TouchPhase.MOVED);
				if(touch)
				{
					var position:Point = touch.getLocation(stage);
					trace("x =" + position.x);
					trace("y =" + position.y);
					moveWindow(0.14, position.x, position.y, Transitions.EASE_OUT);
				}
			}
		}
		
		private function moveWindow(inTime:Number, inX:int, inY:int, inEase:String):void
		{
			var tween:Tween = new Tween(this, inTime, inEase);
			tween.moveTo(inX, inY);
			Starling.juggler.add(tween);
		}
	}
}