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
		
		public static var sourceMapping : Object = {
			"../img/tesstMap.tmx" : testMap
		};
	}

}