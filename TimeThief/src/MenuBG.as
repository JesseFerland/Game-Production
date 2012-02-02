package  
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class MenuBG extends BG 
	{
		[Embed(source = 'assets/ConceptArt.png')] private const MENU:Class;
		
		
		public function MenuBG() 
		{
			graphic = new Image(MENU);
		}
		
		override public function update():void
		{
			//Do nothing
		}
	}

}