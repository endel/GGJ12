package rufus.elements 
{
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
			
			drag.x = 500;
			
			width = 54;
			height = 54;
			offset.x = 0;
			offset.y = 0;
			
			//basic sprite physics
			acceleration.y = 420;
			maxVelocity.y = 400;
		}
		
	}

}