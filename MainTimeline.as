package balldropBONUS_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.ColorTransform;
   import flash.text.TextField;
   
   public dynamic class MainTimeline extends MovieClip
   {
       
      
      public var restartbutton:SimpleButton;
      
      public var rbtrndm:Number;
      
      public var mybgcolor:ColorTransform;
      
      public var hit:Number;
      
      public var startbutton:SimpleButton;
      
      public var myballcolor:ColorTransform;
      
      public var score:Number;
      
      public var mysquare3color:ColorTransform;
      
      public var square1:MovieClip;
      
      public var square2:MovieClip;
      
      public var square4:MovieClip;
      
      public var mysquare4color:ColorTransform;
      
      public var ypos:Number;
      
      public var square3:MovieClip;
      
      public var bg:MovieClip;
      
      public var mytext:TextField;
      
      public var mysquare1color:ColorTransform;
      
      public var flipbutton:SimpleButton;
      
      public var yspeed:Number;
      
      public var mytext2:TextField;
      
      public var mysquare2color:ColorTransform;
      
      public var ball:MovieClip;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,2,this.frame3);
      }
      
      public function rotatespace(param1:KeyboardEvent) : void
      {
         this.square1.rotation = this.square1.rotation + 90;
         this.square2.rotation = this.square2.rotation + 90;
         this.square3.rotation = this.square3.rotation + 90;
         this.square4.rotation = this.square4.rotation + 90;
      }
      
      public function restart(param1:MouseEvent) : void
      {
         this.restartbutton.removeEventListener(MouseEvent.CLICK,this.restart);
         gotoAndStop(2);
      }
      
      public function startgm(param1:MouseEvent) : void
      {
         this.startbutton.removeEventListener(MouseEvent.CLICK,this.startgm);
         gotoAndStop(2);
      }
      
      public function reset() : void
      {
         this.mysquare1color.color = Math.random() * 16777215;
         this.mysquare2color.color = Math.random() * 16777215;
         this.mysquare3color.color = Math.random() * 16777215;
         this.mysquare4color.color = Math.random() * 16777215;
         this.mybgcolor.color = this.mysquare1color.color ^ 16777215;
         this.myballcolor.color = this.mysquare1color.color;
         this.ball.transform.colorTransform = this.myballcolor;
         this.square1.transform.colorTransform = this.mysquare1color;
         this.square2.transform.colorTransform = this.mysquare2color;
         this.square3.transform.colorTransform = this.mysquare3color;
         this.square4.transform.colorTransform = this.mysquare4color;
         this.bg.transform.colorTransform = this.mybgcolor;
         this.rbtrndm = Math.floor(Math.random() * 4) + 1;
         this.square1.rotation = this.square1.rotation + this.rbtrndm * 90;
         this.square2.rotation = this.square2.rotation + this.rbtrndm * 90;
         this.square3.rotation = this.square3.rotation + this.rbtrndm * 90;
         this.square4.rotation = this.square4.rotation + this.rbtrndm * 90;
         this.ypos = -50;
         this.ball.y = -50;
         this.hit = 1;
         this.score++;
         this.mytext.text = String(this.score);
         this.yspeed = this.yspeed + 0.2;
      }
      
      public function moveball(param1:Event) : void
      {
         this.ball.y = this.ypos;
         this.ypos = this.ypos + this.yspeed;
         if(this.ball.hitTestObject(this.square1))
         {
            if(this.hit == 1)
            {
               this.hit = 0;
               this.reset();
            }
         }
         if(this.ball.hitTestObject(this.square2))
         {
            this.ball.removeEventListener(Event.ENTER_FRAME,this.moveball);
            this.flipbutton.removeEventListener(MouseEvent.CLICK,this.rotate);
            stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.rotatespace);
            nextFrame();
         }
         if(this.ball.hitTestObject(this.square3))
         {
            this.ball.removeEventListener(Event.ENTER_FRAME,this.moveball);
            this.flipbutton.removeEventListener(MouseEvent.CLICK,this.rotate);
            stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.rotatespace);
            nextFrame();
         }
         if(this.ball.hitTestObject(this.square4))
         {
            this.ball.removeEventListener(Event.ENTER_FRAME,this.moveball);
            this.flipbutton.removeEventListener(MouseEvent.CLICK,this.rotate);
            stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.rotatespace);
            nextFrame();
         }
      }
      
      public function rotate(param1:MouseEvent) : void
      {
         this.square1.rotation = this.square1.rotation + 90;
         this.square2.rotation = this.square2.rotation + 90;
         this.square3.rotation = this.square3.rotation + 90;
         this.square4.rotation = this.square4.rotation + 90;
      }
      
      function frame1() : *
      {
         stop();
         this.startbutton.addEventListener(MouseEvent.CLICK,this.startgm);
      }
      
      function frame2() : *
      {
         stage.focus = stage;
         this.flipbutton.alpha = 0;
         this.ypos = 50;
         this.yspeed = 3;
         this.score = 0;
         this.hit = 1;
         this.rbtrndm = 90;
         this.myballcolor = new ColorTransform();
         this.mysquare1color = new ColorTransform();
         this.mysquare2color = new ColorTransform();
         this.mysquare3color = new ColorTransform();
         this.mysquare4color = new ColorTransform();
         this.mybgcolor = new ColorTransform();
         this.ball.addEventListener(Event.ENTER_FRAME,this.moveball);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this.rotatespace);
         this.flipbutton.addEventListener(MouseEvent.CLICK,this.rotate);
      }
      
      function frame3() : *
      {
         this.mytext2.text = String(this.score);
         this.restartbutton.addEventListener(MouseEvent.CLICK,this.restart);
      }
   }
}
