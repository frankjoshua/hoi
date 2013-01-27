package com.tesseractmobile.hoi 
{
	
	/**
	 * ...
	 * @author Joshua Frank
	 */
	public interface Entity extends Drawable
	{
		function getType() : int;
		function getTile() : Tile;
		function setTile(tile : Tile) : void;
		function setMoveFunction(func : Function) : void;
		function setSpeed(speed : Number) : void;
		function setDirection(direction : int) : void;
	}
	
}