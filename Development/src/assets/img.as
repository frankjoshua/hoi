package assets
{
	/**
	 * Contains all imagery.
	 */
	public final class img {
		
		[Embed(source = "../../assets/img/testTiles.png")]
		static public const testTiles : Class;
		
		public static var sourceMapping : Object =  {
			"../img/testTiles.png" : testTiles
		};
	}

}