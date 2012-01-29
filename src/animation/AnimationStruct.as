package animation 
{
	import jframe.graphics.MovieClipToBitmapModel;
	import jframe.graphics.SpriteSheetData;
	/**
	 * ...
	 * @author Jeff
	 */
	public class AnimationStruct 
	{
		protected var _width : uint;
		protected var _height : uint;
		protected var _vecMcModel:Vector.<MovieClipToBitmapModel>;
		protected var _vecAnimaModel:Vector.<AnimationModel>;
		protected var _spriteSheet:SpriteSheetData;
		
		public function AnimationStruct(width : uint, height : uint) 
		{
			this._height = height;
			this._width = width;
			//essa classe deve armazenar os labels e as AnimaTesteções, também seu tempo. deve ter alguns metodos reutilizaveis. porém cada entidade vai ter a sua distinta
			
		}
		
		public function get vecMcModel():Vector.<MovieClipToBitmapModel> 
		{
			return _vecMcModel;
		}
		
		public function get vecAnimaModel():Vector.<AnimationModel> 
		{
			return _vecAnimaModel;
		}
		
		public function get spriteSheet():SpriteSheetData 
		{
			return _spriteSheet;
		}
		
		public function get width():uint 
		{
			return _width;
		}
		
		public function set width(value:uint):void 
		{
			_width = value;
		}
		
		public function get height():uint 
		{
			return _height;
		}
		
		public function set height(value:uint):void 
		{
			_height = value;
		}
		
	}

}