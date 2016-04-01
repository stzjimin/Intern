package
{	
	public class Group
	{
		private var _groups:Array = new Array();		//Vector.<Player>배열을 담기위한 배열인 groups
		private var _playerCount:int;		//Player의 총 개수
		private const _groupCount:int = 10;
		
		/**
		 *Group클래스의 생성자 
		 * 최초 생성시 지정한 그룹카운트+1만큼 그룹수를 생성
		 */		
		public function Group()
		{
			_playerCount = 0;
			for(var i:int = 0; i < _groupCount+1; i++)
			{
				var group:Vector.<Player> = new Vector.<Player>();	//Player객체를 담기위한 Vector배열인 group
				_groups.push(group);		//Array배열 groups에 Vector배열 group을 추가
			}
		}
		
		public function get groupCount():int
		{
			return _groupCount;
		}

		public function get playerCount():int
		{
			return _playerCount;
		}

		/**
		 * 입력받은 그룹넘버에 해당하는 그룹을 반환 
		 * @param group_num = 반환받고싶은 그룹의 넘버
		 * @return group_num에 해당하는 그룹
		 *
		 */		
		public function getGroup(groupNum:int):Vector.<Player>
		{
			return _groups[groupNum];
		}
		
		/**
		 * 현제 그룹을 user에 맞게 정렬
		 * 정렬의 경우는 OrderAbs함수가 안으로 들어오면서 Player객체에 따로 불필요하게 차이값을 저장할 필요가 없어짐
		 * @param user = 사용자가 입력한 점수를 바탕으로 정의된 Player객체
		 * 
		 */		
		public function sortGroup(user:Player):void
		{	//Player객체들을 정렬하기위한 메소드(이 때 기준이 될 Plyaer객체를 받고 해당  Player객체의 점수차가 적은 순서대로 정렬한다)
			
			for(var i:int = 0; i < _groupCount+1; i++)
			{
				var groupTemp:Vector.<Player> = _groups[i];
				_groups[i] = groupTemp.sort(orderAbs);		//Array에서 지원하는 sort메소드를 이용하여 정렬(이 때 인자로 메소드를 넘겨주게 되면 해당 메소드를 실행,비교 하여 정렬을 함)
			}
			
			function orderAbs(player1:Player, player2:Player):int		//p_score_interval(user와의 점수차이)를 토대로 비교하기위한 메소드
			{
				if(Math.abs(player1.score - user.score) < Math.abs(player2.score - user.score))
					return -1;
				else if(Math.abs(player1.score - user.score) > Math.abs(player2.score - user.score))
					return 1;
				else
					return 0;
			}
		}
		
		/**
		 * 입력받은 데이터로부터 Player정보를 추출해 그룹화하는 함수
		 * @param data = 데이터파일로 부터 받아온 데이터(String형태로 배열에 저장)
		 * 받아온 한줄당의 데이터를 ','단위로 분할하여 생성된 Player객체에 저장 
		 */		
		public function setGroup(data:Array):void
		{
			var reg:RegExp = new RegExp(/\D/g);
			while(data.length != 0)
			{
				var stringTemp:String;
				stringTemp = data.pop();
				var dataArray:Array = stringTemp.split(",");		//개행문자열로 나눠진 한줄의 문자열(Player한명의 정보)를 다시 ','를 기준으로 분할 
				if(dataArray.length > 3)		//이 때 분할된 문자가 4개 이하인경우는 잘못된 정보로 판단
				{	
					var userLoseCount:String = dataArray.pop() as String;		//분할된 문자열들을 pop을 이용하여 차례로 가져옴
					userLoseCount = userLoseCount.replace(reg,"");
					var userWinCount:String = dataArray.pop() as String;
					userWinCount = userWinCount.replace(reg,"");
					var userScore:String = dataArray.pop() as String;
					userScore = userScore.replace(reg,"");
					var userName:String = dataArray.pop() as String;
					var userNum:String = dataArray.pop() as String;
					userNum = userNum.replace(reg,"");
					
					var player:Player = new Player(int(userNum), userName, int(userScore), int(userWinCount), int(userLoseCount));
					inputPlayer(player);
				}
			}
		}
		
		/**
		 * 입력받은 Player객체를 적절한 그룹으로 배치하기위한 함수
		 * @param player = Player객체
		 * 입력받은 Player객체의 점수를 바탕으로 올바른 그룹을 계산 후 해당 그룹으로 추가시켜줌
		 */		
		public function inputPlayer(player:Player):void
		{
			var groupNum:int = (player.score - 1) / 100000;		//player가 속하는 그룹은 player점수에 따라 정해지므로 해당 규칙으로 플레이어 그룹을 설정
			if(groupNum > _groupCount)
				groupNum = _groupCount;
			player.groupNum = groupNum;
			var groupLength:int = _groups[groupNum].length;
			_groups[groupNum][groupLength] = player;
			_playerCount++;
		}
	}
}