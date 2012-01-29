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
		private var _animation : PlayerAnimation;
		private var _allowArrows : Boolean = true;
		private var _allowJump : Boolean = true;
		
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
			
			width = _animation.width;
			height = _animation.height;
			
			sprite = new FlxSprite(_animation.content.width, _animation.content.height);
			sprite.loadGraphic(_animation.content, true, true, width, height);
			sprite.scale = new FlxPoint( -1, 1);
			
			sprite.mass = 1;
			
			//bounding box tweaks
			sprite.width = width - 60;
			sprite.height = height;
			sprite.offset.x = 20;
			sprite.offset.y = -30;
			
			//basic sprite physics
			sprite.drag.x = 1800;
			sprite.acceleration.y = Game.instance.accelerationY;
			sprite.maxVelocity.x = 200;
			sprite.maxVelocity.y = 500;
			//sprite.velocity.x = 50;
			
			//animations
			sprite.addAnimation(IDLE, [32, 33, 34, 35, 36, 37, 38, 39, 38, 37, 36, 35, 34, 33], 12);
			
			sprite.addAnimation(RUNNING, [11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 30);
			
			// 40 - 53: Saindo do chão
			sprite.addAnimation(JUMPING, [40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53], 18, false);
			
			// 53 - 60: Caindo no chão
			sprite.addAnimation(FALLING, [53, 54, 55, 56, 57, 58, 59, 60], 18, false);

			// 60 - 65: Chegando ao solo
			
			// 66 - 70: Pegando item
			sprite.addAnimation(GET_ITEM, [66, 67, 68, 69, 70], 18, false);
			
			// 71 - 75: Soltando item
			sprite.addAnimation(USE_ITEM, [71, 72, 73, 74, 75], 18, false);
			
			sprite.addAnimationCallback(animationCallback);
		}
		
		override public function update():void 
		{
			super.update();
			
			//MOVEMENT
			sprite.acceleration.x = 0;
			
			if (sprite.x > (FlxG.width - width)) {
				dispatchEvent( new Event(EVENT_NEXT_LEVEL) );
			}
			
			if (_allowArrows) {
				if(FlxG.keys.LEFT)
				{
					sprite.facing = FlxObject.LEFT;
					sprite.acceleration.x -= sprite.drag.x;
				}
				else if(FlxG.keys.RIGHT)
				{
					sprite.facing = FlxObject.RIGHT;
					sprite.acceleration.x += sprite.drag.x;
				}
			}
			
			
			// Jump, jump
			if(_allowJump && ((FlxG.keys.justPressed("UP") || FlxG.keys.SPACE) && sprite.velocity.y == 0))
			{
				
				sprite.y -= 1;
				sprite.velocity.y = -200;
			}
			
			// ANIMATION
			if (sprite.velocity.y < 0)
			{
				sprite.play(JUMPING);
				
			} else if (sprite.velocity.y > 0)
			{
				sprite.play(FALLING);
			}
			else if(sprite.velocity.x == 0)
			{
				sprite.play(IDLE);
			}
			else
			{
				sprite.play(RUNNING);
			}
			
			sprite.drawDebug();
		}
		
		private function animationCallback(name : String, frame : uint, frameIndex: uint):void {
			if (name == GET_ITEM) {
				_allowJump = _allowArrows = false;
			} else if (name == USE_ITEM) {
				_allowJump = _allowArrows = false;
			} else {
				_allowArrows = true;
				_allowJump = true;
			}
			
		}
		
	}

} 