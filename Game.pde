class Game {
  Snake snake;
  Food food;
  State state;
  
  Game() {
    this(new NeuralNetwork(8, 2, 8, 4));
  }
  
  Game(NeuralNetwork brain) {
    this.snake = new Snake(this, width/2, height/2, brain);
    this.food = new Food(1);
    this.state = State.PLAYING;
  }
  

  void update() {
    food.show();
    snake.think();
    snake.update();
    snake.show();
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
