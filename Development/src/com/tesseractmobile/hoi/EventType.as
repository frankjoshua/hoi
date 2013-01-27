package com.tesseractmobile.hoi 
{
	/**
	 * ...
	 * @author Joshua Frank
	 */
	public class EventType 
	{
		private var _eventId : int;
		
		//Contants for event types
		public static var PLAYER_LANDED : int = 1;
		public static var ENEMY_LANDED : int = 2;
		
		public function EventType(id : int) 
		{
			_eventId = id;
		}
		
		public function getEventId() : int {
			return _eventId;
		}
	}

}