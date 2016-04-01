package
{
	public class Player
	{
		private var _p_num : int;
		private var _p_name : String;
		private var _p_score : int;
		private var _p_win_count : int;
		private var _p_lose_count : int;
		
		private var _p_group_num : int;
		
		/**
		 *Player클래스의 생성자 
		 * @param input_num
		 * @param input_name
		 * @param input_score
		 * @param input_win_count
		 * @param input_lose_count
		 * 초기생성 시 기본 정보인 번호,이름,점수,승리횟수,패배횟수를 받아옴
		 */		
		public function Player(input_num:int, input_name:String, input_score:int,
							   input_win_count:int, input_lose_count:int)
		{
			_p_num = input_num;
			_p_name = input_name;
			_p_score = input_score;
			_p_win_count = input_win_count;
			_p_lose_count = input_lose_count;
		}
		
		/**
		 *Plyaer객체가 가지고있는 정보를 출력하기위한 함수 
		 * @return 플레이어가 가지고있는 정보를 정해진 규칙대로 출력
		 * 
		 */		
		public function PrintPlayer():String		//해당 Player객체의 내용들을 출력하기위한 메소드
		{
			trace(" User(" + "id: " + _p_num + ", name: " + _p_name + ", score: " + _p_score + ", win: " + _p_win_count + ", lose: " + _p_lose_count + ")");
			return " User(" + "id: " + _p_num + ", name: " + _p_name + ", score: " + _p_score + ", win: " + _p_win_count + ", lose: " + _p_lose_count + ")";
		}

		//Getter & Setter
		public function get p_group_num():int
		{
			return _p_group_num;
		}

		public function set p_group_num(value:int):void
		{
			_p_group_num = value;
		}

		public function get p_lose_count():int
		{
			return _p_lose_count;
		}

		public function set p_lose_count(value:int):void
		{
			_p_lose_count = value;
		}

		public function get p_win_count():int
		{
			return _p_win_count;
		}

		public function set p_win_count(value:int):void
		{
			_p_win_count = value;
		}

		public function get p_score():int
		{
			return _p_score;
		}

		public function set p_score(value:int):void
		{
			_p_score = value;
		}

		public function get p_name():String
		{
			return _p_name;
		}

		public function set p_name(value:String):void
		{
			_p_name = value;
		}

		public function get p_num():int
		{
			return _p_num;
		}

		public function set p_num(value:int):void
		{
			_p_num = value;
		}

	}
}