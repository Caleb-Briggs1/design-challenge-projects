void particle() {
for (int i=0;size>i;i++) {
    Name[i].burst();
  }
}


// New Tab

class Particles {
  int X;
  int Y;
  int C;
  int D;
  int dir = 1;
  Particles(int Xpos, int Ypos,int CTF) {
    X=Xpos;
    Y=Ypos;
    D=CTF;
  }

    
  void burst() {
      rect(X,Y,0.1,0.1);
      
      if (D==2) {
        colorMode(RGB);
        fill(C,175,255);
        stroke(C,255,255);
      }
      Y+=1;
      if ((int)random(0,45)  == 1) {
        dir *= -1;
      }
      X+=dir;
      if(Y==height) {
        Y=0;
      }
      if(X==0){
        X=width; 
      }
      if (X==width) {
        X=0;
      }
      
      if (C==360) {
        C=0;
      }
      C= C+1;
  }
}