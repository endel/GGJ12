package rufus.elements 
{
	import org.flixel.FlxPath;
	import rufus.core.GameObject;
	
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class Enemy extends GameObject 
	{
		private var state : uint;
		
		static public const STATE_BUNNY:String = "stateBunny";
		static public const STATE_HELLHOUND:String = "stateHellhound";
		
		// -> Usando FlxPath: https://github.com/AdamAtomic/FlxCollisions/blob/master/src/PlayState.as
		private var path : FlxPath;
		
		public function Enemy() 
		{
			
		}
		
	}

}