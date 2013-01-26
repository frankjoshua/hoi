package com.tesseractmobile.hoi 
{
	/**
	 * A map that uses a 
	 */
	public class MazeGraphical extends Maze
	{
		private var _rowsN : uint;
		private var _colsN : uint;
		private var _tileSize : uint;
		
		public function MazeGraphical() 
		{
			
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
		
	}

}