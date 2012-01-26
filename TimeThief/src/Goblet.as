package  
{
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Goblet extends Obstacle 
	{
		[Embed(source = 'assets/goblet.png')] private const GOBLET:Class;
		
		public function Goblet(x:Number=0, y:Number=0) 
		{
			this.x = x;
			this.y = y;
			
			this.width = 75;
			this.height = 75;
			
			super(this.x, this.y, x, y); //Same x and y for position and collision
			
			graphic = new Image(GOBLET);
			
			
			
		}
		
		override public function update():void
		{
			super.update();
			
			this.collideX = this.x;
			this.collideY = this.y;
		}
		
	}

}