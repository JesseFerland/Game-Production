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
		//public static var ditch:Ditch;
		
		public static const STARTING_X:int = 50;
		public static const STARTING_Y:int = 400;
		
		//public const TILE_HEIGHT:int = 58;
		//public const TILE_WIDTH:int = 100;
		public const TILE_SIZE:int = 75;
		public const MAP_Y:int = 8;
		public const MAP_X:int = 32;
		
		public var map:Array = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0]];
		
		public function Level1() 
		{
			loadMap();
			Level1.player = new Player(STARTING_X, STARTING_Y);
			add( Level1.player );
			
			//Level1.testDitch = new Ditch(Level1.pastBG1.width, Level1.player.y);			
			//add( Level1.testDitch );
			
		}
		
		public function loadMap():void
		{
			Level1.pastBG1 = new PastBG;
			Level1.pastBG2 = new PastBG;
			Level1.futureBG1 = new FutureBG;
			Level1.futureBG2 = new FutureBG;			
			
			Level1.pastBG2.x = Level1.pastBG1.width;
			Level1.futureBG2.x = Level1.futureBG1.width;
			
			add( Level1.futureBG1);
			add( Level1.futureBG2);
			add( Level1.pastBG1 );
			add( Level1.pastBG2 );
			
			var x:int;
			var y:int;
			
			for (var i:int = 0; i < MAP_Y; i++)
			{
				for (var j:int = 0; j < MAP_X; j++)
				{
					x = j * TILE_SIZE;
					y = i * TILE_SIZE;
					switch (map[i][j])
					{
						case 1:		var ditch:Ditch = new Ditch(x, y);
									add( ditch );
									break;
						
						default:	break;
					}
				}
			}
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