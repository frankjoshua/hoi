package com.tesseractmobile.hoi 
{
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Joshua Frank
	 */
	public class BaseEntity implements Entity
	{
		private var _sprite : Sprite;
		private var _xDest : int;
		private var _yDest : int;
		private var _xVel : Number = 0;
		private var _yVel : Number = 0;
		private var _tile : Tile;
		private var _rect : Rectangle;
		
		public function BaseEntity(rect : Rectangle) 
		{
			_rect = rect;
			//Create Sprite
			_sprite = new Sprite();
			var g : Graphics = _sprite.graphics;
			g.beginFill(0xFF0000, 1.0);
			g.drawRect(rect.left, rect.top, rect.width, rect.height);
			g.endFill();
		}
		
		public function getSprite() : Sprite {
			return _sprite;
		}
		
		public function update(elapsedTime : int) : void {
			
			//Calculate change in position
			var xDelta : Number = _xVel * elapsedTime;
			var yDelta : Number = _yVel * elapsedTime;
			//Move Rect
			_rect.offset(xDelta, yDelta);
			//Check if motion should be stopped
			var topDiff : Number = _rect.top - _yDest;
			if (Math.abs(topDiff) < Math.abs(yDelta)) {
				_rect.bottom = _yDest + _rect.height;
				_rect.top = _yDest;
				_yVel = 0;
			}
			var leftDiff : Number = _rect.left - _xDest;
			if (Math.abs(leftDiff) < Math.abs(xDelta)) {
				_rect.right = _xDest + _rect.width;
				_rect.left = _xDest;
				_xVel = 0;
			}
			//Update Sprite
			_sprite.y = _rect.top;
			_sprite.x = _rect.left;
			_sprite.width = _rect.width;
			_sprite.height = _rect.height;
		}
		
		
		public function setTile(tile : Tile) : void {
			//Set the tile
			_tile = tile;
			//Move Entity to new location
			_xDest = tile.getRect().left;
			_yDest = tile.getRect().top;
			//Set speed
			var xDelta : Number = _xDest - _rect.left;
			var yDelta : Number = _yDest - _rect.top;
			if (xDelta > 0) {
				_xVel = getSpeed();
			} else if (xDelta < 0) {
				_xVel = - getSpeed();
			}
			if (yDelta > 0) {
				_yVel = getSpeed();
			} else if (yDelta < 0) {
				_yVel = - getSpeed();
			}
		}
		
		public function getTile() : Tile {
			return _tile;
		}
		
		
		private function getSpeed():Number 
		{
			return 0.2;
		}

		
		public function getRect() : Rectangle {
			return _rect;
		}
		
		public function contains(rect : Rectangle) : Boolean {
			return _rect.contains(rect.left + rect.width / 2, rect.top + rect.height / 2);
		}
	}

}