class Ball { 
  float x;
  float y;
  float speedX;
  float speedY;
  float diameter;
  color c;

  
  Ball(float tempX, float tempY, float tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    speedX = 0;
    speedY = 0;
    c = (#57D8AE); 
   
  }

  void move() {
    // Add speed to location
    y = y + speedY;
    x = x + speedX;
    
  }
  
  void display() {
    fill(c);
    ellipse(x,y,diameter,diameter);
  }

  //functions to help with collision detection
  float left(){
    return x-diameter/2;
  }
  float right(){
    return x+diameter/2;
  }
  float up(){
    return y-diameter/2;
  }
  float down(){
    return y+diameter/2;
  }
}
