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
		[Embed(source="../../../res/tilemaps/meumap4.txt", mimeType = 'application/octet-stream')]
		private static var levelTiles : Class;
		
		override public function setup() : void 
		{
			setPlayer(20, 20);
			addElement(BoxWood, 80, 20);
			//addElement(BoxMetal, 100, 400);
			//addElement(Carrot, 320, 490);
			addElement(Enemy, 500, 400);
			addElement(Mushroom, 950, 50);
		}
		
		override public function getTilemap() : String
		{
			return new levelTiles();
		}
		
	}

}