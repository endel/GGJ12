package rufus.elements 
{
	import org.flixel.FlxObject;
	import rufus.core.GameObject;
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class Box extends GameObject
	{
		
		public function Box() { }
		
		override public function update():void 
		{
			// 
			if (!isTouching(FlxObject.FLOOR)) {
				
			}
		}
		
	}

}