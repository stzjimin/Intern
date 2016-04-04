package
{
	import flash.geom.Point;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.Color;

	public class Quads extends Sprite
	{
		[Embed(source="GUI_resources\\revert.png")]
		private static const ButtonBG:Class;
		
		private var _sprite:Sprite;
		private var _quad:Quad
		
		public function Quads()
		{
			_sprite = new Sprite();
			
			var buttonTexture:Texture = Texture.fromEmbeddedAsset(ButtonBG);
			//var texture:Texture = new Texture();
			//var image:Image = new Image(texture);
			_quad = new Quad(700, 700, Color.RED);
		//	var quad:Button = new Button(buttonTexture, "Yes");
			var textField:TextField = new TextField(50, 40, "Hello World!");
			
			_sprite.x = 0;
			_sprite.y = 0;
		//	_sprite.width = 300;
		//	_sprite.height = 500;
			addChild(_sprite);
			_sprite.addChild(_quad);
		//	_sprite.visible = true;
		//	sprite.addChild(textField);
			
		//	addChild(_quad);
		//	addChild(textField);
			
		//	var numChildren:int = sprite.numChildren;
		//	trace(numChildren);
			
		//	sprite.x += 50;
			
		//	var totalWidth:Number = sprite.width;
		//	trace(totalWidth);
			
			_quad.addEventListener(TouchEvent.TOUCH, onQuadTriggered);
		//	quad.
			
		//	msgBox.removeFromParent();
		//	msgBox.dispose();
			
		//	sprite.rotation = 90;
			
			/*
			var text:Texts = new Texts();
			addChild(text);
			*/
		}
		
		public function onQuadTriggered(event:TouchEvent):void
		{
			if(event.getTouch(_sprite,TouchPhase.BEGAN) && event.ctrlKey)
			{
				var currentPos:Point = event.getTouch(_sprite,TouchPhase.BEGAN).getLocation(parent);
				var msgBox:Game = new Game("HAHAHAHAHAHA");
				msgBox.x = currentPos.x;
				msgBox.y = currentPos.y;
				trace("tirg!!");
				_sprite.addChild(msgBox);
			}
			else if(event.getTouch(_sprite,TouchPhase.BEGAN))
			{
				trace("trig!!");
			}
		}
	}
}