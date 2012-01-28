package  
{
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Obstacle extends Item 
	{
		
		public function Obstacle(x:Number = 0, y:Number = 0, collideX:Number = 0, collideY:Number = 0, collideWidth:Number = 75, collideHeight:Number = 75) 
		{
			super(x, y, collideX, collideY, collideWidth, collideHeight);
			
			type = "obstacle";
			
		}
		
		override public function update():void
		{
			super.update()
		}
		
	}

}