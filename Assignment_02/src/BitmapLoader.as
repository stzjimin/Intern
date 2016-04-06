package
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	public class BitmapLoader
	{
		private static var _titleBarBitmap:Bitmap = new Bitmap();
		private static var _closeButtonBitmap:Bitmap = new Bitmap();
		private static var _miniButtonBitmap:Bitmap = new Bitmap();
		private static var _revertButtonBitmap:Bitmap = new Bitmap();
		private static var _contentBitmap:Bitmap = new Bitmap();
		
		private var _titleBarLoader:Loader = new Loader();
		private var _closeButtonLoader:Loader = new Loader();
		private var _miniButtonLoader:Loader = new Loader();
		private var _revertButtonLoader:Loader = new Loader();
		private var _contentLoader:Loader = new Loader();
		
		private var completeFunc:Function;	//비트맵의 로딩이 완료될 경우 호출될 함수
		private var progressFunc:Function;	//비트맵들 중 하나라도 로드가 완료되면 호출되는 함수
		private var completeCounter:int;
		
		public function BitmapLoader(progFunc:Function, compFunc:Function)
		{
			var titleBarURL:URLRequest = new URLRequest("https://raw.githubusercontent.com/stzjimin/JiMin/master/Assignment_02/src/GUI_resources/titleBar.png");
			var closeButtonURL:URLRequest = new URLRequest("https://raw.githubusercontent.com/stzjimin/JiMin/master/Assignment_02/src/GUI_resources/close.png");
			var miniButtonURL:URLRequest = new URLRequest("https://raw.githubusercontent.com/stzjimin/JiMin/master/Assignment_02/src/GUI_resources/minimize.png");
			var revertButtonURL:URLRequest = new URLRequest("https://raw.githubusercontent.com/stzjimin/JiMin/master/Assignment_02/src/GUI_resources/revert.png");
			var contentURL:URLRequest = new URLRequest("https://raw.githubusercontent.com/stzjimin/JiMin/master/Assignment_02/src/GUI_resources/contents.png");
			
			completeCounter = 0;
			completeFunc = compFunc;
			progressFunc = progFunc;
			
			/*
			var titleBarURL:URLRequest = new URLRequest("GUI_resources/titleBar.png");
			var closeButtonURL:URLRequest = new URLRequest("GUI_resources/close.png");
			var miniButtonURL:URLRequest = new URLRequest("GUI_resources/minimize.png");
			var revertButtonURL:URLRequest = new URLRequest("GUI_resources/revert.png");
			var contentURL:URLRequest = new URLRequest("GUI_resources/contents.png");
			*/
			
			_titleBarLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, titleBarCompleate);
			_titleBarLoader.load(titleBarURL);
			
			_closeButtonLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, closeButtonCompleate);
			_closeButtonLoader.load(closeButtonURL);
			
			_miniButtonLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, miniButtonCompleate);
			_miniButtonLoader.load(miniButtonURL);
			
			_revertButtonLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, revertButtonCompleate);
			_revertButtonLoader.load(revertButtonURL);
			
			_contentLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, contentCompleate);
			_contentLoader.load(contentURL);
		}
		
		//getter && setter
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

		//각 로더별로 컴플릿될경우 호출되는 함수들
		private function titleBarCompleate(event:Event):void
		{
			_titleBarBitmap = event.currentTarget.loader.content as Bitmap;
			_titleBarLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, titleBarCompleate);
			checkLoadingComplete();
		}
		
		private function closeButtonCompleate(event:Event):void
		{
			_closeButtonBitmap = event.currentTarget.loader.content as Bitmap;
			_closeButtonLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, titleBarCompleate);
			checkLoadingComplete();
		}
		
		private function miniButtonCompleate(event:Event):void
		{
			_miniButtonBitmap = event.currentTarget.loader.content as Bitmap;
			_miniButtonLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, titleBarCompleate);
			checkLoadingComplete();
		}
		
		private function revertButtonCompleate(event:Event):void
		{
			_revertButtonBitmap = event.currentTarget.loader.content as Bitmap;
			_revertButtonLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, titleBarCompleate);
			checkLoadingComplete();
		}
		
		private function contentCompleate(event:Event):void
		{
			_contentBitmap = event.currentTarget.loader.content as Bitmap;
			_contentLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, titleBarCompleate);
			checkLoadingComplete();
		}
		
		/**
		 *각 로더의 로드가 완료되면 실행되는 함수 
		 * completeCounter의 수로 로드가 완료된 비트맵의 숫자를 측정하고 모두 로드가 됬다면 completeFunc을 호출
		 */		
		private function checkLoadingComplete():void
		{
			completeCounter++;
			progressFunc(completeCounter);
			if(completeCounter >= 5)
			{
				trace("load completed");
				completeFunc();
			}
		}
	}
}