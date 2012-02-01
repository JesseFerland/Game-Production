package  
{	
	
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Image;	
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Ditch extends Obstacle 
	{
		[Embed(source = 'assets/ditch_collide.png')] private const DITCH:Class;
		
		private var frameWidth:int = 75;
		private var frameHeight:int = 75;
		
		public var sprDitch:Spritemap;
		public var pixelMask:Pixelmask;
		
		public function Ditch(x:Number = 0, y:Number = 0) 
		{	
			this.x = x;
			this.y = y;
			
			super(this.x, this.y );		
			
			sprDitch = new Spritemap(DITCH, frameWidth, frameHeight);			
			
			pixelMask = new Pixelmask (sprDitch.getBuffer());
			mask = pixelMask;
			graphic = new Image(DITCH);
			
			type = "ditch";

		}
		
	}

}