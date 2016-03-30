package
{	
	public class Group
	{
		private var groups:Array = new Array();
		private var _group_count:int;
		
		public function Group()
		{
		//	groups = new Array();
			_group_count = 0;
			for(var i:int = 0; i < 11; i++)
			{
				var group:Vector.<Player> = new Vector.<Player>();
				groups.push(group);
			}
		}
		
		public function get group_count():int
		{
			return _group_count;
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
			_group_count++;
		}
		
		public function Sort(user:Player):void
		{
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
				groups[i] = group_sort.sort(OrderAbs);
			}
		}
		
		private function CheckInterval(user:Player, target:Player):void
		{
			target.p_score_interval = Math.abs(target.p_score - user.p_score);
		}
		
		private function OrderAbs(player1:Player, player2:Player):int
		{
			if(player1.p_score_interval < player2.p_score_interval)
				return -1;
			else if(player1.p_score_interval > player2.p_score_interval)
				return 1;
			else
				return 0;
		}
		
		private function Swap(player1:Player, player2:Player):void
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