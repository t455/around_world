package  
{
	import display.Layer;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author 
	 */
	public class Universe extends Sprite 
	{
		
		public function Universe() 
		{
			super();
			
			var layer:Layer = new Layer(80, 150);
			addChild(layer);
			
			var layer2:Layer = new Layer(155, 200);
			addChild(layer2);
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
		
	}

}