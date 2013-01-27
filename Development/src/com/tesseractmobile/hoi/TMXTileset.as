package com.tesseractmobile.hoi 
{
	import flash.display.BitmapData;
	/**
	 * ...
	 * @author us
	 */
	public class TMXTileset 
	{
		public var name : String;
		public var firstgid : uint;
		public var source : String;
		public var bitmapData : BitmapData;
		public var map : TMXMap;
		public var tiles : Vector.<TMXTile>;
		public var tileWidth : uint;
		public var tileHeight : uint;
		
		public function TMXTileset() 
		{
			
		}
		
	}

}