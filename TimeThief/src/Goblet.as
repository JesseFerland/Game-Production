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
	public class Goblet extends Collectable 
	{
		[Embed(source = 'assets/goblet.png')] private const GOBLET:Class;
		
		private var frameWidth:int = 50;
		private var frameHeight:int = 50;
		
		public var sprGob:Spritemap;
		public var pixelMask:Pixelmask;
		
		public function Goblet(x:Number=0, y:Number=0) 
		{
			this.x = x;
			this.y = y;
			
			super(this.x, this.y );		
			
			sprGob = new Spritemap(GOBLET, frameWidth, frameHeight);
			
			pixelMask = new Pixelmask(sprGob.getBuffer());
			mask = pixelMask;
			graphic = new Image(GOBLET);
			
			type = "goblet";		
			
		}
		
	}

}