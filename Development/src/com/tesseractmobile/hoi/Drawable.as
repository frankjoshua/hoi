package com.tesseractmobile.hoi 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Joshua Frank
	 */
	public interface Drawable 
	{
		/**
		 * @return a drawable sprite
		 */
		function getSprite() : Sprite;
		/**
		 * Move object based on elapsed time
		 * @param	elapsedTime
		 */
		function update(elapsedTime : int) : void;
		/**
		 * Check if center of rect is contained in Drawble object
		 * @param	rect
		 * @return
		 */
		function contains(rect : Rectangle) : Boolean;
		function getRect() : Rectangle;
		
		function getBitmap() : Bitmap;
	}
	
}