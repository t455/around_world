package  
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author 
	 */
	public class Constants 
	{
		static public const SCREEN_DIMENSIONS:Point = new Point(800, 600);
		static public const HALF_SCREEN_DIMENSIONS:Point = new Point(SCREEN_DIMENSIONS.x * .5, SCREEN_DIMENSIONS.y * .5);
		static public const TO_RAD:Number = Math.PI / 180;
		static public const TO_DEG:Number = 180 / Math.PI;
	}

}