package com.tesseractmobile.hoi 
{
	import assets.img;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.sampler.NewObjectSample;
	import flash.utils.ByteArray;
	/**
	 * Used to load maps from .tmx files.
	 * <p>1. First, instantiate a new TMXLoader.</p>
	 * <p>2. Then, connect each object type string to a factory function using <code>setObejctFactory()</code>.</p>
	 * <p>3. Next, set the bitmap asset classes corresponding to the image file paths in the TMX source using <code>setPathSource()</code>.</p>
	 * <p>4. Finally, load the map using <code>loadFromXML()</code>.</p>
	 * <p>
	 * 
	 * @author Brad Harms
	 * 
	 * @see loadFromXML
	 * @see setFactory
	 */
	public class TMXLoader 
	{
		private var _pathClasses : Object = { };
		
		public function TMXLoader () {
			
		}
		
		/**
		 * The TMX files store the images for their tilesets using relative file paths. Since our system loads images using asset classes rather than bitmaps,
		 * these image paths must be converted to their appropriate classes. Use this method to create the appropriate associations.
		 * @param	path The image path as it appears in the TMX file.
		 * @param   source The image class that is used to create the tilemaps' bitmap datas.
		 */
		public function setPathSource(path:String, source:Class) : void {
			_pathClasses[path] = source;
		}
		
		public function fromXMLAsset(source:Class) : TMXMap {
			var bytes : ByteArray = (new source) as ByteArray;
			var str : String = bytes.readUTFBytes(bytes.length);
			var xml : XML = new XML(str);
			var map : TMXMap = fromXML(xml);
			return map;
		}
		
		/**
		 * Create a new TMXMap from an XML object.
		 * 
		 * @param	mapXML
		 * @return
		 */
		public function fromXML(mapXML:XML) : TMXMap {
			var row : uint;
			var col : uint;
			var i : uint;
			var j : uint;
			var cols : uint;
			var rows : uint;
			
			// Create new map
			var tmxMap : TMXMap = new TMXMap;
			
			// Get simple data
			tmxMap.width = uint(mapXML.@width);
			tmxMap.height = uint(mapXML.@height);
			tmxMap.tileWidth = uint(mapXML.@tilewidth);
			tmxMap.tileHeight = uint(mapXML.@tileheight);
			
			// Get tile layers
			for each (var layerXML : XML in mapXML.layer) {
				
				// Create and store new layer
				var tmxLayer : TMXLayer = new TMXLayer(tmxMap);
				
				// Get simple data for current layer
				tmxLayer.map = tmxMap;
				tmxLayer.name = layerXML.@name;
				tmxLayer.width = uint(layerXML.@width);
				tmxLayer.height = uint(layerXML.@height);
				
				// Get layer properties
				for each (var layerPropXML : XML in tmxLayer.properties.property) {
					tmxLayer.properties[String(layerPropXML.@name)] = String(layerPropXML.@value);
				}
				
				// Get tile IDs
				var gidsStrs : Array = String(layerXML.data.text()).split(",");
				i = 0;
				for (row = 0; row < tmxLayer.height; row++) {
					var rowData : Vector.<uint> = new Vector.<uint>;
					tmxLayer.gids.push(rowData);
					for (col = 0; col < tmxLayer.width; col++) {
						rowData.push(uint(gidsStrs[i]));
						i++;
					}
				}
			}
			
			// Get object groups
			for each (var ogroupXML : XML in mapXML.objectgroup) {
				
				// Create and store object
				var tmxObjGroup : TMXObjectGroup = new TMXObjectGroup(tmxMap);
				
				// Get simple object group data
				tmxObjGroup.map = tmxMap;
				tmxObjGroup.name = String(ogroupXML.@name);
				
				// Get object group properties
				for each (var ogroupPropXML : XML in ogroupXML.properties.property) {
					tmxObjGroup.properties[String(ogroupPropXML.@name)] = String(ogroupPropXML.@value);
				}
				
				// Get objects of the group
				for each (var objectXML : XML in ogroupXML.object) {
					// Create and store object
					var tmxObject : TMXObject = new TMXObject(tmxObjGroup);
					
					// Set simple properties of the object
					tmxObject.group = tmxObjGroup;
					tmxObject.name = String(objectXML.@name);
					tmxObject.type = String(objectXML.@type);
					tmxObject.rect.x = uint(objectXML.@x);
					tmxObject.rect.y = uint(objectXML.@y);
					tmxObject.rect.width = uint(objectXML.@width);
					tmxObject.rect.height = uint(objectXML.@height);
					
					// Get object properties
					for each (var objectPropsXML : XML in objectXML.properties.property) {
						tmxObject.properties[String(objectPropsXML.@name)] = String(objectPropsXML.@value);
					}
				}
			}
			
			// Get tilesets
			for each (var tilesetXML : XML in mapXML.tileset) {
				// Create and store tileset
				var tmxTileset : TMXTileset = new TMXTileset(tmxMap);
				
				// Get simple tileset attributes
				tmxTileset.map = tmxMap;
				tmxTileset.name = tilesetXML.@name;
				tmxTileset.tileWidth = uint(tilesetXML.@tilewidth);
				tmxTileset.tileHeight = uint(tilesetXML.@tileheight);
				tmxTileset.firstgid = uint(tilesetXML.@firstgid);
				tmxTileset.source = String(tilesetXML.image.@source);
				
				// Load a bitmap data from the image asset library class
				tmxTileset.bitmapData = Bitmap(new _pathClasses[tmxTileset.source]).bitmapData;
				tmxTileset.tiles = new Vector.<TMXTile>;
				cols = tmxTileset.bitmapData.width / tmxTileset.tileWidth;
				rows = tmxTileset.bitmapData.height / tmxTileset.tileHeight;
				
				// Populate the tileset with tiles
				i = 0;
				for (row = 0; row < rows; row++) {
					for (col = 0; col < cols; col++) {
						// Create a new tile and store it
						var tmxTile : TMXTile = new TMXTile(tmxTileset);
						
						// Create a slice out of the parent tileset's bitmap data
						var bmp : BitmapData = new BitmapData(tmxTileset.tileWidth, tmxTileset.tileHeight, true, 0x00000000);
						bmp.copyPixels(
							tmxTileset.bitmapData, 
							new Rectangle(col * tmxTileset.tileWidth, row * tmxTileset.tileHeight, tmxTileset.tileWidth, tmxTileset.tileHeight),
							new Point(0, 0)
						);
						
						// Set simple properties
						tmxTile.tileset = tmxTileset;
						tmxTile.id = i;
						tmxTile.gid = i + tmxTileset.firstgid;
						tmxTile.bitmapData = bmp;
						
						// Get properties for this tile
						for each (var tilePropsXML : XML in tilesetXML.tile.(@id == i).properties.property) {
							tmxTile.properties[tilePropsXML.@name] = String(tilePropsXML.@value);
						}
						
						i++;
					}
				}
			}
			
			// Get properties
			for each (var mapPropsXML : XML in tmxMap.properties.property) {
				tmxMap.properties[mapPropsXML.@name] = String(mapPropsXML.@value);
			}
			
			return tmxMap;
		}
	}

}