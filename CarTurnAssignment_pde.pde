class Mover {

  // The Mover tracks position, velocity, and acceleration 
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;//variable to control size and orientation of the vehicle
  
  

  Mover() {
    // Start in the center
    position = new PVector(width/2, height/2);
    velocity = new PVector(1, 0);             //initial velocity moving to the right
    acceleration = new PVector(-1, 0);        //initial acceleration
    r = 7.0;                                  //initial size of vehicle
    
  }

  //Function to turn left and accelerate to the left
  void turnLeft() {
    if (velocity.x >= 1 || velocity.x == 0) {
      velocity.x = -1;
      velocity.y=0;
    } else {
      velocity.add(acceleration);
    }
  }



  //Function to turn right and accelerate to the right
  void turnRight() {
    if (velocity.x <= -1 || velocity.x == 0) {
      velocity.x = 1;
      velocity.y=0;
    } else {
      velocity.x=velocity.x+1;
    }
  }


  //Function to turn up and accelerate upward
  void turnUp() {
    if (velocity.y >= 1 || velocity.y == 0) {
      velocity.x = 0;
      velocity.y = -1;
    } else {
      velocity.x = 0;
      velocity.y = velocity.y-1;
    }
  }

  //Function to turn down and accelerate downward
  void turnDown() {
    if (velocity.y <= -1 || velocity.y == 0) {
      velocity.x = 0;
      velocity.y = 1;
    } else {
      velocity.x = 0;
      velocity.y = velocity.y+1;
    }
  }
  
  //Function to stop vehicle
  void halt(){
    velocity = new PVector(0, 0);
  
  }

  //updating the vehicle's position
  void update() {
    position.add(velocity);
  }


  //checking if the vehicle has collided with edges and turning it around
  void checkEdges() {
    if (position.y > height) {
      velocity.y = -velocity.y;
    } else if (position.y < 0) {
      velocity.y = velocity.y*-1;
    }
    if (position.x > width) {
      velocity.x = -velocity.x;
    } else if (position.x < 0) {
      velocity.x = velocity.x*-1;
    }
  }



  void display() {
    // Vehicle is a triangle pointing in
    // the direction of velocity; since it is drawn
    // pointing up, we rotate it an additional 90 degrees.
    float theta = velocity.heading() + PI/2;
    fill(175);
    stroke(0);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
}



Mover mover;//Declaring new object called mover

void setup() {
  size(640, 360);
  mover = new Mover();
}

void draw() {
  background(255);

  // Update the position
  mover.update();
  // Display the Mover
  mover.display(); 
  //check if mover hits screen edges
  mover.checkEdges();
}


//checking which keys are oressed and executing appropriate command
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      mover.turnLeft();

      // do something to make the mover move faster to the left
    }
    if (keyCode == RIGHT) {
      mover.turnRight();

      // do something to make the mover move faster to the left
    }

    if (keyCode == UP) {
      mover.turnUp();

      // do something to make the mover move faster to the left
    }

    if (keyCode == DOWN) {
      mover.turnDown();

      // do something to make the mover move faster to the left
    }
    
  }
    if (key == 'b' || key == 'B') {
      mover.halt();
    }
}
