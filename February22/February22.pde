

FlowField f;
ArrayList<Vehicle> vehicles = new ArrayList<Vehicle>();

void setup() {
  size (1200, 800);
  f = new FlowField(15);

  // Make 100 vehicles to start with
  for (int i = 0; i < 100; i++) {
    vehicles.add(new Vehicle(random(width), random(height)));
  }
}




void mousePressed() {
  for (int i=0; i<20; i++) { 
    vehicles.add(new Vehicle(mouseX*(random(0, 9)), mouseY*(random(0, 9))));
  }
}

void draw() {
  background(200);
  f.followMouse();
  // f.display(); // this really slows things down so use it only when you want

  for (Vehicle v : vehicles) {
    //v.applyBehaviors(vehicles);
    v.flock(vehicles);
    v.checkPosition(vehicles);
    //v.seek(new PVector(mouseX, mouseY));
    //v.separate(vehicles); // Try removing this to see what happens if they don't try to separate
    v.follow(f); // Apply the steering force to follow the flow field
    v.update(); // Update the velocity and location, based on the acceleration generated by the steering force
    v.display(); // display the vehicle
  }
}
