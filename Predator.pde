public class Predator extends Vehicle {

  public Prey prey;

  public Predator(float x, float y) {
    super(x, y);
    maxspeed = 10;
    maxforce = 0.5;
    r = 10.0;
  }

  @Override
    public void update() {
    super.update();
    if (prey == null || prey.isDead()) {
      if (preys.size() == 0) { 
        fillPreys();
      } else {
        setPrey(preys.get((int)random(0, preys.size())));
      }
    }
    target = prey.location;
    arrive();
    display();
  }

  @Override
    public void display() {
    float theta = velocity.heading() + PI/2;
    fill(255, 25, 120);
    noStroke();
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();

    if (debug) displayDebug();
  }

  void displayDebug() {
    stroke(0, 0, 255);
    strokeWeight(2);
    line(location.x, location.y, target.x, target.y);
    noStroke();
  }

  public void setPrey(Prey prey) {
    this.prey = prey;
    prey.vColor = color(156, 255, 11);
    this.target = prey.location;
  }

  public void arrive() {
    if (Math.sqrt((location.x-target.x)*(location.x-target.x) + (location.y-target.y)*(location.y-target.y)) <= (prey.r/2 + prey.r/2)) {
      prey.setDead(true);
      setPrey(preys.get((int)random(0, preys.size())));
    }
  }
}
