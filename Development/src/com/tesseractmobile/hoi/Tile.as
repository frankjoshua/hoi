package com.tesseractmobile.hoi 
{
	
	/**
	 * ...
	 * @author Joshua Frank
	 */
	public interface Tile extends Drawable
	{
		function getColor() : int;
		function getEdge(edge : int) : Boolean;
	}
	
}