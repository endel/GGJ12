package rufus.core 
{
	import org.flixel.FlxG;
	import rufus.levels.Level1;
	import rufus.levels.Level2;
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class Game 
	{
		private static var _instance : Game = null;
		private static const secret:Number = Math.random();
		
		private var currentLevel : uint = 0;
		private var levels : Vector.<Class>;
		private var score : uint = 0;
		private var _levelScore : uint = 0;
		public var accelerationY : uint = 500;
		
		public static function get instance() : Game {
			if (!_instance) {
				_instance = new Game(secret);
			}
			return _instance;
		}
		
		public function Game(enforcer:Number) {
			if (enforcer != secret) {
				throw new Error("Error: use Game.instance instead");
			}
			
			levels = new Vector.<Class>();
			levels.push( Level1 );
			levels.push( Level2 );
		}
		
		public function gotoNextLevel() : void {
			score += levelScore;
			levelScore = 0;
			
			currentLevel += 1;
			FlxG.switchState( new levels[currentLevel]() );
		}
		
		public function get levelScore():uint 
		{
			return _levelScore;
		}
		
		public function set levelScore(value:uint):void 
		{
			_levelScore = value;
		}
		
	}

}