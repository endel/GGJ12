package rufus.levels
{
	import rufus.core.ILevel;
	import rufus.core.Level;
	import rufus.elements.Mushroom;
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class Level2 extends Level implements ILevel
	{
		[Embed(source="../../level1.txt", mimeType = 'application/octet-stream')]
		private static var tilemap : Class;
		
		override public function setup() : void 
		{
			setPlayer(500, 400);
			addElement( Mushroom, 400, 400 );
		}
		
		override public function getTilemap() : String
		{
			return new tilemap();
		}
		
	}

}