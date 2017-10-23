import processing.sound.*;
SoundFile file;
float player1 = 0;
float player2 = 0;
int size =20;
float x = 0;
firework[] test2 = new firework[size];

Particles[] Name = new Particles[size];
 Play Start = new Play();
 void setup() {
 //PImage bike = loadImage("bluemenubike.jpg");
 size(1500,750);
 for (int i = 0; size > i; i++) {
          test2[i] = new firework();
        }
 load();
  file = new SoundFile(this, "TronSound.mp3");
  file.play();
 }
 void draw() {
   background(0);
   
   if (Start.isDone() == 0) {
     
   Start.draw();
   }
   if (Start.isDone() == 1) {
     if (player1 < 5 && player2 < 5) {
     play1();
     text(player1,50,50);
   text(player2,1050,50);
     }
   
   }
   if (Start.isDone() == 2) {
     if (player1 < 5 && player2 < 5) {
      play2();
      text(player1,50,50);
      text(player2,1050,50);
     }
    
   }
   if (!(player1 < 5 && player2 < 5)) {
     println("done");
      if(player1 >= 5) {
      image( loadImage("Trophy.png"),550,0,x,x);
      text("Player 1 wins",width/2,height/2+50);
        if (x < 1000) {
        x+=15;
        }
        
      
        
      }
      
      if (player2 >= 5) {
      
        image( loadImage("Trophy.png"),150,-150,x,x);
        text("Player 2 wins",width/2,height/2+50);
        if (x < 1000) {
        x+=15;
        }
        for (int i = 0; size > i; i++) {
          test2[i].update();
        }
        //test2.update();
        
        //play again screen
      }
   }
   
 }
 void keyPressed() {
  First.updateDir();
  if (Start.isDone() == 2) {
      Second.updateDir2();
   }
  
  
 
}
class Trail {
  float x = 0;
  float y = 0;
  float R = 0;
  float gen = 0;
  float B = 0;
  Trail (float X, float Y,float Color) {
    x = X;
    y = Y;
    if (Color > 250) {
      B = (Color-250);
      if (Color > 500) {
        Color = 0;
      }
    }
    else{
      R = Color;
    }
  }
  void update() {
    
    //noFill(); //REMOVE THIs
    gen +=10;
    ellipse(x,y,8,8);
  }
}
class firework {
  float x = random(1500);
  float y = 750;
  float speed = random(1,8);
  ArrayList particles = new ArrayList();
    void update() {
      if (speed >= 0 && y > 0) {
        ellipse(x,y,10,10);
        y -= speed;
        speed -= .01;
      }
      
      else {
      while(particles.size() < 185) {
        particle temp = new particle(random(360),x,y,random(55));
        particles.add(temp);
      }
      for (int i = 0; particles.size() > i; i++) {
        ((particle) particles.get(i)).update();
      }
      }
      
      
      
      
    }
}
class particle {
  float dir,x,y,speed;
  float r = random(250);
  float g = random(250);
  float b = random(250);
  int size2 = 15;
  ArrayList trail = new ArrayList();
  particle(float Dir, float X, float Y,float Speed) {
    dir = Dir;
    x = X;
    y = Y;
    speed = Speed;
    for (int i = 0; size2 > i; i++) {
      Trail temp = new Trail(x,y,0);
      trail.add(temp);
    }
    
  }
  void update() {
     fill(r,g,b,speed*5);
   
    float[] val = lineD(dir,-speed,x,y);
    x = val[0];
    y = val[1];
   
    //ellipse(x,y,5,5);
    if (speed > 0) {
       Trail temp2 = new Trail(x,y,0);
     trail.add(temp2);
     trail.remove(0); //remove last, add new to start
     for (int i = 0; size2 > i; i++) {
       
       ((Trail) trail.get(i)).update();// uncomment to see trail
       
     }
    speed -= .2;
    if (dir%360 < 180) {
    dir += 5;
    }
    else {
      dir -= 5;
    }
    }
    else{
      speed = 0;
    }
  }
}




  




float[] lineD(float direction2, float len, float posX, float posY) { //return true if hit
  float direction = angleToRadians(direction2);
  float[] b = {posX+ (len* sin(direction)), posY+(len * cos(direction))};
  
  return b;
}
float angleToRadians (float angle) { 
  return (angle *PI) / 180;
}