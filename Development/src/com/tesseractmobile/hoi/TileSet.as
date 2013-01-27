package com.tesseractmobile.hoi 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * Represents a tilemap from the TMX.
	 * @author Bradley Harms
	 */
	public class TileSet 
	{
		private var _gid : uint;
		private var _source : String;
		private var _bitmap : Bitmap;
		private var _tileWidth : uint;
		private var _tileHeight : uint;
		private var _bitmapData : BitmapData;
		private var _tileBitmapDatas : Vector.<Bitmap> = new Vector.<Bitmap>;
		
		public function TileSet(gid : uint, tileWidth : uint, tileHeight : uint, source : String, bitmapData : BitmapData) 
		{
			_gid = gid;
			_source = source;
			_tileWidth = tileWidth;
			_tileHeight = tileHeight;
			_bitmapData = bitmapData;
			
			var rows : uint = bitmap.width / tileWidth;
			var cols : uint = bitmap.height / tileHeight;
			
			// Slice the bitmap up into pieces
			for (var j : uint = 0; j < rows; j++) {
				for (var i : uint = 0; i < cols; i++) {
					var bmp : BitmapData = new BitmapData(_tileWidth, tileHeight, true, 0x00000000);
					bmp.copyPixels(
						_bitmap.bitmapData,
						new Rectangle(i * tileWidth, o * tileHeight, tileWidth, tileHeight),
						new Point(0, 0)
					);
					_tileBitmaps.push(bmp);
				}
			}
		}
		
		/**
		 * Get the GID of the tile set.
		 */
		public function getGid() : uint {
			return _gid;
		}
		
		/**
		 * Get the width of a tile in this tileset.
		 */
		public function getTileWidth() : uint {
			return _tileWidth;
		}
		
		/**
		 * Get the height of a tile in this tileset.
		 */
		public function getTileHeight() : uint {
			return _tileHeight;
		}
		
		/**
		 * Get the bitmap data of the tile set.
		 */
		public function getBitmapData() : BitmapData {
			return _bitmapData;
		}
		
		/**
		 * Get the bitmap data for the given TID.
		 */
		public function getTidBitmapData(tid : uint) : BitmapData {
			return _tileBitmapDatas[tid - _gid];
		}
	}

}