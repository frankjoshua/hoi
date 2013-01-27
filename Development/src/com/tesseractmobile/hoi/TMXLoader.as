package com.tesseractmobile.hoi 
{
	import assets.img;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
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
		public var objectFactories : Object;
		
		public function TMXLoader () {
			
		}
		
		public function fromXML(mapXML:XML) : TMXMap {
			var row : uint;
			var col : uint;
			var i : uint;
			var j : uint;
			var cols : uint;
			var rows : uint;
			
			var tmxMap : TMXMap = new TMXMap;
			tmxMap.width = uint(mapXML.@width);
			tmxMap.height = uint(mapXML.@height);
			tmxMap.tileWidth = uint(mapXML.@tilewidth);
			tmxMap.tileHeight = uint(mapXML.@tileheight);
			
			for each (var layerXML : XML in mapXML.layer) {
				var tmxLayer : TMXLayer = new TMXLayer;
				tmxLayer.map = tmxMap;
				tmxLayer.name = layerXML.@name;
				tmxLayer.width = uint(layerXML.@width);
				tmxLayer.height = uint(layerXML.@height);
				tmxLayer.properties = { };
				for each (var layerPropXML : XML in tmxLayer.property) {
					tmxLayer.properties[String(layerPropXML.@name)] = String(layerPropXML.@value);
				}
				tmxLayer.tids = new Vector.<Vector.<uint>>;
				var tidsStrs : Array = String(layerXML.data.text()).split(",");
				i = 0;
				for (row = 0; row < tmxLayer.height; row++) {
					tmxLayer.tids.push(new Vector.<uint>);
					for (col = 0; col < tmxLayer.height; col++) {
						tmxLayer.tids[row].push(uint(tidsStrs[i]));
						i++;
					}
				}
			}
			
			for each (var ogroupXML : XML in mapXML.objectgroup) {
				var tmxObjGroup : TMXObjectGroup = new TMXObjectGroup;
				tmxObjGroup.map = tmxMap;
				tmxObjGroup.name = String(ogroupXML.@name);
				tmxObjGroup.properties = { };
				for each (var ogroupPropXML : XML in ogroupXML) {
					tmxObjGroup.properties[String(ogroupPropXML.@name)] = String(ogroupPropXML.@value);
				}
				tmxObjGroup.objects = new Vector.<TMXObject>;
				for (var objectXML : XML in ogroupXML.object) {
					var tmxObject : TMXObject = new TMXObject;
					tmxObject.group = tmxObjGroup;
					tmxObject.name = String(objectXML.@name);
					tmxObject.type = String(objectXML.@type);
					tmxObject.x = uint(objectXML.@x);
					tmxObject.y = uint(objectXML.@y);
					tmxObject.width = uint(objectXML.@width);
					tmxObject.height = uint(objectXML.@height);
					tmxObject.properties = { };
					for (var objectPropsXML : XML in objectXML.property) {
						tmxObject.properties[String(objectPropsXML.@name)] = String(objectPropsXML.@value);
					}
					tmxObjGroup.objects.push(tmxObject);
				}
			}
			
			for each (var tilesetXML : XML in mapXML.tileset) {
				var tmxTileset : TMXTileset = new TMXTileset;
				tmxTileset.map = tmxMap;
				tmxTileset.name = tilesetXML.@name;
				tmxTileset.tileWidth = uint(tilesetXML.@width);
				tmxTileset.tileHeight = uint(tilesetXML.@height);
				tmxTileset.firstgid = uint(tilesetXML.@firstgid);
				tmxTileset.source = String(tilesetXML.@source);
				tmxTileset.bitmapData = Bitmap(new img.sourceMapping[tmxTileset.source]).bitmapData;
				tmxTileset.tiles = new Vector.<TMXTile>;
				cols = tmxTileset.bitmapData.width / tmxTileset.tileWidth;
				rows = tmxTileset.bitmapData.height / tmxTileset.tileHeight;
				for (j = 0; j < rows; j++) {
					for (i = 0; i < cols; i++) {
						
					}
				}
			}
			
			return tmxMap;
		}
	}

}