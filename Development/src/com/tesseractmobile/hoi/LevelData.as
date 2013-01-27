package com.tesseractmobile.hoi 
{
	/**
	 * Returned by the TMXLoader to give the level data contained within.
	 * @author us
	 */
	public class LevelData 
	{
		
		private var _maze : MazeGraphical;
		private var _entities : Vector.<Entity>;
		
		public function LevelData(maze : Maze, entities : Vector.<Entity>) 
		{
			_maze = maze;
			_entities =  entities;
		}
		
		/**
		 * Return the graphical maze contained within the level data.
		 * @return
		 */
		public function getMaze() : MazeGraphical {
			return _maze;
		}
		
		/**
		 * Return the collection of all entities contained within the level data.
		 * @return
		 */
		public function getEntities() : Vector.<Entity> {
			return _entities;
		}
	}

}