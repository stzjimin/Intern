package
{	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLRequest;
	import flash.system.System;
	import flash.utils.ByteArray;
	
	import starling.display.Button;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	
	public class Window extends Sprite
	{
		/**
		 * _titleBar = 타이틀바 이미지
		 * _content = 윈도우창내부의 흰창
		 * _miniButton = 윈도우창을 최소화 시키는 버튼
		 * _miniButtonTexture = 최소화버튼의 텍스쳐
		 * _revertButton = 최소화된 윈도우창을 다시 복구시키는 버튼
		 * _revertButtonTexture = 복구버튼의 텍스쳐
		 * _closeButton = 윈도우창을 삭제시키는 버튼
		 * _closeButtonTexture = 삭제버튼의 텍스쳐
		 */		
		private var _titleBar:Image;
		private var _content:Content;
		private var _miniButton:Button;
		private var _miniButtonTexture:Texture;
		private var _revertButton:Button;
		private var _revertButtonTexture:Texture;
		private var _closeButton:Button;
		private var _closeButtonTexture:Texture;
		private var _dataFile:File;
		private var _dataStream:FileStream;
		private var bitmap:Bitmap;

		/**
		 * Window클래스의 생성자 
		 * Window클래스는 타이틀바, 최소화버튼, 복구버튼, 닫기버튼, 내용으로 구성
		 * content(내용)은 자식윈도우를 가지고있음
		 */		
		public function Window()
		{	
			_titleBar = new Image(Texture.fromBitmap(BitmapLoader.titleBarBitmap));
			_titleBar.width = 512;
			_titleBar.height = 32;
			_titleBar.addEventListener(TouchEvent.TOUCH, getTilteBarClick);
			
			_content = new Content();
			
			_miniButtonTexture = Texture.fromBitmap(BitmapLoader.miniButtonBitmap);
			_miniButton = new Button(_miniButtonTexture);
			_miniButton.width = 32;
			_miniButton.height = 32;
			_miniButton.x = 448;
			_miniButton.addEventListener(starling.events.Event.TRIGGERED, onMiniTriggerd);
			_miniButton.visible = true;
			
			_revertButtonTexture = Texture.fromBitmap(BitmapLoader.revertButtonBitmap);
			_revertButton = new Button(_revertButtonTexture);
			_revertButton.width = 30;
			_revertButton.height = 35;
			_revertButton.x = 448;
			_revertButton.addEventListener(starling.events.Event.TRIGGERED, onRevertTriggerd);
			_revertButton.scaleY = 0.9;
			_revertButton.visible = false;
			
			_closeButtonTexture = Texture.fromBitmap(BitmapLoader.closeButtonBitmap);
			_closeButton = new Button(_closeButtonTexture);
			_closeButton.width = 32;
			_closeButton.height = 32;
			_closeButton.x = 480;
			_closeButton.addEventListener(starling.events.Event.TRIGGERED, onColseTriggerd);
			
			addChild(_titleBar);
			addChild(_miniButton);
			addChild(_revertButton);
			addChild(_closeButton);
			addChild(_content);
		}
		
		/**
		 * 객체가 제거될 때 호출할 함수
		 * 객체가 제거될 때 EventListener들을 모두 제거해주고 해당 
		 */		
		public function distroy():void
		{
			_revertButtonTexture.dispose();
			_revertButtonTexture = null;
			_revertButton.removeEventListener(starling.events.Event.TRIGGERED, onRevertTriggerd);
			_revertButton.dispose();
			_revertButton = null;
			
			_miniButton.removeEventListener(starling.events.Event.TRIGGERED, onMiniTriggerd);
			_miniButtonTexture.dispose();
			_miniButtonTexture = null;
			_miniButton.dispose();
			_miniButton = null;
			
			_closeButton.removeEventListener(starling.events.Event.TRIGGERED, onColseTriggerd);
			_closeButtonTexture.dispose();
			_closeButtonTexture = null;
			_closeButton.dispose();
			_closeButton = null;
			
			_titleBar.removeEventListener(TouchEvent.TOUCH, getTilteBarClick);
			_titleBar.dispose();
			_titleBar = null;
			
			_content.removeEventListeners(TouchEvent.TOUCH);
			_content.distroy();
			_content.dispose();
			_content = null;
			removeFromParent();
			//	this.dispose();
		}
		
		/**
		 *닫기버튼(_closeButton)을 클릭 시 호출되는 함수
		 * @param event
		 * 닫기버튼 클릭 시 distroy함수를 호출
		 */		
		private function onColseTriggerd(event:starling.events.Event):void
		{
			distroy();
			System.gc();
		}
		
		/**
		 *최소화버튼(_miniButton)을 클릭 시 호출되는 함수 
		 * @param event
		 * 최소화버튼이 클릭되면 내용(_content)과 최소화버튼(_miniButton)을 가려주고 복구버튼(_revertButton)을 노출
		 */		
		private function onMiniTriggerd(event:starling.events.Event):void
		{
			_miniButton.visible = false;
			_revertButton.visible = true;
			_content.visible = false;
		}
		
		/**
		 *복구버튼(_revertButton)을 클릭 시 호출되는 함수 
		 * @param event
		 * 복구버튼이 클릭되면 내용(_content)과 최소화버튼(_miniButton)이 노출되고 복구버튼(_revertButton)이 가려짐
		 */		
		private function onRevertTriggerd(event:starling.events.Event):void
		{
			_revertButton.visible = false;
			_miniButton.visible = true;
			_content.visible = true;
		}
		
		/**
		 *타이틀바(_titleBar)를 터치할 때 호출되는 함수 
		 * @param event
		 * 타이틀바(_titleBar)가 터치되면 눌려졌을 때, 움직일 때, 때어졌을 때의 3가지를 판단
		 * 눌려졌을 때 = 윈도우의 알파값을 0.5로 변경
		 * 움직일 때 = 마우스의 위치변화값을 윈도우에 적용
		 * 때어졌을 때 = 윈도우의 알파값을 1로 변경, 더블클릭의 경우는 윈도우의 최소화와 복구를 반전
		 */		
		private function getTilteBarClick(event:TouchEvent):void
		{
			var touch:Touch = event.getTouch(_titleBar, TouchPhase.BEGAN);
			if(touch)
			{
				this.parent.setChildIndex(this,this.parent.numChildren);
				this.alpha = 0.5;
			}
			
			touch = event.getTouch(_titleBar, TouchPhase.ENDED);
			if(touch)
			{
				this.alpha = 1;
			}
			
			if(touch && touch.tapCount == 2)
			{
				_revertButton.visible = !_revertButton.visible;
				_miniButton.visible = !_miniButton.visible;
				_content.visible = !_content.visible;
			}
			
			touch = event.getTouch(_titleBar, TouchPhase.MOVED);
			if(touch)
			{
				var touches:Touch = event.getTouch(stage);
				this.x += touches.globalX - touches.previousGlobalX;
				this.y += touches.globalY - touches.previousGlobalY;
			}
		}
	}
}