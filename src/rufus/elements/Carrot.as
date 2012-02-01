package rufus.elements 
{
	import org.flixel.FlxObject;
	import rufus.core.Game;
	import rufus.core.GameObject;
	
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class Carrot extends GameObject 
	{
		[Embed(source = "../../../res/cenoura.png")] 
		private var bitmap:Class;
				
		private var _state : String;
		
		static public const STATE_PICK:String = "statePick";
		static public const STATE_PICKED:String = "statePicked";
		
		public function Carrot()
		{	
			this.state = STATE_PICK;
			offset.y = -6;
			setStaticGraphic(bitmap, 65, 33);
		}
		
		override public function update() : void {
			if (_state == STATE_PICK) {
				allowCollisions = FlxObject.ANY;
				immovable = true;
			} else {
				allowCollisions = FlxObject.FLOOR;
				immovable = false;
				acceleration.y = Game.instance.accelerationY;
			}
		}
		
		public function get state():String 
		{
			return _state;
		}
		
		public function set state(value:String):void 
		{
			_state = value;
		}
		
	}

}