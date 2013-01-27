package com.tesseractmobile.hoi
{
	import assets.music;
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
		//Default grid size
		static public const SIZE : int = 32;
		static public const HEIGHT : int = 9;
		static public const WIDTH : int = 16;
		//Maze
		private var maze : Maze;
		//Game objects
		private var player : Player;
		private var _entityList : Vector.<Entity> = new Vector.<Entity>();
		//Cache for keyboard events
		private var _keyEvent : KeyboardEvent;
		//Scratch rect to avvoid object creation
		private var _scratchRect : Rectangle = new Rectangle(0, 0, 0, 0);
		//Pulse
		private var _pulse : Sprite;
		private var _pulseRadius : int = 1;
		private var _showPulse : Boolean = false;
		private var _pulseDelay : int = 0;
		private const PULSE_DELAY : int = 2000;
		private const PULSE_SPEED : int = 5;
		
		public function Main():void 
		{
			
			/****************
				Music test!
			*****************/
			MusicPlayer.play(music.machine);
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			//Set kill player method
			TileStandard._killPlayer = killPlayer;
			
			//Default sizes
			var size : int = SIZE;
			var width : int = WIDTH;
			var height : int = HEIGHT;
			//Setup maze
			maze = new Maze(width, height, size);
			//Add sprites from tiles
			for each (var row : Vector.<Tile> in maze.getGrid()) {
				for each (var tile : Tile in row) {
					addChild(tile.getBitmap());
					addChild(tile.getSprite());
				}
			}
			//Create game entities
			//Create Player
			player = new Player(new Rectangle(0,0,SIZE,SIZE));
			addChild(player.getSprite());
			_entityList.push(player);
			
			//TESTING TESTING
				var partolGuy : PatrolGuy = new PatrolGuy(new Rectangle((width - 1) * size, (height - 1) * size, SIZE, SIZE));
				//partolGuy.setTile(maze.getGrid()[0][0]);
				maze.getGrid()[0][0].addEventListener(returnEntity);
				addChild(partolGuy.getSprite());
				
				_entityList.push(partolGuy);
				var sentryGuy : SentryGuy = new SentryGuy(new Rectangle((4) * size, (4) * size, SIZE, SIZE));
				addChild(sentryGuy.getSprite());
				sentryGuy.blastTile(maze.getGrid()[4][3]);
				sentryGuy.blastTile(maze.getGrid()[4][2]);
				_entityList.push(sentryGuy);
			//END TESTING TESTING
			
			//Add event Listeners
			stage.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyDown);
			stage.addEventListener(Event.ENTER_FRAME, handleEnterFrame);
			
			//Setup pulse - last so it's on top
			_pulse = new Sprite();
			_pulse.x = width * size / 2;
			_pulse.y = height* size / 2;
			addChild(_pulse);
			
			//**** NEED TO ADD CALLBACKS HERE ****
			partolGuy.setMoveFunction(moveEntity);
			sentryGuy.setMoveFunction(moveEntity);
			sentryGuy.setBlastFunction(blastTiles);
			sentryGuy.setUnBlastFunction(unBlastTiles);
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
			//Testing with a time of 33
			update(33);
		}
		
		private function update(elapsedTime : int) : void {
			if (_keyEvent != null) 
			{
				//Easier if maze checks for available moves
				//Look for tile that the player would end up int
				moveEntity(player, _keyEvent.keyCode);
				//Clear event
				_keyEvent = null;
			}

			//Update Game Entities
			for each (var entity : Entity in _entityList) {
				entity.update(elapsedTime);
			}
			
			//Update the pulse
			if(_showPulse){
				var graphics : Graphics = _pulse.graphics;
				graphics.clear();
				_pulseRadius += PULSE_SPEED;
				if (_pulseRadius > WIDTH * SIZE / 2 ) {
					//Hide pulse
					_pulseRadius = 1;
					_showPulse = false;
				} else {
					//Draw pulse
					graphics.beginFill(0xFFFFFF, 0.2);
					graphics.lineStyle(5, 0xFFFFFF, 0.8);
					graphics.drawCircle(0, 0, _pulseRadius);
					graphics.endFill();
					//Check if player is touched by pulse
					var playerXCenter : int = player.getRect().left + player.getRect().width / 2;
					var playerYCenter : int = player.getRect().top + player.getRect().height / 2;
					var gameXCenter : int = WIDTH * SIZE / 2;
					var gameYCenter : int = HEIGHT * SIZE / 2;
					var a : Number = (playerXCenter - gameXCenter) * (playerXCenter - gameXCenter);
					var b : Number = (playerYCenter - gameYCenter) * (playerYCenter - gameYCenter);
					var distance : Number = Math.sqrt(a + b);
					if (Math.abs(distance - _pulseRadius) < PULSE_SPEED) {
						pulseHitPlayer(distance);
					}
				}
			} else {
				//Wait for delay to draw again
				_pulseDelay += elapsedTime;
				if (_pulseDelay > PULSE_DELAY) {
					_pulseDelay = 0;
					_showPulse = true;
				}
			}
			
		}
		
		/**
		 * 
		 * @param	entity
		 * @param	keyCode
		 * @return false if unable to move in that direction
		 */
		public function moveEntity(entity : Entity, keyCode : int) : Boolean {
			//Copy Entity location to _scratchRect
			_scratchRect.left = entity.getRect().left;
			_scratchRect.right = entity.getRect().right;
			_scratchRect.top = entity.getRect().top;
			_scratchRect.bottom = entity.getRect().bottom;
			//Move scratch rect to where player will be
			switch(keyCode) {
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
				
			for each (var row : Vector.<Tile> in maze.getGrid()) {
				for each (var tile : Tile in row) {
					if (tile.contains(_scratchRect)) {
						//Add tile to player to track location
						entity.setTile(tile);
						//Set up test trigger
						//tile.addEventListener(shrinkPlayer);
						//Move worked
						return true;
					}
				}
			}
			return false;
		}
		
		public function blastTiles(tiles : Vector.<Tile>) : void {
			for each (var tile : Tile in tiles) {
				tile.addEventListener(killPlayer);
				var g : Graphics = tile.getSprite().graphics;
				g.clear();
				g.beginFill(0xFF1111, 0.9);
				g.drawRect(0, 0, tile.getRect().width, tile.getRect().height);
				g.endFill();
			}
		}
		
		public function unBlastTiles(tiles : Vector.<Tile>) : void {
			for each (var tile : Tile in tiles) {
				tile.removeEventListener(killPlayer);
				var g : Graphics = tile.getSprite().graphics;
				g.clear();
			}
		}
		
		public function shrinkPlayer(event : EventType) : void {
			player.getSprite().width = 4;
			player.getSprite().height = 4;
		}
		
		public function pulseHitPlayer(distance : int) : void {
			player.setSpeed(_pulseRadius * .001);
		}
		
		public function returnEntity(event : EventType) : void{
			_entityList[1].setTile(maze.getGrid()[5][5]);
		}

		public function killPlayer(event : EventType) : void {
			player.getSprite().width = 4;
			player.getSprite().height = 4;
		}
		
	}
	
	
}