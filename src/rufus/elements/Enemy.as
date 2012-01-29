package rufus.elements 
{
	import animation.EnemyAnimation;
	import org.flixel.FlxPath;
	import rufus.core.GameObject;
	
	/**
	 * ...
	 * @author Endel Dreyer, Jefferson Ramos
	 */
	public class Enemy extends GameObject 
	{
		private var state : uint;
		
		static public const STATE_ANGEL:String = "stateAngel";
		static public const STATE_DEMON:String = "stateDemon";
		
		// -> Usando FlxPath: https://github.com/AdamAtomic/FlxCollisions/blob/master/src/PlayState.as
		private var path : FlxPath;
		private var _animation:EnemyAnimation;
		
		public function Enemy() 
		{
			_animation = new EnemyAnimation(120, 120);
			width = _animation.width;
			height = _animation.height;
			
			sprite = new FlxSprite(_animation.content.width, _animation.content.height);
			sprite.loadGraphic(_animation.content, true, true, width, height);
			
			sprite.addAnimation(DEMON_WALK, []);
			
			/*
			1..45 - cachorro anda
			46..54 - cachorro idle
			55..75 - cachorro rosnando
			
			76..98 - cão pulo
			> 76..85 - (pulo) sobe
			> 85..89 - (pulo) no ar
			> 89..98 - (pulo) caindo
			
			99..103 - cachorro se abaixando
			104..115 - cachorro loop comendo
			
			116..130 - swap cachorro / coelho
			131..149 - coelho andando
			150..155 - coelho parado
			*/
		}
		
	}

}