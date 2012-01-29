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
	public class Level1 extends Level implements ILevel
	{
		[Embed(source="../../../res/tilemaps/level1.txt", mimeType = 'application/octet-stream')]
		private static var tilemap : Class;
		
		override public function setup() : void 
		{
			setPlayer(400, 20);
			addElement(Mushroom, 580, 400);
			
			addElement(BoxMetal, 50, 450);
			addElement(BoxWood, 200, 450);
			addElement(Carrot, 300, 400);
			addElement(Enemy, 200, 200);
		}
		
		override public function getTilemap() : String
		{
			return new tilemap();
		}
		
	}

}