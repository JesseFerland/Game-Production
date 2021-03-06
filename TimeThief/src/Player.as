package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.Sfx;
	
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Player extends Entity 
	{
		[Embed(source = 'assets/player_sprite.png')] private const PLAYER:Class;
		
		[Embed(source = 'assets/hit.mp3')] private const HIT:Class;
		
		[Embed(source = 'assets/blink.mp3')] private const BLINK:Class;
		
		private var frameWidth:int = 150;
		private var frameHeight:int = 150;
		
		public var sprPlayer:Spritemap; 
		public var pixelMask:Pixelmask;
		public var getHit:Sfx;
		public var whenBlink:Sfx;
		
		public var speed:int = 8;
		public var blinkTo:Boolean;
		public var blinkBack:Boolean;
		public var hit:Boolean = false;
		public var invincible:Boolean = false;
		public var hitCounter:int = 0;
		public var spaceIsPressable:Boolean = true;		
		public var jump:Boolean = false;
		
		private var jumpSpeed:int = 8;
		private var fallSpeed:int = 11;		
		private var blinkCounter:int = 0;
		private var spaceHoldCounter:int = 0;		
		private var canJump:Boolean = true;
		private var jumpCounter:int = 0;	
		
		public function Player(x:Number = 0, y:Number = 0 ) 
		{
			super(x, y);
			
			this.x = x;
			this.y = y;
			
			sprPlayer = new Spritemap(PLAYER, frameWidth, frameHeight);
				
			sprPlayer.add("running", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], 20, true);
			sprPlayer.add("jumping", [16, 17, 18, 19, 20, 21], 10, true);
			sprPlayer.add("diving", [21], 20, true);
			sprPlayer.add("rolling", [22, 23, 24], 12, true);
			graphic = sprPlayer;
			type = "player";
			
			pixelMask = new Pixelmask (sprPlayer.getBuffer());
			mask = pixelMask;
			
			getHit = new Sfx(HIT);
			whenBlink = new Sfx(BLINK);
			
			blinkTo = false;
			blinkBack = false;
		}
		override public function update():void
		{	
			pixelMask = new Pixelmask (sprPlayer.getBuffer());
			mask = pixelMask;
					
			if (Input.check(Key.SPACE) && spaceIsPressable)
			{
				spaceHoldCounter++;
				if (spaceHoldCounter >= 10 && blinkTo == false)
				{
					blink();
				}
			}
			
			if (Input.released(Key.SPACE) && jump == false )
			{
				spaceIsPressable = true;
				if (spaceHoldCounter < 10)
				{
					spaceHoldCounter = 0;
					
					if(canJump)
					{
						jump = true;
						jumpCounter = 27;
					}
					else if (!canJump)
					{
						canJump = true;
					}					
				}
			}
			
			if (jump)
			{	
				if (jumpCounter > 0)
				{
					if (sprPlayer.index == 2 )
					{
						var temp:String = sprPlayer.currentAnim;
						if (temp == "jumping")
						{
							sprPlayer.lock();
						}
					}
					else
					{
						sprPlayer.play("jumping");
					}
					
					this.y -= jumpSpeed;
					jumpCounter--;
				}
				
				if (jumpCounter == 0)
				{
					sprPlayer.unlock();
					
					if (sprPlayer.index == 5)
					{
						sprPlayer.play("diving");
					}
					
					if (this.y < Level1.STARTING_Y)
					{
						this.y += fallSpeed;
					}
					else if (this.y >= Level1.STARTING_Y)
					{
						sprPlayer.play("rolling");
						jump = false;
					}
				}
			}	
			
			else 
			{
				if (sprPlayer.currentAnim == "rolling")
				{
					
					if (sprPlayer.index == 2)
					{
						sprPlayer.play("running");
					}
				}
				else
				{
					sprPlayer.play("running");
				}
			}
			
			if (blinkCounter > 0)
			{
				blinkCounter--;
				if (blinkCounter == 0)
				{
					blinkBack = true;
					blinkTo = false;
				}
			}
			
			if (hit)
			{
				getHit.play();
				
				blink();
				spaceIsPressable = true;
				hit = false
			}	
			
			if (hitCounter > 0)
			{
				hitCounter--;
				if (hitCounter == 0)
				{
					invincible = false;
				}
			}
			
		}
		
		public function blink():void
		{
			Level1.temporal -= Level1.BLINK_TEMPORAL_COST;
			invincible = true;
			hitCounter = 90;
			whenBlink.play();
			spaceIsPressable = false;
			blinkTo = true;
			blinkBack = false;
			blinkCounter = 50;
			spaceHoldCounter = 0;
			canJump = false;
		}
		
		public function inFuture():Boolean
		{
			return blinkTo;
		}
		
	}

}