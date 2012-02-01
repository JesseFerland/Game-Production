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
	public class Coin extends Collectable 
	{
		
		[Embed(source = 'assets/coin.png')] private const COIN:Class;
		
		private var frameWidth:int = 32;
		private var frameHeight:int = 32;
		
		public var sprCoin:Spritemap;
		public var pixelMask:Pixelmask;
		
		public function Coin(x:Number=0, y:Number=0) 
		{
			this.x = x;
			this.y = y;
			
			super(this.x, this.y );		
			
			sprCoin = new Spritemap(COIN, frameWidth, frameHeight);
			
			pixelMask = new Pixelmask(sprCoin.getBuffer());
			mask = pixelMask;
			graphic = new Image(COIN);
			
			type = "coin";
			
		}
		
	}

}