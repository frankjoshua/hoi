package assets 
{
	/**
	 * ...
	 * @author us
	 */
	public class music 
	{
		[Embed(source = "../../assets/music/machine.xm", mimeType="application/octet-stream")]
		static public const machine : Class;
		
		[Embed(source = "../../assets/music/race.xm", mimeType="application/octet-stream")]
		static public const race : Class;
		
		[Embed(source = "../../assets/music/tower.xm", mimeType="application/octet-stream")]
		static public const tower : Class;
		
		public static var sourceMapping : Object = {
			"../music/machine.xm" : machine,
			"../music/race.it" : race,
			"../music/tower.xm" : tower
		};
	}

}