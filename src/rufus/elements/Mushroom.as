package rufus.elements 
{
	import org.flixel.FlxSprite;
	import rufus.core.GameObject;
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class Mushroom extends GameObject
	{ 
		[Embed(source = "../../../res/mushroom.png")] 
		private var bitmap:Class;
		
		public function Mushroom() 
		{
			setStaticGraphic(bitmap, 43, 50);
			immovable = true;
		}
		
	}

}