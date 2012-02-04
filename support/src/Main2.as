package 
{
	import animation.EnemyAnimation;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	import jframe.graphics.BitmapSaver;
	import jframe.graphics.PNGEncoder;
	
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var enemy : EnemyAnimation = new EnemyAnimation(120, 100);
			savePNG(enemy.content, "enemy.png");
		}
		
		private function savePNG(source : DisplayObject, filename : String):void{
			var file:File = File.applicationDirectory.resolvePath("res/" + filename);
			var stream : FileStream = new FileStream()
			stream.open(file, FileMode.WRITE);
			stream.writeObject( getPNGByteArray(source) );
			stream.close();
		}
		
		private function getPNGByteArray(source : DisplayObject) : ByteArray {
			var bitmap:BitmapData = new BitmapData(source.width, source.height);
			bitmap.draw( source );
			return PNGEncoder.encode( bitmap );
		}
		
	}
	
}