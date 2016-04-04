package
{	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;

	public class Game extends Sprite
	{
		[Embed(source="GUI_resources\\contents.png")]
		private static const Background:Class;
		
		[Embed(source="GUI_resources\\revert.png")]
		private static const ButtonBG:Class;
		
		public function Game(text:String)
		{
			var background:Image = new Image(Texture.fromEmbeddedAsset(Background));
			var textField:TextField = new TextField(100, 20, text);
			
			var buttonTexture:Texture = Texture.fromEmbeddedAsset(ButtonBG);
			var yesButton:Button = new Button(buttonTexture, "Yes");
			var noButton:Button = new Button(buttonTexture, "no");
			
			yesButton.addEventListener(Event.TRIGGERED, onButtonTriggered);
			noButton.addEventListener(Event.TRIGGERED, onNoButtonTriggered);
			
			yesButton.x = 10;
			yesButton.y = 20;
			
			noButton.x = 60;
			noButton.y = 20;
			
			addChild(background);
			addChild(textField);
			addChild(yesButton);
			addChild(noButton);
		}
		
		public function onButtonTriggered(event:Event):void
		{
			removeFromParent();
			trace("The button was triggered!");
		}
		
		public function onNoButtonTriggered(event:Event):void
		{
			var msgBox:Game = new Game("CHILD!!!");
			addChild(msgBox);
		}
	}
}