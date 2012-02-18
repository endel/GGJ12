package rufus.elements 
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import rufus.core.Game;
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class BoxWood extends Box 
	{
		[Embed(source = "../../../res/caixa-madeira.png")] 
		private static var bitmap:Class;
		
		public function BoxWood()
		{
			setStaticGraphic(bitmap, 64, 64);
			solid = true;
			
			mass = 1;
			drag.x = 500;
			
			width = 54;
			height = 48;
			offset.x = 0;
			offset.y = 6;
			
			//basic sprite physics
			acceleration.y = Game.instance.accelerationY;
		}
		
		override public function update():void 
		{
			FlxG.collide( Player.instance, this );
		}
	}

}