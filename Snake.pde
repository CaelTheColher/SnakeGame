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
    if (!this.body.isEmpty()) {
      Body last = this.body.remove(this.body.size()-1);
      this.body.add(0, last);
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
        this.body.add(0, new Body(this.x, this.y, Direction.None));
      }
    }
  }

  void wallCollision() {
    if (this.x < 0 || this.y < 0 || (this.x + scale) > width || (this.y + scale) > height) {
      this.game.state = State.DEAD;
    }
  }
}
