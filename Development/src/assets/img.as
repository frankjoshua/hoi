package assets
{
	/**
	 * Contains all imagery.
	 */
	public final class img {
		
		[Embed(source = "../../assets/img/testTiles.png")]
		static public const testTiles : Class;
		
		[Embed(source = "../../assets/img/Rivets-and-Grate.gif")]
		static public const Rivets_and_Grate : Class;
		
		[Embed(source = "../../assets/img/Coldiron-tiles.gif")]
		static public const Coldiron_tiles : Class;
		
		[Embed(source = "../../assets/img/StartScreen1.png")]
		static public const StartScreen1 : Class;
		
		[Embed(source = "../../assets/img/StartScreen2.png")]
		static public const StartScreen2 : Class;
		
		[Embed(source = "../../assets/img/Enemy-Switch.gif")]
		static public const Enemy_Switch : Class;
		
		[Embed(source = "../../assets/img/Path-Switch.gif")]
		static public const Path_Switch : Class;
		
		[Embed(source = "../../assets/img/Pulse-Switch.gif")]
		static public const Pulse_Switch : Class;
		
		[Embed(source = "../../assets/img/Niches.gif")]
		static public const Niches : Class;
		
		public static var sourceMapping : Object =  {
			"../img/testTiles.png" : testTiles,
			"../img/Rivets-and-Grate.gif" : Rivets_and_Grate,
			"../img/Coliron-tiles.gif" : Coldiron_tiles,
			"../img/Enemy-Switch.gif" : Enemy_Switch,
			"../img/Pulse-Switch.gif" : Pulse_Switch,
			"../img/Niches.gif" : Niches
		};
	}

}