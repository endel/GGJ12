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
	public class Level9 extends Level implements ILevel
	{
		[Embed(source="../../../res/tilemaps/meumap6.txt", mimeType = 'application/octet-stream')]
		private static var levelTiles : Class;
		
		override public function setup() : void 
		{
			setPlayer(500, 400);
			addElement( Mushroom, 400, 400 );
			//addElement(Enemy, 200, 200);
		}
		
		override public function getTilemap() : String
		{
			return new levelTiles();
		}
		
	}

}