package com.tesseractmobile.hoi 
{
	import flash.display.BitmapData;
	
	/**
	 * Represents one of the tilesets within the .tmx file.
	 * @author Brad Harms
	 */
	public class TMXTileset 
	{
		/**
		 * Name of the tileset. Use as you will.
		 */
		public var name : String;
		
		/**
		 * The first (lowest) "global tile identifier" of any tile in the tileset.
		 */
		public var firstgid : uint;
		
		/**
		 * The source file path of the bitmap data.
		 */
		public var source : String;
		
		/**
		 * The image that contains all the tile bitmap data that is shared by all tiles in the tileset.
		 */
		public var bitmapData : BitmapData;
		
		/**
		 * A link back to the containing map.
		 */
		public var map : TMXMap;
		
		/**
		 * A collection of all tiles within the tileset.
		 */
		public var tiles : Vector.<TMXTile>;
		
		/**
		 * Width of tiles within the tileset in pixels. This may differ from the tile width of the map.
		 */
		public var tileWidth : uint;
		
		/**
		 * Height of tiles within the tileset in pixels. This may differ from the tile height of the map.
		 */
		public var tileHeight : uint;
		
		/**
		 * Constructor.
		 */
		public function TMXTileset(map_:TMXMap) 
		{
			map = map_;
			map.tilesets.push(this);
			tiles = new Vector.<TMXTile>;
		}
		
		/**
		 * Returns the TMXTile with the given "global tile identifier," or "GID," which is used to
		 * represent the tile within tile layers. If 0 is given or if no tile can be found with the
		 * given id within this tileset, null is returned.
		 * @param	gid
		 * @return
		 */
		public function getTileByGid(gid:uint) : TMXTile {
			if ((gid < firstgid) || (gid - firstgid >= tiles.length))
				return null;
			else 
				return tiles[gid - firstgid];
		}
	}

}