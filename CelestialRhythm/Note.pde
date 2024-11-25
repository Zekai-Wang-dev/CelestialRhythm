
class Note {
  
  //Current note index
  int currentIndex; 
  
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
  
  //Checks if note is connected to previous note in the same collumn
  boolean longNote; 
  
  //Note constructor
  public Note(int newCol, float newWait, boolean newLongNote, int newIndex) {
    
    col = newCol; 
    wait = newWait; 
    longNote = newLongNote; 
    currentIndex = newIndex; 
    
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
  
  int count = 0; 
  float timeDisplacement = 0; 
  //Draw the notes
  public void drawNote(float newTime) {
    
    float s = millis()/1000.0; 
    
    //Add a displacement for loading time so that the notes from text file does not go early or late depending on someone's computer 
    if (pos.y > 620 && count == 0) {
      count++; 
      if (s - newTime > 1.0 + timeDisplacement) {
        
        timeDisplacement = (s - newTime) - 1; 
        
      }
      
    }

    if (s - newTime >= wait) {
      
      pos.add(vel.copy()); 
      vel.add(acc.copy()); 
      
      sizeVel += sizeAcc;
      
      w += sizeVel; 
      h += sizeVel; 
  
      fill(1); 
      ellipse(pos.x + 25, pos.y, w, h); 
            
      ArrayList<Note> sameColNotes = new ArrayList<Note>(); 
      float prevNoteX = 0; 
      float prevNoteY = 0; 
      float prevNoteW = 0; 
      
      for (int i = 0; i < notes.size(); i++) {
        if (notes.get(i).getCol() == col) {
          
          sameColNotes.add(notes.get(i)); 
          
        }
      }
        
      if (longNote == true) {
                 
        prevNoteX = sameColNotes.get(currentIndex + 1).getX(); 
        prevNoteY = sameColNotes.get(currentIndex + 1).getY(); 
        prevNoteW = sameColNotes.get(currentIndex + 1).getW(); 
              
         //Draws the connection line 
        fill(150, 150, 150, 120); 
        stroke(1); 
        quad(pos.x - w/4 + 25, pos.y, pos.x + w/4 + 25, pos.y, prevNoteX + prevNoteW/4 + 25, prevNoteY, prevNoteX - prevNoteW/4 + 25, prevNoteY); 
    
      }
      
    }
  }
  
  public int getIndex() {
    
    return currentIndex; 
    
  }
  
  public void setIndex(int newIndex) {
    
    currentIndex = newIndex; 
    
  }
  
  public void setVel(PVector newVel) {
    
    vel = newVel; 
    
  }
  
  public void setAcc(PVector newAcc) {
    
    acc = newAcc; 
    
  }
  
  public void setSizeVel(float newSizeVel) {

    sizeVel = newSizeVel; 
    
  }
  
  public void setSizeAcc(float newSizeAcc) {
    
    sizeAcc = newSizeAcc; 
    
  }
  
  public int getCol() {
    
    return col; 
    
  }
  
  public PVector getPos() {
    
    return pos; 
    
  }
  
  public float getX() {
    
    return pos.x; 
    
  }
  
  public float getY() {
    
    return pos.y; 
    
  }
  
  public float getH() {
    
    return h; 
    
  }
  
  public float getW() {
    
    return w; 
    
  }
  
  public boolean isLong() {
    
    return longNote; 
    
  }
  
  public void setSpeed(float newSpeed) {
    
    vel.mult(newSpeed); 
    acc.mult(newSpeed); 
    sizeVel *= newSpeed; 
    sizeAcc *= newSpeed; 
    
  }
  
}
