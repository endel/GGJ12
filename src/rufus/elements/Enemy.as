package rufus.elements 
{
	import flash.geom.Point;
	import jframe.sound.SomManager;
	import org.flixel.FlxG;
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
		[Embed(source = "../../../res/enemy.png")] 
		private var bitmap : Class;
		
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

		private var _followPath : FlxPath;
		private var swapping:Boolean;
		
		public function Enemy() 
		{
			this._state = STATE_ANGEL;
			loadGraphicAsBitmap(bitmap, true, true, 120, 100);
			
			mass = 100;
			
			width = 120 - 32;
			height = 100 - 36;
			
			acceleration.y = Game.instance.accelerationY;
			maxVelocity.y = 200;
			allowCollisions = FlxObject.ANY;
			
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
			this.updateState();
			
			if (this.state == STATE_DEMON) {
				trace("Enemy =>", (allowCollisions == FlxObject.ANY));
				FlxG.collide(Player.instance, this, onCollidePlayer);
			}
			
			if (!swapping) {
				var animation : String = (state == STATE_ANGEL) ? ANGEL_IDLE : DEMON_IDLE,
					foodFound : CarrotUsed = null,
					carrots : FlxGroup = _level.getGroup("CarrotUsed");
				
				// Try to find a carrot to follow as a bunny
				if (carrots) {
					for each (var n:uint in carrots.members) {
						var _carrot : CarrotUsed = carrots.members[n] as CarrotUsed;
						trace( carrots.members[n] );
						trace( _carrot );
						if ( Point.distance( new Point(x,y), new Point(_carrot.x, _carrot.y) ) < 100 ) {
							foodFound = carrots.members[n] as CarrotUsed;
						}
					}
					
					if (foodFound) {
						animation = (state == STATE_ANGEL) ? ANGEL_WALKING : DEMON_WALKING;
						// Approaching to eat...
						if ( FlxU.getDistance(new FlxPoint(foodFound.x, foodFound.y), new FlxPoint(this.x, this.y)) > 65) {
							acceleration.x += (foodFound.x > x) ? drag.x : -drag.x;
							facing = (foodFound.x > x) ? FlxObject.LEFT : FlxObject.RIGHT;
						} else {
							// Stay and keep eating...
							animation = (state == STATE_ANGEL) ? ANGEL_IDLE : DEMON_EATING;
							acceleration.x = 0;
						}
						
					}
				}
				if (!foodFound) {
					animation = tryToAttack(animation);
				}
				
				play( animation );
			}
			
		}
		
		/**
		 * When collides with Player
		 * 
		 * @param	p
		 * @param	obj
		 */
		private function onCollidePlayer(p:FlxSprite, obj:FlxSprite) : void
		{
			trace("Kill the player!!");
			// obj.allowCollisions = FlxObject.FLOOR;
			
			// Kill the player
			// p.allowCollisions = FlxObject.FLOOR;
			(p as Player).lock();
			
			FlxG.fade(0x0, 0.5, function() : void {
				Game.instance.restartLevel();
			});
		}
		
		private function updateState():void 
		{
			if (Player.POS_X - (Player.WIDTH / 2) < this.x) {
				this.state = (Player.FACING == FlxObject.RIGHT) ? Enemy.STATE_ANGEL : Enemy.STATE_DEMON;
			} else if ( Player.POS_X > this.x + (this.width / 2) ) {
				this.state = (Player.FACING == FlxObject.LEFT) ? Enemy.STATE_ANGEL : Enemy.STATE_DEMON;
			}
			
			if ( _state == STATE_ANGEL ) {
				drag.x = 100;
				maxVelocity.x = 40;
			} else {
				drag.x = 800;
				maxVelocity.x = 200;
			}
			if (x > FlxG.width - width || (x < 0)) {
				maxVelocity.x = 10;
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
				if (Player.POS_X > x) {
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
				acceleration.x = 0;
				
				SomManager.playSound(SomManager.SWAP);
				offset.x = (value == STATE_ANGEL) ? 22 : 14;
				offset.y = (value == STATE_ANGEL) ? 22 : 14;
				allowCollisions = (value == STATE_ANGEL) ? FlxObject.FLOOR : FlxObject.ANY;
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