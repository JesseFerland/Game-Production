package  
{
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Jesse Ferland
	 */
	public class BackStory extends World 
	{
		
		public static var storyBG:StoryBG;
		
		public function BackStory() 
		{
			storyBG = new StoryBG();
			add( storyBG );
			
		}
		
		/*override public function update():void
		{
			storyBG.update()
		}*/
		
	}

}