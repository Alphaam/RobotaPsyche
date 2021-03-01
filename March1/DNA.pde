class DNA {
  float radius;
  float initialMaxSteeringForce;
  float initialMaxSpeed;
  float initialEnergy;
  float metabolism;
  float deadAt;
  float shadeOfRed;
  float shadeOfGreen;
  float shadeOfBlue;

  DNA (float r, float imsf, float ims, float ie, float metab, float dat, float red, float green, float blue) {
    radius = r;
    initialMaxSteeringForce = imsf;
    initialMaxSpeed = ims;
    initialEnergy = ie;
    metabolism = metab; // how much energy is consumed in each frame
    deadAt = dat; // if energy is lower than this vehicle dies
    shadeOfRed=random(0, 255);
    shadeOfGreen=random(0, 255);
    shadeOfBlue=random(0, 255);
  }

  DNA getDNA() {

    // make a copy because this will be the DNA for the new vehicle
    DNA dna = new DNA(radius, initialMaxSteeringForce, initialMaxSpeed, initialEnergy, metabolism, deadAt, shadeOfRed, shadeOfGreen, shadeOfBlue);
    return dna;
  }

  // What should we do here?
  // Obviously could be entirely randome but alternatives exist
  // e.g. some regions on the canvas (hotspots?) or exposure to
  // specific vehicles might cause more severe mutations
  void mutate() {
    if (shadeOfRed<255) {
      shadeOfRed=shadeOfRed+10;
    } else if (shadeOfRed>=255) {
      shadeOfRed=100;
    }
    if (shadeOfGreen<255) {
      shadeOfGreen=shadeOfGreen+10;
    } else if (shadeOfGreen>=255) {
      shadeOfGreen=100;
    } 
    if (shadeOfBlue<255) {
      shadeOfBlue=shadeOfBlue+10;
    } else if (shadeOfBlue>=255) {
      shadeOfBlue=100;
    }
  }

  void inspect() {
    println("DNA information:");
    println("\tRadius = " + radius);
    println("\tInitial Maximum Steering Force = " + initialMaxSteeringForce);
    println("\tInitial Maximum Speed = " + initialMaxSpeed);
    println("\tInitial Energy level = " + initialEnergy);
    println("\tMetabolism rate = " + metabolism);
    println("\tDead at energy level of " + deadAt);

    radius = 10; // just so I can see if I selected the right one
  }
}
