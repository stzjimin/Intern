package
{	
	public class Group
	{
		private var groups:Array = new Array();		//Vector.<Player>배열을 담기위한 배열인 groups
		private var _player_count:int;		//Player의 총 개수
		private const _group_count:int = 10;
		
		public function Group()
		{
			_player_count = 0;
			for(var i:int = 0; i < _group_count+1; i++)
			{
				var group:Vector.<Player> = new Vector.<Player>();	//Player객체를 담기위한 Vector배열인 group
				groups.push(group);		//Array배열 groups에 Vector배열 group을 추가
			}
		}
		
		public function get group_count():int
		{
			return _group_count;
		}

		public function get player_count():int
		{
			return _player_count;
		}

		public function GetGroup(group_num:int):Vector.<Player>
		{
			return groups[group_num];
		}
		
		public function Sort(user:Player):void
		{	//Player객체들을 정렬하기위한 메소드(이 때 기준이 될 Plyaer객체를 받고 해당  Player객체의 점수차가 적은 순서대로 정렬한다)
			
			for(var i:int = 0; i < _group_count+1; i++)
			{
				var group_sort:Vector.<Player> = groups[i];
				groups[i] = group_sort.sort(OrderAbs);		//Array에서 지원하는 sort메소드를 이용하여 정렬(이 때 인자로 메소드를 넘겨주게 되면 해당 메소드를 실행,비교 하여 정렬을 함)
			}
			
			function OrderAbs(player1:Player, player2:Player):int		//p_score_interval(user와의 점수차이)를 토대로 비교하기위한 메소드
			{
				if(Math.abs(player1.p_score - user.p_score) < Math.abs(player2.p_score - user.p_score))
					return -1;
				else if(Math.abs(player1.p_score - user.p_score) > Math.abs(player2.p_score - user.p_score))
					return 1;
				else
					return 0;
			}
		}
		
		public function SetGroup(data:Array):void
		{
		//	var byte_string:String = bytes.toString();		//byte형태로 저장되어있는 문자열들을 toString을 이용해서 문자열로 변환
		//	var params:Array = byte_string.split("\n");		//해당 문자열을 개행문자("\n")를 기준으로 분할(Player별로 문자열을 분할)
			
			var reg:RegExp = new RegExp(/\D/g);
			while(data.length != 0)
			{
				var string_temp:String;
				string_temp = data.pop();
				var data_array:Array = string_temp.split(",");		//개행문자열로 나눠진 한줄의 문자열(Player한명의 정보)를 다시 ','를 기준으로 분할 
				if(data_array.length > 1)		//이 때 분할된 문자가 1개 이하인경우는 ','가 없는 경우이므로 올바른 정보가 아니므로 제외
				{	
					var user_lose_count:String = data_array.pop() as String;		//분할된 문자열들을 pop을 이용하여 차례로 가져옴
					user_lose_count = user_lose_count.replace(reg,"");
					var user_win_count:String = data_array.pop() as String;
					user_win_count = user_win_count.replace(reg,"");
					var user_score:String = data_array.pop() as String;
					user_score = user_score.replace(reg,"");
					var user_name:String = data_array.pop() as String;
					var user_num:String = data_array.pop() as String;
					user_num = user_num.replace(reg,"");
					
					var player:Player = new Player(int(user_num), user_name, int(user_score), int(user_win_count), int(user_lose_count));
					Input_player(player);
				}
			}
		}
		
		private function Input_player(player:Player):void
		{
			var group_num:int = (player.p_score - 1) / 100000;		//player가 속하는 그룹은 player점수에 따라 정해지므로 해당 규칙으로 플레이어 그룹을 설정
			if(group_num > _group_count)
				group_num = _group_count;
			player.p_group_num = group_num;
			var group_length:int = groups[group_num].length;
			groups[group_num][group_length] = player;
			_player_count++;
		}

		/*
		private function CheckInterval(user:Player, target:Player):void		//사용자(user)Player객체와 목표가되는 Player객체의 점수차이를 구하여 저장하기 위한 메소드
		{
			target.p_score_interval = Math.abs(target.p_score - user.p_score);
		}
		*/
	}
}