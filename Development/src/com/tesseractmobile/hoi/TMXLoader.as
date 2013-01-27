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
		public var objectFactories : Object;
		
		public function TMXLoader () {
			
		}
		
		public function fromXML(mapXML:XML) : TMXMap {
			var row : uint;
			var col : uint;
			var i : uint;
			
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
					tmxLayer.properties[String(tmxLayer.@name)] = String(tmxLayer.@value);
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
				tmxObjGroup.name = String(tmxMap);
			}
			
			return tmxMap;
		}
	}

}