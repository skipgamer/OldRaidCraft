package HUD 
{
	import flash.display.BitmapData;
	import Game.Enemy;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class TargetUnitFrame extends HUDEntity 
	{
		//static public var targetedEnemy2:Enemy
		protected var targetHealthBar:Image;
		protected var targetManaBar:Image;
		protected var unitFrameGraphicList:Graphiclist;
		
		protected var targetHealthText:Text;
		protected var targetManaText:Text;
		protected var targetHealth:Text;
		protected var targetMana:Text;
		protected var targetNameText:Text;
		
		static public var targetName:String = "blah";
		static public var targetChanged:Boolean = false;
		
		static public var unitFrameInstance:HUD.TargetUnitFrame;
		
		public function TargetUnitFrame() 
		{
			targetHealthBar = Image.createRect(120, 20, 0xcc2222); //set target health bar graphic
			//targetHealthBar.scaleX = targetedEnemy2.enemyCurrentHealth / targetedEnemy2.enemyMaxHealth;
			
			targetManaBar = Image.createRect(120, 20, 0x2222cc); //set target mana bar graphic
			
			targetManaBar.y = 25;
			
			targetHealth = new Text (""); //set target health text to global target health variable
			targetHealth.x = targetHealthBar.x - 5 - targetHealth.width;
			targetHealth.y = targetHealthBar.y - 3;
			targetHealthText = new Text ("HP:"); //set target health bar text
			targetHealthText.x = targetHealth.x - targetHealthText.width;
			targetHealthText.y = targetHealthBar.y - 3;
			
			targetMana = new Text (""); //set target mana text to global target mana variable
			targetMana.x = targetManaBar.x - 5 - targetMana.width;
			targetMana.y = targetManaBar.y - 3;
			targetManaText = new Text ("MP:"); //set target mana bar text
			targetManaText.x = targetMana.x - targetManaText.width;
			targetManaText.y = targetManaBar.y - 3;
			
			targetNameText = new Text (targetName);
			targetNameText.x = targetHealthBar.width - targetNameText.width;
			targetNameText.y = -targetNameText.height;
			
			unitFrameGraphicList = new Graphiclist(targetHealthBar, targetManaBar, targetHealthText, targetManaText, targetHealth, targetMana, targetNameText); //set which graphics to draw
			
			graphic = new Graphiclist(); //draw graphics
			graphic.scrollX = 0; //locks this entities graphic to camera
			graphic.scrollY = 0;
			
			this.x = FP.camera.x + FP.screen.width - targetHealthBar.width - FP.screen.width / 40; //set co-ordinates of unit frame
			this.y = FP.camera.y + FP.screen.height / 14;
		}
		
		override public function added():void 
		{
			super.added();
			unitFrameInstance = this as HUD.TargetUnitFrame;
			

		}
		
		public function UpdateFrame():void //called by anything that needs to update the target frame (eg. SpellCast, selecting an emey)
		{
			if (GV.TARGETED_ENEMY != null) //if an enemy is targeted
			{
				if (GV.TARGETED_ENEMY.isTargeted == true)
				{
					//get new values and redraw unitframe graphics
					
					targetName = GV.TARGETED_ENEMY.enemyName
					targetNameText = new Text (targetName);
					targetNameText.x = targetHealthBar.width - targetNameText.width;
					targetNameText.y = -targetNameText.height;
					
					targetHealth = new Text (String(GV.TARGETED_ENEMY.enemyCurrentHealth)); //set target health text to global target health variable
					targetHealth.x = targetHealthBar.x - 5 - targetHealth.width;
					targetHealth.y = targetHealthBar.y - 3;
					targetHealthText = new Text ("HP:"); //set target health bar text
					targetHealthText.x = targetHealth.x - targetHealthText.width;
					targetHealthText.y = targetHealthBar.y - 3;
					
					targetMana = new Text (String(GV.TARGETED_ENEMY.enemyCurrentMana)); //set target mana text to global target mana variable
					targetMana.x = targetManaBar.x - 5 - targetMana.width;
					targetMana.y = targetManaBar.y - 3;
					targetManaText = new Text ("MP:"); //set target mana bar text
					targetManaText.x = targetMana.x - targetManaText.width;
					targetManaText.y = targetManaBar.y - 3;
					
					targetHealthBar.scaleX = GV.TARGETED_ENEMY.enemyCurrentHealth / GV.TARGETED_ENEMY.enemyMaxHealth;
					
					unitFrameGraphicList = new Graphiclist(targetHealthBar, targetManaBar, targetHealthText, targetManaText, targetHealth, targetMana, targetNameText); //set which graphics to draw
					graphic = unitFrameGraphicList;
					
					graphic.scrollX = 0; //locks this entities graphic to camera
					graphic.scrollY = 0;
					
					//finished redrawing unitframe graphics
					
					if (GV.TARGETED_ENEMY.enemyCurrentHealth < 1)
					{
						GV.TARGETED_ENEMY.enemyDead = true;
						GV.TARGETED_ENEMY = null;
					}
				}
				else // targeted enemy in global variables does not have isTargeted = true (for deselecting targets)
				{
					graphic = new Graphiclist();
					
					graphic.scrollX = 0; //locks this entities graphic to camera
					graphic.scrollY = 0;
				}
			}
			else //GV.TARGETED_ENEMY = null
			{
				graphic = new Graphiclist();
				
				graphic.scrollX = 0; //locks this entities graphic to camera
				graphic.scrollY = 0;
			}
		}
		
		override public function update():void 
		{
			super.update();
			
		}
	}

}