package rufus.levels
{
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
	public class Level4 extends Level implements ILevel
	{
		[Embed(source="../../../res/tilemaps/lvl4data.txt", mimeType = 'application/octet-stream')]
		private static var tilemap : Class;
		
		override public function setup() : void 
		{
			setPlayer(20, 500);
			//addElement(BoxWood, 200, 400);
			//addElement(BoxMetal, 100, 400);
			addElement(Carrot, 320, 490);
			addElement(Enemy, 600, 400);
			addElement(Mushroom, 950, 450);
		}
		
		override public function getTilemap() : String
		{
			return new tilemap();
		}
		
	}

}