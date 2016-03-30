package
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.text.TextField;
	import flash.utils.ByteArray;

	public class Main		//최종적으로 출력될 텍스트필드를 생성할 클래스
	{
		private var text:TextField = new TextField();
		
		private var data_file:File;
		private var data_stream:FileStream;
		private var bytes:ByteArray = new ByteArray();
		
		public function Main()
		{	
			var match:Match = new Match();			//Match클래스의 객체를 생성
			
			data_file = File.applicationDirectory;				//사용자의 점수가 저장되어있는 데이터파일을 읽어들이기위함.
			data_file = data_file.resolvePath("user_data.txt");	//user_data.txt는 사용자의 점수만 저장된 데이터파일
			data_stream = new FileStream();
			data_stream.open(data_file, FileMode.READ);
			data_stream.readBytes(bytes, data_stream.position, data_stream.bytesAvailable);
			
			var byte_string:String = bytes.toString();
			var user_input_score:int = int(byte_string);
			
			match.SetUser(user_input_score);		//Match클래스의  SetUser메소드 호출로 사용자의 점수로 새로운 Player객체를 생성 및 해당 점수로 Player객체들을 정렬
			match.Display();						//정렬된 Player객체들을 규칙에 맞게 Array변수에 저장함
			
			text.height = 300;
			text.width = 1000;
			var string_array:Array = match.GetOutputString();	//저장된 Array변수를 가져옴(이 때 Array변수는 출력되어질 문자열들을 담고있음
			var output_text:String = new String();				//TextField에 보여질 문자열
			while(string_array.length != 0)
				output_text = output_text + string_array.shift() + "\n";	//문자열에 string_array의 문자열들을 앞에서 부터 꺼내어 차례로 담는다.
			text.text = output_text;		//TextField의 text에 출력할 문자열을 넣어줌
		}
		
		public function get text_field():TextField
		{
			return text;
		}
	}
}