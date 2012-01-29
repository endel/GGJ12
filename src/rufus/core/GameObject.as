package rufus.core 
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class GameObject extends FlxSprite
	{
		protected var collisionMap : FlxTilemap;
		protected var _level : Level;
		
		public function GameObject() { }
		
		protected function setStaticGraphic(bitmap : * , width : Number, height : Number) : void {
			loadGraphic(bitmap, false, true, width, height);
			width = width;
			height = height;
		}
		
		public function addToContainer(container : Level, collisionMap : FlxTilemap = null) : void 
		{
			this.collisionMap = collisionMap;
			this._level = container;
			this._level.add(this);
		}
		
		override public function update() : void
		{
			super.update();
			
			if (this.collisionMap) {
				// Apply collision of collisionMap is set
				FlxG.collide(this, this.collisionMap);
			}
		}
		
		protected function wrap(obj:FlxObject):void
		{
			obj.x = (obj.x + obj.width / 2 + FlxG.width) % FlxG.width - obj.width / 2;
			obj.y = (obj.y + obj.height / 2) % FlxG.height - obj.height / 2;
		}
		
	}

}