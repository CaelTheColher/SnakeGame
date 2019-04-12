void keyPressed() {
  switch (keyCode) {
  case UP:
    if (game.snake.dir != Direction.Down) {
      game.snake.dir = Direction.Up;
    }
    break;
  case DOWN:
    if (game.snake.dir != Direction.Up) {
      game.snake.dir = Direction.Down;
    }
    break;
  case LEFT:
    if (game.snake.dir != Direction.Right) {
      game.snake.dir = Direction.Left;
    }
    break;
  case RIGHT:
    if (game.snake.dir != Direction.Left) {
      game.snake.dir = Direction.Right;
    }
    break;
  }
}
