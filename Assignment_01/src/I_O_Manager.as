package
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;

	public class I_O_Manager
	{
		private var data_file:File;
		private var data_stream:FileStreamWithLineReader;
		private var data:Array;
		
		public function I_O_Manager()
		{
			data_file = File.applicationDirectory;			//Player데이터가 저장되어있는 데이터파일을 읽어들이기위한 변수
			data = new Array();
		}
		
		public function ReadDataFile(file_name:String):Array
		{
			data_file = data_file.resolvePath(file_name);
			data_stream = new FileStreamWithLineReader();
			data_stream.open(data_file, FileMode.READ);
			
			while(data_stream.bytesAvailable)
			{
				var line:String = data_stream.readUTFLine();
				data.push(line);
			}
			//data_stream.readBytes(bytes, data_stream.position, data_stream.bytesAvailable);	//읽어들인 문자열을 bytes에 byte형태로 저장
			
			data_stream.close();
			
			return data;
		}
	}
}