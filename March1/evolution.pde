/*
First step towards evolution:
 
 
 Create a new class consisting of all the weights, limits, and other fixed numbers that might make up an individual vehicle's personality.
 You may invent new ones (size? color?) Do not include velocity or location. Call this new class DNA.
 
 Each vehicle gets its own DNA object
 
 The constructor for a vehicle should take the DNA as an argument, along with any other necessary information you wish (such as initial location)
 
 Create a new method in the Vehicle class called getDNA() which returns a vehicle's DNA object
 
 In order to simulate selection, in each frame, some vehicles do not survive, and some vehicles are copied.
 - Each vehicle is checked in some way, and some vehicles do not survive to the next frame. You get to decide what criterion to use.
 Note that if selection works, then the criterion you use to determine whether a vehicle lives or dies will determine what features
 will be selected (e.g. if you chose to let vehicles die when they leave the canvas, then your system will select vehicles that
 stay on the canvas.) Be creative!
 - Write a method to test whether this vehicle survives or not.
 - How will you determine when vehicles are copied?
 - Think about what other changes will be necessary in order to simulate selection.
 
 Ideas to explore
 - as energy levels go down, tolerance for proximity to other vehicles goes up
 - would be handy to "inspect" a vehicle by clicking on it
 
 Michael Shiloh
 February 20 2021
 
 Change log
 20 feb 2021 - ms - initial entry
 24 feb 2021 - ms - added debugging aids: inspector, frameRate control
 
 Based on examples from The Nature of Code by Daniel Shiffman - Thanks Dan!
 
 This code is in the public domain
 */
import processing.sound.*;//importing sound library
int page =1;
boolean stopDeleting=false;
ArrayList<Vehicle> vehicles = new ArrayList<Vehicle>();
Food food;
SoundFile introMusic;//calling file containing sound
boolean singleFrame = false; // when true, do only one frame and then stop
PFont font;//calling font library
void setup() {
  size (1200, 800);
  background(200, 100, 100);

  introMusic = new SoundFile(this, "intromusic.mp3");//loading sound file
  introMusic.loop();//looping sound
  font=loadFont("font.vlw");//loading font
  // Make 100 vehicles to start with
  for (int i = 0; i < 10; i++) {
    vehicles.add(new Vehicle(random(width), random(height), // location
      10.0, // radius
      0.10, // initial maximum steering force
      2.0, // initial maximum speed
      5000.0, // initial energy
      1.0, // metabolism (energy consumption per frame)
      0.01, // energy level at which vehicle dies      
      255, 
      0, 
      0// original vehicles are greennn
      ));
  }
}

void draw() {
  if (page==1) {
    startPage();
  }
  if (page==2) {
    background(255, 105, 180);
    //if ((frameCount % 100) == 0) {
    //  background(255, random(100,255),random(100,255));
    //}

    food = new Food(mouseX, mouseY);

    //food.display();

    /* Decide whether any vehicles have to be removed
     This must be separately from the rest of the functions
     so that further functions aren't applied to dead vehicles
     If you are modifying an ArrayList during the loop,
     then you cannot use the enhanced loop syntax.
     In addition, when deleting in order to hit all elements,
     you should loop through it backwards, as shown here:
     */
    for (int i = vehicles.size() - 1; i >= 0; i--) {
      Vehicle v = vehicles.get(i);
      v.consumeEnergy();
      v.checkBoarders();
      if (!v.alive && stopDeleting==false) {
        println("removing dead vehicle");



        // randomly pick a vehicle and get its DNA
        //Vehicle v = vehicles.get(int (random(vehicles.size())));
        DNA dna = v.getDNA();

        // mutate DNA
        dna.mutate();

        // Now make a new vehicle using this DNA
        vehicles.add(new Vehicle(
          random(width), 
          random(height), 
          dna.radius, 
          dna.initialMaxSteeringForce, 
          dna.initialMaxSpeed, 
          dna.initialEnergy, 
          dna.metabolism, 
          dna.deadAt, // energy at which to die

          dna.shadeOfRed, 
          dna.shadeOfGreen, 
          dna.shadeOfBlue
          ));
        vehicles.remove(v);
      } else if (!v.alive) {
        DNA dna = v.getDNA();

        // mutate DNA
        dna.mutate();
        vehicles.remove(v);
      }
    }

    for (Vehicle v : vehicles) {

      // Apply different algorithms which will generate forces
      v.simpleSeek(food.getLocation());
      v.separate(vehicles);

      // Update the velocity and location
      // based on the generated forces
      v.update();

      v.feed(food.getLocation()); // If we are close enough, eat
      v.display(); // display the vehicle
    }


    if (singleFrame) {
      noLoop();
    }
  }
}
void keyPressed() {
  switch (key) {
  case 'b':
    stopDeleting=true;
    break;
  case 'B':
    stopDeleting=false;
    break;
  case 'p':
    println("Loop paused; framecount = " + frameCount);
    noLoop();
    break;
  case 'r':
    singleFrame = false;
    loop();
    break;
  case 'd':
    frameRate -= 10;
    println("frameRate = " + frameRate);
    break;
  case 'u':
    frameRate += 10;
    println("frameRate = " + frameRate);
    break;
  case 's': // single frame
    singleFrame = true;
    println("single frame; framecount = " + frameCount);
    loop();
    break;
  case 'n':
    vehicles.add(new Vehicle(mouseX, mouseY, 1.0, 1.0, 1.0, 100.0, 1.0, 1.0, random(0, 255), random(0, 255), random(0, 255))); // new vehicles are blue
    break;
  default:
    println("p = pause; r = run; d = slow down; u = speed up; s = single frame; n = new vehicle");
  }
}

