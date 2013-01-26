package com.tesseractmobile.hoi 
{
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Joshua Frank
	 */
	public interface Tile extends Drawable
	{
		function getEdge(edge : int) : Boolean;
	}
	
}