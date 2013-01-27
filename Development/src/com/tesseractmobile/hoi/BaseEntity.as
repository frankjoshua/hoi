package com.tesseractmobile.hoi 
{
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.errors.IllegalOperationError;
	import flash.geom.Rectangle;
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author Joshua Frank
	 */
	public class BaseEntity implements Entity
	{
		//Entity Types
		public static const PLAYER_TYPE = 1;
		public static const ENEMY_TYPE = 2;
		//Member vars
		protected var _sprite : Sprite;
		private var _xDest : int;
		private var _yDest : int;
		private var _xVel : Number = 0;
		private var _yVel : Number = 0;
		private var _tile : Tile;
		private var _rect : Rectangle;
		private var _speed : Number = 0.05;
		private var _bitmap : Bitmap;
		//Function to move entity
		protected var _moveFunction : Function;
		
		public function BaseEntity(rect : Rectangle) 
		{
			//Set _rect
			_rect = rect;
			//Set inital destination as current location
			_xDest = rect.left;
			_yDest = rect.top;
		}
		
		public function getSprite() : Sprite {
			return _sprite;
		}
		
		public function update(elapsedTime : int) : void {
			if(_xVel != 0 || _yVel != 0){
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
				//Set direction to stopped if done moveing
				if (_xVel == 0 && _yVel == 0) {
					setDirection(Main.STOP);
				}
				//Update Sprite
				if(_sprite != null){
					_sprite.y = _rect.top;
					_sprite.x = _rect.left;
				}
				//Update Bitmap
				if(_bitmap != null){
					_bitmap.y = _rect.top;
					_bitmap.x = _rect.left;
				}
			}
		}
		
		
		public function setTile(tile : Tile) : void {
			//Let last Tile know we are leaving
			if (_tile != null) {
				_tile.removeEntity(this);
			}
			//Let new tile know we are here
			tile.addEntity(this);
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
			return _speed;
		}

		public function setSpeed(speed : Number) : void {
			_speed = speed;
		}
		
		public function getRect() : Rectangle {
			return _rect;
		}
		
		public function contains(rect : Rectangle) : Boolean {
			return _rect.contains(rect.left + rect.width / 2, rect.top + rect.height / 2);
		}
		
		//This should be abstract
		public function getType() : int {
			throw new IllegalOperationError();
		}
		
		public function setMoveFunction(func : Function) : void {
			_moveFunction = func;
		}
		
		public function getBitmap() : Bitmap {
			return _bitmap;
		}
		
		public function setBitmap(bitmap : Bitmap) : void {
			_bitmap = bitmap;
		}
		
		public function setDirection(direction : int) : void {
			//Should be overriden
		}
	}

}