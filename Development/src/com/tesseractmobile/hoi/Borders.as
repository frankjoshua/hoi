package com.tesseractmobile.hoi 
{
	/**
	 * ...
	 * @author Joshua Frank
	 */
	public class Borders 
	{
		public static const LEFT : int = 0;
		public static const RIGHT : int = 1;
		public static const TOP : int = 2;
		public static const BOTTOM : int = 3;
		
		private var _top : Boolean;
		private var _left : Boolean;
		private var _right : Boolean;
		private var _bottom : Boolean;
		
		public function Borders(left : Boolean, top : Boolean, right : Boolean, bottom : Boolean) 
		{
			_top = top;
			_right = right;
			_left = left;
			_bottom = bottom;
		}
		
		public function getEdge(edge : int) : Boolean {
			switch(edge) {
				case LEFT:
					return _left;
				case RIGHT:
					return _right;
				case TOP:
					return _left;
				case BOTTOM:
					return _bottom;
			}
			return false;
		}
	}

}