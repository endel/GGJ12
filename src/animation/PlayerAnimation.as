package animation 
{
	import flash.display.Bitmap;
	import jframe.graphics.MovieClipToBitmapModel;
	import jframe.graphics.SpriteSheetData;
	/**
	 * ...
	 * @author Jeff
	 */
	public class PlayerAnimation extends AnimationStruct
	{
		private var _content:Bitmap;
		static public const STOPPED:String = "stopped";
		static public const FALLING:String = "falling";
		static public const JUMP:String = "jump";
		static public const FALL:String = "fall";
		static public const IDLE:String = "idle";
		static public const WALK:String = "walk";
		
		public function PlayerAnimation() 
		{
			_spriteSheet = new SpriteSheetData();
			_spriteSheet.appendAnimation(new MovieClipToBitmapModel(new AnimaPlayer, 0));
			_spriteSheet.createSpriteSheet(120, 100, .3, 12);			
			_content = _spriteSheet.content;
		}
		/**
		 * Auxilia a fazer o array
		 * @param	totFrames
		 * @param	initFrame
		 * @return
		 */
		private function makeAnimaArray(totFrames:int, initFrame:int = 0):Array 
		{
			var tempArray:Array = new Array();
			for (var i:int = 0; i < totFrames; i++) 
			{
				tempArray.push(initFrame + i);
			}
			trace( "tempArray : " + tempArray );
			return tempArray;
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