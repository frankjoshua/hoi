package com.tesseractmobile.hoi 
{
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Joshua Frank
	 */
	public class TileStandard implements Tile
	{
		private var _color : int = 0;
		private var _sprite : Sprite;
		private var _borders : Borders;
		private var _rect : Rectangle;
		private var _id : int;
		private var _eventListeners : Vector.<Function> = new Vector.<Function>();
		
		public function TileStandard(id : int, rect : Rectangle, borders : Borders)
		{
			_id = id;
			_rect = rect;
			this._borders = borders;
			
			//Create Sprite
			_sprite = new Sprite();
			_sprite.x = rect.left;
			_sprite.y = rect.top;
			var g : Graphics = _sprite.graphics;
			//Test color
			g.beginFill(0x222222, 1.0);
			g.drawRect(0, 0, rect.width, rect.height);
			g.endFill();
			//Test text - remove this later
			var text : TextField = new TextField();
			//text.text = String(xPos / size) + "," + String(yPos / size);
			text.text = getBorderText(borders);
			_sprite.addChild(text);
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
			//Create an event
			var event : EventType =  new EventType(entity.getType());
			//Send to all event listeners
			for each (var listener : Function in _eventListeners) {
				//Could check for return Boolean to see if event was handled
				listener(event);
			}
		}
	}

}