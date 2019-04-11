class Game {
  Snake snake;
  Food food;
  State state;

  Game() {}

  void startGame() {
    snake = new Snake(this, width/2, height/2);
    food = new Food(1);
    state = State.PLAYING;
  }

  void update() {
    food.show();
    snake.score++;
    snake.foodCollision();
    snake.wallCollision();
    checkState();
    snake.update();
    snake.show();
    textSize(20);
    text("Points: " + snake.points, 0, 20);
    text("Score: " + snake.score, 0, 40);
  }

  void checkState() {
    switch(state) {
    case DEAD:
      this.startGame();
    default: 
      break;
    }
  }
}
