package rufus.core
{
	import com.greensock.easing.Quad;
	import com.greensock.TweenLite;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Dictionary;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxSave;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxTilemap;
	import org.flixel.FlxU;
	import rufus.elements.Background;
	import rufus.elements.Box;
	import rufus.elements.BoxMetal;
	import rufus.elements.BoxWood;
	import rufus.elements.Enemy;
	import rufus.elements.Mushroom;
	import rufus.elements.Player;
	
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class Level extends FlxState implements ILevel
	{
		// Tileset that works with AUTO mode (best for thin walls)
		[Embed(source="../../../res/terraTiles5.png")]
		protected static var tiles:Class;
		
		// Some static constants for the size of the tilemap tiles
		protected const TILE_WIDTH:uint = 64;
		protected const TILE_HEIGHT:uint = 64;
		
		// The FlxTilemap we're using	
		protected var collisionMap:FlxTilemap;
		
		protected var player:Player;
		protected var hud:HUD;
		
		protected var gameObjects:Vector.<GameObject> = new Vector.<GameObject>();
		protected var collisionGroups:Object = new Object();
		
		protected var collisionCallbacks:Object = new Object();
		
		protected function setPlayer(x:uint, y:uint):void
		{
			
			player = new Player();
			player.x = x;
			player.y = y;
			player.addToContainer(this, collisionMap);
			gameObjects.push(player);
		}
		
		public function addElement(element:Class, x:uint, y:uint, ignoreCollision:Boolean = false):void
		{
			var el:GameObject = new element();
			el.y = y;
			el.x = x;
			el.addToContainer(this, collisionMap);
			gameObjects.push(el);
			
			if (!ignoreCollision)
			{
				var className:String = (FlxU.getClassName(el).split(".")).slice(-1)[0];
				
				var flxGroup:FlxGroup;
				if (!collisionGroups[className])
				{
					flxGroup = collisionGroups[className] = new FlxGroup();
				}
				else
				{
					flxGroup = collisionGroups[className];
				}
				flxGroup.add(el);
			}
		}
		
		protected function loadTilemap(tilemap:String):void
		{
			collisionMap.loadMap(tilemap, tiles, TILE_WIDTH, TILE_HEIGHT, FlxTilemap.OFF);
		}
		
		override public function update():void
		{
			// Update all GameObjects
			for (var i:uint = 0; i < gameObjects.length; i++) {
				gameObjects[i].update();
			}
			
			hud.update();
			super.update();
			
			// Swap enemy state
			if (collisionGroups["Enemy"]) {
				(collisionGroups["Enemy"] as FlxGroup).members.every(function(flx) {
					var enemy : Enemy = flx as Enemy;
					// enemy.
					
					if (player.x - player.width < enemy.x) {
						enemy.state = (player.facing == FlxObject.RIGHT) ? Enemy.STATE_ANGEL : Enemy.STATE_DEMON;
					} else if ( player.x > enemy.x + enemy.width ) {
						enemy.state = (player.facing == FlxObject.LEFT) ? Enemy.STATE_ANGEL : Enemy.STATE_DEMON;
					}
				});
			}
			
			for (var className:String in collisionGroups)
			{
				// trace(className);
				if (collisionCallbacks[className])
				{
					FlxG.collide(player, collisionGroups[className], collisionCallbacks[className]);
				}
				else
				{
					//trace("Callback for '" + className + "' not defined.");
				}
			}
			// FlxG.collide();
		}
		
		override public function create():void
		{
			FlxG.framerate = 50;
			FlxG.flashFramerate = 50;
			
			FlxG.debug = true;
			FlxG.visualDebug = true;
			
			addElement(Background, 0, 0);
			
			collisionMap = new FlxTilemap();
			loadTilemap(this.getTilemap());
			add(collisionMap);
			
			this.collisionCallbacks = {
				Mushroom: onCollideMushroom,
				BoxWood: onCollideBoxWood,
				BoxMetal: onCollideBoxMetal,
				Carrot: onCollideCarrot,
				Enemy: onCollideEnemy
			};
			
			hud = new HUD(this);
			this.setup();
		}
		
		public function getTilemap():String
		{
			return "";
		}
		
		public function setup():void
		{
		}
		
		public override function draw():void
		{
			super.draw();
		}
		
		/*
		 * Callbacks
		 */
		
		private function onCollideEnemy(p:FlxSprite, obj:FlxSprite) : void
		{
			if ( (obj as Enemy).state == Enemy.STATE_DEMON ) {
				// Kill the player
			}
		}
		
		private function onCollideMushroom(p:FlxSprite, obj:FlxSprite) : void
		{
			Game.instance.endLevel = true;
			Game.instance.levelScore += 1;
			player.allowArrows = false;
			player.allowJump = false;
			
			obj.solid = false;
			TweenLite.to(obj, 0.5, { 
				y: "-20",
				alpha: 50, 
				ease: Quad.easeOut, 
				onComplete: function() : void{
					TweenLite.to(obj, 0.5, {
						alpha: 0,
						onComplete: function() : void {
							Game.instance.gotoNextLevel();
							obj.kill();
						}
					})
				}
			});
		}
		
		private function onCollideBoxWood(p:FlxSprite, obj:FlxSprite) : void
		{
			
		}
		
		private function onCollideBoxMetal(p:FlxSprite, obj:FlxSprite) : void
		{
			if (p.ID == Player.ID) {
				obj.immovable = true;
				obj.solid = true;
				if (obj.velocity.y > 5) {
					// Kill the player!
				}
			}

		}
		
		private function onCollideCarrot(p:FlxSprite, obj:FlxSprite) : void
		{
			p.play(Player.GET_ITEM);
			obj.solid = false;
			
			TweenLite.to(obj, 0.5, { 
				y: "-20", 
				alpha: 50, 
				ease: Quad.easeOut, 
				onComplete: function() : void {
					TweenLite.to(obj, 0.5, {
						alpha: 0,
						onComplete: function():void {
							obj.kill();
						}
					})
				}
			});
		}
		
	}

}