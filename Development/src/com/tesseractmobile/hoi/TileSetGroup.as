package com.tesseractmobile.hoi 
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	/**
	 * Represents the complete collection of all tilesets in the tmx.
	 * @author Brad Harms
	 */
	public class TileSetGroup 
	{
		
		private var _tilesets : Dictionary = new Dictionary();
		
		public function TileSetGroup() 
		{
			
		}
		
		public function addTileset(tileset : TileSet) : void {
			_tileset[tileset.getGid()] = tileset;
		}
		
		/**
		 * Return the TileSet corresponding to the given TID.
		 * @param	tid
		 * @return
		 */
		public function getTilesetForTid(tid : uint) : TileSet {
			var keys : Vector.<uint> = new Vector.<uint>;
			
			// Get the GIDs of all tilesets in sorted order.
			for (var k : Object in _tilesets) {
				keys.push(uint(k));
			}
			keys.sort();
			
			for (var gid : uint in keys) {
				if (tid >= gid)
					return _tilesets[gid];
			}
		}
		
		public function getTileBitmap(tid : uint) : Bitmap {
			
		}
		
	}

}