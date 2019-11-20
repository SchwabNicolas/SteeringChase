class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  PVector target;
  
  float r;
  float maxforce;
  float maxspeed;
  
  color vColor;

  Vehicle(float x, float y) {
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    location = new PVector(x,y);
    r = 16.0;
    maxspeed = 6;
    maxforce = 0.1;
    vColor = color(255, 255, 215);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
    seek();
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void seek() {
    PVector desired = PVector.sub(target,location);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }

  void display() {
    fill(vColor);
    noStroke();
    ellipse(location.x, location.y, r, r);
    
    if(debug) displayDebug();
  }
  
  void displayDebug() {
    stroke(255, 0, 0);
    strokeWeight(2);
    line(location.x, location.y, target.x, target.y);
    noStroke();
  }
}
