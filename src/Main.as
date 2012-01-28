package
{
	import animation.EnemyAnimation;
	import animation.PlayerAnimation;
	import flash.display.Sprite;
	import org.flixel.*;
	import rufus.core.ILevel;
	import rufus.levels.Level1;
	
	[SWF(width="1024", height="640", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]

	public class Main extends Sprite
	{
		var game : FlxGame;
		
		public function Main()
		{
			game = new FlxGame(1024, 640, Level1, 1, 64, 64);
			addChild(game);
		}
	}
}