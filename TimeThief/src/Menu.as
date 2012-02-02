package  
{
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Menu extends World 
	{
		public static var menuBG:MenuBG;
		public static var pressStart:PressStart;
		
		public function Menu() 
		{
			menuBG = new MenuBG();
			menuBG.x = 100;
			add( menuBG );
			
			pressStart = new PressStart(250, 400);
			add( pressStart );
			
		}
		
	}

}