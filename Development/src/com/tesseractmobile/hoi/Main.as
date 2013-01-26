package com.tesseractmobile.hoi
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Rectangle;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Joshua Frank
	 */
	public class Main extends Sprite 
	{
		private var maze : Maze;
		private var player : Player;
		static public const SIZE : int = 32;
		private var _keyEvent : KeyboardEvent;
		private var _scratchRect : Rectangle = new Rectangle(0,0,0,0);
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
			
			var size : int = SIZE;
			maze = new Maze(16, 12, size);
			
			for each (var row : Vector.<Tile> in maze.getGrid()) {
				for each (var tile : Tile in row) {
					addChild(tile.getSprite());
				}
			}
			player = new Player(new Rectangle(0,0,SIZE,SIZE));
			addChild(player.getSprite());
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyDown);
			stage.addEventListener(Event.ENTER_FRAME, handleEnterFrame);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
		}
		
		private function handleKeyDown(e:KeyboardEvent) : void {
			_keyEvent = e;
		}
		
		private function handleEnterFrame(e:Event) : void {
			update(33);
		}
		
		private function update(elapsedTime : int) : void {
			if (_keyEvent != null) 
			{
				//Easier if maze checks for available moves
				//Copy Player location to _scratchRect
				_scratchRect.left = player.getRect().left;
				_scratchRect.right = player.getRect().right;
				_scratchRect.top = player.getRect().top;
				_scratchRect.bottom = player.getRect().bottom;
				//Move scratch rect to where player will be
				switch(_keyEvent.keyCode) {
					case Keyboard.UP:
						_scratchRect.offset(0, -SIZE);
						break;
					case Keyboard.DOWN:
						_scratchRect.offset(0, SIZE);
						break;
					case Keyboard.LEFT:
						_scratchRect.offset(-SIZE, 0);
						break;
					case Keyboard.RIGHT:
						_scratchRect.offset(SIZE, 0);
						break;	
				}
				
				_keyEvent = null;
				//Look for tile that the player would end up int
				for each (var row : Vector.<Tile> in maze.getGrid()) {
				for each (var tile : Tile in row) {
					if (tile.contains(_scratchRect)) {
						//Add entity to tile to trigger events
						//tile.addEntity(player);
						//Add tile to player to track location
						player.setTile(tile);
					}
				}
			}
			}

			
			player.update(elapsedTime);
		}
		

	}
	
	
}