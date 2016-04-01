package
{
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	import Main;
	
	[SWF(width="640", height="480", backgroundColor="#FFFFF0", frameRate="30")]
	public class Assignment_01 extends Sprite
	{
		private var input_text_field:TextField = new TextField(); 
		private var output_text_field:TextField = new TextField();
		private var main:Main;
		
		public function Assignment_01()
		{
			main = new Main();
			captureText();
		}
		
		public function captureText():void		//사용자 입력을 받기위한 메소드
		{ 
			input_text_field.type = TextFieldType.INPUT;
			input_text_field.background = true;
			addChild(input_text_field);
			input_text_field.text = "Type Your Score";
			input_text_field.addEventListener(KeyboardEvent.KEY_DOWN, textInputCapture);
			input_text_field.height = 20;
			input_text_field.border = true;
		}
		
		public function textInputCapture(event:KeyboardEvent):void		//사용자의 입력이 생길경우 호출되는 메소드
		{
			if(event.charCode == 13)			//charCode가 13인 것은 엔터키에 해당함
			{
				var str:String = input_text_field.text;
				var reg:RegExp = new RegExp(/\D/g);
				str = str.replace(reg,"");
				main.user_score = int(str);
				main.SetGroup();
				createOutputBox();
			}
		} 
		
		public function createOutputBox():void 		//사용자의 입력에 따라 Player리스트를 출력해줌
		{
			output_text_field.text = main.output_string;
			output_text_field.height = 430;
			output_text_field.width = 500;
			output_text_field.y = 50;
			output_text_field.mouseWheelEnabled = true;
			addChild(output_text_field);
		} 
	}
}