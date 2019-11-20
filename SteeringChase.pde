public static int VEHICLE_NUMBER = 100;

public ArrayList<Prey> preys;
public Predator predator;

public boolean debug = false;

void setup() {
  fullScreen();
  preys = new ArrayList<Prey>();
  predator = new Predator(random(0, width), random(0, height));

  fillPreys();
}

void draw() {
  background(0);
  for (Vehicle v : preys) {
    v.update();
    v.display();
  }

  predator.update();

  trimDead();
}


public void trimDead() {
  for (int i = 0; i < preys.size(); i++) {
    if (preys.get(i).isDead()) {
      preys.remove(i);
    }
  }
}

public void fillPreys() {
  for (int i = 0; i < VEHICLE_NUMBER; i++) {
    preys.add(new Prey(random(0, width), random(0, height)));
  }

  predator.setPrey(preys.get((int)random(0, preys.size())));
}

void keyPressed() {
  switch(key) {
  case 'D':
    debug = !debug;
    println("Debug mode");
    break;
  case 'd':
    debug = !debug;
    println("Debug mode");
    break;
  }
}
