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
			solid = true;
			
			drag.x = 200;
			
			width = 54;
			height = 54;
			offset.x = 0;
			offset.y = 0;
			
			//basic sprite physics
			acceleration.y = Game.instance.accelerationY;
		}
		
	}

}