package
{
	import animation.EnemyAnimation;
	import animation.PlayerAnimation;
	import flash.display.BlendMode;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import org.flixel.*;
	import rufus.core.ILevel;
	import rufus.levels.Level1;
	
	[SWF(width="1024", height="640", backgroundColor="#000000")]
	[Frame(factoryClass = "Preloader")]
	

	public class Main extends Sprite
	{
		private var game : FlxGame;
		
		//[Embed(source = "../bin/cenario dia1.png")] private var dia:Class;
		//[Embed(source = "../bin/cenario noite2.png")]	private var noite:Class;
		//[Embed(source = "../bin/seamlesstexture6_1200.jpg")] private var texture:Class;
		[Embed(source = "seamlesstexture6_1200.jpg")] private var texture:Class;
		
		[Embed(source = "BG-seila.png")] private var background:Class;
		[Embed(source = "BG-seila2.png")] private var backgroundNight:Class;
		
		private var contentDia:Sprite;
		private var contentNoite:Sprite;
		private var contentTextura:Sprite;
		private var _mask:Sprite;
		private var _topMask:Sprite;
		
		public function Main()
		{
			contentDia = new Sprite();
			contentNoite = new Sprite();
			contentTextura = new Sprite();
			_topMask = new Sprite();
			
			contentDia.addChild(new background)
			contentNoite.addChild(new backgroundNight)
			//contentTextura.addChild(new texture);
			
			//_topMask = new Sprite();
			//var fillType:String = "linear"
			//var colors:Array = [0x000000, 0x000000];
			//var alphas:Array = [.7, 0];
			//var ratios:Array = [0x77,0xff];			
			//var matrix:Matrix = new Matrix();
			//matrix.createGradientBox(1200, 600, 0, 0, 0);
			//var spreadMethod:String = "pad";
			//_topMask.graphics.beginFill(0x990088);
			//_topMask.graphics.beginGradientFill(fillType, colors, alphas,ratios,matrix,spreadMethod );
			//_topMask.graphics.drawRect(0, 0, 1200, 650);
			//_topMask.cacheAsBitmap = true;
			//_topMask.blendMode = BlendMode.OVERLAY;
			//
			//_mask = new Sprite();			
			//
			//fillType = "linear"
			//colors = [0x000000, 0x000000];
			//alphas = [0, 1];
			//ratios = [0x11,0xff];			
			//matrix = new Matrix();
			//matrix.createGradientBox(100, 20, 0, 0, 0);
			//spreadMethod = "pad";
			//_mask.graphics.beginGradientFill(fillType, colors, alphas,ratios,matrix,spreadMethod );
			//_mask.graphics.beginFill(0 );
			//_mask.graphics.drawRect(0, 0, 1200, 650);
			//_mask.cacheAsBitmap = true;
			
			//addChild(contentNoite)
			//addChild(contentDia)
			//addChild(_mask)
			
			//addChild(_topMask)
			//contentTextura.alpha = .5
			//contentTextura.blendMode = BlendMode.OVERLAY;
			
			//contentDia.mask = _mask;
			//contentDia.cacheAsBitmap = true;
			
			game = new FlxGame(1024, 640, Level1, 1, 64, 64);
			addChild(game);
			
			//var _mask:Sprite = new Sprite();
			//_mask.graphics.beginFill(0x000000);
			//_mask.graphics.drawRect(0, 0, 500, 650);
			//addChild(_mask);
			//_mask.alpha = .8
			//_mask.blendMode = BlendMode.OVERLAY
			
			//addChild(contentTextura)
			//addChild(contentTextura)
			//addChild(_topMask)
		}
	}
}