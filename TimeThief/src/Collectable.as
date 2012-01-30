package  
{
	import net.flashpunk.Entity;
	
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Collectable extends Item 
	{
		public var temporalYeild:int;
		public function Collectable(x:Number = 0, y:Number = 0, collideX:Number = 0, collideY:Number = 0, temporalYeild:Number = 5 ) 
		{
			super(x, y, collideX, collideY);
			
			this.temporalYeild = temporalYeild;
			
			type = "collectable";
		}
		
		override public function update():void
		{
			super.update()
			
			this.collideX = this.x;
			this.collideY = this.y;
		}
		
	}

}