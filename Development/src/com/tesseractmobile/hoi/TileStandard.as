package com.tesseractmobile.hoi 
{
	import flash.display.Sprite;
	import flash.display.Graphics;
	/**
	 * ...
	 * @author Joshua Frank
	 */
	public class TileStandard implements Tile
	{
		private var _color : int;
		private var _sprite : Sprite;
		private var _borders : Borders;
		private var _xPos : int;
		private var _yPos : int;
		private var _size : int;
		public function TileStandard(color : int, xPos : int, yPos : int, size : int, borders : Borders) 
		{
			_xPos = xPos;
			_yPos = yPos;
			_size = size;
			this._color = color;
			this._borders = borders;
			_sprite = new Sprite();
			var g : Graphics = _sprite.graphics;
			g.beginFill(_color, 1.0);
			g.drawRect(xPos, yPos, size, size);
			g.endFill();
		}
		
		public function getColor() : int {
			return _color;
		}
		
		public function getSprite() : Sprite {
			return _sprite;
		}
		
		public function update(elapsedTime : int) : void{
			
		}
		
		public function getEdge(edge : int) : Boolean {
			return _borders.getEdge(edge);
		}
		
		public function contains(entity : Drawable) : Boolean {
			
			var entCenterY = entity.getY() + entity.getSize() / 2;
			var entCenterX = entity.getX() + entity.getSize() / 2;
			var xOK = entCenterX > getX() && entCenterX < getX() + _size;
			var yOk = entCenterY < getY() + _size;
			
			if (xOK && entCenterY > getY() && yOk) {
				return true;
			}
			return false;
		}
		
		public function getX() : int {
			return _xPos;
		}
		
		public function getY() : int {
			return _yPos;
		}
		
		public function getSize() : int {
			return _size;
		}
	}

}