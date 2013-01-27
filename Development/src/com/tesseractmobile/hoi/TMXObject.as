package com.tesseractmobile.hoi 
{
	import flash.geom.Rectangle;
	
	/**
	 * Represents one of the objects of an object layer (object group) within the .tmx file.
	 * @author Brad Harms
	 */
	public class TMXObject 
	{
		/**
		 * Name of the object. Need not be unique, but should be. Also doesn't need to be present.
		 */
		public var name : String;
		
		/**
		 * Type string of the object. This is separate from the name of the name of the object's group, but has a similar meaning.
		 */
		public var type : String;
		
		/**
		 * Boundries of the object in pixels. The width and height may be 0,0, in which case the object is a "point" object and has no size.
		 */
		public var rect : Rectangle;
		
		/**
		 * Collection of name-value pairs specific to this object, regardless of its type.
		 */
		public var properties : Object;
		
		/**
		 * Link back to the containing object group.
		 */
		public var group : TMXObjectGroup;
		
		/**
		 * Constructor.
		 */
		public function TMXObject(group_:TMXObjectGroup) 
		{
			group = group_;
			group.objects.push(this);
			rect = new Rectangle(0, 0, 0, 0);
			properties = { };
		}
		
	}

}