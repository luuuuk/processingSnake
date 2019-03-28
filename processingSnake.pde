private Snake snake;
private Food food;
private Menu menu;
private int highscore = 0;
private String gameState = "startMenu";
private int gameSpeed = 10;


/**
 * Setup function called once at startup
 */
void setup(){
  size(800,800);
  snake = new Snake();
  food = new Food();
  menu = new Menu();
}

/**
 * Draw function called each frame
 */
void draw(){
  background(169,169,169);
  
  
  //Start Menu
  if(gameState == "startMenu"){
    menu.show();
    menu.update();
  }
  
  //Update view if game is not yet over and snake still able to eat some food
  
  if(gameState == "game"){
      //Draw score
    textAlign(LEFT, TOP);
    textSize(width /25);
    fill(250,250,250);
    text("Score: " + snake.length, 10, 5); 
  
    if(frameCount % gameSpeed == 0){
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
      gameState = "gameOver";
    }
    
    //Check if snake is trying to eat his body instead of food
    for(PVector tmpPos : snake.body){
      if(snake.position.equals(tmpPos)){
        gameState = "gameOver";
      }
    }
    
  } 
    //Check if new highscore reached
    if (gameState == "gameOver"){
    if(snake.length > highscore){
      highscore = snake.length;
    }
    //Display Game Over and current highscore
    textSize( width /25);
    fill(250,250,250);
    textAlign(CENTER, CENTER);
    text("Game Over \nHighscore: " + highscore, width/2, height/2);
    textSize( width / 30);
    text("Restart - Press '1'\nMenu - Press '2'\nExit - Press '3'" , width/2, height*3/4);
  }
 
}

/**
 * If Game is over player can choose to restart or exit
 */
 
public void changeGameState(String tempString){
 gameState = tempString; 
}

public void changeSpeed(int tempSpeed){
  gameSpeed = tempSpeed;
}

void keyPressed(){
  if (gameState == "gameOver" && key == '1' ){
    snake = new Snake();
    food = new Food();
    gameState = "game";
  }  
  else if (gameState == "gameOver" && key == '2' ){
   gameState = "startMenu"; 
   menu = new Menu(); //PROBLEM: when going back to the menu " 2 " is still saved as key therefore the programm instantly jumps to speed menu"

  }
  else if (gameState == "gameOver" && key == '3'){
     exit(); 
  }    
}

