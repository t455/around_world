package 
{
	import com.greensock.TweenLite;
	import display.Airplane;
	import display.Helicopter;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	import system.Direction;
	
	/**
	 * ...
	 * @author 
	 */
	public class Main extends Sprite 
	{
		private var planet:Planet;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			planet = new Planet();
			planet.x = Constants.HALF_SCREEN_DIMENSIONS.x;
			planet.y = Constants.HALF_SCREEN_DIMENSIONS.y;
			addChild(planet);
			
			planet.addRocket();
			planet.addRocket();
			planet.addRocket();
			
			const numberOfLayers:int = 4;
			for (var i:int = 0; i < numberOfLayers; i++) {
				planet.addLayer();
			}
			
			planet.addObjectOnLayer(ObjectTypes.THUNDERCLOUD, 3);
			planet.addObjectOnLayer(ObjectTypes.THUNDERCLOUD, 2);
			planet.addObjectOnLayer(ObjectTypes.THUNDERCLOUD, 1);
			planet.addObjectOnLayer(ObjectTypes.AIRPLANE, 3);
			planet.addObjectOnLayer(ObjectTypes.HELICOPTER, 2);
			
			var airplane:Airplane = planet.addObjectOnLayer(ObjectTypes.AIRPLANE, 2) as Airplane;
			var helicopter:Helicopter = planet.addObjectOnLayer(ObjectTypes.HELICOPTER, 1) as Helicopter;
			
			airplane.setDirection(Direction.LEFT);
			helicopter.setDirection(Direction.LEFT);
			
			stage.addEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
			stage.addEventListener(MouseEvent.CLICK, stage_click);
		}
		
		private function stage_click(e:MouseEvent):void 
		{
			planet.launchRocket();
		}
		
		private const MIN_SCALE:Number = 0.2;
		private const MAX_SCALE:Number = 1.5;
		
		private function mouseWheelHandler(e:MouseEvent):void 
		{
			var newScale:Number = planet.scaleX - (e.delta / 10);
			newScale = Math.min(newScale, MAX_SCALE);
			newScale = Math.max(newScale, MIN_SCALE);
			
			TweenLite.to(planet, 0.5, { scaleX:newScale, scaleY:newScale } );
		}
		
	}
	
}