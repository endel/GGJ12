package rufus.elements 
{
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import rufus.core.Game;
	import rufus.core.GameObject;
	
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class CarrotUsed extends GameObject 
	{
		[Embed(source = "../../../res/cenoura.png")] 
		private var cenouraBitmap:Class;
		private var _cenouraSprite : FlxSprite;
		
		[Embed(source = "../../../res/mao.png")] 
		private var handBitmap:Class;
		private var _handSprite : FlxSprite;
		
		private var _state : String;
		
		static public const STATE_CARROT:String = "stateCarrot";
		static public const STATE_HAND:String = "stateHand";
		
		public function CarrotUsed()
		{
			_cenouraSprite = new FlxSprite();
			_cenouraSprite.loadGraphic(cenouraBitmap, false, false, 65, 33);
			
			_handSprite = new FlxSprite();
			_handSprite.loadGraphic(handBitmap, false, false, 65, 33);
			
			this.state = STATE_CARROT;
			offset.y = -16;
			
		}
		
		override public function update() : void {
			if (x > Player.POS_X) {
				pixels = (Player.FACING == FlxObject.RIGHT) ? _cenouraSprite.pixels : _handSprite.pixels;
			} else if (x < Player.POS_X) {
				pixels = (Player.FACING == FlxObject.LEFT) ? _cenouraSprite.pixels : _handSprite.pixels;
			}
			
			allowCollisions = FlxObject.FLOOR;
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