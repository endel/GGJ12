package rufus.elements 
{
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class BackgroundNight extends Box 
	{
		[Embed(source = "../../BG-seila2.png")] private var backgroundNight:Class;
		
		public function BackgroundNight() 
		{
			var _back:Bitmap = new backgroundNight;
			setStaticGraphic(_back, _back.width, _back.height);
			immovable = true;
			
		}
		
	}

}