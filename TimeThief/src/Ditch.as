package  
{	
	
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	
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
			
			super(this.x, this.y, x, y );	//Collision x is different than x because it is olny colldiable on the bottom half		
			
			graphic = new Image(DITCH);
			
			this.width = 150;
			this.height = 150;
		}
		
		override public function update():void
		{
			super.update();
			
			this.collideX = this.x + 75;
			this.collideY = this.y + 75;
		}
		
	}

}