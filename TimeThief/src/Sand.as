package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Sand extends Entity 
	{
		
		[Embed(source = 'assets/sand.png')] private const SAND:Class;
		
		public function Sand(x:Number, y:Number) 
		{
			this.x = x;
			this.y = y;
			
			super(this.x, this.y); //Same x and y for position and collision
			
			graphic = new Image(SAND);
			
		}
		
	}

}