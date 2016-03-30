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
				var data_array:Array = string_temp.split(",");		//개행문자열로 나눠진 한줄의 문자열(Player한명의 정보)를 다시 ','를 기준으로 분할 
				if(data_array.length > 1)		//이 때 분할된 문자가 1개 이하인경우는 ','가 없는 경우이므로 올바른 정보가 아니므로 제외
				{	
					var user_lose_count:String = data_array.pop() as String;		//분할된 문자열들을 pop을 이용하여 차례로 가져옴
					var user_win_count:String = data_array.pop() as String;
					var user_score:String = data_array.pop() as String;
					var user_name:String = data_array.pop() as String;
					var user_num:String = data_array.pop() as String;
					
					var player:Player = new Player(int(user_num), user_name, int(user_score), int(user_win_count), int(user_lose_count));
					groups.Input_player(player);
				}
			}
		}
		
		public function GetDataGroup():Group	//데이터파일을 토대로 생성된 Player그룹을 반환해주기 위한 메소드
		{
			return groups;
		}
	}
}