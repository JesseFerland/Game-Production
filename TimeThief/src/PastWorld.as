package  
{
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class PastWorld extends World 
	{
		
		public function PastWorld() 
		{	
			var player:Player = new Player;
			var bg1:PastBG = new PastBG;
			var bg2:PastBG = new PastBG;
			
			bg2.x = bg1.width;
			add( bg1 );
			add( bg2 );			
			add( player );			
		}
		
		/*override public function update():void 
		{
			
			
		}*/
		
	}

}