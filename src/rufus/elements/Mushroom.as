package rufus.elements 
{
	import com.greensock.easing.Quad;
	import com.greensock.TweenLite;
	import jframe.image.ImageManipulation;
	import jframe.sound.SomManager;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import rufus.core.Game;
	import rufus.core.GameObject;
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class Mushroom extends GameObject
	{ 
		static public const IDLE:String = "idle";
		
		[Embed(source = "../../../res/mushroom.png")]
		private var bitmap : Class;
		
		public function Mushroom() 
		{
			setStaticGraphic(bitmap, 100, 100);
			addAnimation(IDLE, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24], 25);
			play(IDLE);
			immovable = true;
		}
		
		override public function update() : void 
		{
			FlxG.collide(Player.instance, this, onCollidePlayer);
		}
		
		private function onCollidePlayer(p:FlxSprite, obj:FlxSprite) : void
		{
			Game.instance.endLevel = true;
			Game.instance.levelScore += 1;
			
			Player.instance.lock();
			SomManager.playSound(SomManager.GET_MUSH, 1, 1)
			
			obj.solid = false;
			
			TweenLite.to(obj, 0.5, { 
				y: "-20",
				alpha: 50, 
				ease: Quad.easeOut, 
				onComplete: function() : void{
					TweenLite.to(obj, 0.5, {
						alpha: 0,
						onComplete: function() : void {
							Game.instance.gotoNextLevel();
							obj.kill();
						}
					})
				}
			});
		}
		
	}

}