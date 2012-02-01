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
	public class Arrow extends Obstacle 
	{
		[Embed(source = 'assets/arrow.png')] private const ARROW:Class;
		
		private var frameWidth:int = 80;
		private var frameHeight:int = 12;
		
		public var sprArrow:Spritemap;
		public var pixelMask:Pixelmask;
		
		public function Arrow(x:Number = 0, y:Number = 0) 
		{	
			this.x = x;
			this.y = y;
			
			super(this.x, this.y );		
			
			sprArrow = new Spritemap(ARROW, frameWidth, frameHeight);			
			
			pixelMask = new Pixelmask (sprArrow.getBuffer());
			mask = pixelMask;
			graphic = new Image(ARROW);
			
			type = "arrow";

		}
		
	}

}