package com.tesseractmobile.hoi 
{
	/**
	 * Represents a tile layer from the .tmx file.
	 * <p>
	 * It is assumed that the tileWidth and tileHeight from the parent TMXMap will be used to determine grid cell sizes.
	 * </p>
	 * <p>
	 * The layer has a link back to the parent map as the <code>map</code> attribute.
	 * </p>
	 * @author Brad Harms
	 */
	public class TMXLayer
	{
		/**
		 * Name of the tile layer. This does not need to be unique.
		 */
		public var name : String = "";
		
		/**
		 * A collection of name-value pairs
		 */
		public var properties : Object = { };
		
		/**
		 * A link back to the parent map. The .tmx file format allows the size of a layer to differ from the size of the map.
		 */
		public var map : TMXMap;
		
		/**
		 * Width of the layer in tiles.
		 */
		public var width : uint;
		
		/**
		 * Height of the layer in tiles. The .tmx file format allows the size of a layer to differ from the size of the map.
		 */
		public var height : uint;
		
		/**
		 * A 2D vector containing the "global tile IDs" (GIDs) of all cells in the layer.
		 */
		public var gids : Vector.<Vector.<uint>>;
		
		/**
		 * Constructor.
		 */
		public function TMXLayer(map_:TMXMap) 
		{
			map = map_;
			map.layers.push(this);
			properties = { };
			gids = new Vector.<Vector.<uint>>;
		}
		
		/**
		 * Return the TMXTile that corresponds to the given cell location within the layer.
		 * If there is no tile in the given location or if the position is outside the layer then null is returned.
		 */
		public function getTileAt(col:uint, row:uint) : TMXTile {
			if (row < 0 || col < 0 || row >= height || col >= width)
				return null;
			var gid : uint = gids[row][col];
			if (gid == 0)
				return null;
			var tile : TMXTile = map.getTileByGid(gid);
			return tile;
		}
	}

}