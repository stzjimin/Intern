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
		
		/**
		 *Assignment_01클래스의 생성자 
		 * 해당 클래스는 사용자에게 보여지는 디스플레이창만을 관리
		 */		
		public function Assignment_01()
		{
			main = new Main();
			captureText();
		}
		
		/**
		 *사용자의 입력을 받기위한 함수 
		 * 사용자의 입력을 받기위한 TextField를 생성 및 EventListener를 추가
		 */		
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
		
		/**
		 *input_text_field의 Even함수 
		 * @param event = 사용자의 키보드 입력
		 * 사용자의 키보드 입력이 있을경우 실행되며 이에따라 입력된 키보드값을 조사한 후 
		 * Enter키일 경우 input_text_field의 값을 점수로 변환한 후 출력문들을 만듬
		 */		
		public function textInputCapture(event:KeyboardEvent):void		//사용자의 입력이 생길경우 호출되는 메소드
		{
			if(event.charCode == 13)			//charCode가 13인 것은 엔터키에 해당함
			{
				var str:String = input_text_field.text;
				var reg:RegExp = new RegExp(/,|\./g);
				str = str.replace(reg,"");
				main.user_score = int(str);
				main.SetGroup();
				createOutputBox();
			//	input_text_field.removeEventListener(KeyboardEvent.KEY_DOWN, textInputCapture);
			}
		} 
		
		/**
		 *만들어진 출력문을 가져와서 사용자가 보게될 TextField의 text로 지정후 해당 TextField를 추가하는 함수 
		 * 생성된 출력문을 가지고오며 사용자가 보게될 출력문의 TextField인 output_text_field를 추가
		 */		
		public function createOutputBox():void 		//사용자의 입력에 따라 Player리스트를 출력해줌
		{
			output_text_field.text = main.output_string;
			output_text_field.height = 430;
			output_text_field.width = 500;
			output_text_field.y = 40;
			output_text_field.mouseWheelEnabled = true;
			addChild(output_text_field);
		}
	}
}