package Game 
{
	import flash.display.BitmapData;
	import HUD.TargetUnitFrame;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Hitbox;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class EnemyDragon extends Enemy 
	{
		
		public function EnemyDragon(locX:Number, locY:Number) 
		{
			super(locX, locY) //passes these values on to enemy
			enemyName = "Dragon";
			enemyMaxHealth = 1000;
			enemyMaxMana = 0;
			enemyImage = new Image(GC.GFX_ENEMY_DRAGON);
			enemyImage.scale = 2;
			enemyDead = false;
			enemyCurrentHealth = enemyMaxHealth;
			enemyCurrentMana = enemyMaxMana;
			trace("enemy added, name: " + enemyName + ", health: " + enemyCurrentHealth + ", mana: " + enemyCurrentMana)
		}
		
	}

}