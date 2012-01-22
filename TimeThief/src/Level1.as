package  
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Level1 extends World 
	{
		public static var player:Player;
		public static var pastBG1:PastBG;
		public static var pastBG2:PastBG;
		public static var futureBG1:FutureBG;
		public static var futureBG2:FutureBG;
		public static var testDitch:Ditch;
		
		public static const STARTING_X:int = 50;
		public static const STARTING_Y:int = 400;
		
		public function Level1() 
		{
			Level1.player = new Player(STARTING_X, STARTING_Y);
			Level1.pastBG1 = new PastBG;
			Level1.pastBG2 = new PastBG;
			Level1.futureBG1 = new FutureBG;
			Level1.futureBG2 = new FutureBG;			
			
			Level1.pastBG2.x = Level1.pastBG1.width;
			Level1.futureBG2.x = Level1.futureBG1.width;
			
			Level1.testDitch = new Ditch(Level1.pastBG1.width, Level1.player.y);
			
			add( Level1.futureBG1);
			add( Level1.futureBG2);
			add( Level1.pastBG1 );
			add( Level1.pastBG2 );
			add( Level1.testDitch );
			add( Level1.player );
		}
		
		override public function update():void
		{
			super.update();
			
			if (Level1.player.blinkTo)
			{
				bringToFront( futureBG1 );
				bringToFront( futureBG2 );
				bringToFront( player );
			}
			
			if (Level1.player.blinkBack)
			{			
				sendToBack(futureBG1);
				sendToBack(futureBG2);
				Level1.player.blinkTo = false;
				Level1.player.blinkBack = false;
			}
		}
		
	}

}