package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Player extends Entity 
	{
		[Embed(source = 'assets/player_sprite_all.png')] private const PLAYER:Class;
		
		public var sprCharacter:Spritemap = new Spritemap(PLAYER, 150, 150);
		
		public var speed:int = 8;
		public var blinkTo:Boolean;
		public var blinkBack:Boolean;
		
		private var jumpSpeed:int = 8;
		private var fallSpeed:int = 11;		
		private var blinkCounter:int = 0;
		private var spaceHoldCounter:int = 0;
		private var spaceIsPressable:Boolean = true;
		private var canJump:Boolean = true;
		private var jump:Boolean = false;
		private var jumpCounter:int = 0;	
		//private var isRolling:Boolean = false;
		//private var isDiving:Boolean = false;
		//private var jumpAnim:Boolean = false;
		
		public function Player(x:Number = 0, y:Number = 0 ) 
		{
			super(x, y);
			
			this.x = x;
			this.y = y;
			
			this.width = 150;
			this.height = 150;
			
			sprCharacter.add("running", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], 20, true);
			sprCharacter.add("jumping", [16, 17, 18, 19, 20, 21, 22], 20, true);
			graphic = sprCharacter;
			type = "player";
			
			blinkTo = false;
			blinkBack = false;
		}
		override public function update():void
		{	
					
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
					if (sprCharacter.index == 2)
					{
						sprCharacter.lock();
					}
					else
					{
						sprCharacter.play("jumping");
					}
					this.y -= jumpSpeed;
					jumpCounter--;
				}
				
				if (jumpCounter == 0)
				{
					
					if (sprCharacter.index < 3)
					{
						sprCharacter.unlock();
					}
					
					if (sprCharacter.index == 3)
					{
						sprCharacter.lock();
					}
					if (this.y < Level1.STARTING_Y)
					{
						this.y += fallSpeed;
					}
					else if (this.y >= Level1.STARTING_Y - 5)
					{
						jump = false;
					}
				}
			}	
			
			else 
			{
				if (sprCharacter.currentAnim == "jumping")
				{
					if (sprCharacter.index == 6)
					{
						sprCharacter.play("running");
					}
				}
				else
				{
					sprCharacter.play("running");
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

		}
		
		private function blink():void
		{
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