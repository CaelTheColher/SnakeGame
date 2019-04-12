class Body {
  float x;
  float y;
  Direction dir;

  Body(float x, float y, Direction dir) {
    this.x = x;
    this.y = y;
    this.dir = dir;
  }

  void show() {
    fill(20);
    rect(this.x, this.y, scale, scale);
  }

  void update() {
    this.x += this.dir.getX() * scale;
    this.y += this.dir.getY() * scale;
  }

  //Debug
  String toString() {
    return "{x:"+this.x+",y:"+this.y+"}";
  }
}
