package rufus.core
{
	import com.greensock.easing.Quad;
	import com.greensock.TweenLite;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	import jframe.sound.SomManager;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxRect;
	import org.flixel.FlxSave;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxTilemap;
	import org.flixel.FlxU;
	import rufus.effects.ParallaxBackground;
	import rufus.effects.ParallaxForeground;
	import rufus.elements.Box;
	import rufus.elements.BoxMetal;
	import rufus.elements.BoxWood;
	import rufus.elements.Carrot;
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
		[Embed(source="../../../res/terraTiles6.png")]
		protected static var tiles:Class;
		
		// Some static constants for the size of the tilemap tiles
		protected const TILE_WIDTH:uint = 64;
		protected const TILE_HEIGHT:uint = 64;
		
		// The FlxTilemap we're using	
		protected var tilemap:FlxTilemap;
		
		protected var _player:Player;
		protected var hud:HUD;
		
		protected var gameObjects:Vector.<GameObject> = new Vector.<GameObject>();
		protected var groups:Object = new Object();
		protected var tilemapCollideable : FlxGroup;
		protected var startedGroupCollisions : Object = new Object();
		
		protected var background : ParallaxBackground;
		protected var foreground : ParallaxForeground;
		
		override public function create():void
		{
			FlxG.framerate = 50;
			FlxG.flashFramerate = 50;
			FlxG.bgColor = 0xffbfe4e5;
			
			background = new ParallaxBackground();
			add(background);
			
			FlxG.debug = true;
			FlxG.visualDebug = true;
			
			tilemap = new FlxTilemap();
			loadTilemap(this.getTilemap());
			add(tilemap);
			
			tilemapCollideable = new FlxGroup();
			this.setup();
			
			foreground = new ParallaxForeground();
			add(foreground);
			
			hud = new HUD();
			add(hud);
		}
		
		/**
		 * Create player and set his position on the level.
		 * 
		 * @param	x
		 * @param	y
		 */
		protected function setPlayer(x:uint, y:uint):void
		{
			Game.instance.level = this;
			_player = new Player();
			player.x = x;
			player.y = y;
			player.addToContainer(this);
			gameObjects.push(player);
			FlxG.camera.target = player;
			FlxG.camera.bounds = new FlxRect(0, 0, 1200, 640);
			
			// Add to tilemap collideable group
			tilemapCollideable.add(player);
		}
		
		/**
		 * Add a dynamic game element to the level.
		 * 
		 * @param	element
		 * @param	x
		 * @param	y
		 * @param	ignoreCollision
		 * @return	GameObject	The created element on the level
		 */
		public function addElement(element:Class, x:uint, y:uint, ignoreCollision:Boolean = false) : GameObject
		{
			var el:GameObject = new element();
			el.y = y;
			el.x = x;
			el.addToContainer(this);
			gameObjects.push(el);
			
			if (!ignoreCollision)
			{
				// Add to tilemap collideable group
				tilemapCollideable.add(el);
				
				var className:String = (FlxU.getClassName(el).split(".")).slice(-1)[0];
				
				var flxGroup:FlxGroup;
				if (!groups[className])
				{
					flxGroup = new FlxGroup();
				}
				else
				{
					flxGroup = groups[className];
				}
				flxGroup.add(el);
				groups[className] = flxGroup;
			}
			return el;
		}
		
		/**
		 * Load a tilemap string
		 * 
		 * @param	tilemap
		 */
		protected function loadTilemap(rawTilemap:String):void
		{
			tilemap.loadMap(rawTilemap, tiles, TILE_WIDTH, TILE_HEIGHT, FlxTilemap.OFF);
		}
		
		override public function preUpdate():void 
		{
			
		}
		
		/**
		 * Main game loop loop loop game loop loop loop game loop ...
		 */
		override public function update():void
		{
			super.update();
			
			if (groups["CarrotUsed"]) {
				FlxG.collide(FlxG.state, groups["CarrotUsed"]);
			}
			
			FlxG.collide(tilemapCollideable, tilemap);
		}
		
		public function getTilemap():String
		{
			return "";
		}
		
		public function setup():void {}
		
		public override function draw():void
		{
			super.draw();
		}
		
		public function getGroup(className : String) : FlxGroup
		{
			return groups[className] as FlxGroup;
		}
		
		public function get player():Player 
		{
			return _player;
		}
		
	}

}
