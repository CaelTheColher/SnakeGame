Game game;
float scale = 20;

void setup() {
  size(600, 600);
  //frameRate(10);
  game = new Game();
  game.startGame();
}

void draw() {
  background(200);
  game.update();
}
