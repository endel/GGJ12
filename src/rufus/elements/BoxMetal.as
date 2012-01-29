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
			sprite.solid = true;
			sprite.mass = 100;
			
			sprite.drag.x = 500;
			
			sprite.offset.x = -8;
			sprite.offset.y = -8;
			
			//basic sprite physics
			sprite.acceleration.y = 420;
			sprite.maxVelocity.y = 400;
		}
		
	}

}