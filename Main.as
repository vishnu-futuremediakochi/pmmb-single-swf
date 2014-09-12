﻿package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.text.TextField;
	import flash.utils.Timer;
    import flash.utils.getTimer;
	
    public class Main extends MovieClip 
	{
        public var bike:*;
		public var smoke:Smoke;
		
		
		public var obstacle_mc:MovieClip;
		public var parkingspot:MovieClip;
		public var bikeposArray:Array;
		public var bikeRotArray:Array;
		public var levelNameArray:Array;
		public var currentLevel:int = 0;
		
		private var gamepaused:Boolean = false;
		private var pausetimer:int = 0;
		private var playmc:MovieClip;
		private var bikemaxspeed:int = 0;
		private var congratsmc:MovieClip;
		//private var hudmc:MovieClip;
		private var txtCurrentLevelName:TextField;
		private var txtRemTime:TextField;
		private var timeElapsed:Number=0;
		private var timeRemaining:Number;
		//private var gameTimer:Timer = new Timer(1000);
		private var containermc:MovieClip;
		private var skiplevel_mc:MovieClip;
		private var movingobstacle_mc:MovieClip;
		private var rbEngineRunning:Sound = new RBEngineRunning();
		private var rbEngineStarting:Sound = new RBEngineStarting();
		private var rbCrashing:Sound = new RBCrashing();
		private var rbClapping:Sound = new RBClapping();
		private var rbEngineHigh:Sound = new RBEngineHigh();
		private var restartTimer:Timer;
		private var restartTimer2:Timer;
		private var hasBikeStarted:Boolean = false;
		private var soundchannel:SoundChannel = new SoundChannel();
		private var soundchannel2:SoundChannel = new SoundChannel();
		private var crashedSoundChannel:SoundChannel = new SoundChannel();
		private var clappingSoundChannel:SoundChannel = new SoundChannel();
		
		private var isEngineSoundHigh:Boolean = false;
		private var isThrottleReleased:Boolean = false;
		
		private var lifesRemaining:int = 5;
		private var isSoundOn:Boolean = true;
		private var totalScore:int = 0;
		
		private var min:String="";
		private var sec:String = "";
		
		private var _t:Number;
		private var t:Number;
		private var totalTimeElapsed:Number=0;
		private var totalTimeRemaining:int;
        public function Main():void 
		{
			bikeposArray = new Array(new Point(670, 100), new Point(630, 510),new Point(550,120),new Point(100,120),new Point(700,400),new Point(700,80),new Point(700,200),new Point(200,400),new Point(530,160),new Point(260,500), new Point(222,258),new Point(300,357),new Point(550,300), new Point(375,415),new Point(620,343));
			bikeRotArray = new Array(180, 0,90,180,0, 270,270,0,180,90,180,25,0,0,270);
			levelNameArray =  new Array("level1", "level2", "level3","level4","level5","level6","level7","level8","level9","level10","level11","level12","level13","level14","level15");
            gamepaused = true;
			
			
        }
		function init()
		{
			
			playmc = getChildByName("play_btn") as MovieClip;
			playmc.addEventListener(MouseEvent.CLICK, mcPlayClickedListener);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpListener);
			
			
			
		}
		function changeBike(nextLevelName:String)
		{
			bike.bikepaused = false;
			
			switch(nextLevelName)
			{
				
				case "level1":
							bikePos = new Point();
							bikePos = bikeposArray[0];							
							bike = new Bike(670, 100);
							addChild(bike);
							bike.rotation = 180;
							break;
				
				case "level2":
							if (bike)
							{
								if (bike.parent)
								{
									bike.parent.removeChild(bike);		
								}
							}
							
							bike = new Bike2(630, 510);
							addChild(bike);
							bike.rotation = 0;
							break;
				case "level3":
							if (bike)
							{
								if (bike.parent)
								{
									bike.parent.removeChild(bike);		
								}
							}
							bike = new Bike3(550, 120);
							addChild(bike);
							bike.rotation = 90;
							break;
				case "level4":
							if (bike)
							{
								if (bike.parent)
								{
									bike.parent.removeChild(bike);		
								}
							}
							bike = new Bike2(100, 120);
							addChild(bike);
							bike.rotation = 180;
							break;
				case "level5":
							if (bike)
							{
								if (bike.parent)
								{
									bike.parent.removeChild(bike);		
								}
							}
							bike = new Bike(700, 400);
							addChild(bike);
							bike.rotation = 0;
							break;
				case "level6":
							if (bike)
							{
								if (bike.parent)
								{
									bike.parent.removeChild(bike);		
								}
							}
							bike = new Bike6(700, 80);
							addChild(bike);
							bike.rotation = 270;
							break;
				case "level7":
							if (bike)
							{
								if (bike.parent)
								{
									bike.parent.removeChild(bike);		
								}
							}
							bike = new Bike7(700, 200);
							addChild(bike);
							bike.rotation = 270;
							break;
				case "level8":
							if (bike)
							{
								if (bike.parent)
								{
									bike.parent.removeChild(bike);		
								}
							}
							bike = new Bike8(200, 400);
							addChild(bike);
							bike.rotation = 0;
							break;
				case "level9":
							if (bike)
							{
								if (bike.parent)
								{
									bike.parent.removeChild(bike);		
								}
							}
							bike = new Bike7(530, 160);
							addChild(bike);
							bike.rotation = 180;
							break;
				case "level10":
							if (bike)
							{
								if (bike.parent)
								{
									bike.parent.removeChild(bike);		
								}
							}
							bike = new Bike8(260, 500);
							addChild(bike);
							bike.rotation = 90;
							break;
							
				case "level11":
							if (bike)
							{
								if (bike.parent)
								{
									bike.parent.removeChild(bike);		
								}
							}
							bike = new Bike9(222, 258);
							addChild(bike);
							bike.rotation = 180;
							break;
				case "level12":
							if (bike)
							{
								if (bike.parent)
								{
									bike.parent.removeChild(bike);		
								}
							}
							var bikePos:Point = bikeposArray[11 ];
							bike.changePos(bikePos.x, bikePos.y);
							bike = new Bike(bikePos.x, bikePos.y);
							addChild(bike);
							bike.rotation =  bikeRotArray[11]
							break;
				case "level13":
							if (bike)
							{
								if (bike.parent)
								{
									bike.parent.removeChild(bike);		
								}
							}
							var bikePos:Point = bikeposArray[12];
							bike = new Bike13(bikePos.x, bikePos.y);
							addChild(bike);
							bike.rotation = bikeRotArray[12];
							break;
				case "level14":
							if (bike)
							{
								if (bike.parent)
								{
									bike.parent.removeChild(bike);		
								}
							}
							var bikePos:Point = bikeposArray[13];
							bike = new Bike9(bikePos.x, bikePos.y);
							addChild(bike);
							bike.rotation = bikeRotArray[13];
							break;
							
				case "level15": 
							if (bike)
							{
								if (bike.parent)
								{
									bike.parent.removeChild(bike);		
								}
							}
							var bikePos:Point = bikeposArray[14];
							bike = new Bike13(bikePos.x, bikePos.y);
							addChild(bike);
							bike.rotation = bikeRotArray[14];
							break;
							
							
							
							
			}
			bike.accelerate = false;
			
		}
		function keyUpListener(evt:KeyboardEvent)
		{
			if (evt.keyCode == 83)//s key for skip
			{
				
				
				
				/* code happening when congrats occurs*/
				gamepaused = false;
				//bike.max_speed = bikemaxspeed;
				var nextLevelName:String = levelNameArray[currentLevel + 1];
				
				if (currentLevel == 14)//this does not exist , goto game completed screen
				{
					trace('reached game completed screen via skipping');
					gamepaused = true;
					hud_mc.visible = false;
					bike.parent.removeChild(bike);
					gamecompleted_mc.x = 0;
					gamecompleted_mc.y = 0;
					
					gamecompleted_mc.parent.setChildIndex(gamecompleted_mc, gamecompleted_mc.parent.numChildren - 1);
					
					var scoreMC:MovieClip = gamecompleted_mc.getChildByName("score") as MovieClip;
					var scoreTF:TextField = scoreMC.getChildByName("txtScore") as TextField;
					scoreTF.text = "" + totalScore;
					
					stage.addEventListener(KeyboardEvent.KEY_UP, spacekeyForPlayAgainListener);
				//	var replaybutton:MovieClip = gamecompleted_mc.getChildByName("replay_mc") as MovieClip;
				//	replaybutton.addEventListener(MouseEvent.CLICK, replayGameCompletedClickedListener);	
					totalScore = 0;
					
					stopEngineHighSound();
					stopEngineRunningSound();
					bike.accelerate = false;
					isThrottleReleased = false;
				}
				else
				{
					this.gotoAndStop(nextLevelName);
					//this is where the new bike should be initialized//
					changeBike(nextLevelName);
					///////////////////////////////////////////////////
					
				//	var bikePos:Point = bikeposArray[currentLevel + 1];
				//	bike.changePos(bikePos.x, bikePos.y);
				//	bike.rotation = bikeRotArray[currentLevel + 1];
					currentLevel++;
					txtRemTime.text = "5:00" ;
					totalTimeElapsed = 0;
					_t = getTimer();
					//gameTimer.start();
					timeElapsed = 0;
					//bike.bikepaused = false;
					if (currentLevel >= 4)
					{
						this["levelmc"]["initX"] = this["levelmc"].x;
						this["levelmc"]["initY"] = this["levelmc"].y;	
					}
				}
				
				
				
				/*/////////////////////////////////////////*/
			}
		}
		function mcPlayClickedListener(evt:MouseEvent)
		{
			
			this.gotoAndStop(11);//level 1
			
			
			//here the level 1 bike is initialized
			bike = new Bike(670,100);			
			addChild(bike);
			smoke = new Smoke();
			addChild(smoke);
			soundchannel = rbEngineStarting.play();
			soundchannel.addEventListener(Event.SOUND_COMPLETE, onEngineStartedSoundPlayed);
		
			////////////////////////////////////
			bike.rotation = 180;
			obstacle_mc = getChildByName("obstacle") as MovieClip;
			parkingspot = getChildByName("parkingspot") as MovieClip;
			this.addEventListener(Event.ENTER_FRAME, enter_frame);
			gamepaused = false;
			//gameTimer.addEventListener(TimerEvent.TIMER, gameTimeCounter);
			//gameTimer.start();
			timeElapsed = 0;
			//hudmc = getChildByName("hud_mc") as MovieClip;
			var mcAudio:MovieClip = hud_mc.getChildByName("audio_mc") as MovieClip;
			mcAudio.addEventListener(MouseEvent.CLICK, audioToggleListener);	
		
			_t = getTimer();
			
		}
		function onEngineStartedSoundPlayed(evt:Event)
		{
			hasBikeStarted = true;	
			
			//	gamepaused = false;
		}
		
		
		
	
		
		function gameTimeCounter(evt:TimerEvent)
		{
			++timeElapsed;
			timeRemaining = 5 * 60 - timeElapsed;
			var m = int(timeRemaining / 60);
			var s = int(timeRemaining % 60);
			
			txtRemTime = hud_mc.getChildByName("txtRemainingTime") as TextField;
			
			if (s < 10)
			{
				sec = "0" + s;
			}
			else
			{
				sec = "" + s;
			}
			if (m < 10)
			{
				min = "0" + m;
			}
			else 
			{
				min = "" + m;
			}
			//the value of min and sec is used inside enter frame 
			
			
			
		}
		function audioToggleListener(evt:MouseEvent)
		{
			
			var mcAudio:MovieClip = hud_mc.getChildByName("audio_mc") as MovieClip;

			if (isSoundOn == true)
			{
				isSoundOn = false;
				mcAudio.gotoAndStop(2);
				
				
			}
			else
			{
				isSoundOn = true;
				mcAudio.gotoAndStop(1);
				
				isThrottleReleased = false;
			}
		}
		
		function enter_frame(evt:Event)
		{
			
			if (!gamepaused)
			{
				
				
				t = getTimer();
				var dt:Number = (t - _t) * 0.001;
				_t = t;
				totalTimeElapsed += dt;
				var timeSpent:int = Math.round(totalTimeElapsed);
				totalTimeRemaining = 5 * 60 - timeSpent;
				
				
				
				var m = int(totalTimeRemaining / 60);
				var s = int(totalTimeRemaining % 60);
				
				txtRemTime = hud_mc.getChildByName("txtRemainingTime") as TextField;
				
				if (s < 10)
				{
					sec = "0" + s;
				}
				else
				{
					sec = "" + s;
				}
				if (m < 10)
				{
					min = "0" + m;
				}
				else 
				{
					min = "" + m;
				}
				txtRemTime.text = "" + min + ":" + sec;
			
				 
				if (totalTimeRemaining == 0 )
				{
					elapsed_mc.gotoAndPlay(2);
					totalTimeElapsed = 0;
					movingobstacle_mc = obstacle_mc.getChildByName("movingobstacle1") as MovieClip;
					if (movingobstacle_mc)
					{
						movingobstacle_mc.stop();
					}
					var movingobstacle2 = obstacle_mc.getChildByName("movingobstacle2") as MovieClip;
					if (movingobstacle2)
					{
						movingobstacle2.stop();
					}
					var movingobstacle_mc3 = obstacle_mc.getChildByName("movingobstacle3") as MovieClip;
					if (movingobstacle_mc3)
					{
						movingobstacle_mc3.stop();
					}
					var movingobstacle4 = obstacle_mc.getChildByName("movingobstacle4") as MovieClip;
					if (movingobstacle4)
					{
						movingobstacle4.stop();
					}
					
					
					bike.speed = 0;
					
					bike.bikepaused = true;
					gamepaused = true;
					bikemaxspeed = bike.max_speed;
					bike.max_speed = 0;
					//gameTimer.stop();
					smoke.gotoAndStop(1);
					
					hasBikeStarted = false;
					
					
					stopEngineHighSound();
					stopEngineRunningSound();
					lifesRemaining--;
					
					//bike["smoke"].visible = false;
					if (isSoundOn == true && rbCrashing && crashedSoundChannel)
					{
						crashedSoundChannel = rbCrashing.play();	
					}
					return;
				}
				obstacle_mc = this["levelmc"].getChildByName("obstacle") as MovieClip;
				
				if (obstacle_mc)
				{
					movingobstacle_mc = obstacle_mc.getChildByName("movingobstacle1") as MovieClip;
				}
				parkingspot = this["levelmc"].getChildByName("parkingspot") as MovieClip;
				bike.parent.setChildIndex(bike, bike.parent.numChildren - 1);
				crashed_mc = getChildByName("crashed_mc") as MovieClip;
				crashed_mc.parent.setChildIndex(crashed_mc, crashed_mc.parent.numChildren - 1);
				congratsmc = getChildByName("congrats_mc") as MovieClip;
				congratsmc.parent.setChildIndex(congratsmc, congratsmc.parent.numChildren - 1);
				elapsed_mc.parent.setChildIndex(elapsed_mc, elapsed_mc.parent.numChildren - 1);
				//hudmc = getChildByName("hud_mc") as MovieClip;
				
				
					
				
				hud_mc.parent.setChildIndex(hud_mc, hud_mc.parent.numChildren - 1);
				txtCurrentLevelName = hud_mc.getChildByName("txtCurrentLevel") as TextField;
				txtCurrentLevelName.text = "" + (currentLevel + 1);	
				var mcLife:MovieClip = hud_mc.getChildByName("life") as MovieClip;
				mcLife.gotoAndStop(lifesRemaining);
					
					
				
				if (bike.accelerate == true)
				{
				
					var exhaust:MovieClip = bike.getChildByName("ex") as MovieClip;
					var smokepoint:Point = new Point();
					
					
					smokepoint = bike.localToGlobal(new Point(exhaust.x, exhaust.y));
				
					smoke.x = smokepoint.x;
					smoke.y = smokepoint.y;
					
					smoke.parent.setChildIndex(smoke, smoke.parent.numChildren - 1);
					smoke.rotation = bike.rotation;
					smoke.gotoAndStop(2);
					
				}
				else
				{
					smoke.gotoAndStop(1);
				}
				
				
				
				if (hasBikeStarted == true)
				{
					
					if (bike.accelerate == true )
					{
						
						/*throttle has been pressed
						 * if the engine high sound is not yet started, start it
						 */
						stopEngineRunningSound();
						if (isEngineSoundHigh == false)//engine not yet started
						{
							playEngineHighSound(null);
							isEngineSoundHigh = true;
							isThrottleReleased = false;
						}
					}
					else
					{
						
						
						
						/*the throttle is released
						 * so, the engine running sound should be played.
						 */
						isEngineSoundHigh = false;
						stopEngineHighSound();
						if (isThrottleReleased == false)
						{
						
							
							playEngineRunningSound(null);
							isThrottleReleased = true;
						}
						
					}
				}
				/* sound override*/
				if (isSoundOn == false)
				{
					stopEngineHighSound();
					stopEngineRunningSound();
				}
				
				
				/******************/
				
				if (currentLevel >= 4 )//currentLevel starts with 0
				{
					
					if (bike.y < 50 )
					{
						
						this["levelmc"].y += 500;
						bike.y = 550;
					}
					else if ( bike.y > 550)
					{
						this["levelmc"].y -= 500;						
						bike.y = 50;
					}
					
					if (bike.x < 50)
					{
						this["levelmc"].x += 700;
						bike.x = 750;
					}
					else if(bike.x>750)
					{
						this["levelmc"].x -= 700;
						bike.x = 50;
					}
					
				}
		
				
				if ( PixelPerfectCollisionDetection.isColliding(bike, obstacle_mc, obstacle_mc.parent, true))
				{
					
					
					movingobstacle_mc = obstacle_mc.getChildByName("movingobstacle1") as MovieClip;
					if (movingobstacle_mc)
					{
						movingobstacle_mc.stop();
					}
					var movingobstacle2 = obstacle_mc.getChildByName("movingobstacle2") as MovieClip;
					if (movingobstacle2)
					{
						movingobstacle2.stop();
					}
					var movingobstacle_mc3 = obstacle_mc.getChildByName("movingobstacle3") as MovieClip;
					if (movingobstacle_mc3)
					{
						movingobstacle_mc3.stop();
					}
					var movingobstacle4 = obstacle_mc.getChildByName("movingobstacle4") as MovieClip;
					if (movingobstacle4)
					{
						movingobstacle4.stop();
					}
					
					
					bike.speed = 0;
					crashed_mc.gotoAndPlay(2);
					bike.bikepaused = true;
					gamepaused = true;
					bikemaxspeed = bike.max_speed;
					bike.max_speed = 0;
					//gameTimer.stop();
					smoke.gotoAndStop(1);
					
					hasBikeStarted = false;
					
					
					stopEngineHighSound();
					stopEngineRunningSound();
					lifesRemaining--;
					
					//bike["smoke"].visible = false;
					if (isSoundOn == true && rbCrashing && crashedSoundChannel)
					{
						crashedSoundChannel = rbCrashing.play();	
					}
					
					
				}
				//else used to make sure collision and parking does not happen at the same instant
				else if ( PixelPerfectCollisionDetection.isColliding(bike, parkingspot, parkingspot.parent, true))
				{
					
					if (
						(PixelPerfectCollisionDetection.isColliding(bike["front1"], parkingspot, parkingspot.parent, true) )
					&&	(PixelPerfectCollisionDetection.isColliding(bike["front2"], parkingspot, parkingspot.parent, true) )
					&& (PixelPerfectCollisionDetection.isColliding(bike["rear1"], parkingspot, parkingspot.parent, true))
					&& (PixelPerfectCollisionDetection.isColliding(bike["rear2"], parkingspot, parkingspot.parent, true))					
					&& (bike.speed == 0)
					)
					{
										
						gamepaused = true;						
						congratsmc.gotoAndPlay(2);
						bikemaxspeed = bike.max_speed;
						bike.max_speed = 0;
						//gameTimer.stop();
						bike.bikepaused = true;
						smoke.gotoAndStop(1);
						soundchannel.stop();
						
						
						hasBikeStarted = false;
						
						stopEngineHighSound();
						stopEngineRunningSound();
						bike.accelerate = false;
						isThrottleReleased = false;
						
						if (isSoundOn==true&& rbClapping && clappingSoundChannel)
						{
							clappingSoundChannel = rbClapping.play();	
						}
						trace('rbClapping:' + rbClapping);
						trace('clappingSoundChannel:' + clappingSoundChannel);
						
					}
				}
				
				
			}
			else
			{
				//game is paused
				if (elapsed_mc.currentFrame == elapsed_mc.totalFrames - 1)
				{
					var bikePos:Point = bikeposArray[currentLevel ];
					bike.changePos(bikePos.x, bikePos.y);
					bike.rotation = bikeRotArray[currentLevel ];
					bike["head"] .rotation = 0;
					bike.max_speed = bikemaxspeed;
					bike.bikepaused = false;
					
					//gameTimer.start();
					timeElapsed = 0;
				//	bike["smoke"].visible = true;
					if (currentLevel >= 4)
					{
						this["levelmc"].x = this["levelmc"]["initX"];
						this["levelmc"].y = this["levelmc"]["initY"];	
					}
					if (movingobstacle_mc)
					{						
						movingobstacle_mc.gotoAndPlay(2);
					}
					var movingobstacle2 = obstacle_mc.getChildByName("movingobstacle2") as MovieClip;
					if (movingobstacle2)
					{
						movingobstacle2.gotoAndPlay(2);
					}
					var movingobstacle3 = obstacle_mc.getChildByName("movingobstacle3") as MovieClip;
					if (movingobstacle3)
					{
						
						movingobstacle3.gotoAndPlay(2);
					}
					var movingobstacle4 = obstacle_mc.getChildByName("movingobstacle4") as MovieClip;
					if (movingobstacle4)
					{
						movingobstacle4.gotoAndPlay(2);
					}
						
					
					soundchannel = rbEngineStarting.play();
					soundchannel.addEventListener(Event.SOUND_COMPLETE, onEngineStartedSoundPlayed);
					gamepaused = false;
					totalTimeElapsed = 0;
					_t = getTimer();
					trace('time elapsed animation completed , time to replay level with one life lost');
				}
				if (crashed_mc.currentFrame == crashed_mc.totalFrames - 1)
				{		
					var levelScore:int = lifesRemaining * totalTimeRemaining;
					totalScore += levelScore;
					
					
					totalTimeElapsed = 0;
					_t = getTimer();
					txtRemTime.text = "5:00" ;
					if (lifesRemaining == 0)
					{
						
						bike.parent.removeChild(bike);
						//var mcAudio:MovieClip = hud_mc.getChildByName("audio_mc") as MovieClip;	
						//mcAudio.removeEventListener(MouseEvent.CLICK, audioToggleListener);
						hud_mc.visible = false;
						gameover_mc.x = 0;
						gameover_mc.y = 0;
						var scoreMC:MovieClip = gameover_mc.getChildByName("score") as MovieClip;
						var scoreTF:TextField = scoreMC.getChildByName("txtScore") as TextField;
						scoreTF.text = "" + totalScore;
						
						if (currentLevel == 0)
						{
							scoreTF.text = "0";
						}
						var replaybutton:MovieClip = gameover_mc.getChildByName("replay_mc") as MovieClip;
						stage.addEventListener(KeyboardEvent.KEY_UP, spacekeyUpListener);
						replaybutton.addEventListener(MouseEvent.CLICK, replayGameListener);
						totalScore = 0;
						
					}
					else
					{
						
						var bikePos:Point = bikeposArray[currentLevel ];
						bike.changePos(bikePos.x, bikePos.y);
						bike.rotation = bikeRotArray[currentLevel ];
						bike["head"] .rotation = 0;
						bike.max_speed = bikemaxspeed;
						bike.bikepaused = false;
						
						//gameTimer.start();
						timeElapsed = 0;
					//	bike["smoke"].visible = true;
						if (currentLevel >= 4)
						{
							this["levelmc"].x = this["levelmc"]["initX"];
							this["levelmc"].y = this["levelmc"]["initY"];	
						}
						if (movingobstacle_mc)
						{						
							movingobstacle_mc.gotoAndPlay(2);
						}
						var movingobstacle2 = obstacle_mc.getChildByName("movingobstacle2") as MovieClip;
						if (movingobstacle2)
						{
							movingobstacle2.gotoAndPlay(2);
						}
						var movingobstacle3 = obstacle_mc.getChildByName("movingobstacle3") as MovieClip;
						if (movingobstacle3)
						{
							
							movingobstacle3.gotoAndPlay(2);
						}
						var movingobstacle4 = obstacle_mc.getChildByName("movingobstacle4") as MovieClip;
						if (movingobstacle4)
						{
							movingobstacle4.gotoAndPlay(2);
						}
						
						soundchannel = rbEngineStarting.play();
						soundchannel.addEventListener(Event.SOUND_COMPLETE, onEngineStartedSoundPlayed);
						gamepaused = false;
					}
					
					
				}
				if (congratsmc.currentFrame == congratsmc.totalFrames - 1)
				{		
					totalTimeElapsed = 0;
					
					var levelScore:int = lifesRemaining * totalTimeRemaining;
					totalScore += levelScore;
					trace('levelscore:' + levelScore);
					trace('lifesRemaining * totalTimeRemaining' + lifesRemaining * totalTimeRemaining);
					trace('totalTimeRemaining:' + totalTimeRemaining);
					trace('lifesRemaining:' + lifesRemaining);
					if (currentLevel == 14)//level 15 completed
					{
						trace('game completed via driving all levels');
						hud_mc.visible = false;
						bike.parent.removeChild(bike);
						gamecompleted_mc.x = 0;
						gamecompleted_mc.y = 0;
						gamecompleted_mc.parent.setChildIndex(gamecompleted_mc, gamecompleted_mc.parent.numChildren - 1);
						
						var scoreMC:MovieClip = gamecompleted_mc.getChildByName("score") as MovieClip;
						var scoreTF:TextField = scoreMC.getChildByName("txtScore") as TextField;
						scoreTF.text = "" + totalScore;
						
						stage.addEventListener(KeyboardEvent.KEY_UP, spacekeyForPlayAgainListener);
						//var gamereplaybutton:MovieClip = gamecompleted_mc.getChildByName("replay_mc") as MovieClip;
						//gamereplaybutton.addEventListener(MouseEvent.CLICK, replayGameCompletedClickedListener);	
						totalScore = 0;
					}
					else
					{
						
						levelcompleted_mc.x = 0;
						levelcompleted_mc.y = 0;
						hud_mc.visible = false;
						bike.parent.removeChild(bike);
						var scoreMC:MovieClip = levelcompleted_mc.getChildByName("score") as MovieClip;
						var scoreTF:TextField = scoreMC.getChildByName("txtScore") as TextField;
						scoreTF.text = "" + totalScore;
						stage.addEventListener(KeyboardEvent.KEY_UP, spacekeyForNextLevelListener);
						var continuebutton:MovieClip = levelcompleted_mc.getChildByName("continue_mc") as MovieClip;
						continuebutton.addEventListener(MouseEvent.CLICK, continueToNextLevelClickedListener);	
						
							//if level is 4,8,12 add one life
						if (lifesRemaining < 5 )
						{
							trace('currentLevel:' + currentLevel);
							if (currentLevel == 2 || currentLevel == 6 || currentLevel == 10)
							{
								lifesRemaining++;
							}	
						}
						
						////////////////////////////////
					}
					
					
				}
				
				
				
			}
			
			
			
		}
		private function replayGameCompletedClickedListener(evt:MouseEvent)
		{
			trace('replay game by mouse click invoked');
			evt.currentTarget.removeEventListener(MouseEvent.CLICK, replayGameCompletedClickedListener);
			stage.removeEventListener(KeyboardEvent.KEY_UP, spacekeyForPlayAgainListener);
			replayCompletedGame();
			
		}
		
		private function spacekeyForPlayAgainListener(evt:KeyboardEvent)
		{
			trace('replay game by spacebar invoked');
			replayCompletedGame();
			stage.removeEventListener(KeyboardEvent.KEY_UP, spacekeyForPlayAgainListener);
			
		}
		private function replayCompletedGame()
		{
			totalTimeElapsed = 0;
			_t = getTimer();
			hud_mc.visible = true;
			gamecompleted_mc.x = -1000;
			gamecompleted_mc.y = -1000;
			//LOAD FIRST LEVEL
			txtRemTime.text = "5:00" ;
			//gameTimer.start();
			timeElapsed = 0;
			lifesRemaining = 5;
			
			
			
			this.gotoAndStop(11);//level 1
			
			currentLevel = 0;
			//here the level 1 bike is initialized
			
			bike = new Bike(670,100);			
			addChild(bike);
			//smoke = new Smoke();
			//addChild(smoke);//look if previous level smoke is present
			soundchannel = rbEngineStarting.play();
			soundchannel.addEventListener(Event.SOUND_COMPLETE, onEngineStartedSoundPlayed);
		
			////////////////////////////////////
			bike["head"] .rotation = 0;
			bike.rotation = 180;
			obstacle_mc = getChildByName("obstacle") as MovieClip;
			parkingspot = getChildByName("parkingspot") as MovieClip;
			
			gamepaused = false;
			
			timeElapsed = 0;
			
			_t = getTimer();
			
		}
		private function continueToNextLevelClickedListener(evt:MouseEvent)
		{
			levelcompleted_mc.x = -2000;
			levelcompleted_mc.y = -2000;
			hud_mc.visible = true;
			gotoNextLevel();
		}
		private function spacekeyForNextLevelListener(evt:KeyboardEvent)
		{
			if (evt.keyCode == 32)
			{
				levelcompleted_mc.x = -2000;
				levelcompleted_mc.y = -2000;
				hud_mc.visible = true;
				gotoNextLevel();
				evt.currentTarget.removeEventListener(KeyboardEvent.KEY_UP, spacekeyForNextLevelListener);
			}
		}
		private function gotoNextLevel()
		{
			totalTimeElapsed = 0;
			_t = getTimer();
			bike.max_speed = bikemaxspeed;
			var nextLevelName:String = levelNameArray[currentLevel + 1];
			this.gotoAndStop(nextLevelName);
			changeBike(nextLevelName);
			//var pos:Point = bikeposArray[currentLevel + 1];
			//bike.changePos(pos.x, pos.y);
			//bike.rotation = bikeRotArray[currentLevel + 1];
			currentLevel++;
			txtRemTime.text = "5:00" ;
			//gameTimer.start();
			timeElapsed = 0;
			//bike.bikepaused = false;
			if (currentLevel >= 4)
			{
				this["levelmc"]["initX"] = this["levelmc"].x;
				this["levelmc"]["initY"] = this["levelmc"].y;	
			}
			
			soundchannel = rbEngineStarting.play();
			soundchannel.addEventListener(Event.SOUND_COMPLETE, onEngineStartedSoundPlayed);
			gamepaused = false;
		}
		private function replayGame()
		{
			totalTimeElapsed = 0;
			_t = getTimer();
			gameover_mc.x = -1000;
			gameover_mc.y = -1000;
			hud_mc.visible = true;
			//LOAD FIRST LEVEL
			this.gotoAndStop(11);//level 1
			changeBike("level1");
			currentLevel = 0;
			bike["head"] .rotation = 0;
			bike.max_speed = bikemaxspeed;
			bike.bikepaused = false;
			txtRemTime.text = "5:00" ;
			//gameTimer.start();
			timeElapsed = 0;
			lifesRemaining = 5;
			soundchannel = rbEngineStarting.play();
			soundchannel.addEventListener(Event.SOUND_COMPLETE, onEngineStartedSoundPlayed);
			gamepaused = false;
			
		}
		
		private function replayGameListener(evt:MouseEvent)
		{
			trace('mouse clicked on replay');
			replayGame();
		}
		private function spacekeyUpListener(evt:KeyboardEvent)
		{
			if (evt.keyCode == 32)
			{
				
				replayGame();
				stage.removeEventListener(KeyboardEvent.KEY_UP, spacekeyUpListener);	
			}
			
			
		}
		
		function playEngineHighSound(evt:Event)
		{
			
			stopEngineRunningSound();
			
			soundchannel2 = rbEngineHigh.play(80);
			if (restartTimer2)
			{
				if (restartTimer2.hasEventListener(TimerEvent.TIMER_COMPLETE))
				{
					restartTimer2.stop();
					restartTimer2.removeEventListener(TimerEvent.TIMER_COMPLETE, playEngineHighSound);			
				}
			}
			
			restartTimer2 = new Timer(rbEngineHigh.length -100 , 1);			
			restartTimer2.start();			
			restartTimer2.addEventListener(TimerEvent.TIMER_COMPLETE, playEngineHighSound);
		}
		
		function playEngineRunningSound(evt:Event)
		{
			stopEngineHighSound();
			
			soundchannel = rbEngineRunning.play(180);			
			
			if (restartTimer)
			{
				if (restartTimer.hasEventListener(TimerEvent.TIMER_COMPLETE))
				{
					restartTimer.stop();
					restartTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, playEngineRunningSound);
				}
			}
			restartTimer = new Timer(rbEngineRunning.length - 250, 1);			
			restartTimer.start();
			restartTimer.addEventListener(TimerEvent.TIMER_COMPLETE, playEngineRunningSound);
		}
		
		public function stopEngineHighSound()
		{
			soundchannel2.stop();
			if (restartTimer2)
			{
				restartTimer2.stop();			
				if (restartTimer2.hasEventListener(TimerEvent.TIMER_COMPLETE))
				{
					restartTimer2.removeEventListener(TimerEvent.TIMER_COMPLETE, playEngineHighSound);
				}
			}
			
			
			isEngineSoundHigh = false;
		}
		
		public function stopEngineRunningSound()
		{
			soundchannel.stop();
			if (restartTimer)
			{
				restartTimer.stop();			
				if (restartTimer.hasEventListener(TimerEvent.TIMER_COMPLETE))
				{
					restartTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, playEngineRunningSound);
				}
			}
			
		}
    }
}