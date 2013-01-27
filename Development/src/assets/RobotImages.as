package assets
{
	/**
	 * Contains all imagery.
	 */
	public final class RobotImages {
		
		[Embed(source = "../../assets/img/SAR_Full_Run_Anim.png")]
		static public const images : Class;
		
		public static var sourceMapping : Object =  {
			"../img/SAR_Full_Run_Anim.png" : images
		};
	}

}