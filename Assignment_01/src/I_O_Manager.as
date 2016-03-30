package
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;

	public class I_O_Manager
	{
		private var data_file:File;
		private var data_stream:FileStream;
		private var bytes:ByteArray = new ByteArray();
		private var groups:Group = new Group();
		
		public function I_O_Manager()
		{
			data_file = File.applicationDirectory;			//Player데이터가 저장되어있는 데이터파일을 읽어들이기위한 변수
			data_file = data_file.resolvePath("data.txt");
			data_stream = new FileStream();
			data_stream.open(data_file, FileMode.READ);
			data_stream.readBytes(bytes, data_stream.position, data_stream.bytesAvailable);	//읽어들인 문자열을 bytes에 byte형태로 저장
			
			var byte_string:String = bytes.toString();		//byte형태로 저장되어있는 문자열들을 toString을 이용해서 문자열로 변환
			var params:Array = byte_string.split("\n");		//해당 문자열을 개행문자("\n")를 기준으로 분할(Player별로 문자열을 분할)
			
			var i:int = 0;
			while(params.length != 0)
			{
				var string_temp:String;
				string_temp = params.pop();
				var data_array:Array = string_temp.split(",");
				if(string_temp.length > 1)
				{	
					var user_lose_count:String = data_array.pop() as String;
					var user_win_count:String = data_array.pop() as String;
					var user_score:String = data_array.pop() as String;
					var user_name:String = data_array.pop() as String;
					var user_num:String = data_array.pop() as String;
					
					var player:Player = new Player(int(user_num), user_name, int(user_score), int(user_win_count), int(user_lose_count));
					groups.Input_player(player);
				}
				
			}
		}
		
		public function GetDataGroup():Group
		{
			return groups;
		}
	}
}