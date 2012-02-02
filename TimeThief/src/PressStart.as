package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class PressStart extends Entity 
	{
		[Embed(source = 'assets/press_start.png')] private const START:Class;
		
		private var frameWidth:int = 300;
		private var frameHeight:int = 75;
		
		private var sprStart:Spritemap;
		
		public function PressStart(x:Number, y:Number) 
		{
			this.x = x;
			this.y = y;
			
			super(this.x, this.y);
			
			sprStart = new Spritemap(START, frameWidth, frameHeight);
				
			sprStart.add("flash", [0, 1, 2, 3], 8, true);
			
			graphic = sprStart;
		}
		
		
		override public function update():void 
		{
			sprStart.play("flash");
			
			if (Input.check(Key.SPACE))
			{
				FP.world.remove(this);
			}
		}
	}

}