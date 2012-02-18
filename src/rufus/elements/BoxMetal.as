package rufus.elements 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class BoxMetal extends Box 
	{
		[Embed(source = "../../../res/caixa-ferro.png")] 
		private static var bitmap:Class;
		
		public function BoxMetal() 
		{
			setStaticGraphic(bitmap, 64, 64);
			solid = true;
			
			mass = 100;
			drag.x = 1000;
			
			width = 54;
			height = 48;
			offset.x = 0;
			offset.y = 6;
			
			// basic sprite physics
			acceleration.y = 420;
			maxVelocity.y = 400;
		}
		
		override public function update():void 
		{
			FlxG.collide(Player.instance, this, onCollidePlayer);
		}
		
		private function onCollidePlayer(p:FlxSprite, obj:FlxSprite) : void
		{
			if (p.ID == Player.ID) {
				obj.immovable = true;
				if (obj.velocity.y > 5) {
					// Kill the player
				}
			}
		}
	}

}