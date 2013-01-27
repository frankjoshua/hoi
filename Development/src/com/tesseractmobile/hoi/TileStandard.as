package com.tesseractmobile.hoi 
{
	import assets.img;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Joshua Frank
	 */
	public class TileStandard implements Tile
	{
		//kill function
		public static var _killPlayer : Function;
		private var _color : int = 0;
		private var _sprite : Sprite;
		private var _borders : Borders;
		private var _rect : Rectangle;
		private var _id : int;
		private var _eventListeners : Vector.<Function> = new Vector.<Function>();
		private var _entity : Entity;
		private var _bitmap : Bitmap;
		
		public function TileStandard(id : int, rect : Rectangle, tmxTile : TMXTile)
		{
			_id = id;
			_rect = rect;
			//Setup Borders
			
			//this._borders = borders;
			//Create bitmap
			//_bitmap = new Bitmap(BitmapManager.getInstance().getTileImage(3).bitmapData);
			if(tmxTile != null){
				_bitmap = new Bitmap(tmxTile.bitmapData);
				if (tmxTile.properties.hasOwnProperty('borders')) {
					var borderStr : String = (tmxTile.properties.borders as String).toLowerCase();
					_borders = new Borders(borderStr.indexOf('left') > 0, borderStr.indexOf('top') > 0, borderStr.indexOf('right') > 0, borderStr.indexOf('bottom') > 0);
				}
			} else {
				//_bitmap = new Bitmap(BitmapManager.getInstance().getTileImage(3).bitmapData);
				_bitmap = new Bitmap(BitmapManager.getInstance().getTileImage(2).bitmapData);
				_borders = new Borders(false, false, false, false);
			}
			//_bitmap.bitmapData.copyPixels(tmxTile.bitmapData, tmxTile.bitmapData.rect, new Point(0, 0));
			//Position bimap
			_bitmap.x = rect.left;
			_bitmap.y = rect.top;
			_bitmap.width = rect.width;
			_bitmap.height = rect.height;
			//Create Sprite
			_sprite = new Sprite();
			_sprite.x = rect.left;
			_sprite.y = rect.top;
			var g : Graphics = _sprite.graphics;
			
			//Test color
			g.beginFill(0x222222, 0.0);
			g.drawRect(0, 0, rect.width, rect.height);
			g.endFill();
			//Test text - remove this later
			//var text : TextField = new TextField();
			//text.text = String(xPos / size) + "," + String(yPos / size);
			//text.text = getBorderText(borders);
			//_sprite.addChild(text);
		}
		
		private function getBorderText(borders : Borders) : String {
			var text : String = new String();
			if (borders.getEdge(Borders.TOP)) {
				text = text + " TOP ";
			}
			if (borders.getEdge(Borders.BOTTOM)) {
				text = text + " BOTTOM ";
			}
			if (borders.getEdge(Borders.LEFT)) {
				text = text + " LEFT ";
			}
			if (borders.getEdge(Borders.RIGHT)) {
				text = text + " RIGHT ";
			}
			return text;
		}
		
		public function getSprite() : Sprite {
			return _sprite;
		}
		
		public function update(elapsedTime : int) : void{
			
		}
		
		public function getEdge(edge : int) : Boolean {
			return _borders.getEdge(edge);
		}
		
		public function contains(rect : Rectangle) : Boolean {
			return _rect.contains(rect.left + rect.width / 2, rect.top + rect.height / 2);
		}
		
		public function getRect() : Rectangle {
			return _rect;
		}
		
		public function addEventListener(listener : Function) : void {
			_eventListeners.push(listener);
		}
		
		/**
		 * Currently only removes one listener
		 * Not the one you want!
		 * FIX THIS
		 * @param	listener
		 */
		public function removeEventListener(listener : Function) : void {
			_eventListeners.pop();
		}
		
		/**
		 * Sends event to Event Listeners based on Entity type
		 * @param	entity
		 */
		public function addEntity(entity : Entity) : void {
			//Kill player if not null
			if (_entity != null) {
				//Check for player
				if (_entity.getType() == BaseEntity.PLAYER_TYPE || entity.getType() == BaseEntity.PLAYER_TYPE) {
					//Check for enemy
					if (_entity.getType() == BaseEntity.ENEMY_TYPE || entity.getType() == BaseEntity.ENEMY_TYPE) {
						//kill
					_killPlayer(new EventType(0));
					}
				}
				
			}
			//Set current Entity
			_entity = entity;
			//Create an event
			var event : EventType =  new EventType(entity.getType());
			//Send to all event listeners
			for each (var listener : Function in _eventListeners) {
				//Could check for return Boolean to see if event was handled
				listener(event);
			}
		}
		
		/**
		 * Remove current entity
		 * @param	entiy
		 */
		public function removeEntity(entiy : Entity) : void {
			_entity = null;
		}
		
		public function getBitmap() : Bitmap {
			return _bitmap;
		}
	}

}