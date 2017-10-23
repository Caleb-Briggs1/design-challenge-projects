class GridSystem { //CREAETE OUT OF BOUNDS DECTION
  int pixelSize; //size of each pixel
  float gridSizeX;
  float gridSizeY;
  /*
   PImage img =  loadImage("floor.png"); 
   PImage img2 = loadImage("download.png");
   */
       
  
  
  ArrayList grid = new ArrayList();
  //images
 
   
  GridSystem() {
    
  }
  GridSystem(int a, float b, float c) {
    pixelSize  = a;
    gridSizeX = b;
    gridSizeY = c;
  }
  
  void createGrid(int Default) {
    for (int i = 0; gridSizeY*gridSizeX > i; i++) {
       grid.add(Default ); 
    }
   
    
  }
  void loadGrid(float[] Grid) {
    ArrayList temp = new ArrayList();
    for (int i = 0;Grid.length > i; i++) {
      temp.add(Grid[i]);
    }
    grid = temp;
  }
  int getGrid(float x, float y) {
    return int( round((x/pixelSize))  + ( round((y/pixelSize)) *gridSizeX));
  } 
  
  int getNext(float x, float y) {
   
  //return (int) grid.get(9999999);
   
  try {
    return (int)grid.get(getGrid(  x, y ));
  } catch (IndexOutOfBoundsException b) {
    return -1; //-1 is escape character!!!
  }
  
  
  
    
  }
  boolean Set(float x, float y, int val) {
    try {
    grid.set(getGrid(x,y),val);
    return true; //success
    }
    catch (IndexOutOfBoundsException b) {
      return false; //failed
    }
  }
  void drawIt() {
    PImage speed = loadImage("Test.png");
    PImage bomb = loadImage("bomb.png");
    for (int i = 0;gridSizeY > i; i++) {
      for (int j = 0;gridSizeX > j; j++) {
        noStroke(); 
        int currentType = (int)((grid.get( (int)(i*gridSizeX + j))));
        if (currentType ==4) {
        fill(0,currentType*30,0);
        rect(j*pixelSize ,i*pixelSize,pixelSize,pixelSize);
        }
        else {
          fill(currentType*30,0,0);
          rect(j*pixelSize ,i*pixelSize,pixelSize,pixelSize);
        }
        if (currentType == 10) {
          image(speed,j*pixelSize ,i*pixelSize,pixelSize,pixelSize);
        }
        if (currentType == 11) {
          image(bomb,j*pixelSize ,i*pixelSize,pixelSize,pixelSize);
        }
        
        
        
      }
  }
  
  
  }  
  
}
class character { //this needs to be changneed
  float direction = 90;
  float x=0;
  float y=0;
  float speed = 7;
  int type;
  int timeLeft;
  int power;
  boolean isDead(character[] chars, GridSystem grid) {
    for (int i = 0; chars.length > i;i++) {
      println(grid.getNext(x,y));
      if (grid.getNext(x,y) == -1) {
        if (y > 50) {
        y = 0;
      }
      else {
        y = height;
      }
      return false;
      }
      if (grid.getNext(x,y) == chars[i].type ) {
        
        return true;
        
      }
      }
      return false;
  }
  void update(character[] chars,GridSystem grid) { //make update take a list of characters
    //ellipse(this.x,this.y,5,5);
   
    direction = abs(direction % 360);
    
    this.move();
    if (grid.getNext(x,y)==10) {
      power = 1;
      timeLeft = 80;
    }
    if (grid.getNext(x,y) == 11) {//bomb
      grid.grid.set(grid.getGrid(this.x,this.y),0);
      for (int i = 1; 15 > i; i++) {
        ArrayList test = createSquare(35,35);
         try {//s
         for (int j =0; test.size() > j; j++) {
            grid.grid.set(grid.getGrid(this.x-50+ ((float[])test.get(j))[0]*grid.pixelSize,this.y-50+((float[])test.get(j))[1]*grid.pixelSize),1);
         }

         }
        
        catch (IndexOutOfBoundsException b) {
          //catch error of out of baounds
        }
      }
    }
    if (power == 1) {
      if (timeLeft > 0) {
        speed = 21;
      timeLeft -=1;
      }
      else {
        power = 0;
        speed = 7;
      }
    }
    if (power != 1) {
    if(isDead(chars,grid)) {
      if (type == 30) {
        println("player 2 winner");
        player2 +=1;
      }
      else {
         
         println("player 1 winner");
         player1 +=1;
      }
      test.grid = new ArrayList();
      test.createGrid(0);
      print("important:");
      First.x = 350;
      First.y = 150;
      
      Second.x = width-350;
      Second.y = 150;
      //reset() here
      //noLoop()
    }
    }
    
    if(test.Set(this.x,this.y,type) == false) { //if failed
      if (y < 150) {
        this.y = 0;
      }
      else {
        this.y = height;
      }
    }
   
    
  }
 void move() {
  if (direction == 90) {
    x+=speed;
  }
  if (direction== 270) {
    x-=speed;
  }
  if (direction == 180) {
    y-=speed;
  }
  if (direction == 0) {
    y+=speed;
  }
 
  }
  float[] nextPos(float x, float y) {
  if (direction == 90) {
    float[] temp = {x+speed,y};
    return temp;
  }
  if (direction == 270) {
    float[] temp = {x-speed,y};
    return temp;
  }
  if (direction == 180) {
    float[] temp = {x,y-speed};
    return temp;
  }
  
    float[] temp = {x,y+speed};
    return temp;
  
}
  
