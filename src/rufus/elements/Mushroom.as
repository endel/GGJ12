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
		[Embed(source = "../../../res/mushroom.png")] 
		private var bitmap:Class;
		private var _animation:MushroomAnimation;
		
		public function Mushroom() 
		{
			_animation = new MushroomAnimation(120, 120);
			
			setStaticGraphic(ImageManipulation.copyBitmap(_animation.content), _animation.width, _animation.height);
			sprite.immovable = true;
		}
		
	}

}