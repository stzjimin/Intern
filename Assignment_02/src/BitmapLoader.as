package
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.system.System;
	
	import starling.textures.Texture;
	
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
		
		private var completeFunc:Function;
		private var completeCounter:int;
		
		public function BitmapLoader(func:Function)
		{
			var titleBarURL:URLRequest = new URLRequest("https://raw.githubusercontent.com/stzyoungsun/youngsun/master/Assignment02/src/GUI_resources/titleBar.png");
			//	var titleBarURL:URLRequest = new URLRequest("http://images.kbench.com:8080/kbench/article/2014_03/k131448p1n1.jpg");
			var closeButtonURL:URLRequest = new URLRequest("https://raw.githubusercontent.com/stzyoungsun/youngsun/master/Assignment02/src/GUI_resources/close.png");
			var miniButtonURL:URLRequest = new URLRequest("https://raw.githubusercontent.com/stzyoungsun/youngsun/master/Assignment02/src/GUI_resources/minimize.png");
			var revertButtonURL:URLRequest = new URLRequest("https://raw.githubusercontent.com/stzyoungsun/youngsun/master/Assignment02/src/GUI_resources/revert.png");
			var contentURL:URLRequest = new URLRequest("https://raw.githubusercontent.com/stzyoungsun/youngsun/master/Assignment02/src/GUI_resources/contents.png");
			
			completeCounter = 0;
			completeFunc = func;
			
			/*
			var titleBarURL:URLRequest = new URLRequest("GUI_resources/titleBar.png");
			var closeButtonURL:URLRequest = new URLRequest("GUI_resources/close.png");
			var miniButtonURL:URLRequest = new URLRequest("GUI_resources/minimize.png");
			var revertButtonURL:URLRequest = new URLRequest("GUI_resources/revert.png");
			var contentURL:URLRequest = new URLRequest("GUI_resources/contents.png");
			*/
			
			_titleBarLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, titleBarCompleate);
			_titleBarLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, titleBarProgress);
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
		
		private function titleBarProgress(event:ProgressEvent):void
		{
			var prog:int = Math.ceil(event.bytesLoaded / event.bytesTotal * 100);
			trace(prog + "%");
		//	_titleBarBitmap = event.currentTarget.loader.content as Bitmap;
		//	titleBarLoader.close();
		//	_titleBarTexture = Texture.fromBitmap(_titleBarBitmap);
		//	trace("aa");
		}

		private function titleBarCompleate(event:Event):void
		{
			trace("load ing = " + System.totalMemory / 1024);
			_titleBarBitmap = event.currentTarget.loader.content as Bitmap;
			_titleBarLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, titleBarCompleate);
			_titleBarLoader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, titleBarProgress);
		//	closeButtonLoader.load(closeButtonURL);
			trace("aa");
			checkLoadingComplete();
		}
		
		private function closeButtonCompleate(event:Event):void
		{
			_closeButtonBitmap = event.currentTarget.loader.content as Bitmap;
			_closeButtonLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, titleBarCompleate);
		//	miniButtonLoader.load(miniButtonURL);
			trace("bb");
			checkLoadingComplete();
		}
		
		private function miniButtonCompleate(event:Event):void
		{
			_miniButtonBitmap = event.currentTarget.loader.content as Bitmap;
			_miniButtonLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, titleBarCompleate);
		//	revertButtonLoader.load(revertButtonURL);
			trace("cc");
			checkLoadingComplete();
		}
		
		private function revertButtonCompleate(event:Event):void
		{
			_revertButtonBitmap = event.currentTarget.loader.content as Bitmap;
			_revertButtonLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, titleBarCompleate);
		//	contentLoader.load(contentURL);
			trace("dd");
			checkLoadingComplete();
		}
		
		private function contentCompleate(event:Event):void
		{
			_contentBitmap = event.currentTarget.loader.content as Bitmap;
			_contentLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, titleBarCompleate);
			trace("ee");
			checkLoadingComplete();
		}
		
		private function checkLoadingComplete():void
		{
			completeCounter++;
			
			if(completeCounter >= 5)
			{
				trace("completed");
				//call a custom function when loading completes!
				completeFunc();
			}
		}
	}
}