package  
{
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class BG extends Entity 
	{
		
		public function BG() 
		{
			this.width = 1200;
			this.height = 600;
			
			type = "BG";
		}
		
		override public function update():void
		{
			this.x -= Level1.player.speed;
			if (this.x == -(this.width)) this.x = this.width;  //If it goes of the screen, set it to the other end of the map
			

		}
		
	}

}