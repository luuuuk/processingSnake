private Snake snake;
private Food food;
private boolean gameOver = false;
private int highscore = 0;


/**
 * Setup function called once at startup
 */
void setup(){
  size(600,600);
  snake = new Snake();
  food = new Food();
}

/**
 * Draw function called each frame
 */
void draw(){
  background(169,169,169);

  //Draw score
  textAlign(LEFT, TOP);
  textSize(width /25);
  fill(250,250,250);
  text("Score: " + snake.length, 10, 5); 
  
  //Update view if game is not yet over and snake still able to eat some food
  
  if(gameOver == false){
    if(frameCount % 10 == 0){
      snake.update();
    }
    snake.show();
    food.show();
    snake.useInput();

    //Check if food is about to get digested
    if(snake.position.equals(food.position)){
      food = new Food();
      snake.length++;
    }

    //Check if snake is hitting the wall
    if(snake.position.x < 0 || snake.position.x + 10 > width || snake.position.y < 0 || snake.position.y+10 > height){
      gameOver = true;
    }
    
    //Check if snake is trying to eat his body instead of food
    for(PVector tmpPos : snake.body){
      if(snake.position.equals(tmpPos)){
        gameOver = true;
      }
    }
    
  } else {
    //Check if new highscore reached
    if(snake.length > highscore){
      highscore = snake.length;
    }
    //Display Game Over and current highscore
    textSize( width /25);
    fill(250,250,250);
    textAlign(CENTER, CENTER);
    text("Game Over \nHighscore: " + highscore, width/2, height/2);
    textSize( width / 30);
    text("Press 'r' to restart \n Press 'e' to exit" , width/2, height*3/4);
  }
}

/**
 * If Game is over mouse-click will restart game
 */
/*void mouseClicked(){
  if(gameOver){
    snake = new Snake();
    food = new Food();
    gameOver= false;
  }
}
*/
void keyPressed(){
  if (gameOver && key == 'r' ){
    snake = new Snake();
    food = new Food();
    gameOver = false;
  }
  if (gameOver && key == 'e'){
     exit(); 
  }
    
}

