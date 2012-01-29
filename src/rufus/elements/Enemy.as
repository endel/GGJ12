package rufus.elements 
{
	import animation.EnemyAnimation;
	import jframe.sound.SomManager;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPath;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	import rufus.core.Game;
	import rufus.core.GameObject;
	
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class Enemy extends GameObject
	{
		private var _state : String;
		
		static public const STATE_ANGEL : String = "stateAngel";
		static public const STATE_DEMON : String = "stateDemon";
		
		static public const DEMON_IDLE:String = "demonIdle";
		static public const DEMON_ATTACK:String = "demonAttack";
		static public const DEMON_CROUCHING:String = "demonCrouching";
		static public const DEMON_EATING:String = "demonEating";
		static public const DEMON_TO_ANGEL:String = "demonToAngel";
		static public const ANGEL_TO_DEMON:String = "angelToDemon";
		static public const ANGEL_WALKING:String = "angelWalking";
		static public const ANGEL_IDLE:String = "angelIdle";
		static public const DEMON_WALKING:String = "demonWalk";
		static public const DEMON_GROWLING:String = "demonGrowling";
		
		// -> Usando FlxPath: https://github.com/AdamAtomic/FlxCollisions/blob/master/src/PlayState.as
		private var _animation : EnemyAnimation;
		private var _followPath : FlxPath;
		private var swapping:Boolean;
		
		public function Enemy() 
		{
			this._state = STATE_ANGEL;
			
			_animation = new EnemyAnimation(120, 100);
			loadGraphicAsBitmap(_animation.content, true, true, _animation.width, _animation.height);
			
			mass = 100;
			
			width = _animation.width - 32;
			height = _animation.height - 36;
			
			offset.x = 14;
			offset.y = 14;
			
			acceleration.y = Game.instance.accelerationY;
			maxVelocity.y = 200;
			
			addAnimation(DEMON_WALKING, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44], 24);
			addAnimation(DEMON_IDLE, [45, 46, 47, 48, 49, 50, 51, 52, 53, 52, 51, 50, 49, 48, 47, 46], 24);
			
			addAnimation(DEMON_GROWLING, [54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74], 24);
			addAnimation(DEMON_ATTACK, [75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97], 64);
			
			addAnimation(DEMON_CROUCHING, [98, 99, 100, 101, 102], 24);
			addAnimation(DEMON_EATING, [103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114], 24);
			
			addAnimation(DEMON_TO_ANGEL, [115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129], 24, false);
			addAnimation(ANGEL_TO_DEMON, [129, 128, 127, 126, 125, 124, 123, 122, 121, 120, 119, 118, 117, 116, 115], 24, false);
			
			addAnimation(ANGEL_WALKING, [130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148], 24);
			addAnimation(ANGEL_IDLE, [149, 150, 151, 152, 153, 154], 24);
			
			addAnimationCallback( animationCallback );
			
			/*var pathFrom : FlxPoint = getMidpoint();
			pathFrom.x += 50;
			_followPath = new FlxPath([pathFrom, getMidpoint()]);
			followPath(_followPath, 40, FlxObject.PATH_YOYO);*/
		}
		
		private function animationCallback(name : String, frame : uint, frameIndex: uint):void {
			if ((name == ANGEL_TO_DEMON || name == DEMON_TO_ANGEL) && frame == 14) {
				swapping = false;
			}
		}
		
		override public function update() : void {
			super.update();
			if (!swapping) {
				var animation : String = (state == STATE_ANGEL) ? ANGEL_IDLE : DEMON_IDLE;;
				
				// Find a carrot to follow as a bunny
				var carrots : FlxGroup = _level.getGroup("CarrotUsed");
				if (carrots) {
					var targetCarrot : CarrotUsed = null;
					
					for each (var n:uint in carrots.members) {
						if ((Math.abs(y - carrots.members[n].y)) < 100) {
							targetCarrot = carrots.members[n] as CarrotUsed;
						}
					}
					
					if (targetCarrot) {
						animation = (state == STATE_ANGEL) ? ANGEL_WALKING : DEMON_WALKING;
						// Approaching to eat...
						trace( FlxU.getDistance(new FlxPoint(targetCarrot.x, targetCarrot.y), new FlxPoint(this.x, this.y)) );
						if ( FlxU.getDistance(new FlxPoint(targetCarrot.x, targetCarrot.y), new FlxPoint(this.x, this.y)) > 65) {
							acceleration.x += (targetCarrot.x > x) ? drag.x : -drag.x;
							facing = (targetCarrot.x > x) ? FlxObject.LEFT : FlxObject.RIGHT;
						} else {
							// Stay and keep eating...
							animation = (state == STATE_ANGEL) ? ANGEL_IDLE : DEMON_EATING;
							acceleration.x = 0;
						}
						
					} else {
						animation = tryToAttack(animation);
					}
				} else {
					animation = tryToAttack(animation);
				}
				
				if ( _state == STATE_ANGEL ) {
					drag.x = 100;
					maxVelocity.x = 40;
					allowCollisions = FlxObject.FLOOR;
				} else {
					drag.x = 1400;
					maxVelocity.x = 500;
					allowCollisions = FlxObject.ANY;
				}
				play( animation );
			}
			
		}
		
		/**
		 * 
		 * @return String 
		 */
		private function tryToAttack(defaultAnimation : String) : String
		{
			var animation : String = defaultAnimation;
			if (state == STATE_DEMON) {
				// Nothing to eat, the demom will kill the player.
				if (Player.posX > x) {
					facing = FlxObject.LEFT;
					acceleration.x += drag.x;
					animation = DEMON_ATTACK;
				} else {
					facing = FlxObject.RIGHT
					acceleration.x -= drag.x;
					animation = DEMON_ATTACK;
				}
			}
			
			return animation;
		}
		
		public function set state(value:String):void 
		{
			if (_state != value) {
				swapping = true;
				SomManager.playSound(SomManager.SWAP);
				play( ((value == STATE_ANGEL) ? DEMON_TO_ANGEL : ANGEL_TO_DEMON) );
			}
			_state = value;
		}
		
		public function get state():String 
		{
			return _state;
		}
		
	}

}