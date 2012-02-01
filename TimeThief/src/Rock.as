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
	public class Rock extends Obstacle 
	{
		[Embed(source = 'assets/rock.png')] private const ROCK:Class;
		
		private var frameWidth:int = 225;
		private var frameHeight:int = 150;
		
		public var sprRock:Spritemap;
		public var pixelMask:Pixelmask;
		
		public function Rock(x:Number = 0, y:Number = 0 ) 
		{
			this.x = x;
			this.y = y;
			
			super(this.x, this.y );		
			
			sprRock = new Spritemap(ROCK, frameWidth, frameHeight);
			
			pixelMask = new Pixelmask(sprRock.getBuffer());
			mask = pixelMask;
			graphic = new Image(ROCK);
			
			type = "rock";
			
		}
		
	}

}