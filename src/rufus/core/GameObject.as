package rufus.core 
{
	import flash.events.EventDispatcher;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class GameObject extends EventDispatcher
	{
		public var sprite : FlxSprite;
		protected var collisionMap : FlxTilemap;
		protected var reapear : Boolean = false;
		
		public var width : Number;
		public var height : Number;
		
		public function GameObject() { }
		
		protected function setStaticGraphic(bitmap : * , width : Number, height : Number) : void {
			this.width = width;
			this.height = height;
			
			sprite = new FlxSprite(width, height);
			sprite.loadGraphic(bitmap, false, true, width, height);
			
			sprite.width = width;
			sprite.height = height;
		}
		
		public function addToContainer(container : FlxState, collisionMap : FlxTilemap = null, reapear : Boolean = false) : void 
		{
			this.reapear = reapear;
			this.collisionMap = collisionMap;
			container.add(sprite);
		}
		
		public function update() : void
		{
			if (this.reapear) {
				this.wrap( sprite );
			}
			
			// Apply collision of collisionMap is set
			if (this.collisionMap) {
				FlxG.collide(sprite, this.collisionMap);
			}
		}
		
		protected function wrap(obj:FlxObject):void
		{
			obj.x = (obj.x + obj.width / 2 + FlxG.width) % FlxG.width - obj.width / 2;
			obj.y = (obj.y + obj.height / 2) % FlxG.height - obj.height / 2;
		}
		
	}

}