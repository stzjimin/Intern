package
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;

	public class I_O_Manager
	{
		
		private var data_file:File;
		private var data_stream:FileStreamWithLineReader;
		private var data:Array;
		
		/**
		 *I_O_Manager의 생성자
		 * 객체 생성시 file의 기본경로를 설정 및 데이터를 저장할 배열을 준비
		 */		
		public function I_O_Manager()
		{
			data_file = File.applicationDirectory;			//Player데이터가 저장되어있는 데이터파일을 읽어들이기위한 변수
			data = new Array();
		}
		
		/**
		 *입력받은 데이터파일의 이름으로 파일을 찾은 후 정보를 읽어오는 클래스 
		 * @param file_name = 데이터파일의 이름
		 * @return 데이터파일에서 읽어들인 데이터
		 * 데이터 파일로부터 데이터를 읽어들인 후 이를 반환
		 */		
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
			data_stream.close();
			
			return data;
		}
	}
}