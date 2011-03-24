package  
{
	/**
	 * ...
	 * @author skipgamer
	 * 
	 * All Global Constants, and types go here
	 */
	public class GC 
	{
		
		//Text
		public static const TEXT_GAME_NAME:String = "RaidCraft";
		public static const TEXT_GAME_VERSION:String = "Version 0.01";
		public static const TEXT_PLAY_BUTTON:String = "Play Game";
		public static const TEXT_OPTIONS_BUTTON:String = "Options";
		public static const TEXT_EXIT_BUTTON:String = "Exit";
		public static const TEXT_DONE_SPELL_SELECT:String = "Done";
		
		//Types
		public static const TYPE_MOUSE:String = "mouse collision";
		public static const TYPE_SPELL_BUTTON_EMPTY:String = "empty spell button";
		public static const TYPE_SPELL_BUTTON:String = "non empty spell button";
		public static const TYPE_SPELL_BUTTON_ACTIONBAR:String = "non empty spell button";
		
		//Graphics
		[Embed(source = '../assets/raidcraft_title.png')]
		public static const GFX_TITLE:Class;
		
		// mouse icon
		
		[Embed(source = '../assets/mouse_cursor.png')]
		public static const GFX_MOUSE_CURSOR:Class;
		
		[Embed(source = '../assets/mouse_flash.png')]
		public static const GFX_MOUSE_FLASH:Class;
		
		// menu buttons
		
		[Embed(source = '../assets/menu_button.png')]
		public static const GFX_MENU_BUTTON:Class;
		
		[Embed(source = '../assets/menu_button_hover.png')]
		public static const GFX_MENU_BUTTON_HOVER:Class;
		
		// spell buttons
		
		[Embed(source = '../assets/spell_button_normal.png')]
		public static const GFX_SPELL_BUTTON_NORMAL:Class;
		
		[Embed(source = '../assets/spell_button_pressed.png')]
		public static const GFX_SPELL_BUTTON_PRESSED:Class;
		
		[Embed(source = '../assets/spell_button_empty.png')]
		public static const GFX_SPELL_BUTTON_EMPTY:Class;
		
		//spell icons
		
		[Embed(source = '../assets/spell_icon_fireball.png')]
		public static const GFX_SPELL_ICON_FIRE:Class;
		
		[Embed(source = '../assets/spell_icon_arcane.png')]
		public static const GFX_SPELL_ICON_ARCANE:Class;
		
		[Embed(source = '../assets/spell_icon_frost.png')]
		public static const GFX_SPELL_ICON_FROST:Class;
		
		[Embed(source = '../assets/spell_icon_death.png')]
		public static const GFX_SPELL_ICON_DEATH:Class;
		
		[Embed(source = '../assets/spell_icon_lightning.png')]
		public static const GFX_SPELL_ICON_LIGHTNING:Class;
		
	}

}