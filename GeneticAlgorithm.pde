void nextGeneration() {
  calcFitness();
  ArrayList<Game> newPopulation = new ArrayList<Game>();
  for (int i=0; i < populationSize; i++) {
    NeuralNetwork parent1 = select().snake.brain;
    NeuralNetwork parent2 = select().snake.brain;
    NeuralNetwork child = parent1.merge(parent2);
    child.mutate(0.1);
    newPopulation.add(new Game(child, true));
  }
  population = newPopulation;
  population.get(0).show = true;
  generation++;
}

void calcFitness() {
  for (Game game : population) {
    game.snake.calcFitness();
  }
}

Game select() {
  int fitnessSum = 0;
  for (Game game : population) {
    fitnessSum += game.snake.fitness;
  }

  long rand = floor(random(fitnessSum));

  int runningSum = 0;
  for (Game game : population) {
    runningSum += game.snake.fitness;
    if (runningSum > rand) {
      println(game.snake.fitness);
      return game;
    }
  }

  return population.get(0);
}
