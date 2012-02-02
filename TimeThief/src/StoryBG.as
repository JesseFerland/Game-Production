package  
{
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class StoryBG extends BG 
	{
		[Embed(source = 'assets/BackStory.png')] private const STORY:Class;
		
		public function StoryBG() 
		{
			graphic = new Image(STORY);
		}
		
		override public function update():void 
		{
			this.y -= 0.25;
		}
		
	}

}