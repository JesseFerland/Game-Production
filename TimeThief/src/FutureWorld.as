package  
{
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class FutureWorld extends World 
	{
		
		public function FutureWorld() 
		{
			//var player:Player = new Player;
			var bg1:FutureBG = new FutureBG;
			var bg2:FutureBG = new FutureBG;
			
			bg2.x = bg1.width;
			add( bg1 );
			add( bg2 );			
			//add( player );
		}
		
	}

}