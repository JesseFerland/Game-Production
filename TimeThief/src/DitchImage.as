package  
{	
	
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class DitchImage extends Obstacle 
	{
		[Embed(source = 'assets/ditch.png')] private const DITCH:Class;
		
		public var pixelMask:Pixelmask;
		
		public function DitchImage(x:Number = 0, y:Number = 0) 
		{	
			this.x = x;
			this.y = y;
			
			super(this.x, this.y );		
			
			pixelMask = new Pixelmask(DITCH, this.x, this.y);
			mask = pixelMask;
			graphic = new Image(DITCH);

		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}