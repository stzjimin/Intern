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
			data_file = File.documentsDirectory.resolvePath("C:\\Users\\user\\Adobe Flash Builder 4.7\\Assignment_01\\data.txt");
			data_stream = new FileStream();
			data_stream.open(data_file, FileMode.READ);
		//	data_stream.position = 0;
			data_stream.readBytes(bytes, data_stream.position, data_stream.bytesAvailable);
			
			var byte_string:String = bytes.toString();
			var params:Array = byte_string.split("\n");
			
			var i:int = 0;
			while(params.length != 0)
			{
				var string_temp:String;
				string_temp = params.pop();
				if(string_temp.length > 1)
				{
					var data_array:Array = string_temp.split(",");
					
					var user_lose_count:String = data_array.pop() as String;
				//	trace(int(user_lose_count));
					var user_win_count:String = data_array.pop() as String;
				//	trace(int(user_win_count));
					var user_score:String = data_array.pop() as String;
				//	trace(int(user_score));
					var user_name:String = data_array.pop() as String;
				//	trace(user_name);
					var user_num:String = data_array.pop() as String;
				//	trace(int(user_num));
				//	trace(i++);
				//	trace();
					
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