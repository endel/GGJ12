package rufus.effects 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
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
			layer1.scrollFactor = new FlxPoint(0.3, 0.3);
			
			var layer2 : FlxSprite = new FlxSprite();
			layer2.loadGraphic(bitmap2);
			layers.push( layer2 );
			add( layer2 );
			layer2.scrollFactor = new FlxPoint(0.7, 0.7);
			
			var layer3 : FlxSprite = new FlxSprite();
			layer3.loadGraphic(bitmap3);
			layers.push( layer3 );
			add( layer3 );
			layer3.scrollFactor = new FlxPoint(1, 1);
		}
		
		
	}

}