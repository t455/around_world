package
{
	import com.greensock.TweenLite;
	import com.sevenson.geom.sat.Collision;
	import display.Airplane;
	import display.Helicopter;
	import display.ThunderCloud;
	import display.Layer;
	import display.MoveableObject;
	import display.Rocket;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author 
	 */
	public class Planet extends Sprite 
	{
		private const RADIUS:int = 120;
		private const LAYER_THICKNESS:int = 80;
		private const COLOR_PLANET:uint = 0xAED13A;
		private const COLOR_LAYERS:Array = [0x51B2DA, 0x3C7FB6, 0x414F86, 0x452C4A];
		
		private var _layers:Vector.<Layer> = new Vector.<Layer>();
		private var _objects:Vector.<MoveableObject> = new Vector.<MoveableObject>();
		private var _rockets:Vector.<Rocket> = new Vector.<Rocket>();
		
		public function Planet() 
		{
			var circle:Shape = new Shape();
			circle.graphics.beginFill(COLOR_PLANET)
			circle.graphics.drawCircle(0, 0, RADIUS);
			addChild(circle);
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			for (var i:int = 0; i < _objects.length; i++) 
			{
				var object:MoveableObject = _objects[i];
				object.update();
				object.angle += _layers[object.layerID].rotationDiff;
				
				for (var j:int = 0; j < _rockets.length; j++) 
				{
					var rocket:Rocket = _rockets[j];
					rocket.update();
					
					if (Collision.testBoolean(rocket.collisionBox, object.collisionBox)) {
						rocket.alpha = Math.random();
						
						removeObject(object);
						removeRocket(rocket);
					} else if (rocket.distance > 800) {
						removeRocket(rocket);
					}
				}
			}
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
		
		public function addLayer():void
		{
			var numberOfLayers:int = _layers.length;
			var innerRadius:Number = RADIUS + numberOfLayers * LAYER_THICKNESS;
			var outerRadius:Number = innerRadius + LAYER_THICKNESS;
			var layer:Layer = new Layer(innerRadius, outerRadius, COLOR_LAYERS[numberOfLayers]);
			addChildAt(layer, 0);
			
			_layers.push(layer);
		}
		
		public function addRocket():void
		{
			var rocket:Rocket = new Rocket();
			rocket.distance = RADIUS+rocket.width/2;
			rocket.angle = int(Math.random() * 360);
			addChild(rocket);
			
			_rockets.push(rocket);
		}
		
		public function addObjectOnLayer(type:uint, layer:int):MoveableObject
		{
			var object:MoveableObject;
			
			switch (type) 
			{
				case ObjectTypes.AIRPLANE: 			object = new Airplane();		break;
				case ObjectTypes.HELICOPTER: 		object = new Helicopter();		break;
				case ObjectTypes.THUNDERCLOUD: 		object = new ThunderCloud();	break;
				default:
			}
			
			if (object) {
				object.layerID = layer;
				object.distance = RADIUS + layer * LAYER_THICKNESS + LAYER_THICKNESS * .5;
				object.startDistance = object.distance;
				object.angle = int(Math.random() * 360);
				addChild(object);
				
				_objects.push(object);
			}
			
			return object;
		}
		
		public function removeObject(object:MoveableObject):void
		{
			var index:int = _objects.indexOf(object);
			if (index >= 0) {
				_objects.splice(index, 1);
				
				removeChild(object);
			}
		}
		
		public function removeRocket(rocket:Rocket):void
		{
			var index:int = _rockets.indexOf(rocket);
			if (index >= 0) {
				_rockets.splice(index, 1);
				
				removeChild(rocket);
			}
		}
		
		public function launchRocket():void 
		{
			if(_rockets.length > 0)
				_rockets[0].launch();
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