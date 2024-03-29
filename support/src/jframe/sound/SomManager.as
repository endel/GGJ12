package jframe.sound
{

	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	/**
	 * ...
	 * @author Jeff
	 */
	public class SomManager
	{
		
		// Todos os tipos de sons, você declara aqui
		static public var SOM_AMBIENTE:Sound = new SomAmbiente;
		static public var GET_CARROT:Sound = new PegouCenoura;
		static public var GET_MUSH:Sound = new PegouCogumelo;
		static public var WALK:Sound = new SoundCoelhoAnda;
		static public var SWAP:Sound = new Swap;
		static public var WALKBUNNY:Sound = new BunnyWalk;
		private static var somAtual:Sound;		
		public static var VOLUME:Number = 1;		
		static private var soundChann:SoundChannel;
		static private var soundTransf:SoundTransform;
		static private var _varMute:Boolean = false;
		static private var soundTransfAmbiente:SoundTransform;
		static private var soundChannAmbiente:SoundChannel;
		static private var _somAmbiente:Sound;
		
		public function SomManager()
		{
		
		}
		
		// Esse método será o responsável por reproduzir o som.
		// Perceba como esse método é "static", para que eu possa usá-lo sem a necessidade de instanciar a classe (assim como todos os tipos de sons que declarei lá em cima também são static por essa mesma razão!)
		public static function playSound(snd:Sound, loops:Number = 1, volumee:Number = -1):void
		{
			
			if (!_varMute)
			{
				
				somAtual = snd;
				
				// ".5" é o que controla de qual lado um som estéreo sairá. .5 seria o meio termo (sai o mesmo volume tanto do lado esquerdo, quanto do direito)
				soundTransf = new SoundTransform(VOLUME, volumee > 0 ? volumee :.4);
				soundChann = somAtual.play(0, loops);
				soundChann.soundTransform = soundTransf;
			}
		}
		
		public static function changeSoundAmbiente(_sound:Sound):void
		{
			{
				try
				{
					soundChannAmbiente.stop();
				}
				catch (err:Error)
				{
					
				}
				soundChannAmbiente = new SoundChannel()
				_somAmbiente = _sound
			}
		}
		
		// Esse método será o responsável por reproduzir o som.
		// Perceba como esse método é "static", para que eu possa usá-lo sem a necessidade de instanciar a classe (assim como todos os tipos de sons que declarei lá em cima também são static por essa mesma razão!)
		public static function playSoundAmbiente(id:int = 1):void
		{
			if (!_varMute)
			{
				// ".5" é o que controla de qual lado um som estéreo sairá. .5 seria o meio termo (sai o mesmo volume tanto do lado esquerdo, quanto do direito)
				soundTransfAmbiente = new SoundTransform(.4, .8);
				soundChannAmbiente = _somAmbiente.play(0, int.MAX_VALUE);
				soundChannAmbiente.soundTransform = soundTransfAmbiente;
			}
		}
		
		public static function mute():void
		{
			_varMute = true;
			if (soundChann)
				soundChann.stop();
			if (soundChannAmbiente)
				soundChannAmbiente.stop();
		}
		
		public static function unmute(_loop:int = 1):void
		{
			_varMute = false;
			playSoundAmbiente();
		}
		
		static public function get varMute():Boolean 
		{
			return _varMute;
		}
	
	}
}
