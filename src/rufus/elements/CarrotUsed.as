package rufus.elements 
{
	import org.flixel.FlxObject;
	import rufus.core.Game;
	import rufus.core.GameObject;
	
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class CarrotUsed extends GameObject 
	{
		[Embed(source = "../../../res/cenoura.png")] 
		private var bitmap:Class;
		
		[Embed(source = "../../../res/mao.png")] 
		private var bitmapSwapped:Class;
				
		private var _state : String;
		
		static public const STATE_CARROT:String = "stateCarrot";
		static public const STATE_HAND:String = "stateHand";
		
		public function CarrotUsed()
		{	
			this.state = STATE_CARROT;
			offset.y = -16;
			setStaticGraphic(bitmap, 65, 33);
		}
		
		override public function update() : void {
			allowCollisions = FlxObject.FLOOR;
			immovable = false;
			acceleration.y = Game.instance.accelerationY;
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