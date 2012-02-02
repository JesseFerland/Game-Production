package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Sand extends Entity 
	{
		[Embed(source = 'assets/sand.png')] private const SAND:Class;
		
		private var sprSand:Spritemap;
		
		private var frameWidth:int = 205;
		private var frameHeight:int = 47;
		
		public function Sand() 
		{
			sprSand = new Spritemap(SAND, frameWidth, frameHeight);
			sprSand.add("full", [0], 20, true);
			
			graphic = sprSand;
		}
		
		override public function update():void
		{
			super.update();
			
			sprSand.play("full");
			
			if (Level1.temporal > 0)
			{
				sprSand.scaleX = Level1.temporal / 1000;
			}
		}
		
	}

}