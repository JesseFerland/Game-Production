package  
{
	import net.flashpunk.Entity
	import net.flashpunk.Graphic;	
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class FutureBG extends BG 
	{
		[Embed(source = 'assets/BackgroundFuture.png')] private const FUTURE:Class;
		
		public function FutureBG() 
		{
			graphic = new Image(FUTURE);
			
		}
		
	}

}