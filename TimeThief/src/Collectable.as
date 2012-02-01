package  
{
	import net.flashpunk.Entity;
	
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Collectable extends Item 
	{
		public function Collectable(x:Number = 0, y:Number = 0) 
		{
			super(x, y);
						
			type = "collectable";
		}
		
		override public function update():void
		{
			super.update()
		}
		
	}

}