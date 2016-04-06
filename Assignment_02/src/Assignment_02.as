package
{
	import flash.display.Sprite;
	import starling.core.Starling;
	
	[SWF(width="700", height="700", frameRate="60", backgroundColor="#FFFFFF")]
	public class Assignment_02 extends Sprite
	{
		private var _starling:Starling;
		
		public function Assignment_02()
		{
			new URLloader();
			
			_starling = new Starling(Main, stage);
			_starling.start();
			_starling.showStats = true;
		}
	}
}