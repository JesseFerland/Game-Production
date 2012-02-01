package  
{
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Obstacle extends Item 
	{
		
		public function Obstacle(x:Number = 0, y:Number = 0) 
		{
			super(x, y);
			
			type = "obstacle";
			
		}
		
		override public function update():void
		{
			super.update()
		}
		
	}

}