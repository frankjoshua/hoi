package com.tesseractmobile.hoi 
{
	/**
	 * Represents an object layer, or object "group," within the .tmx.
	 * 
	 * @author Brad Harms
	 */
	public class TMXObjectGroup
	{
		/**
		 * Name of the group. This may be used in place of object type strings.
		 */
		public var name : String;
		
		/**
		 * A collection of name-value pairs pertaining to the group as a whole.
		 */
		public var properties : Object;
		
		/**
		 * A link back to the containing map.
		 */
		public var map : TMXMap;
		
		/**
		 * A collection of all objects contained within the group.
		 */
		public var objects : Vector.<TMXObject>;
		
		public function TMXObjectGroup(map_:TMXMap) 
		{
			map = map_;
			map.objectgroups.push(this);
			properties = { };
			objects = new Vector.<TMXObject>;
		}
		
	}

}