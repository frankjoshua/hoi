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
		function addEntity(entity : Entity) : void;
		function removeEntity(entity : Entity) : void;
		function addEventListener(listener : Function) : void;
		function removeEventListener(listener : Function) : void;
	}
	
}