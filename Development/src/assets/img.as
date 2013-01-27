package assets
{
	/**
	 * Contains all imagery.
	 */
	public final class img {
		
		[Embed(source = "../../assets/img/Rivets-and-Grate.gif")]
		static public const testTiles : Class;
		
		public static var sourceMapping : Object =  {
			"../img/Rivets-and-Grate.gif" : testTiles
		};
	}

}