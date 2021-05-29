import processing.sound.*;
SoundFile Mosaic;
Ball ball;
Paddle paddleCPU;
Paddle paddlePlayer;
int scoreLeft = 0;
int scoreRight = 0;
boolean play;

void setup(){
  size(800,600);
   
ball = new Ball(300,200,25);
  ball.speedX = 5;
  ball.speedY = random(-3.5,3.5);
    paddleCPU = new Paddle(15, height/2, 30,200);
  paddlePlayer = new Paddle(width-15, height/2, 30,200);
play = false;
Mosaic = new SoundFile(this, "sirplus.wav");
}


void draw(){

  if (!play) {
    startScreen();
    } else {
  background(60);
  fill(170);
rect(392, 140 , 15, 60);
rect(392, 50 , 15, 60);
rect(392, 230 , 15, 60);
rect(392, 320 , 15, 60);
rect(392, 410 , 15, 60);
rect(392, 500 , 15, 60);

   
    textSize(40);
  textAlign(CENTER);
    text(scoreRight, width/2+30, 30);
    text(scoreLeft, width/2-30, 30);
  if (ball.up() > paddleCPU.y) paddleCPU.y += 3.3;
  if (ball.down() < paddleCPU.y) paddleCPU.y -= 3.3;
  if ( ball.left() < paddleCPU.right() && ball.y > paddleCPU.up() && ball.y < paddleCPU.down()){
    ball.speedX = -ball.speedX;
    ball.speedY = ball.y - paddleCPU.y;
  }

  if ( ball.right() > paddlePlayer.left() && ball.y > paddlePlayer.up() && ball.y < paddlePlayer.down()) {
    ball.speedX = -ball.speedX;
    ball.speedY = ball.y - paddlePlayer.y;
  }
   if ( ball.left() < paddleCPU.right() && ball.y > paddleCPU.up() && ball.y < paddleCPU.down()){
    ball.speedX = -ball.speedX;
    ball.speedY = map(ball.y - paddleCPU.y, -paddleCPU.h/2, paddleCPU.h/2, -10, 10);
  }

  if ( ball.right() > paddlePlayer.left() && ball.y > paddlePlayer.up() && ball.y < paddlePlayer.down()) {
    ball.speedX = -ball.speedX;
    ball.speedY = map(ball.y - paddlePlayer.y, -paddlePlayer.h/2, paddlePlayer.h/2, -10, 10);
  }
 if (ball.right() > width) {
    scoreLeft = scoreLeft + 1;
    ball.x = width/2;
    ball.y = height/2;
  }
  if (ball.left() < 0) {
    scoreRight = scoreRight + 1;
    ball.x = width/2;
    ball.y = height/2;
  }
    if (ball.right() > width) {
    ball.speedX = -ball.speedX;
  }
  if (ball.left() < 0) {
    ball.speedX = -ball.speedX;
  }
  if ( ball.left() < paddleCPU.right() && ball.y > paddleCPU.up() && ball.y < paddleCPU.down()){
    ball.speedX = -ball.speedX;
  }

  if ( ball.right() > paddlePlayer.left() && ball.y > paddlePlayer.up() && ball.y < paddlePlayer.down()) {
    ball.speedX = -ball.speedX;
  }
  if (paddleCPU.down() > height) {
    paddleCPU.y = height-paddleCPU.h/2;
  }

  if (paddleCPU.up() < 0) {
    paddleCPU.y = paddleCPU.h/2;
  }
    
  if (paddlePlayer.down() > height) {
    paddlePlayer.y = height-paddlePlayer.h/2;
  }

  if (paddlePlayer.up() < 0) {
    paddlePlayer.y = paddlePlayer.h/2;
  }
    paddleCPU.move();
  paddleCPU.display();
  paddlePlayer.move();
  
  paddlePlayer.display();
  ball.move();
  ball.display();
    if (ball.right() > width) {
    ball.speedX = -ball.speedX;
  }
   if (ball.left() < 0) {
    ball.speedX = -ball.speedX;
  }

  if (ball.down() > height) {
    ball.speedY = -ball.speedY;
  }

  if (ball.up() < 0) {
    ball.speedY = -ball.speedY;
  }
  if (scoreLeft==6) {
      play = false;
      gameOver();
      } else if (scoreRight==6) {
      play = false;
      gameOver1();
      }
    }
}

void keyPressed(){
  if(keyCode == UP){
    paddlePlayer.speedY=-5;
  }
  if(keyCode == DOWN){
    paddlePlayer.speedY=5;
  }

}

void keyReleased(){
  if(keyCode == UP){
    paddlePlayer.speedY=0;
  }
  if(keyCode == DOWN){
    paddlePlayer.speedY=0;
  }
}

void startScreen() {
  background(30);
  textAlign(CENTER);
  text("PONG", width/2, height/2-40);
  text("Controls = Up arrow key is to go up", width/2, height/2-20);
  text("Controls = Down arrow key is to go Down", width/2, height/2);
  text("First to 6 Wins!", width/2, height/2+20);
  text("Don't Forget To Have Fun!", width/2, height/2+40);
  text("Click Your Mouse To Continue...", width/2, height/2+60);

  if (mousePressed) {
    play = true;
  }
  

}
  void gameOver() {
  background(0);
  textAlign(CENTER);
  
  text("Game Over! CPU Wins!", width/2, height/2-50);
  text("Final Score:" + scoreLeft, width/2, height/2+50);
  
  noLoop();
}

  void gameOver1() {
  background(0);
  textAlign(CENTER);
 
  text("Game Over! Player Wins", width/2, height/2-50);
  text("Final Score:" + scoreRight, width/2, height/2+50);
  
  noLoop();
}
