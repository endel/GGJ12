package rufus.core 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import rufus.elements.Player;
	
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class HUD 
	{
		[Embed(source = "../../../res/mushroom.png")]
		private static var ScoreBmp:Class;
		[Embed(source = "../../../res/restart.png")]
		private static var restart:Class;
		[Embed(source = "../../../res/exit.png")]
		private static var exit:Class;
		
		private var restartSprite : FlxSprite;
		private var exitSprite : FlxSprite;
		private var scoreTxt : FlxText;
		
		public function HUD(container : FlxState) 
		{
			restartSprite = new FlxSprite(800, 10, restart)
			container.add(restartSprite)
			
			exitSprite = new FlxSprite(880, 10, exit)
			container.add(exitSprite)
			
			
			//restartSprite.cli
			//scoreSprite = new FlxSprite(5, 5, ScoreBmp);
			//container.add(scoreSprite);
			//
			//scoreTxt = new FlxText(20 + scoreSprite.width , 20, 200, "");
			//scoreTxt.size = 24;
			//container.add(scoreTxt);
		}
		
		public function update():void 
		{
			//scoreTxt.text = Game.instance.levelScore.toString();
		}
	}

}