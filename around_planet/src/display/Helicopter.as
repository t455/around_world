package display 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author 
	 */
	public class Helicopter extends MoveableObject 
	{
		private var _velocity:Number = 0.065;
		
		private const AMPLITUDE:int = 20;
		
		public function Helicopter() 
		{
			super(new HelicopterClip());
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private functions
		//
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//
		//  Public functions
		//
		//--------------------------------------------------------------------------
		
		public function setDirection(value:int):void
		{
			_velocity = Math.abs(_velocity) * value;
			sprite.scaleY = value;
		}
		
		private var _time:Number = 0;
		override public function update():void 
		{
			angle += _velocity;
			
			_time += 0.02;
			var dh:Number = Math.sin(_time) * AMPLITUDE;
			distance = startDistance + dh;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Events handlers
		//
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//
		//  Getters/Setters
		//
		//--------------------------------------------------------------------------
		
	}

}