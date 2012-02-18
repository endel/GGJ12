package rufus.scenes 
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
	public class MainMenu extends FlxState
	{
		[Embed(source="../../../res/rufus-game-interface.png")]
		private static var background : Class;
		private var back:FlxSprite
		
		public function MainMenu() : void 
		{
			back = new FlxSprite
			back.loadGraphic(background);
			add(back);
			
			FlxG.mouse.show();
			FlxG.stage.addEventListener(MouseEvent.CLICK, onClick)
		}
		
		private function onClick(e:MouseEvent):void 
		{
			FlxG.stage.removeEventListener(MouseEvent.CLICK, onClick)
			Game.instance.gotoNextLevel();
		}
		
	}

}