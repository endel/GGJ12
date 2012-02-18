package rufus.core 
{
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class WorldLevels 
	{
		private static var _instance : WorldLevels;
		
		[Embed(source = "../../../res/tilemaps/lvl1data.txt")]
		private var level1 : Class;
		
		public function get instance() : WorldLevels {
			if (!_instance) {
				_instance = new WorldLevels();
			}
			return _instance;
		}
		
		public function getLevel(num:uint) : Vector.<String> {
			var levelData : Vector.<String> = new Vector.<String>();
			levelData.push( new level1() );
			//levelData.push();
		}
		
	}

}