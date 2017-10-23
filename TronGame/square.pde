ArrayList createSquare(int wide,int high) {
  int h = high;
  int w = wide;
  ArrayList res = new ArrayList();
  for (int i = 0; high > i; i++) {
    
    for (int j = 0; wide > j; j++) {
      float[] tst = {w-j,h};
        res.add(tst);
    }
    h--;
  }
  return res;
}


//