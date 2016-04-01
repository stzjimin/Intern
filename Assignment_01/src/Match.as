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
			groups = new Group();
			groups.SetGroup(i_o_manager.ReadDataFile("data.txt"));
		}
		
		public function SetUser(input_score:int):void			//사용자의 점수를 받게되면 해당 사용자의 Player객체를 생성하기 위한 메소드
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
		
		public function SetDisplay():void
		{
			var count:int = 0;				//출력된 Player숫자를 저장하기위한 변수
			var group_flag:int = 0;			//다음 탐색그룹을 정할 때 사용되어질 변수
			var matched_group_num:int = user.p_group_num;		//다음탐색될 그룹번호(초기에는 사용자가 속한 그룹)
			output_string.push("Your Score is " + user.p_score + "\n");
			while(!((count >= 5) || (count >= groups.player_count)))		//출력된 player숫자가 5명을 넘어가지 않거나, 데이터에 있는 Player의 총 개수를 넘어가지 않는 다면 반복
			{
				if((group_flag % 2) == 1)					//group_flag에 따라 다음 탐색그룹을 지정(이 때 group_flag가 홀수이면 위쪽그룹을 탐색, 짝수이면 아래쪽 그룹을 탐색)
				{
					matched_group_num = user.p_group_num + ((group_flag + 1) / 2);
					if(matched_group_num > 10)			//만약 다음 탐색하려는 그룹의 번호가 10보다 큰 경우(11그룹을 넘어갈경우)는 방향을 다시 아래로 전환
					{
						group_flag++;
						continue;
					}
				}
				else					//group_flag가 0인경우(사용자가 속한 그룹을 탐색하는 경우)도 여기에 속함
				{
					matched_group_num = user.p_group_num - (group_flag / 2);
					if(matched_group_num < 0)			//만약 다음 탐색하려는 그룹의 번호가 0보다 작은 경우(1그룹을 넘어갈경우)는 방향을 다시 위로 전환
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
					for(var i:int = 0; i < matched_group.length; i++)		//탐색하려는 그룹의 Player들을 출력
					{
						output_string.push(PrintPlayer(matched_group[i]));
						output_string.push("\n");
						count++;
						if(count >= 5)		//출력된 Player의 수가 5이상이 되면 탐색그룹에 Player가 남아있어도 즉시 출력을 중단.
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

		private function PrintPlayer(player:Player):String		//해당 Player객체의 내용들을 출력하기위한 메소드
		{
			trace(" User(" + "id: " + player.p_num + ", name: " + player.p_name + ", score: " + player.p_score + ", win: " + player.p_win_count + ", lose: " + player.p_lose_count + ")");
			return " User(" + "id: " + player.p_num + ", name: " + player.p_name + ", score: " + player.p_score + ", win: " + player.p_win_count + ", lose: " + player.p_lose_count + ")";
		}
	}
}