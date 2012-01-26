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
		public var blinkTo:Boolean;
		public var blinkBack:Boolean;
		
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
			
			this.width = 150;
			this.height = 150;
			
			graphic = new Image(CHARACTER);
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
					blinkTo = false;
				}
			}
			
			
			/*if (this.x < (Level1.testDitch.x + 5) && this.x > (Level1.testDitch.x - 5))
			{
				trace("test");
			}
			
			if (collideWith("obstacle", this.x, this.y))
			{
				trace("collision ", this.x, this.y);
			}*/

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