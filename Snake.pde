class Snake{
  public PVector position;
  public PVector velocity;
  public int length;
  private ArrayList<PVector> body;
  
  /**
   * Snake constructor
   */
  public Snake(){
    this.position = new PVector(400,400);
    this.velocity = new PVector(1,0);
    this.length = 0;
    this.body = new ArrayList<PVector>();
  }
  
  /**
   * Function drawing the Snakes head
   */
  public void show(){
    fill(0, 169, 0);
    rect(this.position.x,this.position.y,10,10);
    for(PVector tmpPos : body){
      rect(tmpPos.x, tmpPos.y, 10, 10);
    }
  }
  
  /**
   * Function updating the snakes position
   */
  public void update(){
    body.add(this.position.copy());
    
    //Calculate new positions
    this.position.x = this.position.x + this.velocity.x * 10;
    this.position.y = this.position.y + this.velocity.y * 10;
    
    //Remove last element of body
    if(body.size() > this.length){
      body.remove(0);
    }
  }
  
  /**
   * Function to move the snake via keyboard input
   */
  public void useInput(){
    if(keyCode == LEFT){
      //Turn left
      snake.velocity.x = -1;
      snake.velocity.y = 0;
    } else if(keyCode == RIGHT){
      //Turn right
      snake.velocity.x = 1;
      snake.velocity.y = 0;
    } else if(keyCode == UP){
      snake.velocity.x = 0;
      snake.velocity.y = -1;
    } else if(keyCode == DOWN){
      snake.velocity.x = 0;
      snake.velocity.y = 1;
    }
  }
  
}
