enum Direction {
  //lower case because processing is stupid
  None(0, 0), 
    Up(0, -1), 
    Down(0, 1), 
    Left(-1, 0), 
    Right(1, 0);

  private int x;
  private int y;

  private Direction(int x, int y) {
    this.x = x;
    this.y = y;
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }
}
