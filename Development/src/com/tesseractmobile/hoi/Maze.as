package com.tesseractmobile.hoi 
{
	import assets.img;
	import assets.map;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Joshua Frank
	 */
	public class Maze 
	{
		private var _grid:Vector.<Vector.<Tile>>;
		
		public function Maze(rows : int, col : int, tileSize : int ) 
		{
			//Read in XML
			var loader : TMXLoader = new TMXLoader();
			for (var src : String in img.sourceMapping){
				loader.setPathSource(src, img.sourceMapping[src] as Class);
			}
			var tmap : TMXMap = loader.fromXMLAsset(map.SARlevel1);
			
			var tmxLayer : TMXLayer = tmap.layers[0];
			
			
			_grid = new Vector.<Vector.<Tile>>;
			//Add tiles to grid
			for (var c : int = 0; c < col; c++) {
				var row : Vector.<Tile> = new Vector.<Tile>;
				for (var r : int = 0; r < rows; r++) {
					//var borders : Borders = new Borders(r == 0, c == 0, r == rows - 1, c == col - 1);
					row.push(new TileStandard(0, new Rectangle(r * tileSize, c * tileSize, tileSize, tileSize), tmxLayer.getTileAt(r, c)));
				}
				_grid.push(row);
			}
		}
		
		public function getGrid() : Vector.<Vector.<Tile>> {
			return _grid;
		}
	}

}