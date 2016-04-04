package
{
	import flash.display.Sprite;
	
	import starling.core.Starling;
	
	[SWF(width="700", height="700", frameRate="60", backgroundColor="#FFFFFF")]
	public class Assginment_02 extends Sprite
	{
		private var _starling:Starling;
		
		public function Assginment_02()
		{
			_starling = new Starling(Main, stage);
			_starling.start();
		}
	}
}