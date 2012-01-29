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
	public class Level5 extends Level implements ILevel
	{
		[Embed(source="../../../res/tilemaps/meumap5.txt", mimeType = 'application/octet-stream')]
		private static var tilemap : Class;
		
		override public function setup() : void 
		{
			setPlayer(200, 400);
			addElement( Mushroom, 0, 400 );
			addElement(Enemy, 600, 0);
			addElement(Enemy, 400, 300);
		}
		
		override public function getTilemap() : String
		{
			return new tilemap();
		}
		
	}

}