package com.tesseractmobile.hoi 
{
	import flash.utils.ByteArray;
	import neoart.flod.core.CorePlayer;
	import neoart.flod.FileLoader;
	
	/**
	 * Plays music from one of the embedded .xm files.
	 * <p>
	 * This class is not instantiated. Use the static methods to play or stop music.
	 * </p>
	 * @author 
	 */
	public final class MusicPlayer 
	{
		private static var
		player : CorePlayer,
		stream : ByteArray,
		flodIsPlaying : Boolean;
		
		
		static public function play(Source:Class) : void {
			if (flodIsPlaying == true) player.stop();
			var loader : FileLoader = new FileLoader;
			stream = new Source as ByteArray;
			player = loader.load(stream);
			player.play();
			flodIsPlaying = true;
		}
		
		public static function stopSong():void {
			player.stop();
			flodIsPlaying = false;
		}
	}

}