package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class Player extends Entity 
	{
		[Embed(source = 'assets/character.png')] private const CHARACTER:Class;
		
		public var speed:int = 8;
		public var blinkTo:Boolean = false;
		public var blinkBack:Boolean = false;
		
		private var jumpSpeed:int = 5;
		private var fallSpeed:int = 8;		
		private var blinkCounter:int = 0;
		private var spaceHoldCounter:int = 0;
		private var spaceIsPressable:Boolean = true;
		private var canJump:Boolean = true;
		private var jump:Boolean = false;
		private var jumpCounter:int = 0;
		
		
		
		public function Player(x:Number = 0, y:Number = 0 ) 
		{
			super(x, y);
			this.x = x;
			this.y = y;
			graphic = new Image(CHARACTER);
			setHitbox(145, 168, this.x, this.y);
			type = "player";
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
						jumpCounter = 50;
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
					this.y -= jumpSpeed;
					jumpCounter--;
				}
				if (jumpCounter == 0)
				{
					if (this.y < Level1.STARTING_Y)
					{
						this.y += fallSpeed;
					}
					else if (this.y >= Level1.STARTING_Y)
					{
						jump = false;
					}
				}
			}			
			
			if (blinkCounter > 0)
			{
				blinkCounter--;
				if (blinkCounter == 0)
				{
					blinkBack = true;
				}
			}
			
			/*if (this.x < (Level1.testDitch.x + 5) && this.x > (Level1.testDitch.x - 5))
			{
				trace("test");
			}*/
			
			if (collide("obstacle", x, y))
			{
				trace("collision");
			}

		}
		
		private function blink():void
		{
			spaceIsPressable = false;
			blinkTo = true;
			blinkCounter = 50;
			spaceHoldCounter = 0;
			canJump = false;
		}
		
	}

}