package rufus.elements 
{
	import rufus.core.GameObject;
	
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class Carrot extends GameObject 
	{
		[Embed(source = "../../../res/cenorin.png")] 
		private var bitmap:Class;
				
		private var state : uint;
		
		static public const STATE_PICK:String = "statePick";
		static public const STATE_UTILIZED:String = "stateUtilized";
		
		public function Carrot() 
		{
			setStaticGraphic(bitmap, 127, 107);
			immovable = true;
		}
		
	}

}