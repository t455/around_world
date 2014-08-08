package
{
	import com.greensock.TweenLite;
	import com.sevenson.geom.sat.Collision;
	import display.Cloud;
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
					if (Collision.testBoolean(rocket.collisionBox, object.collisionBox))
						rocket.alpha = Math.random();
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
		
		public function addCloudAt(id:int = 0):void
		{
			var cloud:Cloud = new Cloud();
			cloud.layerID = id;
			cloud.distance = RADIUS + id * LAYER_THICKNESS + (Math.random() * LAYER_THICKNESS) / 2 + LAYER_THICKNESS / 2;
			
			cloud.angle = int(Math.random() * 360);
			addChild(cloud);
			_objects.push(cloud);
		}
		
		
		public function addObjectOnLayer():void
		{
			//var mo:MoveableObject = new MoveableObject();
			//mo.graphics.beginFill(0x00ff00);
			//mo.graphics.drawRect( -10, -20, 20, 40);
			//mo.distance = 150;
			//mo.angle = int(Math.random() * 360);
			//addChild(mo);
			//
			//_objects.push(mo);
		}
		
		public function launchRocket():void 
		{
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