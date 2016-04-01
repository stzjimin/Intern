package
{
	public class Match
	{
		private var groups:Group;
		private var i_o_manager:I_O_Manager;
		private var user:Player;
		private var output_string:Array = new Array();
		private const max_out_count:int = 5
		
		/**
		 *Match클래스의 생성자 
		 * 객체생성 시 I_O_Manager와 Group객체를 생성 
		 * Group객체의 그룹들을 데이터파일을 사용하여 지정
		 */		
		public function Match()
		{
			i_o_manager = new I_O_Manager();
			groups = new Group();
			groups.SetGroup(i_o_manager.ReadDataFile("data.txt"));
		}
		
		/**
		 *사용자로 부터 입력받은 점수를 토대로 사용자의 Player객체를 생성 및 해당점수를 토대로 그룹을 정렬하는 함수
		 * @param input_score = 사용자로부터 입력받은 점수
		 * 사용자가 입력한 점수로 사용자의 Player객체를 생성하고 해당 객체를 넘겨주면서 그룹을 정렬
		 */		
		public function SetUser(input_score:int):void			//사용자의 점수를 받게되면 해당 사용자의 Player객체를 생성하기 위한 메소드
		{
			user = new Player(0, "user", input_score, 0, 0);
			
			var group_num:int = (user.p_score - 1) / 100000;
			if(group_num > groups.group_count)
				group_num = groups.group_count;
			else if(group_num < 0)
				group_num = 0;
			user.p_group_num = group_num;
			
			groups.Sort(user);			//생성된 user의 Player객체를 토대로 Player객체들을 정렬
		}
		
		/**
		 *출력될 Player객체를 정하기위한 함수 
		 * 지정한 최대출력 개수만큼 출력하거나, 데이터에 있는 총 플레이어개수만큼 출력될때까지 지그재그형식으로 그룹을 탐색
		 */		
		public function SetDisplay():void
		{
			var count:int = 0;				//출력된 Player숫자를 저장하기위한 변수
			var group_flag:int = 0;			//다음 탐색그룹을 정할 때 사용되어질 변수
			var matched_group_num:int = user.p_group_num;		//다음탐색될 그룹번호(초기에는 사용자가 속한 그룹)
			output_string.push("Your Score is " + user.p_score + "\n");
			while(!((count >= max_out_count) || (count >= groups.player_count)))		//출력된 player숫자가 5명을 넘어가지 않거나, 데이터에 있는 Player의 총 개수를 넘어가지 않는 다면 반복
			{
				if((group_flag % 2) == 1)					//group_flag에 따라 다음 탐색그룹을 지정(이 때 group_flag가 홀수이면 위쪽그룹을 탐색, 짝수이면 아래쪽 그룹을 탐색)
				{
					matched_group_num = user.p_group_num + ((group_flag + 1) / 2);
					if(matched_group_num > groups.group_count)			//만약 다음 탐색하려는 그룹의 번호가 10보다 큰 경우(11그룹을 넘어갈경우)는 방향을 다시 아래로 전환
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

				output_string.push(">Matched Group = " + (matched_group_num+1) + "\n");
				trace(">Matched Group = " + (matched_group_num+1));
				var matched_group:Vector.<Player> = groups.GetGroup(matched_group_num);
				if(matched_group.length == 0)
				{
					output_string.push("This Group is empty!!" + "\n");
					trace(" This Group is empty!!");
				}
				else
				{
					for(var i:int = 0; i < matched_group.length; i++)		//탐색하려는 그룹의 Player들을 출력
					{
						output_string.push(matched_group[i].PrintPlayer() + "\n");
						count++;
						if(count >= 5)		//출력된 Player의 수가 5이상이 되면 탐색그룹에 Player가 남아있어도 즉시 출력을 중단.
							break;
					}
				}
				group_flag++;
				output_string.push("\n");
			}
		}
		
		/**
		 *최종적으로 사용자에게 보여지게될 문자열을 반환해주는 함수 
		 * @return 사용자가 최종적으로 보게될 문자열
		 * 
		 */		
		public function GetOutputString():Array
		{
			return output_string;
		}
	}
}