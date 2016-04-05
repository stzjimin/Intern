package
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	public class URLloader
	{
		private static var _titleBarBitmap:Bitmap;
		private static var _closeButtonBitmap:Bitmap;
		private static var _miniButtonBitmap:Bitmap;
		private static var _revertButtonBitmap:Bitmap;
		private static var _contentBitmap:Bitmap;
		
		public function URLloader()
		{
			var titleBarLoader:Loader = new Loader();
			var closeButtonLoader:Loader = new Loader();
			var miniButtonLoader:Loader = new Loader();
			var revertButtonLoader:Loader = new Loader();
			var contentLoader:Loader = new Loader();
			
			var titleBarURL:URLRequest = new URLRequest("https://raw.githubusercontent.com/stzyoungsun/youngsun/master/Assignment02/src/GUI_resources/titleBar.png");
			var closeButtonURL:URLRequest = new URLRequest("https://raw.githubusercontent.com/stzyoungsun/youngsun/master/Assignment02/src/GUI_resources/close.png");
			var miniButtonURL:URLRequest = new URLRequest("https://raw.githubusercontent.com/stzyoungsun/youngsun/master/Assignment02/src/GUI_resources/minimize.png");
			var revertButtonURL:URLRequest = new URLRequest("https://raw.githubusercontent.com/stzyoungsun/youngsun/master/Assignment02/src/GUI_resources/revert.png");
			var contentURL:URLRequest = new URLRequest("https://raw.githubusercontent.com/stzyoungsun/youngsun/master/Assignment02/src/GUI_resources/contents.png");
			
			
			titleBarLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, titleBarCompleate);
			titleBarLoader.load(titleBarURL);
			
			closeButtonLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, closeButtonCompleate);
			closeButtonLoader.load(closeButtonURL);
			
			miniButtonLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, miniButtonCompleate);
			miniButtonLoader.load(miniButtonURL);
			
			revertButtonLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, revertButtonCompleate);
			revertButtonLoader.load(revertButtonURL);
			
			contentLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, contentCompleate);
			contentLoader.load(contentURL);
		}
		
		public static function get contentBitmap():Bitmap
		{
			return _contentBitmap;
		}

		public static function get revertButtonBitmap():Bitmap
		{
			return _revertButtonBitmap;
		}

		public static function get miniButtonBitmap():Bitmap
		{
			return _miniButtonBitmap;
		}

		public static function get closeButtonBitmap():Bitmap
		{
			return _closeButtonBitmap;
		}

		public static function get titleBarBitmap():Bitmap
		{
			return _titleBarBitmap;
		}

		private function titleBarCompleate(event:Event):void
		{
			_titleBarBitmap = event.currentTarget.loader.content as Bitmap;
		}
		
		private function closeButtonCompleate(event:Event):void
		{
			_closeButtonBitmap = event.currentTarget.loader.content as Bitmap;
		}
		
		private function miniButtonCompleate(event:Event):void
		{
			_miniButtonBitmap = event.currentTarget.loader.content as Bitmap;
		}
		
		private function revertButtonCompleate(event:Event):void
		{
			_revertButtonBitmap = event.currentTarget.loader.content as Bitmap;
		}
		
		private function contentCompleate(event:Event):void
		{
			_contentBitmap = event.currentTarget.loader.content as Bitmap;
		}
	}
}