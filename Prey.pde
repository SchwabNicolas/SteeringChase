class Prey extends Vehicle {

  public boolean dead;

  public Prey(float x, float y) {
    super(x, y);
    target = new PVector(random(0, width), random(0, height));
  }

  @Override
    public void update() {
    super.update();
    arrive();
  }

  public void arrive() {
    PVector desired = PVector.sub(target, location);

    float d = desired.mag();
    desired.normalize();
    if (d < 100) {
      float m = map(d, 0, 100, 0, maxspeed);
      desired.mult(m);
    } else {
      desired.mult(maxspeed);
    }
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    applyForce(steer);

    if (Math.sqrt((location.x-target.x)*(location.x-target.x) + (location.y-target.y)*(location.y-target.y)) <= (r/2 + r/2)) {
      target = new PVector(random(width), random(height));
    }
  }

  public boolean isDead() {
    return dead;
  }

  public void setDead(boolean dead) {
    this.dead = dead;
  }
}
