package
{	
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
		[Embed(source="GUI_resources\\titleBar.png")]
		private static const barImage:Class;
		
		[Embed(source="GUI_resources\\minimize.png")]
		private static const miniImage:Class;
		
		[Embed(source="GUI_resources\\revert.png")]
		private static const revertImage:Class;
		
		[Embed(source="GUI_resources\\close.png")]
		private static const closeImage:Class;
		
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

		/**
		 * Window클래스의 생성자 
		 * Window클래스는 타이틀바, 최소화버튼, 복구버튼, 닫기버튼, 내용으로 구성
		 * content(내용)은 자식윈도우를 가지고있음
		 */		
		public function Window()
		{
			_titleBar = new Image(Texture.fromEmbeddedAsset(barImage));
			_titleBar.addEventListener(TouchEvent.TOUCH, getTilteBarClick);
			
			_content = new Content();
			
			_miniButtonTexture = Texture.fromEmbeddedAsset(miniImage);
			_miniButton = new Button(_miniButtonTexture);
			_miniButton.x = 448;
			_miniButton.addEventListener(Event.TRIGGERED, onMiniTriggerd);
			_miniButton.visible = true;
			
			_revertButtonTexture = Texture.fromEmbeddedAsset(revertImage);
			_revertButton = new Button(_revertButtonTexture);
			_revertButton.x = 448;
			_revertButton.addEventListener(Event.TRIGGERED, onRevertTriggerd);
			_revertButton.scaleY = 0.9;
			_revertButton.visible = false;
			
			_closeButtonTexture = Texture.fromEmbeddedAsset(closeImage);
			_closeButton = new Button(_closeButtonTexture);
			_closeButton.x = 480;
			_closeButton.addEventListener(Event.TRIGGERED, onColseTriggerd);
			
			addChild(_titleBar);
			addChild(_miniButton);
			addChild(_revertButton);
			addChild(_closeButton);
			addChild(_content);
		}
		
		/**
		 *닫기버튼(_closeButton)을 클릭 시 호출되는 함수
		 * @param event
		 * 닫기버튼이 클릭되면 이벤트리스너들을 모두제거해준 후 해당객체를 부모로부터 제거
		 */		
		private function onColseTriggerd(event:Event):void
		{
			close();
		}
		
		public function close():void
		{
			_revertButton.removeEventListener(Event.TRIGGERED, onRevertTriggerd);
			_miniButton.removeEventListener(Event.TRIGGERED, onMiniTriggerd);
			_closeButton.removeEventListener(Event.TRIGGERED, onColseTriggerd);
			_titleBar.removeEventListener(TouchEvent.TOUCH, getTilteBarClick);
			_content.removeEventListeners(TouchEvent.TOUCH);
			//	_content.removeEventListeners(TouchEvent.TOUCH);
		//	_content.getChildAt(0).removeEventListeners(TouchEvent.TOUCH);
		//	var par:DisplayObjectContainer = this.parent;
			//	trace(_content.getChildAt(0).getgetChildAt(0));
		//	var child:DisplayObjectContainer = _content;
		//	_content.close();
		//	var childContent:DisplayObject = child.getChildAt(0);
		//	trace(childContent);
			removeFromParent();
			//	par.addChild(this);
		}
		
		/**
		 *최소화버튼(_miniButton)을 클릭 시 호출되는 함수 
		 * @param event
		 * 최소화버튼이 클릭되면 내용(_content)과 최소화버튼(_miniButton)을 가려주고 복구버튼(_revertButton)을 노출
		 */		
		private function onMiniTriggerd(event:Event):void
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
		private function onRevertTriggerd(event:Event):void
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