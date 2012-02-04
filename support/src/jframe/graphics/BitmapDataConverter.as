package jframe.graphics
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import jframe.image.ImageManipulation;
	
	/**
	 * Função responsável pela conversão de movieClips em spritesheets
	 * @author Jeff
	 */
	public class BitmapDataConverter
	{
		
		public function BitmapDataConverter()
		{
		
		}
		/**
		 * Converte um vector de MovieClips em um spriteSheet
		 * @param	vecMovies
		 * @return um bitmapData com o spritesheet
		 */
		public static function parseMovieClips(vecMovies:Vector.<MovieClipToBitmapModel>, tileWidth:int, tileHeight:int, scale:Number = 1, tilesPerLines:int = 10):BitmapData
		{
			var widthIdTile:int = 0;
			var heightIdTile:int = 0;
			var container:Sprite = new Sprite;
			for each (var item:MovieClipToBitmapModel in vecMovies)
			{
				
				var vec:Vector.<BitmapData> = MovieClipToBitmap.createBitmapFrameSequence(item.content, tileWidth, tileHeight,scale,-1,-1,item.shoudHaveFrames)
				for (var i:int = 0; i < vec.length; i++)
				{
					var tempBmp:Bitmap = new Bitmap(vec[i]);
					container.addChild(tempBmp);
					tempBmp.x = widthIdTile * tileWidth;
					tempBmp.y = heightIdTile * tileHeight;
					
					widthIdTile ++;
					if (widthIdTile >= tilesPerLines){
						widthIdTile = 0;
						heightIdTile ++;
					}
				}
			}
			var bDataReturn:BitmapData = ImageManipulation.displayObjectToBitmap(container).bitmapData;
			container = null
			return bDataReturn
		}
	
	}

}