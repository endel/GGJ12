package rufus.elements 
{
	import flash.events.Event;
	import jframe.sound.SomManager;
	import org.flixel.*;
	import rufus.core.Game;
	import rufus.core.GameObject;
	import rufus.core.Level;
	
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	
	public class Player extends GameObject
	{
		static public const ID:uint = 100;
		
		[Embed(source = "../../../res/rufus.png")]
		private var bitmap : Class;
		private static var _instance : Player;
		
		private var _allowArrows : Boolean = true;
		private var _allowJump : Boolean = true;
		private var _lockAnimation : Boolean = false;
		
		public static var FACING : uint = 0;
		public static var POS_X : Number = 0;
		public static var WIDTH : Number = 0;
		
		static public const JUMPING:String = "jumping";
		static public const FALLING:String = "falling";
		static public const RUNNING:String = "running";
		static public const IDLE:String = "idle";
		static public const EVENT_NEXT_LEVEL:String = "eventNextLevel";
		static public const GET_ITEM:String = "getItem";
		static public const USE_ITEM:String = "useItem";
		
		private var allowSwapDirection : Boolean = true;
		
		private var velocityX : uint = 200;
		private var velocityXAir : uint = 100;
		
		private var maxVelocityX : uint = 200;
		private var maxVelocityXAir : uint = 100;
		
		static public var SCORE : Number = 0;
	
		public function Player()
		{
			_instance = this;
			loadGraphicAsBitmap(bitmap, true, true, 120, 120);
			scale = new FlxPoint( -1, 1);
			ID = ID;
			allowCollisions = FlxObject.ANY;
			
			maxVelocityX = 150;
			maxVelocityXAir = 100;
			
			mass = 1;
			
			//bounding box tweaks
			width = WIDTH = (120 - 56);
			height = 120 - 60;
			offset.x = 30;
			offset.y = 26;
			
			//basic sprite physics
			acceleration.y = Game.instance.accelerationY;
			acceleration.x = 0;
			maxVelocity.y = 400;
			
			drag.x = 350;
			
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
		
		public static function get instance():Player 
		{
			return _instance;
		}
		
		override public function update() : void 
		{
			super.update();
			trace("Player =>", (allowCollisions == FlxObject.ANY))
			
			// Reduce speed when player is in the air
			maxVelocity.x = (isTouching(FlxObject.FLOOR)) ? maxVelocityX : maxVelocityXAir;
			
			trace("velocity.x => " + velocity.x, "; ", "drag.x => " + drag.x);
			
			if (_allowArrows && Game.instance.endLevel == false) {
				
				if(FlxG.keys.LEFT && (x > 0))
				{
					facing = FlxObject.LEFT;
					velocity.x = - ((isTouching(FlxObject.FLOOR)) ? velocityX : velocityXAir);
				}
				else if(FlxG.keys.RIGHT && (x < FlxG.width - width))
				{
					facing = FlxObject.RIGHT;
					velocity.x = (isTouching(FlxObject.FLOOR)) ? velocityX : velocityXAir;
				}
			}
			
			if (Game.instance.carrots > 0 && (FlxG.keys.ENTER || FlxG.keys.DOWN)) {
				Game.instance.carrots -= 1;
				var carrot : CarrotUsed = this._level.addElement(CarrotUsed, x + 30, y + 7, false) as CarrotUsed;
				play(Player.USE_ITEM);
				_lockAnimation = true;
			}
			
			// Jump, jump
			if(((FlxG.keys.justPressed("UP") || FlxG.keys.SPACE) && isTouching(FlxObject.FLOOR)))
			{
				y -= 1;
				velocity.y = -300;
			}
			
			// Global for background update 
			FACING = facing;
			POS_X = x;
			
			if (_lockAnimation) {
				return;
			}
			
			// ANIMATION
			if (velocity.y < 0)
			{
				play(JUMPING);
			} else if (velocity.y >= 50)
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
		
		public function lock() : void {
			_lockAnimation = true;
			_allowJump = _allowArrows = false;
		}
		
		public function unlock() : void {
			_lockAnimation = false;
			_allowJump = _allowArrows = true;
		}
		
		private function animationCallback(name : String, frame : uint, frameIndex: uint):void {
			if (name == RUNNING) {
				if (frame == 2) {
					SomManager.playSound(SomManager.WALK)
				}
			}
			if (name == GET_ITEM || name == USE_ITEM) {
				this.lock();
				if (frame == 4) {
					_lockAnimation = false;
				}
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