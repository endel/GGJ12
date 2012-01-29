package rufus.elements 
{
	import animation.MushroomAnimation;
	import jframe.image.ImageManipulation;
	import org.flixel.FlxSprite;
	import rufus.core.GameObject;
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class Mushroom extends GameObject
	{ 
		static public const IDLE:String = "idle";
		[Embed(source = "../../../res/mushroom.png")] 
		private var bitmap:Class;
		private var _animation:MushroomAnimation;
		
		public function Mushroom() 
		{
			_animation = new MushroomAnimation(40, 40);
			setStaticGraphic(ImageManipulation.copyBitmap(_animation.content), _animation.width, _animation.height);
			addAnimation(IDLE, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24], 25);
			play(IDLE);
			immovable = true;
		}
		
	}

}