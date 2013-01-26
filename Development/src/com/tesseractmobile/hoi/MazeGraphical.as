package com.tesseractmobile.hoi 
{
	import flash.display.Bitmap;
	import flash.display.IBitmapDrawable;
	/**
	 * A maze that slices up a given image into tiles that will be used by the graphical tiles within it.
	 */
	public class MazeGraphical extends Maze
	{
		private var _rowsN : uint;
		private var _colsN : uint;
		private var _tileSize : uint;
		private var _tilesetBitmaps : Vector.<Bitmap>;
		private var _tileBitmaps : Vector.<Bitmap> = new Vector.<Bitmap>;
		
		/**
		 * 
		 * Create a new graphical maze.
		 * 
		 * @param	rows Height of the maze in tiles.
		 * @param	cols Width of the maze in tiles.
		 * @param	tileSize Width and height of tiles within the maze measured in pixels.
		 * @param	tileset A bitmap that will contain the complete collection of all graphical data
		 */
		public function MazeGraphical(rows : int, cols : int, tileSize : int, tilesets : Vector.<Bitmap>) 
		{
			super(rows, cols, tileSize);
			_tilesetBitmaps = tilesets;
			
		}
		
		/**
		 * Number of rows of tiles in the map.
		 */
		public function get rowsN() : uint {
			return _rowsN;
		}
		
		/**
		 * Number of columns of tiles in the map.
		 */
		public function get colsN() : uint {
			return _colsN;
		}
		
		/**
		 * Width and height of tiles in pixels.
		 */
		public function get tileSize() : uint {
			return _tileSize;
		}
		
		/**
		 * Get a tileset bitmap by the given index.
		 */
		public function getTilesetBitmap(i : uint) : Bitmap {
			return _tilesetBitmaps[i];
		}
		
		/**
		 * Get a tile bitmap by the given index.
		 * <p>
		 * This is used by new tiles to acquire their bitmap based on their gid.
		 * </p>
		 */
		public function getTileBitmap(i : uint) : Bitmap {
			return _tileBitmaps[i];
		}
	}

}