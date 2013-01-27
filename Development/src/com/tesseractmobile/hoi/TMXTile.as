package com.tesseractmobile.hoi 
{
	import flash.display.BitmapData;
	/**
	 * Represents one of the tiles within a tile set.
	 * <p>
	 * Again, these should not be created directly. This is the job of the TMXLoader.
	 * </p>
	 * <p>
	 * A tile contains the bitmap data from the appropriate portion of the tileset's image.
	 * </p>
	 * <p>
	 * A tile has a link back to its parent tileset via the <code>tileset</code> property.
	 * </p>
	 * @author Brad Harms
	 */
	public class TMXTile 
	{
		/**
		 * Name-value pairs assigned to the tile from the .tmx file.
		 */
		public var properties : Object;
		
		/**
		 * The ID number of this tile within the tile set.
		 */
		public var id : uint;
		
		/**
		 * The "global identifier," which is used to identify the tile across all tilesets and layers.
		 * This number will always be at least 1, and may be larger than the number of tiles within the tile set.
		 */
		public var gid : uint;
		
		/**
		 * A link back to the containing tileset.
		 */
		public var tileset : TMXTileset;
		
		/**
		 * Bitmap data copied from the parent tileset's.
		 */
		public var bitmapData : BitmapData;
		
		/**
		 * Constructor. You don't need to use this directly.
		 */
		public function TMXTile(tileset_:TMXTileset) 
		{
			tileset = tileset_;
			tileset.tiles.push(this);
			properties = { };
		}
		
	}

}