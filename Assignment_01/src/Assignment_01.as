package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.events.*;
	
	import Main;
	
	public class Assignment_01 extends Sprite
	{
		private var myTextBox:TextField = new TextField(); 
		private var myOutputBox:TextField = new TextField();
		private var main:Main;
		
		public function Assignment_01()
		{
			main = new Main();
			captureText();
		}
		
		public function captureText():void		//사용자 입력을 받기위한 메소드
		{ 
			myTextBox.type = TextFieldType.INPUT;
			myTextBox.background = true;
			addChild(myTextBox);
			myTextBox.text = "Type Your Score";
			myTextBox.addEventListener(KeyboardEvent.KEY_DOWN, textInputCapture);
			myTextBox.height = 20;
			myTextBox.border = true;
		} 
		
		public function textInputCapture(event:KeyboardEvent):void		//사용자의 입력이 생길경우 호출되는 메소드
		{
			if(event.charCode == 13)			//charCode가 13인 것은 엔터키에 해당함
			{
				var str:String = myTextBox.text;
				main.user_score = int(str);
				createOutputBox(str);
			}
		} 
		
		public function createOutputBox(str:String):void 		//사용자의 입력에 따라 Player리스트를 출력해줌
		{
			var text_field:TextField = main.text_field;
			text_field.y = 50;
			addChild(text_field);
		} 
	}
}