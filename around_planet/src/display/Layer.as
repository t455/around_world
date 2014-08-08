package display 
{
	import base.ILayer;
	import com.greensock.easing.Cubic;
	import com.greensock.TweenLite;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	/**
	 * ...
	 * @author 
	 */
	public class Layer extends Sprite implements ILayer 
	{
		private var _innerRadius:Number;
		private var _outerRadius:Number;
		
		public var rotationDiff:Number = 0;
		public var angle:Number = 0;
		
		public function Layer(innerRadius:Number = 0, outerRadius:Number = 0, color:uint = 0x333333) 
		{
			_innerRadius = innerRadius;
			_outerRadius = outerRadius;
			
			if (_outerRadius < _innerRadius)
				_outerRadius = _innerRadius;
			
			draw(color);
			
			TweenLite.from(this, 1.5, { scaleX:0, scaleY:0, ease:Cubic.easeOut } );
			//TweenLite.from(this, 1.5, { alpha:0, ease:Cubic.easeOut } );
			
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private functions
		//
		//--------------------------------------------------------------------------
		
		private function draw(color:uint):void 
		{
			graphics.beginFill(color);
			graphics.drawCircle(0, 0, outerRadius);
			graphics.drawCircle(0, 0, innerRadius);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public functions
		//
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//
		//  Events handlers
		//
		//--------------------------------------------------------------------------
		
		private var _starAngle:Number;
		private function mouseDownHandler(e:MouseEvent):void 
		{
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			stage.addEventListener(Event.ENTER_FRAME, mouseMoveHandler);
			
			Mouse.cursor = MouseCursor.HAND;
			
			removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
			
			_starAngle = Math.atan2(mouseY, mouseX) * Constants.TO_DEG;
		}
		
		private function mouseUpHandler(e:MouseEvent):void 
		{
			stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			stage.removeEventListener(Event.ENTER_FRAME, mouseMoveHandler);
			
			Mouse.cursor = MouseCursor.AUTO;
			
			var absRotationDiff:Number = Math.abs(rotationDiff);
			var dir:int = rotationDiff / absRotationDiff;
			rotationDiff = Math.min(2, absRotationDiff);
			
			if (rotationDiff < 1) {
				rotationDiff = 0;
			} else {
				rotationDiff *= dir;
				addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			}
		}
		
		public var total:Number = 0;
		private function mouseMoveHandler(e:Event):void 
		{
			angle = Math.atan2(mouseY, mouseX) * Constants.TO_DEG;
			rotationDiff = angle - _starAngle;
			_starAngle = angle;
			
			total += rotationDiff;
		}
		
		private function enterFrameHandler(e:Event):void 
		{
			rotationDiff *= 0.98;
			angle += rotationDiff;
			
			if (Math.abs(rotationDiff) < .15) {
				rotationDiff = 0;
				removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  Getters/Setters
		//
		//--------------------------------------------------------------------------
		
		/* INTERFACE base.ILayer */
		
		public function get innerRadius():Number 
		{
			return _innerRadius;
		}
		
		public function get outerRadius():Number 
		{
			return _outerRadius;
		}
		
	}

}