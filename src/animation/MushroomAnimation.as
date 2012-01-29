package animation 
{
	import flash.display.Bitmap;
	import jframe.graphics.MovieClipToBitmapModel;
	import jframe.graphics.SpriteSheetData;
	/**
	 * ...
	 * @author Jeff
	 */
	public class MushroomAnimation extends AnimationStruct
	{
		private var _content:Bitmap;
		static public const STOPPED:String = "stopped";
		static public const FALLING:String = "falling";
		static public const JUMP:String = "jump";
		static public const FALL:String = "fall";
		static public const IDLE:String = "idle";
		static public const WALK:String = "walk";
		
		public function MushroomAnimation(width : uint, height : uint)
		{
			super(width, height);
			_spriteSheet = new SpriteSheetData();
			_spriteSheet.appendAnimation(new MovieClipToBitmapModel(new MushroomAnima, 0));
			_spriteSheet.createSpriteSheet(_width, _height, .1, 12);
			_spriteSheet.content.bitmapData.draw(_spriteSheet.content);
			_content = _spriteSheet.content;
		}
		
		public function get content():Bitmap 
		{
			return _content;
		}
		
		public function set content(value:Bitmap):void 
		{
			_content = value;
		}
	
	}

}