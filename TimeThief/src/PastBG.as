package  
{
	import net.flashpunk.Entity
	import net.flashpunk.Graphic;	
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class PastBG extends BG
	{
		[Embed(source = 'assets/BackgroundPast.jpg')] private const PAST:Class;
		
		public function PastBG() 
		{
			graphic = new Image(PAST);
			
		}
		
	}

}