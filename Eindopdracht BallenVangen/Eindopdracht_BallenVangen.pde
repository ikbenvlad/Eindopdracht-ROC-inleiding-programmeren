float ballY, ballX;
float paddleX, paddleY = 350;
float ballSpeed;
float groundY;
float ballSize;
int paddle;
float paddleSpeed = 4.5;
int paddleWidth = 100, paddleHeight = 10;
int lives = 3, score = 0;
boolean gameOver = false;


void setup() {
  size(600, 400);
  ballX = random(width);
  ballY = 0;
  ballSpeed = 4;
  groundY = height;
  ballSize = 15;
}

void draw() {
  background(0);
  fill(255,255,255);
  ellipse(ballX, ballY, ballSize * 1.5, ballSize * 1.5);
  ballY = ballY + ballSpeed;
  fill(255,0,0);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
  
  textSize(16);
  fill(255);
  textAlign(CENTER, TOP);
  text("Score: " + score, width/2, 20);
  text("Hearts: " + lives, width/6, 20);
  
  if (ballY + ballSize / 2 >= paddleY && ballY - ballSize / 2 <= paddleY + paddleHeight && ballX + ballSize / 2 >= paddleX && ballX - ballSize / 2 <= paddleX + paddleWidth && ballSpeed > 0){
    resetBall();
    score++;
  }
  
  if(ballY - ballSize > groundY) {
    resetBall();
    lives--;
    checkLoser();
  }
  
  movePaddle();
}

void movePaddle(){
  if(keyPressed){
    if(key == 'a' || key == 'A' || keyCode == LEFT){
      paddleX = paddleX - paddleSpeed;
    }
    if(key == 'd' || key == 'D' || keyCode == RIGHT){
      paddleX = paddleX + paddleSpeed;
    }
    
  paddleX = constrain(paddleX, 0, width - paddleWidth);
  }
}

void checkLoser(){
  if(lives == 0){
    gameOver = true;
    gameOverScreen();
  }
}

void gameOverScreen(){
  background(0);
  fill(255);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("Je hebt verloren! Jouw score was: " + score, width/2, height/2-40);
  
  textSize(16);
  text("Druk op 'R' op opnieuw te starten", width/2, height/2+40);
  noLoop();
}

void keyPressed(){
  if(gameOver && (key == 'r' | key == 'R')){
    lives = 3;
    score = 0;
    gameOver = false;
    ballX = random(width);
    ballY = 0;
    ballSpeed = 3;
    loop();
  }
}

void resetBall(){
  ballY = 0;
  ballX = random(width);
  ballSpeed = 3;
}
