package  
{	
	
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Ditch extends Obstacle 
	{
		[Embed(source = 'assets/ditch.png')] private const DITCH:Class;
		
		public function Ditch(x:Number = 0, y:Number = 0) 
		{			
			super(x, y);
			
			this.x = x;
			this.y = y;
			
			graphic = new Image(DITCH);
			mask = new Pixelmask(DITCH);
			//type = "ditch";
			this.width = 300;
			this.height = 185;
		}
		
	}

}