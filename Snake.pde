class Snake extends Body {
  Game game;
  int points = 0;
  int score = 0;
  int fitness = 0;
  int remaining = 100;
  ArrayList<Body> body;
  NeuralNetwork brain;

  Snake(Game game, float x, float y, NeuralNetwork brain) {
    super(x, y, Direction.None);
    this.game = game;
    this.body = new ArrayList<Body>();
    this.brain = brain;
  }

  void show() {
    for (Body bodyPart : this.body) {
      bodyPart.show();
    }
    super.show();
  }

  void update() {
    this.score++;
    this.wallCollision();
    this.foodCollision();
    if (floor(frameCount % 10) == 0) {
      this.think();
      if (!this.body.isEmpty()) {
        body.remove(0);
        this.body.add(new Body(this.x, this.y, Direction.None));
      }
      for (Body bodyPart : this.body) {
        bodyPart.update();
      }
      super.update();
      this.remaining--;
      //collision detection needs to be after the snake update so it doesn't false trigger 
      this.bodyCollision();
    }
    this.timeOut();
  }

  void think() {
    //inputs to the neural network
    double[] inputs = new double[9];
    //snake location
    inputs[0] = this.x / width;
    inputs[1] = this.y / height;
    //snake direction
    inputs[2] = this.dir.getX() / width;
    inputs[3] = this.dir.getY() / height;
    //food location
    inputs[4] = this.game.food.x / width;
    inputs[5] = this.game.food.y / height;
    inputs[6] = dist(this.x,this.y, this.game.food.x, this.game.food.y) / width;
    //distance to the closest wall in a straight line
    inputs[7] = 0;
    //distance to the closest body in a straight line
    inputs[8] = 0;
    //outputs from the neural network
    double[] outputs = this.brain.guess(inputs);
    //picks the move
    int move = 0;
    for ( int i = 1; i < outputs.length; i++ ) {
      if ( outputs[i] > outputs[move] ) move = i;
    }

    //executes the move
    switch (move) {
    case 0:
      if (this.dir != Direction.Down)
        this.dir = Direction.Up;
      break;
    case 1:
      if (this.dir != Direction.Up)
        this.dir = Direction.Down;
      break;
    case 2:
      if (this.dir != Direction.Right)
        this.dir = Direction.Left;
      break;
    case 3:
      if (this.dir != Direction.Left)
        this.dir = Direction.Right;
      break;
    }
  }

  void calcFitness() {
    this.fitness = (this.score / 2) + floor(pow(2, this.points));
  }

  void wallCollision() {
    if (this.x < 0 || this.y < 0 || (this.x + scale) > width || (this.y + scale) > height) {
      this.game.state = State.DEAD;
    }
  }

  void foodCollision() {
    if (dist(this.x, this.y, this.game.food.x, this.game.food.y) < 1) {
      this.points += this.game.food.points;
      this.game.food = new Food(1);
      this.body.add(new Body(this.x, this.y, Direction.None));
      this.remaining += 100;
    }
  }

  void bodyCollision() {
    for (Body bodyPart : this.body) {
      if (dist(this.x, this.y, bodyPart.x, bodyPart.y) < 1) {
        this.game.state = State.DEAD;
      }
    }
  }

  void timeOut() {
    if (this.remaining < 0) this.game.state = State.DEAD;
  }
}
