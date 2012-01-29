package rufus.core
{
	import com.greensock.easing.Quad;
	import com.greensock.TweenLite;
	import flash.events.Event;
	import flash.utils.Dictionary;
	import mx.core.FlexSprite;
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
	import rufus.elements.Mushroom;
	import rufus.elements.Player;
	
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class Level extends FlxState implements ILevel
	{
		// Tileset that works with AUTO mode (best for thin walls)
		[Embed(source="../../../res/terraTiles4.png")]
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
			
			//setStaticGraphic(bitmap, 64, 64);
			player = new Player();
			player.sprite.x = x;
			player.sprite.y = y;
			player.addToContainer(this, collisionMap);
			player.addEventListener(Player.EVENT_NEXT_LEVEL, gotoNextLevel);
			gameObjects.push(player);
		}
		
		public function addElement(element:Class, x:uint, y:uint, ignoreCollision:Boolean = false):void
		{
			var el:GameObject = new element();
			el.sprite.y = y;
			el.sprite.x = x;
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
				flxGroup.add(el.sprite);
			}
		}
		
		protected function loadTilemap(tilemap:String):void
		{
			collisionMap.loadMap(tilemap, tiles, TILE_WIDTH, TILE_HEIGHT, FlxTilemap.AUTO);
		}
		
		override public function update():void
		{
			// Update all GameObjects
			for (var i:uint = 0; i < gameObjects.length; i++) {
				if (!gameObjects[i].sprite) {
					trace("Sprite destroído!!!!!");
				}
				gameObjects[i].update();
			}
			
			hud.update();
			super.update();
			
			for (var className:String in collisionGroups)
			{
				// trace(className);
				if (collisionCallbacks[className])
				{
					FlxG.collide(player.sprite, collisionGroups[className], collisionCallbacks[className]);
				}
				else
				{
					//trace("Callback for '" + className + "' not defined.");
				}
			}
			FlxG.collide();
		}
		
		override public function create():void
		{
			FlxG.framerate = 50;
			FlxG.flashFramerate = 50;
			addElement(Background, 0, 0);
			collisionMap = new FlxTilemap();
			loadTilemap(this.getTilemap());
			add(collisionMap);
			
			this.collisionCallbacks = {
				Mushroom: onCollideMushroom,
				BoxWood: onCollideBoxWood,
				BoxMetal: onCollideBoxMetal,
				Carrot: onCollideCarrot
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
		private function onCollideMushroom(p:FlxSprite, obj:FlxSprite) : void
		{
			Game.instance.levelScore += 1;
			
			obj.solid = false;
			TweenLite.to(obj, 0.5, { 
				y: "-20",
				alpha: 50, 
				ease: Quad.easeOut, 
				onComplete: function() : void{
					TweenLite.to(obj, 0.5, {
						alpha: 0,
						onComplete: function() : void {
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
			if (obj.velocity.y > 5) {
				// Kill the player!
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
		
		private function gotoNextLevel(e:Event):void
		{
			Game.instance.gotoNextLevel();
		}
	}

}