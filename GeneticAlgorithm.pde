void nextGeneration() {
  
  calculateFitness();
  
  ArrayList<Game> newPopulation = new ArrayList<Game>();
  for (int i=0; i < populationSize; i++) {
    Game parent1 = select();
    Game parent2 = select();
    Game child = new Game(parent1.snake.brain.merge(parent2.snake.brain));
    child.snake.brain.mutate(0.1);
    newPopulation.add(child);
  }
  population = newPopulation;
}

void calculateFitness() {
  int sum = 0;
  for (Game game: population) {
    sum += game.snake.score;
  }
  for (Game game: population) {
    game.snake.fitness = game.snake.score / sum;
  }
}

Game select() {
  
  int fitnessSum = 0;
  for (Game game: population) {
    fitnessSum += game.snake.fitness;
  }
  
  long rand = floor(random(fitnessSum));
  
  int runningSum = 0;
  for (Game game: population) {
    runningSum += game.snake.fitness;
    if (runningSum > rand) return game;
  }
  
  return population.get(0);
}
