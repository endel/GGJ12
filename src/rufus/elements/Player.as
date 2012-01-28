package rufus.elements 
{
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
		[Embed(source = "../../../res/hugo.png")] 
		private static var PersonagemBmp:Class;
		
		static public const JUMPING:String = "jumping";
		static public const FALLING:String = "falling";
		static public const RUNNING:String = "running";
		static public const IDLE:String = "idle";
		static public const EVENT_NEXT_LEVEL:String = "eventNextLevel";
		
		static public var SCORE : Number = 0;
	
		public function Player() 
		{
			width = 52;
			height = 70;
			
			sprite = new FlxSprite(312, 420);
			sprite.loadGraphic(PersonagemBmp, true, true, width, height);
			
			sprite.mass = 1;
			
			//bounding box tweaks
			sprite.width = width;
			sprite.height = height;
			sprite.offset.x = 1;
			sprite.offset.y = 1;
			
			//basic sprite physics
			sprite.drag.x = 800;
			sprite.acceleration.y = Game.instance.accelerationY;
			sprite.maxVelocity.x = 100;
			sprite.maxVelocity.y = 500;
			
			//animations
			sprite.addAnimation(IDLE, [17]);
			sprite.addAnimation(RUNNING, [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], 18);
			sprite.addAnimation(JUMPING, [20, 21, 22, 23, 24, 25], 18, false);
			sprite.addAnimation(FALLING, [26, 27, 28, 29], 18, false);
		}
		
		override public function update():void 
		{
			super.update();
			
			//MOVEMENT
			sprite.acceleration.x = 0;
			
			if (sprite.x > (FlxG.width - width)) {
				dispatchEvent( new Event(EVENT_NEXT_LEVEL) );
			}
			
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
			
			// Jump, jump
			if((FlxG.keys.justPressed("UP") || FlxG.keys.SPACE) && sprite.velocity.y == 0)
			{
				sprite.y -= 1;
				sprite.velocity.y = -200;
			}
			
			//ANIMATION
			if (sprite.velocity.y < 0)
			{
				sprite.play(JUMPING);
				
			} else if(sprite.velocity.y > 0)
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
		}
		
	}

}