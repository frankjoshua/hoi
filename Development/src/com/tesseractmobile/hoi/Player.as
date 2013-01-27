package com.tesseractmobile.hoi 
{
	import flash.geom.Rectangle;
	import flash.display.Graphics;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Joshua Frank
	 */
	public class Player extends BaseEntity 
	{
		private var _state : int = STANDING;
		//States
		private const STANDING : int = 0;
		private const MOVING_DOWN : int = 1;
		private const MOVING_UP : int = 2;
		private const MOVING_LEFT : int = 3;
		private const MOVING_RIGHT : int = 4;
		//Var
		private var _timer : int = 0;
		
		public function Player(rect : Rectangle) 
		{
			super(rect);
			//Create Sprite
			_sprite = new Sprite();
			_sprite.x = rect.left;
			_sprite.y = rect.top;
			var g : Graphics = _sprite.graphics;
			g.beginFill(0xFF0000, 0.1);
			g.drawRect(0, 0, rect.width, rect.height);
			g.endFill();
			setBitmap(BitmapManager.getInstance().getBitmap(BitmapManager.ROBOT_STAND));
		}
				
		override public function update(elapsedTime : int) : void {
			//Update time for image switching
			_timer += elapsedTime;
			if (_timer > 1000) {
				_timer = 0;
				//Switch bitmaps based on state
				switch(_state) {
					case STANDING:
						//setBitmap(BitmapManager.getInstance().getBitmap(BitmapManager.ROBOT_STAND));
						break;
					case MOVING_UP:
					case MOVING_DOWN:
					case MOVING_RIGHT:
					case MOVING_LEFT:
						
						break;
				}
			}
			//Call super last so it wil update bitmap location
			super.update(elapsedTime);
		}
		
		private function setState(state : int) : void {
			_state = state;
			switch(state) {
				case STANDING:
					//setBitmap(BitmapManager.getInstance().getBitmap(BitmapManager.ROBOT_STAND));
					break;
				case MOVING_DOWN:
					//setBitmap(BitmapManager.getInstance().getBitmap(BitmapManager.ROBOT_STAND));
					break;
				case MOVING_UP:
				case MOVING_LEFT:
				case MOVING_RIGHT:
					//setBitmap(BitmapManager.getInstance().getTileImage(0));
					break;
			}
		}
		
		override public function setDirection(direction : int) : void {
			switch(direction){
				case Main.UP:
					setState(MOVING_UP);
					break;
				case Main.DOWN:
					setState(MOVING_DOWN);
					break;
				case Main.LEFT:
					setState(MOVING_LEFT);
					break;
				case Main.RIGHT:
					setState(MOVING_RIGHT);
					break;
				case Main.STOP:
					setState(STANDING);
					break;
			}
		}
		
		override public function getType() : int {
			return BaseEntity.PLAYER_TYPE;
		}
	}

}