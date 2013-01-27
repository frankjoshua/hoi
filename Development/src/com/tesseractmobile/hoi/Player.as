package com.tesseractmobile.hoi 
{
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Joshua Frank
	 */
	public class Player extends BaseEntity 
	{
		
		public function Player(rect : Rectangle) 
		{
			super(rect);
		}
				
		override public function getType() : int {
			return BaseEntity.PLAYER_TYPE;
		}
	}

}