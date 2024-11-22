
class Note {
  
  //width and height variable
  float w = 50;
  float h = 25; 
  
  //The collumn the note starts in
  int col; 
  
  //Position of the note for each collumn
  PVector pos; 

  //Velocity & acceleration of the note for each collumn
  PVector vel; 
  PVector acc; 

  float sizeVel = (400/72.42)/100; 
  float sizeAcc = 0.055; 
  
  //Wait time before appear in seconds
  float wait; 
  
  //Note constructor
  public Note(int newCol, float newWait) {
    
    col = newCol; 
    wait = newWait; 
    
    if (col == 1) {
      
      pos = new PVector(300, 0); 
      vel = new PVector(-0.09, 0.32); 
      acc = new PVector(-0.09, 0.32); 
      
    }
    else if (col == 2) {
      
      pos = new PVector(350, 0); 
      vel = new PVector(-0.03, 0.32); 
      acc = new PVector(-0.03, 0.32); 
      
    }
    else if (col == 3) {
      
      pos = new PVector(400, 0); 
      vel = new PVector(0.03, 0.32); 
      acc = new PVector(0.03, 0.32); 
      
    }
    else if (col == 4) {
      
      pos = new PVector(450, 0); 
      vel = new PVector(0.09, 0.32); 
      acc = new PVector(0.09, 0.32); 
      
    }
    
  }
  
  //Draw the notes
  public void drawNote() {
    
    float s = millis()/1000.0; 
        
    if (s >= wait) {
      
      pos.add(vel.copy()); 
      vel.add(acc.copy()); 
      
      sizeVel += sizeAcc;
      
      w += sizeVel; 
      h += sizeVel; 
  
      fill(1); 
      ellipse(pos.x + 25, pos.y, w, h); 
    
    }
  }
  
  public int getCol() {
    
    return col; 
    
  }
  
  public PVector getPos() {
    
    return pos; 
    
  }
  
  public float getH() {
    
    return h; 
    
  }
  
  public void setSpeed(float newSpeed) {
    
    vel.mult(newSpeed); 
    acc.mult(newSpeed); 
    sizeVel *= newSpeed; 
    sizeAcc *= newSpeed; 
    
  }
  
}
