package
{
	import animation.EnemyAnimation;
	import animation.MushroomAnimation;
	import animation.PlayerAnimation;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.FileReference;
	import flash.utils.ByteArray;
	import jframe.graphics.PNGEncoder;
	
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class Main extends Sprite
	{
		
		public function Main():void
		{
			var appDirFile:File = new File();
			appDirFile.browseForDirectory("Where you want to save generated assets?");
			appDirFile.addEventListener(Event.SELECT, function(e:Event) {
					var enemy:EnemyAnimation = new EnemyAnimation(120, 100);
					savePNG(appDirFile, enemy.content, "enemy.png");
					
					var mushroom:MushroomAnimation = new MushroomAnimation(100, 100);
					savePNG(appDirFile, mushroom.content, "mushroom.png");
					
					var player:PlayerAnimation = new PlayerAnimation(120, 120);
					savePNG(appDirFile, player.content, "rufus.png");
				});
		
		}
		
		private function savePNG(dirFile:File, source:DisplayObject, filename:String):void
		{
			var file:File = dirFile.resolvePath(filename);
			trace("Saving... " + file.url);
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.WRITE);
			stream.writeBytes(getPNGByteArray(source));
			stream.close();
		}
		
		private function getPNGByteArray(source:DisplayObject):ByteArray
		{
			var bitmap:BitmapData = new BitmapData(source.width, source.height, true, 0x00000000);
			bitmap.draw(source);
			return PNGEncoder.encode(bitmap);
		}
	
	}

}