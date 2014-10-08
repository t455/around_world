package display 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author 
	 */
	public class Airplane extends MoveableObject 
	{
		private var _velocity:Number = 0.2;
		
		public function Airplane() 
		{
			super(new PlaneClip());
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
		
		override public function update():void 
		{
			angle += _velocity;
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