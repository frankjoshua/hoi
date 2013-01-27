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
	public class SentryGuy extends BaseEntity 
	{
		private var _timer : int = 0;
		private var _flipFlop : Boolean = true;
		//Blast Function
		private var _blast : Function;
		private var _unBlast : Function;
		private var _blastTiles : Vector.<Tile> = new Vector.<Tile>;
		
		public function SentryGuy(rect : Rectangle) 
		{
			super(rect);
			//Create Sprite
			_sprite = new Sprite();
			_sprite.x = rect.left;
			_sprite.y = rect.top;
			var g : Graphics = _sprite.graphics;
			g.beginFill(0x00FF00, 1.0);
			g.drawRect(0, 0, rect.width, rect.height);
			g.endFill();
		}
		
		override public function update(elapsedTime : int) : void {
			super.update(elapsedTime);
			_timer += elapsedTime;
			//Move when enough time has elapsed
			if (_timer > 1000) {
				_timer = 0;
				if (_blast != null && _unBlast != null) {
					//Check for good move
					var moveOk : Boolean = false;
					if(_flipFlop){
						_blast(_blastTiles);
					} else {
						_unBlast(_blastTiles);
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
		
		public function blastTile(tile : Tile) : void {
			_blastTiles.push(tile);
		}
		
		public function getBlastTiles() : Vector.<Tile> {
			return _blastTiles;
		}
		
		public function setBlastFunction(blast : Function) : void {
			_blast = blast;
		}
		
		public function setUnBlastFunction(unBlast : Function) : void {
			_unBlast = unBlast;
		}
	}

}