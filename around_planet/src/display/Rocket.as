package display 
{
	import com.greensock.easing.Cubic;
	import com.greensock.TweenLite;
	/**
	 * ...
	 * @author Fushigi
	 */
	public class Rocket extends MoveableObject
	{
		private var speed:Number = 0;
		private var launched:Boolean = false;
		
		public function Rocket() 
		{
			super(new RocketClip);
		}
		
		public function launch():void
		{
			launched = true;
		}
		
		override public function update():void
		{
			if (launched)
			{
				speed += 0.001;
				distance += speed;
			}
		}
	}

}