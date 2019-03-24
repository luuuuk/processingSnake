class Food{
  PVector position;
  
  /**
   * Food constructor
   */
  public Food(){
    PVector newPosition = randomPosition();
    this.position = newPosition;
  }
  
  /**
   * Generates a PVector with random x and y, condition for position: modulo 10 equals 0
   * @return random PVector
   */
  public PVector randomPosition(){
    float x = random(0,790);
    float y = random(0,790);
    x -= (x+10)%10;
    y -= (y+10)%10;
    return new PVector(x,y);
  }
  
  /**
   * Function drawing Food
   */
  public void show(){
    fill(204, 102, 0);
    rect(this.position.x,this.position.y,10,10);
  }
}
