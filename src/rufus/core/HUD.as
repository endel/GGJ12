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
		
		private var scoreSprite : FlxSprite;
		private var scoreTxt : FlxText;
		
		public function HUD(container : FlxState) 
		{
			scoreSprite = new FlxSprite(5, 5, ScoreBmp);
			container.add(scoreSprite);
			
			scoreTxt = new FlxText(20 + scoreSprite.width , 20, 200, "");
			scoreTxt.size = 24;
			container.add(scoreTxt);
		}
		
		public function update():void 
		{
			scoreTxt.text = Player.SCORE.toString();
		}
	}

}