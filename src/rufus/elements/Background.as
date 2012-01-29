package rufus.elements 
{
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class Background extends Box 
	{
		[Embed(source = "../../BG-seila.png")] private var background:Class;
		
		public function Background() 
		{
			var _back:Bitmap = new background;
			setStaticGraphic(_back, _back.width, _back.height);
			immovable = true;
			
		}
		
	}

}