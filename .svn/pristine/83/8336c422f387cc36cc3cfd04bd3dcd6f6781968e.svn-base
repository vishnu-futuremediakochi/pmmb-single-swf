package {
	import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.geom.Point;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
    public class Bike6 extends Sprite {
        public var acceleration:Number=0.33;
        public var speed_decay:Number=0.90;
        public var rotation_step:Number=5;
        public var max_speed:Number=10;
        public var back_speed:Number=0.4;
        public var speed:Number=0;
        public var accelerate, brake, turn_left, turn_right:Boolean = false;
		public var rposx, rposy:int;
		public var bikepaused:Boolean = false;
		public var isEngineSoundHigh:Boolean = false;
		public var soundchannel2:SoundChannel = new SoundChannel();
		public var rbEngineHigh:Sound = new RBEngineHigh();
		private var restartTimer:Timer;
        public function Bike6(posx:int,posy:int):void {
            x=posx;
            y = posy;
			rposx = posx;
			rposy = posy;
			
            addEventListener(Event.ADDED_TO_STAGE,init);
        }
		public function removeListeners()
		{
			removeEventListener(Event.ENTER_FRAME, on_enter_frame);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, on_key_down);
			stage.removeEventListener(KeyboardEvent.KEY_UP, on_key_up);
		}
		public function addListeners()
		{
			addEventListener(Event.ENTER_FRAME,on_enter_frame);
            stage.addEventListener(KeyboardEvent.KEY_DOWN,on_key_down);
            stage.addEventListener(KeyboardEvent.KEY_UP,on_key_up);
		}
	
		public function resetFlags()
		{
			accelerate = false;
			brake = false;
			turn_left = false;
			turn_right = false;
		}
		public function removeObjectAndListeners()
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			removeEventListener(Event.ENTER_FRAME, on_enter_frame);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, on_key_down);
			stage.removeEventListener(KeyboardEvent.KEY_UP, on_key_up);
		}
		public function resetPos()
		{
			x=rposx;
            y=rposy;
		}
		public function changePos(posx:int, posy:int)
		{
			x = posx;
			y = posy;
		}
        public function init(e:Event):void {
            addEventListener(Event.ENTER_FRAME,on_enter_frame);
            stage.addEventListener(KeyboardEvent.KEY_DOWN,on_key_down);
            stage.addEventListener(KeyboardEvent.KEY_UP,on_key_up);
        }
		
        public function on_enter_frame(e:Event):void 
		{
			if (bikepaused)
			{
				
				return;//if paused , do nothing an return
			}
			
            if (accelerate&&speed<max_speed) {
                speed+=acceleration;
            }
            if (brake&&speed>-1) {
                speed-=back_speed;
            }
            var speed_x:Number=Math.sin(rotation*0.0174532925)*speed;
            var speed_y:Number = - Math.cos(rotation * 0.0174532925) * speed;
			
		
            if (turn_left ) 
			{
				if (accelerate)
				{
					
					if (this["head"].rotation > -15 )
					{
						this["head"].rotation -= rotation_step * (speed / max_speed);	
					}	
				}
				if (brake)
				{
					if (this["head"].rotation > -15 )
					{
						this["head"].rotation += rotation_step * (speed / max_speed);	
					}	
				}
				
                
				rotation -= rotation_step*(speed/max_speed);
            }
            else if (turn_right) 
			{
				if (accelerate)
				{
					if (this["head"].rotation < 15 )
					{
						this["head"].rotation += rotation_step * (speed / max_speed);	
					}	
				}
				if (brake)
				{
					if (this["head"].rotation < 15 )
					{
						this["head"].rotation -= rotation_step * (speed / max_speed);	
					}	
				}
				
                
				rotation += rotation_step*(speed/max_speed);
            }
			else
			{
				
				this["head"].rotation *= speed_decay;	
			}
            y+=speed_y;
            x+=speed_x;
           
			
			
            if (Math.abs(speed)>0.3) {
                speed*=speed_decay;
            } else {
                speed=0;
            }
        }
        public function on_key_down(e:KeyboardEvent):void {
            if (e.keyCode==38) {
                accelerate = true;
				
            }
            if (e.keyCode==40) {
                brake=true;
            }
            if (e.keyCode==37) {
                turn_left=true;
            }
            if (e.keyCode==39) {
                turn_right=true;
            }
        }
        public function on_key_up(e:KeyboardEvent):void {
            if (e.keyCode==38) {
                accelerate = false;
				
            }
            if (e.keyCode==40) {
                brake=false;
            }
            if (e.keyCode==37) {
                turn_left=false;
            }
            if (e.keyCode==39) {
                turn_right=false;
            }
			
        }
		
    }
}