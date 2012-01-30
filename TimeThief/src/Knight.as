package  
{
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Knight extends Obstacle 
	{
		[Embed(source = 'assets/knight.png')] private const KNIGHT:Class;
		
		public function Knight(x:Number=0, y:Number=0) 
		{
			this.x = x;
			this.y = y;
			
			this.width = 150;
			this.height = 150;
			
			super(this.x, this.y, x, y, this.width, this.height);
			
			graphic = new Image(KNIGHT);
			
		}
		
		override public function update():void
		{
			super.update();
			
			this.collideX = this.x;
			this.collideY = this.y;
		}
	}

}