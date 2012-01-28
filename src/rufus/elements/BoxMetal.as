package rufus.elements 
{
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class BoxMetal extends Box 
	{
		[Embed(source = "../../../res/box-metal.png")] 
		private static var bitmap:Class;
		
		public function BoxMetal() 
		{
			setStaticGraphic(bitmap, 48, 48);
			sprite.solid = true;
			sprite.mass = 100;
			
			sprite.drag.x = 500;
			
			sprite.offset.x = 1;
			sprite.offset.y = 1;
			
			//basic sprite physics
			sprite.acceleration.y = 420;
			sprite.maxVelocity.y = 400;
		}
		
	}

}