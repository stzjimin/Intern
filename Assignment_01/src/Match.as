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
		
		public function SetUser(input_score:int):void			//사용자의 점수를 받아서 해당 사용자의 Player객체를 생성하기 위한 메소드
		{
			user = new Player(0, "user", input_score, 0, 0);
			
			var group_num:int = (user.p_score - 1) / 100000;
			if(group_num > 10)
				group_num = 10;
			else if(group_num < 0)
				group_num = 0;
			user.p_group_num = group_num;
			
			groups.Sort(user);			//생성된 user의 Player객체를 토대로 Player객체들을 정렬
		}
		
		public function PrintPlayer(player:Player):void		//해당 Player객체의 내용들을 출력하기위한 메소드
		{
			output_string.push(" User(" + "id: " + player.p_num + ", name: " + player.p_name + ", score: " + player.p_score + ", win: " + player.p_win_count + ", lose: " + player.p_lose_count + ")");
			trace(" User(" + "id: " + player.p_num + ", name: " + player.p_name + ", score: " + player.p_score + ", win: " + player.p_win_count + ", lose: " + player.p_lose_count + ")"); 
		}
		
		public function Display():void
		{
			var count:int = 0;
			var group_flag:int = 0;
			var matched_group_num:int = user.p_group_num;
			output_string.push("Your Score is " + user.p_score + "\n");
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

				output_string.push(">Matched Group = " + (matched_group_num+1));
				output_string.push("\n");
				trace(">Matched Group = " + (matched_group_num+1));
				var matched_group:Vector.<Player> = groups.GetGroup(matched_group_num);
				if(matched_group.length == 0)
				{
					output_string.push("This Group is empty!!");
					output_string.push("\n");
					trace(" This Group is empty!!");
				}
				else
				{
					for(var i:int = 0; i < matched_group.length; i++)
					{
						PrintPlayer(matched_group[i]);
						output_string.push("\n");
						count++;
						if(count >= 5)
							break;
					}
				}
				group_flag++;
				output_string.push("\n");
			}
		}
		
		public function GetOutputString():Array
		{
			return output_string;
		}
	}
}