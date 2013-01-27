package com.tesseractmobile.hoi 
{
	import flash.geom.Rectangle;
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author Joshua Frank
	 */
	public class PatrolGuy extends BaseEntity 
	{
		private var _timer : int = 0;
		private var _flipFlop : Boolean = true;
		public function PatrolGuy(rect:Rectangle) 
		{
			super(rect);
			//Create Sprite
			_sprite = new Sprite();
			_sprite.x = rect.left;
			_sprite.y = rect.top;
			var g : Graphics = _sprite.graphics;
			g.beginFill(0x0000FF, 1.0);
			g.drawRect(0, 0, rect.width, rect.height);
			g.endFill();
		}
		
		override public function update(elapsedTime : int) : void {
			super.update(elapsedTime);
			_timer += elapsedTime;
			//Move when enough time has elapsed
			if (_timer > 500) {
				_timer = 0;
				if (_moveFunction != null) {
					//Check for good move
					var moveOk : Boolean = false;
					if(_flipFlop){
						moveOk = _moveFunction(this, Keyboard.UP);
					} else {
						moveOk = _moveFunction(this, Keyboard.DOWN);
					}
					//Change direction when hitting a wall
					if (moveOk == false) {
						_flipFlop = !_flipFlop;
					}
				}
			}
			
		}
		
		override public function getType() : int {
			return BaseEntity.ENEMY_TYPE;
		}
	}

}