void mouseClicked() {
  if (page==2 && vehicles.size()==0) {
    for (int i = 0; i < 10; i++) {
      vehicles.add(new Vehicle(random(width), random(height), // location
        10.0, // radius
        0.10, // initial maximum steering force
        2.0, // initial maximum speed
        5000.0, // initial energy
        1.0, // metabolism (energy consumption per frame)
        0.01, // energy level at which vehicle dies      
        255, 
        0, 
        0// original vehicles are greennn
        ));
    }
  } else if (page==2) {
    // find the closest vehicle
    for (int i=0; i<20; i++) { 
      Vehicle v = vehicles.get(i);
      DNA dna = v.getDNA();
      vehicles.add(new Vehicle(
        random(width), 
        random(height), 
        dna.radius, 
        dna.initialMaxSteeringForce, 
        dna.initialMaxSpeed, 
        dna.initialEnergy, 
        dna.metabolism, 
        dna.deadAt, // energy at which to die

        dna.shadeOfRed, 
        dna.shadeOfGreen, 
        dna.shadeOfBlue
        ));
      ;
    }
    Vehicle closestVehicle = vehicles.get(0);
    float closestVehicleDistance = width*height; //assume worst case
    PVector mouseAt = new PVector(mouseX, mouseY);

    for (Vehicle v : vehicles) {
      if (v.distance(mouseAt) < closestVehicleDistance ) {
        closestVehicle = v;
        closestVehicleDistance = v.distance(mouseAt);
      }
    }

    closestVehicle.inspect();
  }
}

void startPage() {//c;ass that starts the game

  background(255, 105, 180);
  textFont(font, 50);
  textAlign(CENTER);
  text("WELCOME TO BUBBLE DESTRESS", width/2, height/2);
  if (mouseX>=425 && mouseY>=550 && mouseX<=585 && mouseY <= 610) {

    level2Buttonhover();
  } else {
    level2Button();
  }
}//setting static background

//Building level 2 button
void level2Button() {

  fill(0, 0, 0);
  noStroke();
  rect(415, 560, 160, 60);

  fill(255, 255, 255);
  noStroke();
  rect(425, 550, 160, 60);

  fill(0, 0, 0);
  textFont(font, 40);
  textAlign(CENTER);
  text("START", 505, 595);
}

void level2Buttonhover() {
  fill(0, 0, 0);
  noStroke();
  rect(415, 560, 160, 60);

  fill(0, 255, 0);
  noStroke();
  rect(425, 550, 160, 60);

  fill(255, 255, 255);
  textFont(font, 40);
  textAlign(CENTER);
  text("START", 505, 595);
}

void mousePressed() {
  if (page==1 && mouseX>=425 && mouseY>=550 && mouseX<=585 && mouseY <= 610) {// starting level2 player1 page id level 2 button is clicked
    page=2;//resetting player 1 counter}
  }
}
