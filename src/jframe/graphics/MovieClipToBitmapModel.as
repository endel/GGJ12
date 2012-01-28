package jframe.graphics 
{
	import flash.display.MovieClip;
	/**
	 * Armazena informações para criar as animações
	 * @author Jeff
	 */
	public class MovieClipToBitmapModel 
	{
		/**
		 * MovieClip que será conmvertido
		 */
		private var _content:MovieClip;
		/**
		 * Numero de frames que deverá ter
		 */
		private var _shoudHaveFrames:int;
		/**
		 * 
		 * @param	content MovieClip que será convertido
		 * @param	shoudHaveFrames Quantodade de frames que deve ter
		 */
		public function MovieClipToBitmapModel(content:MovieClip, shoudHaveFrames:int) 
		{
			this._shoudHaveFrames = shoudHaveFrames;
			this._content = content;
			
		}
		
		public function get content():MovieClip 
		{
			return _content;
		}
		
		public function get shoudHaveFrames():int 
		{
			return _shoudHaveFrames;
		}
		
	}

}