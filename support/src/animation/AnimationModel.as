package animation 
{
	/**
	 * ...
	 * @author Jeff
	 */
	public class AnimationModel 
	{
		private var _animaLabel:String;
		private var _vecFrames:Array;
		private var _timeAnimation:Number;
		
		public function AnimationModel(animaLabel:String, vecFrames:Array, timeAnimation:Number) 
		{
			this._timeAnimation = timeAnimation;
			this._vecFrames = vecFrames;
			this._animaLabel = animaLabel;
		}
		
		public function get animaLabel():String 
		{
			return _animaLabel;
		}
		
		public function get vecFrames():Array 
		{
			return _vecFrames;
		}
		
		public function get timeAnimation():Number 
		{
			return _timeAnimation;
		}
		
	}

}