package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	/**
	 * ...
	 * @author  
	 */
	public class Layer extends Sprite 
	{
		
		public function Layer() 
		{
			super();
			
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}
		
		private function mouseDownHandler(e:MouseEvent):void 
		{
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			
			startAngle = Math.atan2(mouseY, mouseX) * (180 / Math.PI);
			
			Mouse.cursor = MouseCursor.HAND;
			
			removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		private var startAngle:Number = 0;
		private var diff:Number = 0;
		private function mouseMoveHandler(e:MouseEvent):void 
		{
			var currAngle:Number = Math.atan2(mouseY, mouseX) * (180 / Math.PI);
			diff = currAngle - startAngle;
			this.rotation += diff;
		}
		
		private function mouseUpHandler(e:MouseEvent):void 
		{
			stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			
			Mouse.cursor = MouseCursor.AUTO;
			
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			
			var dir:int = diff / Math.abs(diff);
			diff = Math.min(2, Math.abs(diff)) * dir;
			
			if (Math.abs(diff) < 1)
				diff = 0;
		}
		
		private function enterFrameHandler(e:Event):void 
		{
			diff *= 0.98;
			this.rotation += diff;
			
			if (Math.abs(diff) < .15)
				removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
	}

}