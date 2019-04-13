final float scale = 20;
final int populationSize = 200;
ArrayList<Game> population = new ArrayList<Game>();

void setup() {
  size(600, 600);
  for (int i=0; i < populationSize; i++) {
    population.add(new Game());
  }
}

void draw() {
  background(200);
  if (!allDead()) {
    for (Game game : population) {
      if (game.state != State.DEAD)
        game.update();
    }
  } else nextGeneration();

  textSize(20);
  text("FPS: " + floor(frameRate), 0, 20);
}

boolean allDead() {
  for (Game game : population) {
    if (game.state != State.DEAD) return false;
  }
  return true;
}
