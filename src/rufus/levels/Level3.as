package rufus.levels
{
	import rufus.core.ILevel;
	import rufus.core.Level;
	import rufus.elements.Enemy;
	import rufus.elements.Mushroom;
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class Level3 extends Level implements ILevel
	{
		[Embed(source="../../../res/tilemaps/lvl3data.txt", mimeType = 'application/octet-stream')]
		private static var levelTiles : Class;
		
		override public function setup() : void 
		{
			setPlayer(800, 100);
			addElement(Mushroom, 30, 444);
			addElement(Enemy, 900, 500);
		}
		
		override public function getTilemap() : String
		{
			return new levelTiles();
		}
		
	}

}