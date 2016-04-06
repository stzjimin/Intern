package
{
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class Content extends Sprite
	{
		/*
		[Embed(source="GUI_resources\\mario.png")]
		private static const marioImage:Class;
		
		[Embed(source="GUI_resources\\marioSheet.xml", mimeType="application/octet-stream")]
		private static const marioSheet:Class;
		*/
		
		private var _content:Image;
//		private var _marioMoviClip:MovieClip;
		
		/**
		 *Content클래스의 생성자 
		 * Content클래스는 내부의 흰바탕의 이미지와 자식윈도우를 가짐
		 */		
		public function Content()
		{	
			_content = new Image(Texture.fromBitmap(URLloader.contentBitmap));
			_content.width = 512;
			_content.height = 256;
			_content.addEventListener(TouchEvent.TOUCH,onContentClicked);
			_content.y = 30;
			addChild(_content);
			
			/*
			var texture:Texture = Texture.fromEmbeddedAsset(marioImage);
			var xml:XML = XML(new marioSheet());
			var textureAtlas:TextureAtlas = new TextureAtlas(texture, xml);
			var frames:Vector.<Texture> = textureAtlas.getTextures("mario");
			
			_marioMoviClip = new MovieClip(frames, 10);
			_marioMoviClip.x = 20;
			_marioMoviClip.y = 50;
			
			_background.addChild(_content);
		//	Starling.juggler.add(_marioMoviClip);
		//	_background.addChild(_marioMoviClip);
			*/
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
				trace("content 자식 개수 = " + this.numChildren);
			}
		}
	
		public function distroy():void
		{
			_content.removeEventListener(TouchEvent.TOUCH,onContentClicked);
			for(var i:int = this.numChildren-1; i > 0; i--)
			{
				trace("close Window " + i);
			//	Window(this.getChildAt(i)).dispose();
				Window(this.getChildAt(i)).distroy();
			}
		}
	}
}