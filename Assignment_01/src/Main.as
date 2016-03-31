package
{
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.text.TextField;
	import flash.utils.ByteArray;

	public class Main		//최종적으로 출력될 텍스트필드를 생성할 클래스
	{
		private var text:TextField = new TextField();
		
		private var data_file:File;
		private var data_stream:FileStream;
		private var bytes:ByteArray = new ByteArray();
		private var match:Match;
		private var _user_score:int;
		
		public function Main()
		{	
			match = new Match();			//Match클래스의 객체를 생성
		}
		
		public function set user_score(value:int):void
		{
			_user_score = value;
		}

		public function get text_field():TextField
		{
			match.SetUser(_user_score);		//Match클래스의  SetUser메소드 호출로 사용자의 점수로 새로운 Player객체를 생성 및 해당 점수로 Player객체들을 정렬
			match.Display();						//정렬된 Player객체들을 규칙에 맞게 Array변수에 저장함
			
			text.height = 500;
			var string_array:Array = match.GetOutputString();	//저장된 Array변수를 가져옴(이 때 Array변수는 출력되어질 문자열들을 담고있음
			var output_text:String = new String();				//TextField에 보여질 문자열
			while(string_array.length != 0)
				output_text = output_text + string_array.shift();	//문자열에 string_array의 문자열들을 앞에서 부터 꺼내어 차례로 담는다.
			text.text = output_text;		//TextField의 text에 출력할 문자열을 넣어줌
			text.autoSize = "left";
			text.mouseWheelEnabled = true;
			
			return text;
		}
	}
}