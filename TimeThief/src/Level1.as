package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Level1 extends World 
	{
	//	[Embed(source = 'assets/thunderstruck.mp3')] private const MUSIC:Class;
		
		public static var player:Player;
		public static var pastBG1:PastBG;
		public static var pastBG2:PastBG;
		public static var futureBG1:FutureBG;
		public static var futureBG2:FutureBG;
		public static var temporalGUI:TemporalGui;
		public static var sand:Sand;
				
		public static const STARTING_X:int = 50;
		public static const STARTING_Y:int = 375;
		
		//Change these to change damage done. Temporal is decreasing at about 30/second. 
		//Please dont try to change how fast temporal decreases, it will change a lot of other things.
		public static var temporal:int = 1000; //STARTING TEMPORAL ENERGY, increase this if decreasing too fast
		public const KNIGHT_TEMPORAL_DAMAGE:int = 100;
		public const BOWMAN_TEMPORAL_DAMAGE:int = 100;
		public const ROCK_TEMPORAL_DAMAGE:int = 100;
		public const DITCH_TEMPORAL_DAMAGE:int = 100;
		public const COIN_TEMPORAL_INCREASE:int = 100
		public const GOBLET_TEMPORAL_INCREASE:int = 300;
		public static const BLINK_TEMPORAL_COST:int = 75;		
			
		public static const TILE_SIZE:int = 75;
		public const MAP_Y:int = 8;
		public const MAP_X:int = 90;
		
		public var time:int = 0;
		
		public static var obstacles:Array = new Array();
		public var collectables:Array = new Array();
		
		/*
		 * Map Codes:
		 * 1 = Coin
		 * 2 = Goblet
		 * 3 = Ditch (image)
		 * 4 = Ditch (collidable) //When using put as [3, 4]  Did this for collision reasons
		 * 5 = Rock 
		 * 6 = Knight
		 * 7 = Bowman
		 * 8 = Hill
		*/
		public var map:Array = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
								[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];
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
			
			Level1.temporalGUI = new TemporalGui;
			Level1.temporalGUI.x = 50;
			Level1.temporalGUI.y = 530;
			
			Level1.sand = new Sand;
			Level1.sand.x = 75;
			Level1.sand.y = 545;
			
			add( Level1.futureBG1);
			add( Level1.futureBG2);
			add( Level1.pastBG1 );
			add( Level1.pastBG2 );
			add( Level1.sand );
			add( Level1.temporalGUI );
			
			
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
						case 1:		var coin:Coin = new Coin(x, y);
									add( coin );
									collectables.push(coin);
									break;
									
						case 2:		var goblet:Goblet = new Goblet(x, y);
									add( goblet );
									collectables.push(goblet);
									break;
									
						case 3:		var ditchImage:DitchImage = new DitchImage(x, y);
									add( ditchImage );
									obstacles.push(ditchImage);
									break;
									
						case 4:		var ditch:Ditch = new Ditch(x, y);
									add( ditch );
									obstacles.push(ditch);
									break;
									
						case 5:		var rock:Rock = new Rock(x, y);
									add( rock );
									obstacles.push(rock);
									break;
						
						case 6: 	var knight:Knight = new Knight(x, y);
									add( knight );
									obstacles.push(knight);
									break;
									
						case 7:		var bowman:Bowman = new Bowman(x, y);
									add( bowman );
									obstacles.push(bowman);								
									break;	
									
						case 8:		var hill:Hill = new Hill(x, y);
									add( hill );
									obstacles.push(hill);
									break;
						
						default:	break;
					}
				}
			}
		}
		
		override public function update():void
		{
			time ++;
			if (time == 1) // Reset the counter after 1 second has elapsed, or 30 frames.
			{				
				time = 0;
				
				super.update();
						
				if (temporal <= 0 )
				{
					trace("no energy");
				}
				
				if (Level1.player.blinkTo == false) //If the player is not in the future
				{
					temporal--;
					
					if (Level1.player.invincible == false) //If the player is not invincible after a hit
					{
						if (Level1.player.collide("knight", player.x, player.y))
						{
							temporal -= KNIGHT_TEMPORAL_DAMAGE;
							Level1.player.hit = true;
							trace("knight");
						}
						
						if (Level1.player.collide("bowman", player.x, player.y))
						{
							temporal -= BOWMAN_TEMPORAL_DAMAGE;
							Level1.player.hit = true;
							trace("bowman");
						}
						
						if (Level1.player.collide("ditch", player.x, player.y))
						{
							temporal -= DITCH_TEMPORAL_DAMAGE;
							Level1.player.hit = true;
							trace("ditch");
						}
						
						if (Level1.player.collide("rock", player.x, player.y))
						{
							temporal -= ROCK_TEMPORAL_DAMAGE;
							Level1.player.hit = true;
							trace("rock");
						}
						
						var tempCoin:Entity = Level1.player.collide("coin", player.x, player.y );
						if (tempCoin)
						{
							Coin.collect.play();
							temporal += COIN_TEMPORAL_INCREASE;
							remove(tempCoin);
							trace("coin");
						}
						
						var tempGob:Entity = Level1.player.collide("goblet", player.x, player.y );
						if (tempGob)
						{
							temporal += GOBLET_TEMPORAL_INCREASE;
							remove(tempGob);
							trace("goblet");
						}
						
						var tempArrow:Entity = Level1.player.collide("arrow", player.x, player.y );
						if (tempArrow)
						{
							temporal -= BOWMAN_TEMPORAL_DAMAGE;
							remove(tempArrow);
							trace("arrow");
						}
					}
					
					if (Level1.player.collide("hill", player.x, player.y))  //Not in above if statement so unaffected by hit
					{
						Level1.player.y -= Level1.player.speed;
						trace("hill");
					}
				}
				
				
			
				
				if (Level1.player.y < STARTING_Y && Level1.player.jump == false) //If the character is falling from a hill
				{
					Level1.player.y += 5;
				}
							
				if (Level1.player.blinkTo)
				{
					bringToFront( futureBG1 );
					bringToFront( futureBG2 );
					bringToFront( player );
					bringToFront( sand );
					bringToFront( temporalGUI );
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