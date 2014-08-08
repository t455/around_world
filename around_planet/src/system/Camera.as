package system 
{
	import flash.display.DisplayObject;
	/**
	 * ...
	 * @author  
	 */
	public class Camera 
	{
		private var _parent:DisplayObject;
		private var _target:DisplayObject;
		
		public function Camera(parent:DisplayObject, target:DisplayObject) 
		{
			_parent = parent;
			_target = target;
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
		
		public function update():void
		{
			
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