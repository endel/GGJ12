package rufus.elements 
{
	import rufus.core.GameObject;
	
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class Carrot extends GameObject 
	{
		[Embed(source = "../../../res/cenoura.png")] 
		private var bitmap:Class;
				
		private var state : String;
		
		static public const STATE_PICK:String = "statePick";
		static public const STATE_UTILIZED:String = "stateUtilized";
		
		public function Carrot(state : String = STATE_PICK)
		{	
			this.state = state;
			setStaticGraphic(bitmap, 65, 33);
			immovable = true;
		}
		
	}

}