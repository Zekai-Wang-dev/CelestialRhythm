ArrayList<Note> notes = new ArrayList<Note>(); 

int[] colorOfBox = new int[4];

boolean dpressed = false;
boolean fpressed = false;
boolean jpressed = false;
boolean kpressed = false;

boolean released = false; 

//X: 300 (First Row) 
//X: 350 (Second Row) 
//X: 400 (Third Row)
//X: 450 (Fourth Row) 
  
void setup() {
  
  size(800, 800); 
  
  //Initial color of the finish line boxes
  for (int i = 0; i < 4; i++) {
    
    colorOfBox[i] = 150;  
    
  }
  
  //Notes for testing
  notes.add(new Note(1, 1.0)); 
  notes.add(new Note(2, 1.5)); 
  notes.add(new Note(3, 2.0)); 
  notes.add(new Note(4, 2.5)); 

  notes.get(0).setSpeed(0.5); 
  notes.get(1).setSpeed(0.5); 
  notes.get(2).setSpeed(0.5); 
  notes.get(3).setSpeed(0.5); 

}

void draw() {
  
  background(255); 
  
  //Note path background
  fill(150);
  quad(300, 0, 500, 0, 800, 800, 0, 800); 
  
  //Note seperation 1
  stroke(1); 
  line(350, 0, 200, 800); 
  
  //Note seperation 2
  stroke(1); 
  line(400, 0, 400, 800); 
  
  //Note seperation 3
  stroke(1); 
  line(450, 0, 600, 800); 
  
  //Finish box col 1
  stroke(1);
  fill(colorOfBox[0]); 
  quad(105, 520, 252.5, 520, 230, 640, 60, 640); 
  
  //Finish box col 2
  stroke(1);
  fill(colorOfBox[1]); 
  quad(252.5, 520, 400, 520, 400, 640, 230, 640); 
  
  //Finish box col 3
  stroke(1);
  fill(colorOfBox[2]); 
  quad(400, 520, 547.5, 520, 570, 640, 400, 640); 
  
  //Finish box col 4
  stroke(1);
  fill(colorOfBox[3]); 
  quad(547.5, 520, 695, 520, 740, 640, 570, 640); 
  
  //Start of finish line
  stroke(1); 
  line(110, 520, 690, 520); 
  
  //End of finish line
  stroke(1); 
  line(60, 640, 740, 640); 
  
  //Draw the notes
  for (int i = 0; i < notes.size(); i++) {
    
    notes.get(i).drawNote();    
    
  }
  
}

void checkNotePressed(int col) {
  
  int indexOfClosest = 0; 
  boolean notesExist = false; 
  
  //Initialize the closest note for the collumn
  for (int i = 0; i < notes.size(); i++) {
      
      if (notes.get(i).getCol() == col) {
        
        indexOfClosest = i; 
        notesExist = true; 
        break;
        
      }
      else
        notesExist = false; 
  }
     
  //Get the note that is closest so that user input only detects that note
  for (int i = 0; i < notes.size(); i++) {
    
    if (notes.get(i).getCol() == col) {
      if (520 - notes.get(i).getPos().y < 520 - notes.get(indexOfClosest).getPos().y) {
        
        indexOfClosest = i; 
        
      }
    }
  }
  
  //Checks where the note is pressed and determines the points you got or if you missed
  if (notes.size() > 0 && notesExist == true) {
        
    float noteH = notes.get(indexOfClosest).getH(); 
    float notefY = notes.get(indexOfClosest).getPos().y + noteH/2; 
    float notebY = notes.get(indexOfClosest).getPos().y - noteH/2; 

    if (notefY < 520 - noteH) {
      
      println("Miss"); 
      
    }
    else if (notefY > 520 - noteH - 15 && notefY < 520) {
     
      println("Ok"); 
      notes.remove(indexOfClosest); 
      
    }
    else if (notefY > 520 - 35 && notefY < 520) {
     
      println("Great"); 
      notes.remove(indexOfClosest); 
      
    }
    else if (notebY > 520 - 25 && notefY < 640 + 20) {
     
      println("Perfect"); 
      notes.remove(indexOfClosest); 
      
    }
    else if (notebY < 640 + 35 && notefY > 640) {
     
      println("Great"); 
      notes.remove(indexOfClosest); 
      
    }
    else if (notebY < 640 + noteH + 15 && notefY > 640) {
     
      println("Ok"); 
      notes.remove(indexOfClosest); 
      
    }
    else if (notebY > 640 + noteH) {
     
      println("Miss"); 
      
    }
    
  }
  
}

void keyPressed() {
  
  if (key == 'd' && dpressed == false) {
    
    colorOfBox[0] = 255;
    checkNotePressed(1); 
    dpressed = true; 
    
  }
  if (key == 'f' && fpressed == false) {
    
    colorOfBox[1] = 255;
    checkNotePressed(2); 
    fpressed = true; 

  }
  if (key == 'j' && jpressed == false) {
    
    colorOfBox[2] = 255;
    checkNotePressed(3); 
    jpressed = true; 

  }
  if (key == 'k' && kpressed == false) {
    
    colorOfBox[3] = 255;
    checkNotePressed(4); 
    kpressed = true; 
    
  }
  
  
}

void keyReleased() {
  
  if (key == 'd') {
    
    colorOfBox[0] = 150;
    checkNotePressed(1); 
    dpressed = false; 

  }
  if (key == 'f') {
    
    colorOfBox[1] = 150;
    checkNotePressed(2); 
    fpressed = false; 

  }
  if (key == 'j') {
    
    colorOfBox[2] = 150;
    checkNotePressed(3); 
    jpressed = false; 

  }
  if (key == 'k') {
    
    colorOfBox[3] = 150;
    checkNotePressed(4); 
    kpressed = false; 

  }
  
}
