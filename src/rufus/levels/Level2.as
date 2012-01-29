package rufus.levels
{
	import rufus.core.ILevel;
	import rufus.core.Level;
	import rufus.elements.BoxWood;
	import rufus.elements.Carrot;
	import rufus.elements.Enemy;
	import rufus.elements.Mushroom;
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class Level2 extends Level implements ILevel
	{
		[Embed(source="../../../res/tilemaps/lvl2data.txt", mimeType = 'application/octet-stream')]
		private static var tilemap : Class;
		
		override public function setup() : void 
		{
			setPlayer(20, 400);
			addElement(Mushroom, 980, 340);
			addElement(BoxWood,  498, 500)
			addElement(Carrot, 320, 340);
			addElement(Enemy, 560, 500);
		}
		
		override public function getTilemap() : String
		{
			return new tilemap();
		}
		
	}

}