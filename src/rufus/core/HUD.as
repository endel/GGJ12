package rufus.core 
{
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;
	import rufus.elements.Player;
	
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class HUD extends FlxGroup
	{
		[Embed(source = "../../../res/restart.png")]
		private static var restart:Class;
		
		private var restartSprite : FlxExtendedSprite;
		private var scoreTxt : FlxText;
		
		public function HUD() 
		{
			restartSprite = new  FlxExtendedSprite(0, 0, restart);
			restartSprite.clickable = true;
			restartSprite.mousePressedCallback = Game.instance.restartLevel;
			add(restartSprite)
			
			//restartSprite.cli
			//scoreSprite = new FlxSprite(5, 5, ScoreBmp);
			//container.add(scoreSprite);
			//
			//scoreTxt = new FlxText(20 + scoreSprite.width , 20, 200, "");
			//scoreTxt.size = 24;
			//container.add(scoreTxt);
		}
		
		override public function postUpdate():void 
		{
			restartSprite.x = FlxG.camera.scroll.x; //  - restartSprite.width - 5;
			restartSprite.y = FlxG.camera.scroll.y; // - restartSprite.height - 5;
			//scoreTxt.text = Game.instance.levelScore.toString();
		}
		
	}

}