  int getNext(GridSystem Name) {
  if (direction == 90) {
    return Name.getNext(x+speed,y);
  }
  if (direction == 270) {
    return Name.getNext(x-speed,y);
  }
  if (direction == 180) {
    return Name.getNext(x,y-speed);
  }
  
    return Name.getNext(x,y+speed);
  
  
}
  int getNext2(GridSystem Name) {
  if (direction == 90) {
    return Name.getNext(x+speed*2,y);
  }
  if (direction == 270) {
    return Name.getNext(x-speed*2,y);
  }
  if (direction == 180) {
    return Name.getNext(x,y-speed*2);
  }
  
    return Name.getNext(x,y+speed*2);
  
  
}
  void updateAI(GridSystem Name) {
   println(direction);
   direction = direction % 360;
    if (getNext(Name) == 30 || getNext2(Name) == 4) {
     
        direction += 90 ;
       println(direction);
        
       
    }
    else {
      if ((int)random(0,15) == 1) {
        
        direction -= 90;
        if (getNext(Name) == 30 || getNext2(Name) == 4) {
          direction += 90;
        }
        }
      }
    
  }
  void updateDir() {
    if (keyPressed) {
   if (keyCode == 39) {
     if (direction != 270) {
   direction = 90;
     }
  }
  if (keyCode == 37) {
    if (direction != 90) {
   
     
    direction = 270;
    }
  }
  if (keyCode == 40) {
    if (direction != 180) {
   
    direction = 0;
    }
  }
   if (keyCode == 38) {
     if (direction != 0) {
   
    direction = 180;
     }
  }
  }
  }
   void updateDir2() {
    
   if (key == 'd') {
     if (direction != 270) {
   direction = 90;
     }
  }
  if (key == 'a') {
     if (direction != 90) {
    direction = 270;
     }
  }
  if (key == 's') {
     if (direction != 180) {
    direction = 0;
     }
  }
   if (key == 'w') {
      if (direction != 0) {
    direction = 180;
      }
  }
  }
  
}

void load() {
    First.type = 30;
  Second.type = 4;
  First.x = 350;
      First.y = 150;
      Second.x = width-350;
      Second.y = 150;
  //int[] gridCenter = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 2, 2, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 6, 6, 6, 6, 6, 6, 6, 3, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 6, 6, 6, 6, 6, 6, 6, 3, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 6, 6, 6, 6, 6, 6, 6, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 6, 6, 6, 6, 6, 6, 6, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 6, 4, 6, 4, 6, 4, 6, 4, 6, 4, 2, 2, 4, 6, 4, 6, 4, 6, 4, 6, 4, 6, 4, 6, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2, 2, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
  //center.loadGrid(gridCenter); //loads grid based on gridTest pixels
  test.createGrid(0);
  for (int i = 0; size > i; i++) {
    Name[i] = new Particles(int(random(0,width)),int(random(0,height)),2);
  }
}

GridSystem test = new GridSystem(7,1500/7,750/7);

character First = new character();
character Second = new character();
character[] chars = {First,Second};
powerUP pow = new powerUP();
void play1() {
 
  background(0);
  test.drawIt();
  fill(0,0,250);
 Second.updateAI(test);
  First.update(chars,test);
  Second.update(chars,test);
   pow.update(test);
   if ((int)random(0,400) == 1) {
      pow =  new powerUP();
    }
    if ((int)random(0,400) == 1) {
      pow =  new powerUP();
      pow.type = 11;
    }
}
void play2() {
  background(0);
  test.drawIt();
  fill(0,0,250);
 //Second.updateAI(test);
  First.update(chars,test);
  Second.update(chars,test);
   pow.update(test);
   if ((int)random(0,400) == 1) {
      pow =  new powerUP();
    }
    if ((int)random(0,400) == 1) {
      pow =  new powerUP();
      pow.type = 11;
    }
}