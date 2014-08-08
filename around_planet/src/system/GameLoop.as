package system 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	/**
	 * ...
	 * @author  
	 */
	public class GameLoop extends Sprite 
	{
		private var _previousTime:int;
		private var _isStarted:Boolean;
		
		public function GameLoop() 
		{
			
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private functions
		//
		//--------------------------------------------------------------------------
		
		protected function update(dt:Number):void
		{
			
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public functions
		//
		//--------------------------------------------------------------------------
		
		public function start():void
		{
			if (!_isStarted) {
				_previousTime = getTimer();
				_isStarted = true;
				this.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			}
		}
		
		public function stop():void
		{
			if (_isStarted) {
				_isStarted = false;
				this.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  Events handlers
		//
		//--------------------------------------------------------------------------
		
		private function enterFrameHandler(e:Event):void 
		{
			var currentTime:int = getTimer();
			var diff:int = currentTime - _previousTime;
			
			_previousTime = currentTime;
			
			update(diff / 1000);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Getters/Setters
		//
		//--------------------------------------------------------------------------
		
	}

}