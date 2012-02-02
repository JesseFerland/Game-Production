package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
		
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	
	public class Main extends Engine 
	{
		public var backStory:Boolean = false;
		public var startGame:Boolean = false;
		public var continueable:Boolean = true
		
		public function Main()
		{
			
			super(800, 600, 60, false);
			
			FP.world = new Menu;			
			
		}
		
		override public function init():void
		{
			
		}
		
		override public function update():void
		{
			super.update();
			
			if (continueable = true)
			{
				if (Input.pressed(Key.SPACE) && backStory == true && startGame == false) 
				{
					FP.world = new Level1;
					startGame = true;
					continueable = false;
				}
			
				if (Input.pressed(Key.SPACE) && backStory == false)
				{
					FP.world = new BackStory;
					backStory = true;
				}
			}
			
			if (Input.released(Key.SPACE))
			{
				continueable = true;
			}		
		
		}
		
		
		
	}
	
}