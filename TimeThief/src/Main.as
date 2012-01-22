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
		public function Main()
		{
			super(800, 600, 60, false);
			
			FP.world = new Level1;
		}
		
		override public function init():void
		{
			
		}
		
		
		
	}
	
}