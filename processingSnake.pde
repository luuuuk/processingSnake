private Snake snake;
private Food food;
private boolean gameOver = false;
private int highscore = 0;


/**
 * Setup function called once at startup
 */
void setup(){
  size(800,800);
  snake = new Snake();
  food = new Food();
}

/**
 * Draw function called each frame
 */
void draw(){
  background(169,169,169);

  //Draw score
  textSize(width /25);
  fill(250,250,250);
  text("Score: " + snake.length, 10, 30); 
  
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
    text("Game Over", width/3, height/3.5);
    text("Highscore: " + highscore, width/3, height/3.5 + width /25 ); 
  }
}

/**
 * If Game is over mouse-click will restart game
 */
void mouseClicked(){
  if(gameOver){
    snake = new Snake();
    food = new Food();
    gameOver= false;
  }
}
