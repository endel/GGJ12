package jframe.graphics 
{
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author Jeff
	 */
	public class SpriteSheetData
	{
		private var mVec:Vector.<MovieClipToBitmapModel>;
		private var _content:Bitmap;
		private var _tileWidth:int;
		private var _tileHeight:int;
		/**
		 * Classe que gera o spritesheet
		 */
		public function SpriteSheetData() 
		{
			mVec = new Vector.<MovieClipToBitmapModel>();			
		}
		/**
		 * Adiciona models com os movie clips e a quantidade de quadros que deve ter
		 * @param	McModel
		 */
		public function appendAnimation(McModel:MovieClipToBitmapModel):void
		{
			mVec.push(McModel)
		}
		/**
		 * Cria o spritesheet
		 * @param	tileWidth largura do tile
		 * @param	tileHeight altura do tile
		 * @param	scale escala
		 * @param	tilesPerLines tiles por linhas
		 */
		public function createSpriteSheet(tileWidth:int, tileHeight:int, scale:Number = 1, tilesPerLines:int = 5):void
		{
			this._tileHeight = tileHeight;
			this._tileWidth = tileWidth;
			_content = new Bitmap((BitmapDataConverter.parseMovieClips(mVec, _tileWidth, _tileHeight, scale, tilesPerLines)));
		}
		/**
		 * Esse é o bitmap do spritesheet gerado
		 */
		public function get content():Bitmap 
		{
			return _content;
		}
		
		public function get tileWidth():int 
		{
			return _tileWidth;
		}
		
		public function get tileHeight():int 
		{
			return _tileHeight;
		}
		
	}

}