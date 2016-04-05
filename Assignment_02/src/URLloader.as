package
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	import starling.textures.Texture;
	
	public class URLloader
	{
		private static var _titleBarTexture:Texture;
		
		private static var _titleBarBitmap:Bitmap;
		private static var _closeButtonBitmap:Bitmap;
		private static var _miniButtonBitmap:Bitmap;
		private static var _revertButtonBitmap:Bitmap;
		private static var _contentBitmap:Bitmap;
		
		private var titleBarLoader:Loader = new Loader();
		private var closeButtonLoader:Loader = new Loader();
		private var miniButtonLoader:Loader = new Loader();
		private var revertButtonLoader:Loader = new Loader();
		private var contentLoader:Loader = new Loader();
		
		public function URLloader()
		{
			var titleBarURL:URLRequest = new URLRequest("https://raw.githubusercontent.com/stzyoungsun/youngsun/master/Assignment02/src/GUI_resources/titleBar.png");
			var closeButtonURL:URLRequest = new URLRequest("https://raw.githubusercontent.com/stzyoungsun/youngsun/master/Assignment02/src/GUI_resources/close.png");
			var miniButtonURL:URLRequest = new URLRequest("https://raw.githubusercontent.com/stzyoungsun/youngsun/master/Assignment02/src/GUI_resources/minimize.png");
			var revertButtonURL:URLRequest = new URLRequest("https://raw.githubusercontent.com/stzyoungsun/youngsun/master/Assignment02/src/GUI_resources/revert.png");
			var contentURL:URLRequest = new URLRequest("https://raw.githubusercontent.com/stzyoungsun/youngsun/master/Assignment02/src/GUI_resources/contents.png");
			
			
			titleBarLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, titleBarCompleate);
		//	titleBarLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, titleBarCompleate);
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
			titleBarLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, titleBarCompleate);
			_titleBarTexture = Texture.fromBitmap(_titleBarBitmap);
			trace("aa");
		}
		
		private function closeButtonCompleate(event:Event):void
		{
			_closeButtonBitmap = event.currentTarget.loader.content as Bitmap;
			closeButtonLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, titleBarCompleate);
			trace("bb");
		}
		
		private function miniButtonCompleate(event:Event):void
		{
			_miniButtonBitmap = event.currentTarget.loader.content as Bitmap;
			miniButtonLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, titleBarCompleate);
			trace("cc");
		}
		
		private function revertButtonCompleate(event:Event):void
		{
			_revertButtonBitmap = event.currentTarget.loader.content as Bitmap;
			revertButtonLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, titleBarCompleate);
			trace("dd");
		}
		
		private function contentCompleate(event:Event):void
		{
			_contentBitmap = event.currentTarget.loader.content as Bitmap;
			contentLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, titleBarCompleate);
			trace("ee");
		}
	}
}