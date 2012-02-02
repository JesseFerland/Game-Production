package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class TemporalGui extends Entity 
	{
		[Embed(source = 'assets/gui spritesheet.png')] private const GUI:Class;
		
		private var sprGUI:Spritemap;
		
		private var frameWidth:int = 300;
		private var frameHeight:int = 75;
		
		//private var sand:Sand;
		
		public function TemporalGui() 
		{
			sprGUI = new Spritemap(GUI, frameWidth, frameHeight);
			sprGUI.add("full", [0], 20, true);
			sprGUI.add("half", [2], 20, true);
			sprGUI.add("empty", [1], 20, true);
			
			graphic = sprGUI;
		}
		
		override public function update():void
		{
			super.update();
			if (Level1.temporal < 250)
			{
				sprGUI.play("empty");
			}
			else if (Level1.temporal < 500 )
			{
				sprGUI.play("half");
			}
			else 
			{
				sprGUI.play("full");
			}
		}
		
	}

}