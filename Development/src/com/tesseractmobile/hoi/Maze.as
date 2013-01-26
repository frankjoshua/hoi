package com.tesseractmobile.hoi 
{
	/**
	 * ...
	 * @author Joshua Frank
	 */
	public class Maze 
	{
		private var grid:Vector.<Vector.<Tile>>;
		
		public function Maze(rows : int, col : int, tileSize : int ) 
		{
			grid = new Vector.<Vector.<Tile>>;
			
			for (var c : int = 0; c < col; c++) {
				var row : Vector.<Tile> = new Vector.<Tile>;
				for (var r : int = 0; r < rows; r++) {
					var borders : Borders = new Borders(r == 0, c == 0, r == rows - 1, c == col - 1);
					row.push(null);
				}
				grid.push(row);
			}
		}
		
		public function getGrid() : Vector.<Vector.<Tile>> {
			return grid;
		}
	}

}