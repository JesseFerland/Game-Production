package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Obstacle extends Entity 
	{
		
		public function Obstacle(x:Number = 0, y:Number = 0) 
		{
			super(x, y);
			
			this.x = x;
			this.y = y;
			type = "obstacle";
			
		}
		
		override public function update():void
		{
			if (this.x >= -(this.width) )
			{
				this.x -= Level1.player.speed;
			}
			
			else if (this)
			{		
				FP.world.remove(this);
			}
		}
		
	}

}