package com.tesseractmobile.hoi 
{
	import assets.img;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author us
	 */
	public class TestMain extends Sprite
	{
		
		public function TestMain() 
		{
			for (var propname : String in img.testTiles)
				trace(propname);
		}
		
	}

}