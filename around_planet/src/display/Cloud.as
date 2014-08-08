package display
{
	import display.MoveableObject;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Fushigi
	 */
	public class Cloud extends MoveableObject 
	{
		
		public function Cloud() 
		{
			super(new ThunderCloudClip());
		}
		
		
		override public function update():void
		{
			angle += 0.05;
		}
	}

}