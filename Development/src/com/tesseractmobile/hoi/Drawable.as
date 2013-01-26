package com.tesseractmobile.hoi 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Joshua Frank
	 */
	public interface Drawable 
	{
		function getSprite() : Sprite;
		/**
		 * 
		 * @param	elapsedTime
		 */
		function update(elapsedTime : int) : void;
		function contains(drawable : Drawable) : Boolean;
		function getX() : int;
		function getY() : int;
		function getSize() : int;
	}
	
}