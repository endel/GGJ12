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
		protected var _vecMcModel:Vector.<MovieClipToBitmapModel>;
		protected var _vecAnimaModel:Vector.<AnimationModel>;
		protected var _spriteSheet:SpriteSheetData;
		
		public function AnimationStruct() 
		{
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
		
	}

}