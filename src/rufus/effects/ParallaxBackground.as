package rufus.effects 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class ParallaxBackground extends FlxGroup
	{
		[Embed(source = "../../../res/Paralax3.png")]
		protected var bitmap1 : Class;
		
		[Embed(source = "../../../res/Paralax2.png")]
		protected var bitmap2 : Class;
		
		[Embed(source = "../../../res/Paralax1.png")]
		protected var bitmap3 : Class;
		
		protected var layers : Vector.<FlxSprite>;
		protected var layerDistance : Number = 0.8;
		protected var layerDistanceMultiplier : Number = 0.9;
		
		public function ParallaxBackground() 
		{
			layers = new Vector.<FlxSprite>();
			
			var layer1 : FlxSprite = new FlxSprite();
			layer1.loadGraphic(bitmap1);
			layers.push( layer1 );
			add( layer1 );
			
			var layer2 : FlxSprite = new FlxSprite();
			layer2.loadGraphic(bitmap2);
			layers.push( layer2 );
			add( layer2 );
			
			var layer3 : FlxSprite = new FlxSprite();
			layer3.loadGraphic(bitmap3);
			layers.push( layer3 );
			add( layer3 );
		}
		
		override public function postUpdate():void 
		{
			var distance 	: Number = layerDistance,
				i 			: uint,
				numLayers 	: uint = layers.length;
			for (i = 0; i < numLayers; i++) {
				layers[i].x = ((FlxG.camera.target.x - (layers[i].width / 2)) * distance);
				layers[i].y = ((FlxG.camera.target.y - (layers[i].height / 2)) * distance);
				distance *= layerDistanceMultiplier;
			}
		}
		
	}

}