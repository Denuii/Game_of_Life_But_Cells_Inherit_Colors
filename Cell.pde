class Cell {
  public int x;
  public int y;
  
  public int arrayCordX;
  public int arrayCordY;
  
  public boolean isAlive;
  public boolean wasAlive;
  
  public float r;
  public float g;
  public float b;
  
  Cell(int x, int y, boolean isAlive, int arrayCordX, int arrayCordY){
    this.x = x;
    this.y = y;
    this.isAlive = isAlive;
    this.arrayCordX = arrayCordX;
    this.arrayCordY = arrayCordY;
    this.wasAlive = isAlive;
    this.r = random(0,255);
    this.g = random(0,255);
    this.b = random(0,255);
  }
  
  
}
