Game game;
float scale = 20;

void setup() {
  size(600, 600);
  game = new Game();
  game.startGame();
}

void draw() {
  background(200);
  game.update();
}
