package  
{
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Coin extends Collectable 
	{
		
		[Embed(source = 'assets/coin.png')] private const COIN:Class;
		
		public function Coin(x:Number=0, y:Number=0) 
		{
			this.x = x;
			this.y = y;
			
			super(this.x, this.y, x, y, 5); //Same x and y for position and collision
			
			graphic = new Image(COIN);
			
			this.width = 75;
			this.height = 75;
			
		}
		
	}

}