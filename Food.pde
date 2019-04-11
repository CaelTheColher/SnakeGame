class Food {
  float x;
  float y;
  int points;

  Food(int points) {
    this.x = floor(random(width/scale)) * scale;
    this.y = floor(random(height/scale)) * scale;
    this.points = points;
  }

  void show() {
    fill(255, 0, 100);
    rectMode(CORNER);
    rect(x, y, scale, scale);
  }
}
