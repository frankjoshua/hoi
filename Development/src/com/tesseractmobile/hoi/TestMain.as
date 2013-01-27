package com.tesseractmobile.hoi 
{
	import assets.img;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author us
	 */
	public class TestMain extends Sprite
	{
		
		public function TestMain() 
		{
			var bmp : Bitmap = new img.testTiles();
			var bmpData : BitmapData = bmp.bitmapData;
			bmpData.copyPixels(
			
			
			
			var bmp2 : Bitmap = new Bitmap(bmpData);
			addChild(bmp2);
		}
		
	}

}