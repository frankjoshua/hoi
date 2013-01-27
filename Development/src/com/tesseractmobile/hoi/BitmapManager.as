package com.tesseractmobile.hoi 
{
	import assets.BadGuyImages;
	import assets.RobotImages;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import assets.img;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Joshua Frank
	 */
	public class BitmapManager 
	{
		private var _bitmaps : Array;
		private var _tileBitmaps : Array;
		private var _badGuyImages : Array;
		//Singleton Bitmapmanger
		private static var instance : BitmapManager;
		//Image positions
		public static const ROBOT_STAND : int = 0;
		public static const ROBOT_ROCK_1 : int = 1;
		public static const ROBOT_ROCK_2 : int = 2;
		public static const ROBOT_ROCK_3 : int = 3;
		
		public function BitmapManager() 
		{
			//Initialize bitmap array
			_bitmaps = new Array(100);
			//Initilize tile array
			_tileBitmaps = new Array(100);
			_badGuyImages = new Array(100);
			//Chop up images
			chopImages(_tileBitmaps, new img.testTiles);
			chopImages(_bitmaps, new RobotImages.images);
			chopImages(_badGuyImages, new BadGuyImages.images);		
		}
		
		public static function getInstance() : BitmapManager {
			if (instance == null) {
				instance = new BitmapManager();
			}
			return instance;
		}
		
		public function getBitmap(pos : int) : Bitmap {
			return _bitmaps[pos];
		}
		
		public function getTileImage(pos : int) : Bitmap {
			return _tileBitmaps[pos];
		}
		
		public function getBadGuyImages(pos : int) : Bitmap {
			return _badGuyImages[pos];
		}

		/**
		 * Chops up image and adds to array
		 * @param	tileBitmaps
		 * @param	bitmapArray
		 */
		private function chopImages(bitmapArray : Array, bitmap : Bitmap) :void  
		{
			//Get bitmap data
			var bmData : BitmapData = bitmap.bitmapData;
			//Loop through and cut up tile bitmaps
			for (var col : int = 0; col < bitmap.height / Main.TILE_SIZE; col++) {
				var totalRows : int = bitmap.width / Main.TILE_SIZE
				for (var row : int = 0; row < totalRows; row ++) {
					//New bitmap to hold tile image
					var bm : Bitmap = new Bitmap();
					bm.bitmapData = new BitmapData(Main.TILE_SIZE, Main.TILE_SIZE);
					//Copy section of main tile image
					bm.bitmapData.copyPixels(bmData, new Rectangle(Main.TILE_SIZE * row, Main.TILE_SIZE * col, Main.TILE_SIZE, Main.TILE_SIZE), new Point(0, 0));
					bm.width = Main.SIZE;
					bm.height = Main.SIZE;
					//Add to array
					bitmapArray[row + (col * totalRows)] = bm;
				}
			}
		}
		
	}

}