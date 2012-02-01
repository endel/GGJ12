package rufus.levels
{
	import flash.display.Bitmap;
	import org.flixel.FlxG;
	import rufus.core.ILevel;
	import rufus.core.Level;
	import rufus.elements.BoxMetal;
	import rufus.elements.BoxWood;
	import rufus.elements.Carrot;
	import rufus.elements.Enemy;
	import rufus.elements.Mushroom;
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class Level1 extends Level implements ILevel
	{
		[Embed(source="../../../res/tilemaps/lvl1data.txt", mimeType = 'application/octet-stream')]
		private static var tilemap : Class;
		
		override public function setup() : void 
		{
			setPlayer(20, 500);
			addElement(Mushroom, 950, 380);
			addElement(Carrot, 300, 380);
			addElement(Carrot, 400, 380);
		}
		
		override public function getTilemap() : String
		{
			return new tilemap();
		}
		
	}

}