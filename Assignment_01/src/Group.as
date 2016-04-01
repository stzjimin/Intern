package
{	
	public class Group
	{
		private var groups:Array = new Array();		//Vector.<Player>배열을 담기위한 배열인 groups
		private var _player_count:int;		//Player의 총 개수
		
		public function Group()
		{
			_player_count = 0;
			for(var i:int = 0; i < 11; i++)
			{
				var group:Vector.<Player> = new Vector.<Player>();	//Player객체를 담기위한 Vector배열인 group
				groups.push(group);		//Array배열 groups에 Vector배열 group을 추가
			}
		}
		
		public function get player_count():int
		{
			return _player_count;
		}

		public function GetGroup(group_num:int):Vector.<Player>
		{
			return groups[group_num];
		}
		
		public function Input_player(player:Player):void
		{
			var group_num:int = (player.p_score - 1) / 100000;
			if(group_num > 10)
				group_num = 10;
			player.p_group_num = group_num;
			var group_length:int = groups[group_num].length;
			groups[group_num][group_length] = player;
			_player_count++;
		}
		
		public function Sort(user:Player):void
		{	//Player객체들을 정렬하기위한 메소드(이 때 기준이 될 Plyaer객체를 받고 해당  Player객체의 점수차가 적은 순서대로 정렬한다)
			var i:int;
			var j:int;
			for(i = 0; i < 11; i++)
			{
				var group_temp:Vector.<Player> = groups[i];
				for(j = 0; j < group_temp.length; j++)
					CheckInterval(user, group_temp[j]);
				groups[i] = group_temp;
			}
			
			for(i = 0; i < 11; i++)
			{
				var group_sort:Vector.<Player> = groups[i];
				groups[i] = group_sort.sort(OrderAbs);		//Array에서 지원하는 sort메소드를 이용하여 정렬(이 때 인자로 메소드를 넘겨주게 되면 해당 메소드를 실행,비교 하여 정렬을 함)
			}
		}
		
		private function CheckInterval(user:Player, target:Player):void		//사용자(user)Player객체와 목표가되는 Player객체의 점수차이를 구하여 저장하기 위한 메소드
		{
			target.p_score_interval = Math.abs(target.p_score - user.p_score);
		}
		
		private function OrderAbs(player1:Player, player2:Player):int		//p_score_interval(user와의 점수차이)를 토대로 비교하기위한 메소드
		{
			if(player1.p_score_interval < player2.p_score_interval)
				return -1;
			else if(player1.p_score_interval > player2.p_score_interval)
				return 1;
			else
				return 0;
		}
		
		private function Swap(player1:Player, player2:Player):void		//두 Player객체 내부의 데이터들을 바꿔주기위한 메소드
		{
			var String_temp:String;
			var int_temp:int;
			
			int_temp = player1.p_num;
			player1.p_num = player2.p_num;
			player2.p_num = int_temp;
			
			String_temp = player1.p_name;
			player1.p_name = player2.p_name;
			player2.p_name = String_temp;
			
			int_temp = player1.p_score;
			player1.p_score = player2.p_score;
			player2.p_score = int_temp;
			
			int_temp = player1.p_win_count;
			player1.p_win_count = player2.p_win_count;
			player2.p_win_count = int_temp;
			
			int_temp = player1.p_lose_count;
			player1.p_lose_count = player2.p_lose_count;
			player2.p_lose_count = int_temp;
			
			int_temp = player1.p_group_num;
			player1.p_group_num = player2.p_group_num;
			player2.p_group_num = int_temp;
		}
	}
}