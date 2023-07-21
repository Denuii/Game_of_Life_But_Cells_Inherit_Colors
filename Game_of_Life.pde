float cellSize = 10;
ArrayList<ArrayList<Cell>> cells;
int framerate = 30;

void setup() {
  
  frameRate(framerate);

  size(2000,1000);
  background(0);
  cells = new ArrayList();
  
  translate(cellSize/2, cellSize/2);
  
  int creationHelperX = 0;
  int creationHelperY = 0;
  
  for (int i = 0; i<width; i += cellSize){
    cells.add(new ArrayList<Cell>());
    for (int j = 0; j<height; j += cellSize) {
      cells.get(creationHelperX).add(new Cell(i, j, (random(0,2) > 1) ? true: false, creationHelperX, creationHelperY));
      creationHelperY++;
    }
    creationHelperX++;
    creationHelperY = 0;
  }
  
}

void draw() {
  //noStroke();
  for(int i = 0; i<cells.size(); i++) {
    for(int j = 0; j<cells.get(i).size(); j++) {
      if (cells.get(i).get(j).isAlive) {
        fill(cells.get(i).get(j).r, cells.get(i).get(j).g, cells.get(i).get(j).b);
      } else {
        fill(0);
      }
      rect(cells.get(i).get(j).x, cells.get(i).get(j).y, cellSize, cellSize);
      cells.get(i).get(j).isAlive = getNextStatus(cells.get(i).get(j));
    }
  }
}

boolean getNextStatus(Cell c) {
  int alives = 0;
  c.wasAlive = c.isAlive;
  ArrayList<float[]> colors = new ArrayList();
  for (int i = c.arrayCordX-1; i<c.arrayCordX+2; i++){
    for (int j = c.arrayCordY-1; j<c.arrayCordY+2; j++){
      
      if ((i>-1 && i<cells.size()) && (j>-1 && j<cells.get(i).size())){
        
        if (!(i == c.arrayCordX && j == c.arrayCordY)){
          
          if(i < c.arrayCordX || (i == c.arrayCordX && j == c.arrayCordY-1)){
            if (cells.get(i).get(j).wasAlive){
              float[] colorr = new float[3];
              colorr[0] = cells.get(i).get(j).r;
              colorr[1] = cells.get(i).get(j).g;
              colorr[2] = cells.get(i).get(j).b;
              colors.add(colorr);
              alives++;
            }
          } else {
            if (cells.get(i).get(j).isAlive){
              float[] colorr = new float[3];
              colorr[0] = cells.get(i).get(j).r;
              colorr[1] = cells.get(i).get(j).g;
              colorr[2] = cells.get(i).get(j).b;
              colors.add(colorr);
              alives++;
            }
          }
        }
      }
    }
  }

  if ((!c.isAlive) && alives == 3){
    c. r = (colors.get(0)[0] + colors.get(1)[0] + colors.get(2)[0]) / 3;
    c. g = (colors.get(0)[1] + colors.get(1)[1] + colors.get(2)[1]) / 3;
    c. b = (colors.get(0)[2] + colors.get(1)[2] + colors.get(2)[2]) / 3;
    return true;

  }
  if (c.isAlive && (alives > 3 || alives < 2)){
    return false;
  }
  
  
  return c.isAlive;
}
