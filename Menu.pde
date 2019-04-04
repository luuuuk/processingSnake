class Menu{
  private String menuState = "startMenu";
  private String speed = "normal";
  private XML scoreboardXML;
 
   /**
    * Menu constructor
    */
  public Menu(){
    menuState = "startMenu";
    
    scoreboardXML = loadXML("scoreboard.xml");

  }
  
  /**
   * Shows the chosen Menu
   */
  public void show(){
    textSize(width/25);
    textAlign(CENTER,CENTER);

    switch (menuState) {
      case "startMenu": showStartMenu();
        break;

      case "speedMenu": showSpeedMenu();
        break;

      case "highscoreMenu": showHighscoreMenu();
        break;
    }
  }
 
  /**
   * Swaps between menus and executes actions in them
   */
  public void update(){

    switch (menuState) {

      case "startMenu":
       switch (key) {
          case '1':
            changeGameState("game"); 
            snake = new Snake();
            food = new Food();
          break;

          case '2':
            changeMenuState("speedMenu");
          break;

          case '3':
            changeMenuState("highscoreMenu");
          break;

          case '5':
            exit();
        }
      break;

      case "speedMenu":
        switch (key) {
          case '1': 
            changeSpeed(13);
            speed = "Slow";
          break;

          case '2':
            changeSpeed(8);  
            speed = "Normal";
          break;

          case '3':
            changeSpeed(3);    
            speed = "Sauschnell";
          break;

          case '4':
            changeMenuState("startMenu");;
          break;
        }
      break;

      case "highscoreMenu":
        if(key == '4'){
          changeMenuState("startMenu");
        }
    }
  }
  
  
  /**
   * Show Main Menu
   */
  public void showStartMenu(){
    text("Start game - Press '1'\nChange Speed - Press '2'\nHighscores - Press '3'\nExit - Press '5'",width/2,height/2);
  }

  /**
   * Show Speed Menu
   */  
  public void showSpeedMenu(){
    text("Slow - Press '1'\nNormal - Press '2'\nSauschnell - Press '3'\nBack to Start Menu - Press '4'",width/2,height/2);
    text("Speed : " + speed,width/2,height/10);
  }

  /**
   * Show Scoreboard aka Highscore Menu
   */
  public void showHighscoreMenu(){
    XML[] scoreboard = scoreboardXML.getChildren("highscore");
    text("1 - " + scoreboard[scoreboard.length-1].getContent() +"\n2 - " + scoreboard[scoreboard.length-2].getContent() + "\n3 - " + scoreboard[scoreboard.length-3].getContent() + "\n\nBack to Start Menu - Press '4'",width/2,height/2);
  }
  
  /**
   * Function used to change the menu state
   * @param tmpMenuState menu state to change to
   */
  public void changeMenuState(String tmpMenuState){
    menuState = tmpMenuState;
  }
}
