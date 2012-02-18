package rufus.effects 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class ParallaxForeground extends FlxGroup
	{
		[Embed(source = "../../../res/Paralax1.png")]
		protected var bitmap1 : Class;
		
		protected var layers : Vector.<FlxSprite>;
		protected var layerDistanceX : Number = 1.2;
		protected var layerDistanceY : Number = 1.4;
		
		public function ParallaxForeground() 
		{
			//layers = new Vector.<FlxSprite>();
			//
			//var layer1 : FlxSprite = new FlxSprite();
			//layer1.loadGraphic(bitmap1);
			//layers.push( layer1 );
			//add( layer1 );
		}
		
		override public function postUpdate():void 
		{
			//var distanceX 	: Number = layerDistanceX,
				//distanceY 	: Number = layerDistanceY,
				//i 			: uint,
				//numLayers 	: uint = layers.length;
			//for (i = 0; i < numLayers; i++) {
				//layers[i].x = ((FlxG.camera.target.x - (layers[i].width / 2)) * distanceX);
				//layers[i].y = ((FlxG.camera.target.y - (layers[i].height / 2)) * distanceY);
				//distanceX *= layerDistanceX;
				//distanceY *= layerDistanceY;
			//}
		}
		
	}

}