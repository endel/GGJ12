package rufus.elements 
{
	import animation.PlayerAnimation;
	import flash.events.Event;
	import org.flixel.*;
	import rufus.core.Game;
	import rufus.core.GameObject;
	
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	
	public class Player extends GameObject
	{
		static public const ID:uint = 100;
		private var _animation : PlayerAnimation;
		
		private var _allowArrows : Boolean = true;
		private var _allowJump : Boolean = true;
		private var _lockAnimation : Boolean = false;
		
		static public const JUMPING:String = "jumping";
		static public const FALLING:String = "falling";
		static public const RUNNING:String = "running";
		static public const IDLE:String = "idle";
		static public const EVENT_NEXT_LEVEL:String = "eventNextLevel";
		static public const GET_ITEM:String = "getItem";
		static public const USE_ITEM:String = "useItem";
		
		static public var SCORE : Number = 0;
	
		public function Player()
		{
			_animation = new PlayerAnimation(120, 120);
			
			loadGraphicAsBitmap(_animation.content, true, true, _animation.width, _animation.height);
			scale = new FlxPoint( -1, 1);
			ID = ID;
			
			mass = 1;
			
			//bounding box tweaks
			width = _animation.width - 60;
			height = _animation.height - 60;
			offset.x = 26;
			offset.y = 26;
			
			//basic sprite physics
			drag.x = 1800;
			acceleration.y = Game.instance.accelerationY;
			maxVelocity.x = 200;
			maxVelocity.y = 500;
			//velocity.x = 50;
			
			//animations
			addAnimation(IDLE, [31, 32, 33, 34, 35, 36, 37, 38, 39, 38, 37, 36, 35, 34, 33, 32], 12);
			
			addAnimation(RUNNING, [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 42);
			
			// 40 - 53: Saindo do chão
			addAnimation(JUMPING, [39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52], 18, false);
			
			// 53 - 60: Caindo no chão
			addAnimation(FALLING, [52, 53, 54, 55, 56, 57, 58, 59], 18, false);

			// 60 - 65: Chegando ao solo
			
			// 66 - 70: Pegando item
			addAnimation(GET_ITEM, [65, 66, 67, 68, 69], 18, false);
			
			// 71 - 75: Soltando item
			addAnimation(USE_ITEM, [70, 71, 72, 73, 74], 18, false);
			
			addAnimationCallback(animationCallback);
		}
		
		override public function update() : void 
		{
			super.update();
			
			// Movement
			acceleration.x = 0;
			
			if (_allowArrows && Game.instance.endLevel == false) {
				if(FlxG.keys.LEFT && (x > 0))
				{
					facing = FlxObject.LEFT;
					acceleration.x -= drag.x;
				}
				else if(FlxG.keys.RIGHT && (x < FlxG.width - width))
				{
					facing = FlxObject.RIGHT;
					acceleration.x += drag.x;
				}
			}
			
			// Jump, jump
			if(_allowJump && ((FlxG.keys.justPressed("UP") || FlxG.keys.SPACE) && velocity.y == 0))
			{
				y -= 1;
				velocity.y = -300;
			}
			
			if (_lockAnimation) {
				return;
			}
			
			// ANIMATION
			if (velocity.y < 0)
			{
				play(JUMPING);
			} else if (velocity.y > 0)
			{
				play(FALLING);
			}
			else if(velocity.x == 0)
			{
				play(IDLE);
			}
			else
			{
				play(RUNNING);
			}
		}
		
		private function animationCallback(name : String, frame : uint, frameIndex: uint):void {
			if (name == GET_ITEM || name == USE_ITEM) {
				_lockAnimation = true;
				_allowJump = _allowArrows = false;
				if (frame == 4) {
					_lockAnimation = false;
				}
			// } else if (  ) {
			} else {
				_allowArrows = true;
				_allowJump = true;
			}
			
		}
		
		public function get allowArrows():Boolean 
		{
			return _allowArrows;
		}
		
		public function set allowArrows(value:Boolean):void 
		{
			_allowArrows = value;
		}
		
		public function get allowJump():Boolean 
		{
			return _allowJump;
		}
		
		public function set allowJump(value:Boolean):void 
		{
			_allowJump = value;
		}
		
	}

} 