class Snake extends Body {
  Game game;
  int points = 0;
  int score = 0;
  ArrayList<Body> body;

  Snake(Game game, float x, float y) {
    super(x, y, Direction.None);
    this.game = game;
    this.body = new ArrayList<Body>();
  }

  void show() {
    for (Body bodyPart : this.body) {
      bodyPart.show();
    }
    super.show();
  }

  void update() {
    if (floor(frameCount % 10) == 0) {
      if (!this.body.isEmpty()) {
        body.remove(0);
        this.body.add(new Body(this.x, this.y, Direction.None));
      }
    }
    for (Body bodyPart : body) {
      bodyPart.update();
    }
    super.update();
  }


  void foodCollision() {
    if (!((this.x + scale) <= this.game.food.x || this.x >= (this.game.food.x + scale))) {
      if (!((this.y + scale) <= this.game.food.y || this.y >= (this.game.food.y + scale))) {
        this.points += this.game.food.points;
        this.game.food = new Food(1);
        this.body.add(new Body(this.x, this.y, Direction.None));
      }
    }
  }

  void wallCollision() {
    if (this.x < 0 || this.y < 0 || (this.x + scale) > width || (this.y + scale) > height) {
      this.game.state = State.DEAD;
    }
  }
  
  void bodyCollision() {
    for (Body bodyPart : body) {
      //println(dist(this.x, this.y, bodyPart.x, bodyPart.y));
      if (dist(this.x, this.y, bodyPart.x, bodyPart.y) < 1) {
        this.game.state = State.DEAD;
      }
    }
  }
}
