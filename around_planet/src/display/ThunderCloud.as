package display
{
	import display.MoveableObject;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Fushigi
	 */
	public class ThunderCloud extends MoveableObject 
	{
		private var _velocity:Number = 0.025;
		
		public function ThunderCloud() 
		{
			super(new ThunderCloudClip());
		}
		
		
		override public function update():void
		{
			angle += _velocity;
		}
	}

}