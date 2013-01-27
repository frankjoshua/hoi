package assets 
{
	/**
	 * ...
	 * @author us
	 */
	public class map 
	{
		[Embed(source = "../../assets/map/testMap.tmx", mimeType="application/octet-stream")]
		static public const testMap : Class;
		
		[Embed(source = "../../assets/map/SARlevel1.tmx", mimeType="application/octet-stream")]
		static public const SARlevel1 : Class;
		
		public static var sourceMapping : Object = {
			"../img/tesstMap.tmx" : testMap,
			"../img/SARlevel1.tmx" : SARlevel1
		};
	}

}