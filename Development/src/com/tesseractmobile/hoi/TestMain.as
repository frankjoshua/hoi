package com.tesseractmobile.hoi 
{
	import assets.img;
	import assets.map;
	import assets.music;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author us
	 */
	public class TestMain extends Sprite
	{
		
		
		public function TestMain() 
		{
			var loader : TMXLoader = new TMXLoader;
			for (var src : String in img.sourceMapping)
				loader.setPathSource(src, img.sourceMapping[src] as Class);
			
			var tmap : TMXMap = loader.fromXMLAsset(map.testMap);
			trace(tmap);
		}
		
		
		
	}

}