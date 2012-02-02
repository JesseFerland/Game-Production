package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Knight extends Obstacle 
	{
		[Embed(source = 'assets/knight_sprite.png')] private const KNIGHT:Class;
		//[Embed(source = 'assets/knight.mp3')] private const SWING:Class;
		
		private var frameWidth:int = 150;
		private var frameHeight:int = 150;
		
		public var sprKnight:Spritemap; 
		public var pixelMask:Pixelmask;
		
		private var inRange:Boolean;
		
		public function Knight(x:Number=0, y:Number=0) 
		{
			this.x = x;
			this.y = y;
			
			super(this.x, this.y);
			
			sprKnight = new Spritemap(KNIGHT, frameWidth, frameHeight);
				
			sprKnight.add("attack", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 12, true);
			
			graphic = sprKnight;
			
			type = "knight";
			
			pixelMask = new Pixelmask (sprKnight.getBuffer());
			mask = pixelMask;
			
		}
		
		override public function update():void
		{
			super.update();
			
			if (inRange)
			{
				sprKnight.play("attack");
				if (sprKnight.index == 9)
				{
					sprKnight.lock();
				}
			}
			
			if (this.x <= 200)
			{
				inRange = true;
			}
		}
	}

}