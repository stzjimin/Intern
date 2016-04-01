package
{
	public class Player
	{
		private var _num : int;
		private var _name : String;
		private var _score : int;
		private var _winCount : int;
		private var _loseCount : int;
		
		private var _groupNum : int;
		
		/**
		 *Player클래스의 생성자 
		 * @param input_num
		 * @param input_name
		 * @param input_score
		 * @param input_win_count
		 * @param input_lose_count
		 * 초기생성 시 기본 정보인 번호,이름,점수,승리횟수,패배횟수를 받아옴
		 */		
		public function Player(inputNum:int, inputName:String, inputScore:int,
							   inputWinCount:int, inputLoseCount:int)
		{
			_num = inputNum;
			_name = inputName;
			_score = inputScore;
			_winCount = inputWinCount;
			_loseCount = inputLoseCount;
		}
		
		/**
		 *Plyaer객체가 가지고있는 정보를 출력하기위한 함수 
		 * @return 플레이어가 가지고있는 정보를 정해진 규칙대로 출력
		 * 
		 */		
		public function printPlayer():String		//해당 Player객체의 내용들을 출력하기위한 메소드
		{
			trace(" User(" + "id: " + _num + ", name: " + _name + ", score: " + _score + ", win: " + _winCount + ", lose: " + _loseCount + ")");
			return " User(" + "id: " + _num + ", name: " + _name + ", score: " + _score + ", win: " + _winCount + ", lose: " + _loseCount + ")";
		}

		//Getter & Setter
		public function get groupNum():int
		{
			return _groupNum;
		}

		public function set groupNum(value:int):void
		{
			_groupNum = value;
		}

		public function get loseCount():int
		{
			return _loseCount;
		}

		public function set loseCount(value:int):void
		{
			_loseCount = value;
		}

		public function get winCount():int
		{
			return _winCount;
		}

		public function set winCount(value:int):void
		{
			_winCount = value;
		}

		public function get score():int
		{
			return _score;
		}

		public function set score(value:int):void
		{
			_score = value;
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

		public function get num():int
		{
			return _num;
		}

		public function set num(value:int):void
		{
			_num = value;
		}

	}
}