package com.tesseractmobile.hoi 
{
	import flash.display.Sprite;
	import flash.display.Graphics;
	/**
	 * ...
	 * @author Joshua Frank
	 */
	public class BaseEntity implements Entity
	{
		private var _sprite : Sprite;
		private var _yPos : int;
		private var _xPos : int;
		private var _size : int;
		private var _xDest : int;
		private var _yDest : int;
		private var _xVel : Number;
		private var _yVel : Number;
		private var _tile : Tile;
		
		public function BaseEntity(xPos : int, yPos : int, size : int) 
		{
			_sprite = new Sprite();
			_yPos = yPos;
			_xPos = xPos;
			_size = size;
			var g : Graphics = _sprite.graphics;
			g.beginFill(0xFF0000, 1.0);
			g.drawRect(xPos, yPos, size, size);
			g.endFill();
		}
		
		public function getSprite() : Sprite {
			return _sprite;
		}
		
		public function update(elapsedTime : int) : void{
			var xDelta : int = _xVel * elapsedTime;
			var yDelta : int = _yVel * elapsedTime;
			_yPos += yDelta;
			_xPos += xDelta;
			if (Math.abs(_yPos - _yDest) < yDelta) {
				_yPos = _yDest;
				_yVel = 0;
			}
			if (Math.abs(_xPos - _xDest) < xDelta) {
				_xPos = _xDest;
				_xVel = 0;
			}
			//Update Sprite
			_sprite.y = _yPos;
			_sprite.x = _xPos;
		}
		
		public function down() : Boolean {
			if (_tile.getEdge(Borders.BOTTOM) == false) {
				_yDest = _yPos + _size;
				_yVel = getSpeed();
				return true;
			}
			
			return false;
		}
		
		public function up() : Boolean {
			if (_tile.getEdge(Borders.TOP) == false) {
				_yDest = _yPos - _size;
				_yVel = - getSpeed();
				return true;
			}
			return false;
		}
		
		public function left() : Boolean {
			if(_tile.getEdge(Borders.LEFT) == false){
				_xDest = _xPos - _size;
				_xVel = - getSpeed();
				return true;
			}
			return false;
		}
		
		public function right() : Boolean {
			if (_tile.getEdge(Borders.RIGHT) == false) {
				_xDest = _xPos + _size;
				_xVel = getSpeed();
				return true;
			}
			
			return false;
		}
		
		public function setTile(tile : Tile) : void {
			_tile = tile;
		}
		
		public function contains(entity : Drawable) : Boolean {
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
		
		private function getSpeed():Number 
		{
			return 0.2;
		}
	}

}