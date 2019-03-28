class Menu{
  private String menuState = "startMenu";
  private String speed = "normal";
 
   /**
     * Menu constructor
     */
  public Menu(){
    menuState = "startMenu";
  }
  
//Shows the chosen Menu
  public void show(){
    textSize(width/25);
    textAlign(CENTER,CENTER);
    if (menuState == "startMenu"){
     showStartMenu(); 
    }
    else if (menuState == "speedMenu"){
     showSpeedMenu(); 
    }
  }
 
  //Swaps between menus and executes actions in them
  public void update(){
    if (menuState == "startMenu"){
      if (key == '1'){
        changeGameState("game"); 
        snake = new Snake();
        food = new Food();
      } else if (key == '2'){
        menuState = "speedMenu";
      } else if (key == '3'){
        exit();
      }   
    }  else if (menuState == "speedMenu"){
        if (key == '1'){
         changeSpeed(13);
         speed = "Slow";
        } else if (key == '2'){
          changeSpeed(8);  
          speed = "Normal";
        } else if (key == '3'){
          changeSpeed(3);    
          speed = "Sauschnell";
        } else if (key == '4'){
          menuState = "startMenu";
        }
      
      }
  }
  
  
//Show Main Menu
  public void showStartMenu(){
  text("Start game - Press '1'\nChange Speed - Press '2'\nExit - Press '3'",width/2,height/2);
  }
//Show Speed Menu  
  public void showSpeedMenu(){
  text("Slow - Press '1'\nNormal - Press '2'\nSauschnell - Press '3'\nBack to Start Menu - Press '4'",width/2,height/2);
  text("Speed : " + speed,width/2,height/10);
  }
  
}
