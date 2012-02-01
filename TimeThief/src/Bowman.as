package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Bowman extends Obstacle 
	{
		[Embed(source = 'assets/bowman_sprite.png')] private const BOW:Class;
		
		private var frameWidth:int = 150;
		private var frameHeight:int = 150;
		
		public var sprBow:Spritemap; 
		public var pixelMask:Pixelmask;
		
		public var shoot:Boolean = false;
		private var inRange:Boolean;
		
		public function Bowman(x:Number=0, y:Number=0) 
		{
			this.x = x;
			this.y = y;
			
			super(this.x, this.y);
			
			sprBow = new Spritemap(BOW, frameWidth, frameHeight);
				
			sprBow.add("attack", [0, 1, 2, 3, 4, 5, 6, 7], 10, true);
			
			graphic = sprBow;
			
			type = "bowman";
			
			pixelMask = new Pixelmask (sprBow.getBuffer());
			mask = pixelMask;
		}
		
		override public function update():void
		{
			super.update();
			
			if (inRange)
			{
				sprBow.play("attack");
				if (sprBow.index == 1)
				{
					var arrow:Arrow = new Arrow(this.x - 20, this.y + 55);
					FP.world.add( arrow );
					Level1.obstacles.push(arrow);
				}
			}
			
			if (this.x < 0)
			{
				sprBow.lock();
			}			
			else if (this.x <= 500)
			{
				inRange = true;
			}
			
		}
		
	}

}