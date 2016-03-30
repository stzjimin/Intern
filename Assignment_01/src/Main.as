package
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	import flash.text.TextField;

	public class Main
	{
		private var text:TextField = new TextField();
		
		private var data_file:File;
		private var data_stream:FileStream;
		private var bytes:ByteArray = new ByteArray();
		
		public function Main()
		{	
			var match:Match = new Match();
			
//			data_file = File.documentsDirectory.resolvePath("C:\\Users\\user\\Adobe Flash Builder 4.7\\Assignment_01\\user_data.txt");
			data_file = File.documentsDirectory.resolvePath("C:\\Users\\user\\Adobe Flash Builder 4.7\\Assignment_01\\user_data.txt");
			data_stream = new FileStream();
			data_stream.open(data_file, FileMode.READ);
			data_stream.readBytes(bytes, data_stream.position, data_stream.bytesAvailable);
			
			var byte_string:String = bytes.toString();
			var user_input_score:int = int(byte_string); 
			
			
			match.SetUser(user_input_score);
			match.Display();
		}
		
		public function get text_field():TextField
		{
			return text;
		}
	}
}