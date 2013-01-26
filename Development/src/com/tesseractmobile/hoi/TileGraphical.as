package com.tesseractmobile.hoi 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	/**
	 * A tile type that uses a rectangular area of a given bitmap to display itself.
	 * @author Brad Harms
	 */
	public class TileGraphical implements Tile 
	{
		private var _xPos : int = 0;
		private var _yPos : int = 0;
		private var _size : int = 0;
		
		public function TileGraphical(xPos : int, yPos : int, size : int, borders : Borders, bitmap : Bitmap, crop : Rectangle)
		{
			_xPos = xPos;
			_yPos = yPos;
			_size = size;
			
		}
		
		/* INTERFACE com.tesseractmobile.hoi.Tile */
		
		/**
		 * 
		 * @return 0. The graphical tile has no color.
		 */
		public function getColor():int 
		{
			return 0;
		}
		
		public function getEdge(edge:int):Boolean 
		{
			
		}
		
		public function getSprite():Sprite 
		{
			
		}
		
		public function update(elapsedTime:int):void 
		{
			
		}
		
		public function contains(drawable:Drawable):Boolean 
		{
			
		}
		
		public function getX():int 
		{
			
		}
		
		public function getY():int 
		{
			
		}
		
		public function getSize():int 
		{
			
		}
		
		public function getBitmap():Bitmap {
			
		}
		
		public function getCrop():Rectangle {
			
		}
		
	}

}