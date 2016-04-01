package
{
	public class Main		//최종적으로 출력될 텍스트필드를 생성할 클래스
	{
		private var match:Match;
		private var _user_score:int;
		
		/**
		 *Main클래스의 생성자 
		 * 객체생성 시 Match클래스의 객체를 생성함
		 * Main클래스는 유저의 입력데이터 및 출력 데이터만을 관리
		 */		
		public function Main()
		{	
			match = new Match();			//Match클래스의 객체를 생성
		}
		
		/**
		 *user_score의 setter함수 
		 * @param value = 유저가 입력한 데이터
		 * 
		 */		
		public function set user_score(value:int):void
		{
			_user_score = value;
		}
		
		/**
		 *user_score를 바탕으로 Match클래스의 SetUser함수를 실행
		 * SetUser함수가 실행될 시 그룹이 정렬됨
		 * Match클래스의 SetDisplay함수를 실행할 경우 객체 내에서 출력에 필요한 정보가 가공됨
		 */		
		public function SetGroup():void
		{
			match.SetUser(_user_score);		//Match클래스의  SetUser메소드 호출로 사용자의 점수로 새로운 Player객체를 생성 및 해당 점수로 Player객체들을 정렬
			match.SetDisplay();						//정렬된 Player객체들을 규칙에 맞게 Array변수에 저장함	
		}

		/**
		 *최종적으로 사용자에게 보여지게될 출력문을 반환하는 함수 
		 * @return 사용자가 최종적으로 보게될 출력문
		 * Match클래스의 객체가 가지고있던 출력문들을 Array형태로 가져와
		 * 하나의 String으로 다시 조합한 후 해당 문자열을 반환
		 */		
		public function get output_string():String
		{
			var string_array:Array = match.GetOutputString();	//저장된 Array변수를 가져옴(이 때 Array변수는 출력되어질 문자열들을 담고있음
			var output_text:String = new String();				//TextField에 보여질 문자열
			while(string_array.length != 0)
				output_text = output_text + string_array.shift();	//문자열에 string_array의 문자열들을 앞에서 부터 꺼내어 차례로 담는다.
			
			return output_text;
		}
	}
}