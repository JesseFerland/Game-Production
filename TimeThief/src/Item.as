package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Draw;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Item extends Entity 
	{
		
		public var isRemoved:Boolean = false;
		public var collideX:Number;
		public var collideY:Number;
		public var collideWidth:Number;
		public var collideHeight:Number;
		
		public function Item(x:Number = 0, y:Number = 0, collideX:Number = 0, collideY:Number = 0, collideWidth:Number = 75, collideHeight:Number = 75) 
		{
			super(x, y);
			
			this.collideX = collideX;
			this.collideY = collideY;
			this.collideHeight = collideHeight;
			this.collideWidth = collideWidth;
			
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
			
			Draw.rect(collideX, collideY, collideWidth, collideHeight); 
			
			
		}
		
	}

}