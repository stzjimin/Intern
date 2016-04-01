package
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;

	public class IOManager
	{
		
		private var _dataFile:File;
		private var _dataStream:FileStreamWithLineReader;
		private var _data:Array;
		
		/**
		 *I_O_Manager의 생성자
		 * 객체 생성시 file의 기본경로를 설정 및 데이터를 저장할 배열을 준비
		 */		
		public function IOManager()
		{
			_dataFile = File.applicationDirectory;			//Player데이터가 저장되어있는 데이터파일을 읽어들이기위한 변수
			_data = new Array();
		}
		
		/**
		 *입력받은 데이터파일의 이름으로 파일을 찾은 후 정보를 읽어오는 클래스 
		 * @param file_name = 데이터파일의 이름
		 * @return 데이터파일에서 읽어들인 데이터
		 * 데이터 파일로부터 데이터를 읽어들인 후 이를 반환
		 */		
		public function readDataFile(fileName:String):Array
		{
			_dataFile = _dataFile.resolvePath(fileName);
			_dataStream = new FileStreamWithLineReader();
			_dataStream.open(_dataFile, FileMode.READ);
			
			while(_dataStream.bytesAvailable)
			{
				var line:String = _dataStream.readUTFLine();
				_data.push(line);
			}
			_dataStream.close();
			
			return _data;
		}
	}
}