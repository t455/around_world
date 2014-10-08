package display 
{
	import com.sevenson.geom.sat.shapes.Box;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author  
	 */
	public class MoveableObject extends Sprite 
	{
		private var _collisionBox:Box = new Box(50, 50);
		private var _angle:Number = 0;
		private var _distance:Number = 0;
		
		public var layerID:int = 0;
		public var sprite:MovieClip;
		public var startDistance:Number = 0;
		
		public function MoveableObject(visual:MovieClip) 
		{
			sprite = visual;
			var collisionSprite:Sprite = sprite.getChildByName("collision_mc") as Sprite;
			if (collisionSprite) {
				collisionSprite.visible = false;
				_collisionBox.width = collisionSprite.width;
				_collisionBox.height = collisionSprite.height;
			}
			addChild(sprite);
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
		public function update():void
		{
			
		}
		
		public function get collisionBox():Box 
		{
			return _collisionBox;
		}
		
		override public function set x(value:Number):void 
		{
			super.x = value;
			_collisionBox.x = value;
		}
		
		override public function set y(value:Number):void 
		{
			super.y = value;
			_collisionBox.y = value;
		}
		
		override public function set rotation(value:Number):void 
		{
			super.rotation = value;
			_collisionBox.rotation = value;
		}
		
		public function get distance():Number 
		{
			return _distance;
		}
		
		public function set distance(value:Number):void 
		{
			_distance = value;
			this.x = Math.cos(this.rotation * Constants.TO_RAD) * _distance;
			this.y = Math.sin(this.rotation * Constants.TO_RAD) * _distance;
		}
		
		public function get angle():Number 
		{
			return _angle;
		}
		
		public function set angle(value:Number):void 
		{
			_angle = value;
			rotation = _angle;
			this.x = Math.cos(this.rotation * Constants.TO_RAD) * _distance;
			this.y = Math.sin(this.rotation * Constants.TO_RAD) * _distance;
		}
		
	}

}