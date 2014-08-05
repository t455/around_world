package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author  
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			var center:Point = new Point(stage.stageWidth * .5, stage.stageHeight * .5);
			
			var layer2:Layer2 = new Layer2();
			layer2.x = center.x;
			layer2.y = center.y;
			addChild(layer2);
			
			var layer:Layer1 = new Layer1();
			layer.x = center.x;
			layer.y = center.y;
			addChild(layer);
			
			var planet:Planet = new Planet();
			planet.x = center.x;
			planet.y = center.y;
			addChild(planet);
			
			var label1:Label = new Label();
			label1.title_txt.text = "rocket1";
			label1.progress_mc.visible = false;
			addChild(label1);
			
			var label2:Label = new Label();
			label2.y = 30;
			label2.title_txt.text = "rocket2";
			label2.progress_mc.visible = false;
			addChild(label2);
			
			var rocket:SomeRocket = new SomeRocket();
			rocket.startDelay = 5;
			rocket.rotation = -30;
			rocket.label = label1;
			planet.addChild(rocket);
			
			var rocket2:SomeRocket = new SomeRocket();
			rocket2.startDelay = 15;
			rocket2.rotation = 65;
			rocket2.label = label2;
			planet.addChild(rocket2);
		}
		
	}
	
}