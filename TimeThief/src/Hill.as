package  
{
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;	
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Hill extends Obstacle 
	{
		[Embed(source = 'assets/hill.png')] private const HILL:Class;
		
		private var frameWidth:int = 600;
		private var frameHeight:int = 150;
		
		public var sprHill:Spritemap;
		public var pixelMask:Pixelmask;
		
		public function Hill(x:Number = 0, y:Number = 0 ) 
		{
			this.x = x;
			this.y = y;
			
			super(this.x, this.y );		
			
			sprHill = new Spritemap(HILL, frameWidth, frameHeight);
			
			pixelMask = new Pixelmask(sprHill.getBuffer());
			mask = pixelMask;
			graphic = new Image(HILL);
			
			type = "hill";
			
		}
		
	}

}