package rufus.core 
{
	import org.flixel.FlxG;
	import rufus.levels.Level1;
	import rufus.levels.Level2;
	import rufus.levels.Level3;
	// import rufus.levels.Level4;
	import rufus.levels.Level5;
	import rufus.levels.Level6;
	import rufus.levels.Level7;
	import rufus.levels.Level8;
	import rufus.levels.Level9;
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class Game 
	{
		private static var _instance : Game = null;
		private static const secret:Number = Math.random();
		
		private var _endLevel : Boolean = false;
		private var currentLevel : uint = 0;
		private var levels : Vector.<Class>;
		private var score : uint = 0;
		private var _carrots : uint = 0;
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
			levels.push( Level3 );
			// levels.push( Level4 );
			levels.push( Level5 );
			levels.push( Level6 );
			levels.push( Level7 );
			levels.push( Level8 );
			levels.push( Level9 );
		}
		
		public function gotoNextLevel() : void {
			score += levelScore;
			levelScore = 0;
			
			carrots = 0;
			
			currentLevel += 1;
			FlxG.fade(0x0, 1, function() {
				Game.instance.endLevel = false;
				try {
					FlxG.switchState( new levels[currentLevel]() );
				} catch (e:Error) {
					currentLevel = 0;
					FlxG.switchState( new levels[currentLevel]() );
				}
			} );
		}
		
		public function restartLevel():void 
		{
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
		
		public function get endLevel():Boolean 
		{
			return _endLevel;
		}
		
		public function set endLevel(value:Boolean):void 
		{
			_endLevel = value;
		}
		
		public function get carrots():uint 
		{
			return _carrots;
		}
		
		public function set carrots(value:uint):void 
		{
			_carrots = value;
		}
		
	}

}