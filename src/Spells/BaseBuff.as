package Spells 
{
	import Game.Enemy;
	import HUD.HUDMessage;
	import HUD.TargetUnitFrame;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image
	import net.flashpunk.FP
	import net.flashpunk.graphics.Spritemap
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class BaseBuff extends Entity
	{ 
		private var buffGraphiclist:Graphiclist;
		private var buffBackground:Image = new Image(GC.GFX_SPELL_BUTTON_NORMAL);
		private var sprBuffCooldown:Spritemap = new Spritemap(GC.GFX_COOLDOWN, 32, 32);
		private var timeElapsed:Number = 0;
		private var buffIcon:Image;
		
		private var ticksPassed:Number = 1;
		
		private var buffPos:Number = 0;
		
		private var passedSpell:BaseSpell;
		private var targetedEnemy:Enemy; //targeted Enemy when buff is started this will not change when GV.TARETED_ENEMY changes
		
		private var unitFrameInstance:TargetUnitFrame;
		
		public function BaseBuff(i:BaseSpell, j:Enemy) 
		{
			passedSpell = i;
			targetedEnemy = j;
			
			buffIcon = new Image(passedSpell.spellIconGraphic);
			
			buffBackground.scale = .5;
			buffIcon.scale = .5;
			
			sprBuffCooldown.add("cooldown", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32], 32 / (passedSpell.buffTickTime * passedSpell.buffTicks), true);
			sprBuffCooldown.scale = .5;
			sprBuffCooldown.alpha = .5;
			sprBuffCooldown.color = 0x000000;
			
			
			buffGraphiclist = new Graphiclist(buffBackground, buffIcon);
			graphic = buffGraphiclist;
			graphic.scrollX = 0;
			graphic.scrollY = 0;
			
			
			x = TargetUnitFrame.unitFrameInstance.x;
			y = TargetUnitFrame.unitFrameInstance.y + 50;
			
			trace("Drawn buff graphic: ");
		}
		
		public function MoveBuffs():void
		{
			if (buffPos < 1) buffPos = 1;
			if (this.world.classCount(BaseBuff) > 6)
			{
				x = TargetUnitFrame.unitFrameInstance.x + (buffBackground.scaledWidth + buffBackground.scaledWidth / 6) * (buffPos - 7);
				y = TargetUnitFrame.unitFrameInstance.y + 50 + (buffBackground.scaledHeight + buffBackground.scaledHeight / 6);
			}
			else x = TargetUnitFrame.unitFrameInstance.x + (buffBackground.scaledWidth + buffBackground.scaledWidth / 6) * (buffPos - 1);
			
			if (this.world.classCount(BaseBuff) > 12)
			{
				this.world.remove(this);
			}
			
		}
		
		override public function added():void 
		{
			buffPos = this.world.classCount(BaseBuff)
			
			MoveBuffs();
			
			sprBuffCooldown.play("cooldown");
			buffGraphiclist.add (sprBuffCooldown)
			super.added();
		}
		
		override public function update():void 
		{
			timeElapsed += FP.elapsed;
			
			MoveBuffs();
			
			if (ticksPassed > passedSpell.buffTicks) //if buff runs out
			{
				passedSpell.BuffEffectRemoved(targetedEnemy);
				
				var myArray:Array = new Array();
				FP.world.getClass(BaseBuff, myArray); //gets all instances of BaseBuff and stores them in an array
				
				for each (var allBuffs:BaseBuff in myArray) //for each instance of BaseSpell in the Array
				{
					allBuffs.buffPos -= 1; //change the buffPos of all buffs
				}
				this.world.remove(this);
			}
			else
			{
				if (timeElapsed > passedSpell.buffTickTime * ticksPassed)
				{
					trace("tick");
					ticksPassed += 1
					targetedEnemy.enemyCurrentHealth -= passedSpell.buffDmg;
					TargetUnitFrame.unitFrameInstance.UpdateFrame();
					
				}
			}
			
			if (targetedEnemy != GV.TARGETED_ENEMY) //if the targeted enemy when the spell is cast is not equal to the current targeted enemy, hide the entity
			{
				graphic.visible = false;
			}
			else graphic.visible = true;
			
			super.update();
		}
		
	}

}