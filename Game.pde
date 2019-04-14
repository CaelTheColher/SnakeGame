class Game {
  Snake snake;
  Food food;
  State state;
  Boolean show;
  Game(boolean show) {
    this(new NeuralNetwork(9, 4, 8, 4), show);
  }

  Game(NeuralNetwork brain, boolean show) {
    this.snake = new Snake(this, width/2, height/2, brain);
    this.food = new Food(10);
    this.state = State.PLAYING;
    this.show = show;
  }


  void update() {
    //snake.think();
    snake.update();
    if (show) {
      food.show();
      snake.show();
    }
    //this.checkState();
    //textSize(20);
    //text("Points: " + snake.points, 0, 20);
    //text("Score: " + snake.score, 0, 40);
    //text("FPS: " + floor(frameRate), 0, 60);
  }



  //void checkState() {
  //  switch(state) {
  //  case DEAD:
  //    this.startGame();
  //  default: 
  //    break;
  //  }
  //}
}
