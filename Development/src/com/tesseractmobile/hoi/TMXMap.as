package com.tesseractmobile.hoi 
{
	/**
	 * ...
	 * @author us
	 */
	public class TMXMap 
	{
		public var width : uint;
		public var height : uint;
		public var tileWidth : uint;
		public var tileHeight : uint;
		public var layers : Vector.<TMXLayer>;
		public var objectgroups : Vector.<TMXObjectGroup>;
		public var tilesets : Vector.<TMXTileset>;
		
		public function TMXMap() 
		{
			
		}
		
	}

}