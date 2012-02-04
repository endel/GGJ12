package rufus.levels
{
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import rufus.core.Game;
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
	public class Menu extends FlxState
	{
		//[Embed(source = "../../../res/tilemaps/lvl1data.txt", mimeType = 'application/octet-stream')]
		[Embed(source="../../../res/rufus-game-interface.png")]
		private static var tilemap : Class;
		private var back:FlxSprite
		public function Menu() : void 
		{
			back = new FlxSprite
			back.loadGraphic(tilemap);
			add(back);
			
		FlxG.mouse.show()
			
			FlxG.stage.addEventListener(MouseEvent.CLICK, onClick)
			//setPlayer(20, 500);
			//addElement(Mushroom, 950, 380);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			trace( "onClick : " + onClick );
			FlxG.stage.removeEventListener(MouseEvent.CLICK, onClick)
			Game.instance.gotoNextLevel();
		}
		
	}

}