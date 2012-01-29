package rufus.elements 
{
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
			sprite.solid = true;
			
			sprite.drag.x = 200;
			
			sprite.offset.x = -8;
			sprite.offset.y = -8;
			
			//basic sprite physics
			sprite.acceleration.y = Game.instance.accelerationY;
		}
		
	}

}