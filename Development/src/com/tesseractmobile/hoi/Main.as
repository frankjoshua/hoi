package com.tesseractmobile.hoi
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Joshua Frank
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
			var rect : Sprite = new Sprite();
			var g : Graphics = rect.graphics;
			g.beginFill(0x550055, 1.0);
			g.drawRect(100, 100, 100, 100);
			g.endFill();
			
			addChild(rect);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
		}
		
	}
	
}