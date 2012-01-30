package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	
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
		
		public static const STARTING_X:int = 50;
		public static const STARTING_Y:int = 400;
		
		public static const TILE_SIZE:int = 75;
		public const MAP_Y:int = 8;
		public const MAP_X:int = 90;
		
		public var time:int = 0;
		public var temporal:int = 1000;
		
		public var obstacles:Array = new Array();
		public var collectables:Array = new Array();
		
		public var map:Array = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 4, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 2, 2, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3],
								[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];
							  // 1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 64 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90

		public function Level1() 
		{
			loadMap();
			Level1.player = new Player(STARTING_X, STARTING_Y);
			add( Level1.player );
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
									obstacles.push(ditch);
									break;
									
						case 2:		var coin:Coin = new Coin(x, y);
									add( coin );
									collectables.push(coin);
									break;
									
						case 3:		var goblet:Goblet = new Goblet(x, y);
									add( goblet );
									collectables.push(goblet);
									break;
									
						case 4: 	var knight:Knight = new Knight(x, y);
									add( knight );
									obstacles.push(knight);
									break;
						
						default:	break;
					}
				}
			}
		}
		
		override public function update():void
		{
	
			time ++;
			if (time == 1)
			{
				// Reset the counter after 1 second has elapsed.
				time = 0;
				
				super.update();
				
				Draw.rect(50, 50, temporal, 10, 0xFFFFFF, 0, true);
								
				temporal--;
				if (temporal <= 0 )
				{
					trace("no energy");
				}
				
				//for (var i:int = 0; i < obstacles.length; i++)
				
					///STILL NEED TO REMOVE WHEN OFF MAP
				if (Level1.player.blinkTo == false) //If the player is not in the future
				{
					if(Level1.player.collide("obstacle", player.x, player.y))
					//if (Level1.player.collide("obstacle", player.x, player.y))
					//if(collideRect("player", obstacles[i].collideX, obstacles[i].collideY, obstacles[i].collideWidth, obstacles[i].collideHeight))
					{
						temporal--;
						trace("hit");
						//break;
					}
					
					var tempEnt:Entity = Level1.player.collide("collectable", player.x, player.y);
					if (tempEnt)
					//if(collideRect("player", collectables[j].collideX, collectables[j].collideY, collectables[j].collideWidth, collectables[j].collideHeight))
					{
						//var tempCollect:Collectable = tempEnt;
						temporal += 100;
						remove(tempEnt);
						trace("collect");
						//break;
					}
				}
				//}
							
				if (Level1.player.blinkTo)
				{
					temporal -= 5;
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

}