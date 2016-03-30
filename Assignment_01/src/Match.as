package
{
	public class Match
	{
		private var groups:Group;
		private var i_o_manager:I_O_Manager;
		private var user:Player;
		private var output_string:Array = new Array();
		
		public function Match()
		{
			i_o_manager = new I_O_Manager();
			groups = i_o_manager.GetDataGroup();
		}
		
		public function SetUser(input_score:int):void
		{
			user = new Player(0, "user", input_score, 0, 0);
			
			var group_num:int = (user.p_score - 1) / 100000;
			if(group_num > 10)
				group_num = 10;
			user.p_group_num = group_num;
			
			groups.Sort(user);
		}
		
		public function PrintPlayer(player:Player):void
		{
			output_string.push("User(" + "id: " + player.p_num + ", name: " + player.p_name + ", score: " + player.p_score + ", win: " + player.p_win_count + ", lose: " + player.p_lose_count + ")" + "\n");
			trace("User(" + "id: " + player.p_num + ", name: " + player.p_name + ", score: " + player.p_score + ", win: " + player.p_win_count + ", lose: " + player.p_lose_count + ")"); 
		}
		
		public function Display():void
		{
			var count:int = 0;
			var group_flag:int = 0;
			var matched_group_num:int = user.p_group_num;
			while(!((count >= 5) || (count >= groups.group_count)))
			{
				if((group_flag % 2) == 1)
				{
					matched_group_num = user.p_group_num + ((group_flag + 1) / 2);
					if(matched_group_num > 10)
					{
						group_flag++;
						continue;
					}
				}
				else
				{
					matched_group_num = user.p_group_num - (group_flag / 2);
					if(matched_group_num < 0)
					{
						group_flag++;
						continue;
					}
				}
				
				output_string.push("Matched Group = " + matched_group_num + "\n");
				trace("Matched Group = " + matched_group_num);
				var matched_group:Vector.<Player> = groups.GetGroup(matched_group_num);
				if(matched_group.length == 0)
				{
					output_string.push("This Group is empty!!" + "\n");
					trace("This Group is empty!!");
				}
				else
				{
					for(var i:int = 0; i < matched_group.length; i++)
					{
						PrintPlayer(matched_group[i]);
						count++;
						if(count >= 5)
							break;
					}
				}
				group_flag++;
			}
		}
		
		public function GetOutputString():Array
		{
			return output_string;
		}
	}
}