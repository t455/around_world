package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author  
	 */
	public class Rocket extends Sprite 
	{
		private var timer:Timer;
		
		private var speed:Number = 0;
		
		public var startDelay:int = 10;
		public var label:Label;
		
		private const START_DISTANCE:Number = 70;
		private const FINISH_DISTANCE:Number = 170;
		
		public function Rocket() 
		{	
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var startDistance:Number = 70;
			
			this.x = Math.cos(this.rotation * Math.PI / 180) * startDistance;
			this.y = Math.sin(this.rotation * Math.PI / 180) * startDistance;
			
			timer = new Timer(1000, startDelay);
			timer.addEventListener(TimerEvent.TIMER, timerTickHandler);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, timerCompleteHandler);
			
			timer.start();
			
			var currentTime:int = timer.repeatCount - timer.currentCount;
			if(label)
				label.time_txt.text = "00:" + (currentTime < 10 ? ("0" + currentTime) : currentTime);
		}
		
		private function enterFrameHandler(e:Event):void 
		{
			var stepX:Number = Math.cos(this.rotation * Math.PI / 180) * speed;
			var stepY:Number = Math.sin(this.rotation * Math.PI / 180) * speed;
			
			this.x += stepX;
			this.y += stepY;
			
			speed += .0010;
			
			var dist:Number = Math.sqrt((this.x * this.x) + (this.y * this.y));
			
			var progress:Number = (dist - START_DISTANCE) / (FINISH_DISTANCE - START_DISTANCE);
			if (progress < 1) label.progress_mc.line_mc.scaleX = progress;
		}
		
		private function timerTickHandler(e:TimerEvent):void 
		{
			var currentTime:int = timer.repeatCount - timer.currentCount;
			if(label)
				label.time_txt.text = "00:" + (currentTime < 10 ? ("0" + currentTime) : currentTime);
		}
		
		private function timerCompleteHandler(e:TimerEvent):void 
		{
			label.progress_mc.visible = true;
			label.time_txt.visible = false;
			
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
	}

}