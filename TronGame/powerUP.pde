class powerUP {
  //give position, last for x seconds, every run through, if alive, update 
  //x,y positions to values
  float x = random(1500-7);
  float y = random(750-7);
  int type = 10;
  int life = (int)random(10,60);
  void changeGrid(GridSystem grid) {
    grid.grid.set(grid.getGrid(x,y),type);
    grid.grid.set(grid.getGrid(x+grid.pixelSize,y),type);
    grid.grid.set(grid.getGrid(x-grid.pixelSize,y),type);
    
    
  }
  void update (GridSystem grid) {
    
    if (life > 0) {
    changeGrid(grid);
    
    }
    
    life -=1;
  }
  
  
}