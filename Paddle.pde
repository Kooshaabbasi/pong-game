class Paddle{

  float x;
  float y;
  float w;
  float h;
  float speedY;
  float speedX;
  color c;
  
  Paddle(float tempX, float tempY, float tempW, float tempH){
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    speedY = 0;
    speedX = 0;
    c=(#D85757);
  }

  void move(){
    y += speedY;
    x += speedX;
  }

  void display(){
    fill(c);
    rect(x-w/2,y-h/2,w,h);
  } 
  
  //helper functions
  float left(){
    return x-w/2;
  }
  float right(){
    return x+w/2;
  }
  float up(){
    return y-h/2;
  }
  float down(){
    return y+h/2;
  }
}
