package com.tesseractmobile.hoi 
{
	/**
	 * A helper class that may be used for processing the TMX objects that were loaded by the TMXLoader.
	 * <p>
	 * To use:
	 * </p>
	 * <p>
	 * 1. Set the <code>onLayerCell</code> and <code>onObject</code> callbacks to appropriate functions.
	 * </p>
	 * <p>
	 * 2. Call the <code>processMap()</code> method.
	 * </p>
	 * <p>Layer cells are processed before objects.</p>
	 * @author Brad Harms
	 * @see onLayerCell
	 * @see onObject
	 * @see processMap
	 */
	public class TMXProcessor 
	{
		/**
		 * Called once for each tile of each layer.
		 * <p>Expects a function of the form:</p>
		 * <p><code>function handleLayerCell( col : uint, row : uint, tile : TMXTile, layer : TMXLayer ) : void</code>
		 */
		public var onLayerCell : Function = null;
		
		/**
		 * Called once for each object.
		 * <p>Expects a function of the form:</p>
		 * <p><code>function handleObject(obj : TMXObject)</p>
		 */
		public var onObject : Function = null;
		
		public function TMXProcessor(onLayerCell_ : Function = null, onObject_ : Function = null) 
		{
			
		}
		
		/**
		 * This will process a TMXMap by iterating over every cell of every layer and every object of every object group and calling the appropriate callback.
		 * @param	map
		 */
		public function processMap(map:TMXMap) : void {
			if (onLayerCell !== null) {
				for each(var layer : TMXLayer in map.layers) {
					for (var row : uint = 0; row < map.height; row++) {
						for (var col : uint = 0; col < map.width; col++) {
							onLayerCell(col, row, map.getTileByGid(layer.gids[row][col]), layer);
						}
					}
				}
			}
			
			if (onObject !== null) {
				for each(var group : TMXObjectGroup in map.objectgroups) {
					for each (var obj : TMXObject in group.objects) {
						onObject(obj);
					}
				}
			}
		}
		
	}

}