package  
{
	/**
	 * Contains all assets for the game.
	 */
	public final class assets 
	{
		
		/**
		 * Contains all imagery.
		 */
		public final class img {
			
			[Embed(source = "../assets/testTiles")]
			static public const testTiles : Class;
			
			
		}
		
		/**
		 * Contains all .tmx maps.
		 */
		public final class map {
			[Embed(source = "../assets/testMap", mineType="text/xml")]
			static public const testMap : Class;
		}
	}

}