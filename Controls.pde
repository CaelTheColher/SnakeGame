void keyPressed() {
  switch (keyCode) {
  case UP:
    game.snake.dir = Direction.Up;
    break;
  case DOWN:
    game.snake.dir = Direction.Down;
    break;
  case LEFT:
    game.snake.dir = Direction.Left;
    break;
  case RIGHT:
    game.snake.dir = Direction.Right;
    break;
  }
}
