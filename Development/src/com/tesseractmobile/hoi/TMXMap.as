package com.tesseractmobile.hoi 
{
	/**
	 * Represents a whole TMX file.
	 * 
	 * <p>This is not created directly. Instead, a .tmx file is loaded using TMXLoader class.</p>
	 * 
	 * @author Brad Harms
	 * @see TMXLoader
	 */
	public class TMXMap 
	{
		/**
		 *	Width of the map in tiles.
		 */
		public var width : uint = 0;
		
		/**
		 * Height of the map in tiles.
		 */
		public var height : uint = 0;
		
		/**
		 * Width of a grid cell. Use this for positioning tiles in all layers, regardless of the size of the layer's tiles.
		 */
		public var tileWidth : uint = 0;
		
		/**
		 * Height of a grid cell. Use this for positioning tiles in all layers, regardless of the layer's tiles.
		 */
		public var tileHeight : uint = 0;
		
		/**
		 * A collection of all layers in the order they appear in the .tmx file.
		 */
		public var layers : Vector.<TMXLayer>;
		
		/**
		 * A collection of all object groups in the order they appear in the .tmx file.
		 */
		public var objectgroups : Vector.<TMXObjectGroup>;
		
		/**
		 * A collection of all tilesets as they appear in the .tmx file.
		 */
		public var tilesets : Vector.<TMXTileset>;
		
		/**
		 * Name-value property pairs that are applied to the whole map.
		 * <p>Example: <code>tmxMap.properties.someName</code></p>
		 * <p>Or: <code>tmxMap.properties["someName"]</code></p>
		 */
		public var properties : Object;
		
		/**
		 * Constructor. There's no need to use this directly.
		 */
		public function TMXMap() 
		{
			tilesets = new Vector.<TMXTileset>;
			layers = new Vector.<TMXLayer>;
			objectgroups = new Vector.<TMXObjectGroup>;
			properties = { };
		}
		
		/**
		 * Returns the TMXTile with the given "global tile identifier," or "GID," which is used to
		 * represent the tile within tile layers. If 0 is given or if no tile can be found with the
		 * given id, null is returned.
		 * @param	gid
		 * @return
		 */
		public function getTileByGid(gid:uint) : TMXTile {
			var tile : TMXTile = null;
			for each (var tileset : TMXTileset in tilesets) {
				tile = tileset.getTileByGid(gid);
				if (tile !== null)
					return tile;
			}
			return null;
		}
		
	}

}