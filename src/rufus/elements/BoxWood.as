package rufus.elements 
{
	import rufus.core.Game;
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class BoxWood extends Box 
	{
		[Embed(source = "../../../res/box-wood.png")] 
		private static var bitmap:Class;
		
		public function BoxWood() 
		{
			setStaticGraphic(bitmap, 48, 48);
			sprite.solid = true;
			
			sprite.drag.x = 200;
			
			sprite.offset.x = 1;
			sprite.offset.y = 1;
			
			//basic sprite physics
			sprite.acceleration.y = Game.instance.accelerationY;
		}
		
	}

}