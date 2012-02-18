package rufus.elements 
{
	import com.greensock.easing.Quad;
	import com.greensock.TweenLite;
	import jframe.sound.SomManager;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import rufus.core.Game;
	import rufus.core.GameObject;
	
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class Carrot extends GameObject 
	{
		[Embed(source = "../../../res/cenoura.png")] 
		private var bitmap:Class;
		
		public function Carrot()
		{	
			offset.y = -6;
			acceleration.y = Game.instance.accelerationY;
			setStaticGraphic(bitmap, 65, 33);
			allowCollisions = FlxObject.ANY;
		}
		
		override public function update() : void {
			if (allowCollisions == FlxObject.ANY) {
				FlxG.collide(Player.instance, this, onCollidePlayer);
			}
		}
		
		private function onCollidePlayer(p:FlxSprite, obj:FlxSprite) : void
		{
			moves = false;
			allowCollisions = FlxObject.FLOOR;
			alive = false;
			
			Player.instance.lock();
			Player.instance.play(Player.GET_ITEM);
			
			SomManager.playSound(SomManager.GET_CARROT,1 , .2);
			
			Game.instance.carrots += 1;
			
			TweenLite.to(obj, 0.5, { 
				y: "-20", 
				alpha: 50, 
				ease: Quad.easeOut, 
				onComplete: function() : void {
					TweenLite.to(obj, 0.5, {
						alpha: 0,
						onComplete: function():void {
							obj.kill();
						}
					})
				}
			});
		}
	}

}