package  
{
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Item extends Entity 
	{
		
		public var isRemoved:Boolean = false;
		
		public function Item(x:Number = 0, y:Number = 0) 
		{
			super(x, y);
						
			this.x = x;
			this.y = y;
		}
		
		override public function update():void
		{
			if (!isRemoved)
			{
				if (this.x >= -(this.width) )
				{
					this.x -= Level1.player.speed;
				}
			
				else if (this)
				{	
					isRemoved = true;					
				}
			}
			
			
		}
		
	}

}