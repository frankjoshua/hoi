package com.tesseractmobile.hoi 
{
	import assets.img;
	/**
	 * Used to load maps from .tmx files.
	 * <p>
	 * First, instantiate a new TMXLoader. Then, connect each object type string to a factory function using <code>setObejctFactory()</code>.
	 * Finally, load the map using <code>loadFromXML()</code>
	 * </p>
	 * 
	 * <p>
	 * Entities are created by the objects within the object layers of the TMX file. The name of the object layer determines the "type string" of
	 * the objects within that layer. (The type attributes associated with the specific object entities is currently ignored.)
	 * </p>
	 * 
	 * @author Brad Harms
	 * 
	 * @see loadFromXML
	 * @see setFactory
	 */
	public class TMXLoader 
	{
		private var _objectFactories : Object = new Object();
		
		public function TMXLoader() 
		{
			
		}
		
		/**
		 * Associate a factory function with a given object type name from the TMX data.
		 * <p>
		 * Functions must be of the form:
		 * </p>
		 * <p>
		 * <code>function factory(type : String, x : Number, y : Number, w : Number, h : Number, tmxProps : Objects) : Entity;</code>
		 * </p>
		 * 
		 * @param	typeName
		 * @param	factory
		 */
		public function setObjectFactory(type : String, factory : Function) : void {
			_objectFactories[type] = factory;
		}
		
		/**
		 * Return the factory function corresponding to the given type string.
		 * @param	Name of the object type according to the TMX file.
		 * @return The factory function
		 */
		public function getObjectFactory(type: String) : Function{
			return _objectFactories[type] as Function;
		}
		
		/**
		 * Remove the factory with the given string.
		 * @param	type
		 */
		public function delObjectFactory(type : String) : void {
			delete _objectFactories[type];
		}
		
		/**
		 * Pass in an XML object and get a LevelData in return.
		 * @param	xml
		 */
		public function loadFromXML(tmx:XML) : LevelData {
			var mapWidth : uint = uint(tmx.@width);
			var mapHeight : uint = uint(tmx.@height);
			var mapTileWidth : uint = uint(tmx.@tilewidth);
			var mapTileHeight : uint = uint(tmx.@tileheight);
			var tdata : Vector.<uint> = new Vector.<uint>;
			var maze : MazeGraphical;
			var tiles : Vector.<TileGraphical> = new Vector.<TileGraphical>();
			var tilesetGroup : TileSetGroup = new TileSetGroup;
			
			// Our map system uses the same width and height, so make sure the TMX does.
			if (mapTileWidth != mapTileHeight) {
				throw new Error("Map tile width must be equal to map tile height.");
			}
			
			// Load tileset data first.
			for each (var tilesetXML : XML in tmx.tileset) {
				var tilesetGID : uint = uint(tilesetXML.@firstgid);
				var tilesetTileWidth : uint = uint(tilesetXML.@tilewidth);
				var tilesetTileHeight : uint = uint(tilesetXML.@tileheight);
				var tilesetSource : String = tilessetXML.@source;
				var tilesetBitmapData = img.sourceMapping[tilesetSource];
				var tileset : TileSet = new TileSet(
					tilesetGID,
					tilesetTileWidth,
					tilesetTileHeight,
					tilesetSource,
					tilesetBitmapData
				);
			}

		}
	}

}