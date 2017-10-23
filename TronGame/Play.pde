class Play {
  int a = 200;
   int b = 200;
   int c = 200;
   int d = 200;
   int e = 200;
   int f = 200;
   int done = 0;
  int isDone() {
    return done;
  }
  void draw() {
     background(0);
 textSize(200);
 fill(50,175,255);
 text("TRON",400,200);
  strokeWeight(7.5);
   stroke(75,75,75);
   if (mouseX > 500 && mouseX < 850 && mouseY > 300 && mouseY < 400) {
     a = 255;
     b = 255;
     if (mousePressed) {
       b = 200;
       done = 1;
       //first clicked
     }
   } else if (mouseX > 500 && mouseX < 850 && mouseY > 450 && mouseY < 550){
     c = 255;
     d = 255;
     if (mousePressed) {
       d = 200;
       done = 2;
       //second clicked
     }
   } else if (mouseX > 500 && mouseX < 850 && mouseY > 600 && mouseY < 700){
     e = 255;
     f = 255;
     if (mousePressed) {
       f = 200;
       done = 3;
       //third clicked
     }
   } else {
     a = 200;
     b = 200;
     c = 200;
     d = 200;
     e = 200;
     f = 200;
   }
   fill(a,a,b);
   rect(500,300,350,100);
   fill(c,c,d);
   rect(500,450,350,100);
   fill(e,e,f);
   rect(500,600,350,100);
   
   textSize(40);
   fill(0,0,0);
   text("SINGLEPLAYER", 535,365);
   text("MULTIPLAYER", 545,515);
   text("SETTINGS", 580,665);
  }
  
}