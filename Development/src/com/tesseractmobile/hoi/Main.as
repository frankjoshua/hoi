package com.tesseractmobile.hoi
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
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
			player = new Player(size / 4, size / 4, size / 2);
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
				switch(_keyEvent.keyCode) {
					case Keyboard.UP:
						player.up();
						break;
					case Keyboard.DOWN:
						player.down();
						break;
					case Keyboard.LEFT:
						player.left();
						break;
					case Keyboard.RIGHT:
						player.right();
						break;	
				}
				_keyEvent = null;
			}
			for each (var row : Vector.<Tile> in maze.getGrid()) {
				for each (var tile : Tile in row) {
					if (tile.contains(player)) {
						player.setTile(tile);
					}
				}
			}
			player.update(elapsedTime);
		}
	}
	
}