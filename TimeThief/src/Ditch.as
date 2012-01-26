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
			this.x = x - 75;
			this.y = y - 75;  //So when placing on the level editor, place according to collidble bottom
			trace("ditch", this.x, this.y);
			super(this.x, this.y);
			
			
			
			graphic = new Image(DITCH);
			setHitbox(75, 75, x, y) //Make only the bottom right of the image collidable
			
			this.width = 150;
			this.height = 150;
		}
		
	}

}